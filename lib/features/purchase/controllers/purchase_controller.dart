import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../core/network/api_client.dart';
import '../../../core/errors/failures.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../home/controllers/dashboard_controller.dart';
import '../models/subscription_model.dart';

part 'purchase_controller.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState {
  const factory PurchaseState({
    @Default(true) bool isLoading,
    @Default([]) List<SubscriptionPlanModel> availablePlans,
    UserSubscriptionModel? currentSubscription,
    @Default([]) List<ProductDetails> storeProducts,
    @Default(PurchaseFlow.none) PurchaseFlow currentFlow,
    String? selectedPlanId,
    @Default(false) bool isPurchasing,
    @Default(false) bool isRestoring,
    String? error,
    String? purchaseError,
    // Feature flags
    @Default(false) bool canMakePurchases,
    @Default(false) bool hasActiveSubscription,
    @Default(false) bool hasValidPaymentMethod,
    // Purchase success state
    PurchaseResult? lastPurchaseResult,
  }) = _PurchaseState;

  const PurchaseState._();

  bool get hasError => error != null;
  bool get hasPurchaseError => purchaseError != null;
  bool get hasData => availablePlans.isNotEmpty;
  bool get isEmpty => availablePlans.isEmpty && !isLoading;
  bool get isPurchaseInProgress => isPurchasing || currentFlow != PurchaseFlow.none;

  // Filter plans
  List<SubscriptionPlanModel> get freePlans =>
      availablePlans.where((plan) => plan.isFree).toList();

  List<SubscriptionPlanModel> get paidPlans =>
      availablePlans.where((plan) => !plan.isFree).toList();

  List<SubscriptionPlanModel> get popularPlans =>
      availablePlans.where((plan) => plan.isPopular).toList();

  List<SubscriptionPlanModel> get recommendedPlans =>
      availablePlans.where((plan) => plan.isRecommended).toList();

  // Get selected plan
  SubscriptionPlanModel? get selectedPlan {
    if (selectedPlanId == null) return null;
    try {
      return availablePlans.firstWhere((plan) => plan.id == selectedPlanId);
    } catch (e) {
      return null;
    }
  }

  // Subscription status checks
  bool get isTrialActive => currentSubscription?.isTrial ?? false;
  bool get isSubscriptionExpiring => currentSubscription?.isExpiringSoon ?? false;
  bool get isPaymentOverdue => currentSubscription?.isPaymentOverdue ?? false;

  // Get trial days remaining
  int? get trialDaysRemaining => currentSubscription?.daysRemainingInTrial;
}

@freezed
class PurchaseResult with _$PurchaseResult {
  const factory PurchaseResult({
    required bool success,
    required String planId,
    String? transactionId,
    String? message,
    UserSubscriptionModel? subscription,
    DateTime? purchaseDate,
  }) = _PurchaseResult;
}

class PurchaseController extends StateNotifier<PurchaseState> {
  final ApiClient _apiClient;
  final Ref _ref;
  final InAppPurchase _inAppPurchase;

  PurchaseController(this._apiClient, this._ref)
      : _inAppPurchase = InAppPurchase.instance,
        super(const PurchaseState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await _checkPurchaseAvailability();
    await loadSubscriptionPlans();
    await loadCurrentSubscription();
    _setupPurchaseUpdates();
    // Auto-restore purchases on app startup like React Native
    await _autoRestorePurchasesOnStartup();
  }

  Future<void> _checkPurchaseAvailability() async {
    final isAvailable = await _inAppPurchase.isAvailable();
    state = state.copyWith(canMakePurchases: isAvailable);

    if (!isAvailable) {
      state = state.copyWith(
        error: 'In-app purchases are not available on this device.',
      );
    }
  }

  void _setupPurchaseUpdates() {
    _inAppPurchase.purchaseStream.listen(
      _handlePurchaseUpdate,
      onError: (error) {
        state = state.copyWith(
          isPurchasing: false,
          currentFlow: PurchaseFlow.none,
          purchaseError: 'Purchase failed: $error',
        );
      },
    );
  }

  Future<void> loadSubscriptionPlans() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Define Critical Alpha subscription product IDs like React Native
      final criticalAlphaPlans = [
        SubscriptionPlanModel(
          id: 'criticalapha_month',
          name: 'Monthly',
          description: '3 day free trial then \$4.95/month',
          price: 4.95,
          currency: 'USD',
          billingPeriod: BillingPeriod.monthly,
          trialDays: 3,
          features: [],
          appleProductId: 'criticalapha_month',
          googleProductId: 'criticalapha_month',
          isPopular: true,
          isActive: true,
        ),
        SubscriptionPlanModel(
          id: 'criticalalpha_year',
          name: 'Annually',
          description: '3 day free trial then \$49.95/year',
          price: 49.95,
          currency: 'USD',
          billingPeriod: BillingPeriod.yearly,
          trialDays: 3,
          features: [],
          appleProductId: Platform.isIOS ? 'criticalalpha_year' : null,
          googleProductId: Platform.isAndroid ? 'criticalalpha_year' : null,
          isRecommended: true,
          isActive: true,
        ),
      ];

      // Load store products for the plans
      await _loadStoreProducts(criticalAlphaPlans);

      state = state.copyWith(
        isLoading: false,
        availablePlans: criticalAlphaPlans,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> _loadStoreProducts(List<SubscriptionPlanModel> plans) async {
    if (!state.canMakePurchases) return;

    try {
      final productIds = plans
          .where((plan) => !plan.isFree)
          .map((plan) => _getProductId(plan))
          .where((id) => id != null)
          .cast<String>()
          .toSet();

      if (productIds.isEmpty) return;

      final response = await _inAppPurchase.queryProductDetails(productIds);

      if (response.error != null) {
        print('Failed to load store products: ${response.error}');
        return;
      }

      state = state.copyWith(storeProducts: response.productDetails);
    } catch (e) {
      print('Failed to load store products: $e');
    }
  }

  String? _getProductId(SubscriptionPlanModel plan) {
    // Return platform-specific product ID
    if (Platform.isIOS) {
      return plan.appleProductId;
    } else if (Platform.isAndroid) {
      return plan.googleProductId;
    }
    return plan.platformProductId;
  }

  Future<void> loadCurrentSubscription() async {
    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) return;

      final response = await _apiClient.get('/subscriptions/current');

      if (response.data['data'] != null) {
        final subscription = UserSubscriptionModel.fromJson(response.data['data']);
        state = state.copyWith(
          currentSubscription: subscription,
          hasActiveSubscription: subscription.isActive,
        );
      }
    } catch (e) {
      print('Failed to load current subscription: $e');
    }
  }

  Future<void> selectPlan(String planId) async {
    state = state.copyWith(selectedPlanId: planId);
  }

  Future<void> purchaseSubscription(String planId) async {
    if (!state.canMakePurchases) {
      throw PlatformException('Purchases are not available');
    }

    state = state.copyWith(
      isPurchasing: true,
      currentFlow: PurchaseFlow.purchase,
      purchaseError: null,
    );

    try {
      final plan = state.availablePlans.firstWhere((p) => p.id == planId);

      if (plan.isFree) {
        // Handle free plan subscription
        await _subscribeToFreePlan(plan);
        return;
      }

      // Find store product
      final productId = _getProductId(plan);
      if (productId == null) {
        throw PaymentException('Product ID not found for plan');
      }

      final productList = state.storeProducts
          .where((p) => p.id == productId);
      final product = productList.isEmpty ? null : productList.first;

      if (product == null) {
        throw PaymentException('Product not found in store');
      }

      // Create purchase param
      final purchaseParam = PurchaseParam(productDetails: product);

      // Start purchase
      final success = await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);

      if (!success) {
        throw PaymentFailedException('Failed to initiate purchase');
      }

      // Purchase updates will be handled by the stream listener
    } catch (e) {
      state = state.copyWith(
        isPurchasing: false,
        currentFlow: PurchaseFlow.none,
        purchaseError: _getErrorMessage(e),
      );
      rethrow;
    }
  }

  Future<void> _subscribeToFreePlan(SubscriptionPlanModel plan) async {
    try {
      final response = await _apiClient.post('/subscriptions/subscribe', data: {
        'plan_id': plan.id,
      });

      final subscription = UserSubscriptionModel.fromJson(response.data['data']);

      state = state.copyWith(
        isPurchasing: false,
        currentFlow: PurchaseFlow.none,
        currentSubscription: subscription,
        hasActiveSubscription: true,
        lastPurchaseResult: PurchaseResult(
          success: true,
          planId: plan.id,
          message: 'Successfully subscribed to ${plan.name}',
          subscription: subscription,
          purchaseDate: DateTime.now(),
        ),
      );
    } catch (e) {
      throw SubscriptionException('Failed to subscribe to free plan: ${_getErrorMessage(e)}');
    }
  }

  void _handlePurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      print('Purchase update status: ${purchaseDetails.status}');
      print('Product ID: ${purchaseDetails.productID}');

      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
          state = state.copyWith(currentFlow: PurchaseFlow.pending);
          break;

        case PurchaseStatus.purchased:
          // Complete the purchase first
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
          }
          await _handleSuccessfulPurchase(purchaseDetails);
          break;

        case PurchaseStatus.error:
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
          }
          _handleFailedPurchase(purchaseDetails);
          break;

        case PurchaseStatus.restored:
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
          }
          _handleRestoredPurchase(purchaseDetails);
          break;

        case PurchaseStatus.canceled:
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
          }
          state = state.copyWith(
            isPurchasing: false,
            currentFlow: PurchaseFlow.none,
            purchaseError: 'Purchase was cancelled',
          );
          break;
      }
    }
  }

  Future<void> _handleSuccessfulPurchase(PurchaseDetails purchaseDetails) async {
    try {
      print('Handling successful purchase for product: ${purchaseDetails.productID}');

      // Update subscription status exactly like React Native implementation
      final values = {
        'subscriptionTransactionId': purchaseDetails.purchaseID ?? purchaseDetails.transactionDate,
        'subscriptionAmount': purchaseDetails.productID.contains('month') ? 4.95 : 49.95,
        'isSubscribed': true,
      };

      print('Sending subscription update to backend: $values');

      // Call _updateSubscription endpoint exactly like React Native does
      try {
        final response = await _apiClient.post('/user/update-subscription-details', data: values);
        print('Backend subscription update response: ${response.data}');
      } catch (apiError) {
        print('Backend API error: $apiError');
        // Continue even if backend fails - purchase is already successful
      }

      final subscription = UserSubscriptionModel(
        id: purchaseDetails.purchaseID ?? '',
        planId: purchaseDetails.productID,
        userId: _ref.read(authStateProvider).value?.id ?? '',
        status: SubscriptionStatus.active,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: purchaseDetails.productID.contains('month') ? 30 : 365)),
        isActive: true,
        isTrial: false,
      );

      // Find the purchased plan
      final planList = state.availablePlans
          .where((p) => _getProductId(p) == purchaseDetails.productID);
      final plan = planList.isEmpty ? null : planList.first;

      state = state.copyWith(
        isPurchasing: false,
        currentFlow: PurchaseFlow.none,
        currentSubscription: subscription,
        hasActiveSubscription: true,
        purchaseError: null,
        lastPurchaseResult: PurchaseResult(
          success: true,
          planId: plan?.id ?? '',
          transactionId: purchaseDetails.transactionDate,
          message: 'Purchase successful! Welcome to ${plan?.name ?? 'Premium'}',
          subscription: subscription,
          purchaseDate: DateTime.now(),
        ),
      );

      // Notify dashboard to refresh subscription status
      try {
        final dashboardController = _ref.read(dashboardControllerProvider.notifier);
        dashboardController.setPurchased(true);
        await dashboardController.refreshDashboard();
      } catch (e) {
        print('Could not refresh dashboard: $e');
      }

    } catch (e) {
      state = state.copyWith(
        isPurchasing: false,
        currentFlow: PurchaseFlow.none,
        purchaseError: 'Purchase verification failed: ${_getErrorMessage(e)}',
      );
    }
  }

  void _handleFailedPurchase(PurchaseDetails purchaseDetails) {
    final error = purchaseDetails.error;
    String errorMessage = 'Purchase failed';

    if (error != null) {
      switch (error.code) {
        case 'user_canceled':
          errorMessage = 'Purchase was cancelled';
          break;
        case 'payment_invalid':
          errorMessage = 'Payment method is invalid';
          break;
        case 'payment_not_allowed':
          errorMessage = 'Payment not allowed';
          break;
        default:
          errorMessage = error.message ?? 'Unknown purchase error';
      }
    }

    state = state.copyWith(
      isPurchasing: false,
      currentFlow: PurchaseFlow.none,
      purchaseError: errorMessage,
    );
  }

  void _handleRestoredPurchase(PurchaseDetails purchaseDetails) {
    // Handle restored purchases like React Native implementation
    if (purchaseDetails.productID.isNotEmpty) {
      // Update subscription status using the correct API endpoint
      final values = {
        'subscriptionTransactionId': purchaseDetails.purchaseID ?? purchaseDetails.transactionDate,
        'subscriptionAmount': purchaseDetails.productID.contains('month') ? 4.95 : 49.95,
        'isSubscribed': true,
      };

      // Call API to update subscription
      _apiClient.post('/user/update-subscription-details', data: values).then((_) async {
        state = state.copyWith(
          isRestoring: false,
          currentFlow: PurchaseFlow.none,
          hasActiveSubscription: true,
          currentSubscription: UserSubscriptionModel(
            id: purchaseDetails.purchaseID ?? '',
            planId: purchaseDetails.productID,
            userId: _ref.read(authStateProvider).value?.id ?? '',
            status: SubscriptionStatus.active,
            startDate: DateTime.now(),
            endDate: DateTime.now().add(Duration(days: purchaseDetails.productID.contains('month') ? 30 : 365)),
            isActive: true,
            isTrial: false,
          ),
        );

        // Show success message
        state = state.copyWith(
          lastPurchaseResult: PurchaseResult(
            success: true,
            planId: purchaseDetails.productID,
            message: 'Previous purchases have been restored.',
            purchaseDate: DateTime.now(),
          ),
        );

        // Notify dashboard to refresh subscription status
        try {
          final dashboardController = _ref.read(dashboardControllerProvider.notifier);
          dashboardController.setPurchased(true);
          await dashboardController.refreshDashboard();
        } catch (e) {
          print('Could not refresh dashboard: $e');
        }
      }).catchError((e) {
        state = state.copyWith(
          isRestoring: false,
          currentFlow: PurchaseFlow.none,
          purchaseError: 'No previous purchases to restore.',
        );
      });
    } else {
      state = state.copyWith(
        isRestoring: false,
        currentFlow: PurchaseFlow.none,
        purchaseError: 'No previous purchases to restore.',
      );
    }
  }

  Future<void> _verifyRestoredPurchase(PurchaseDetails purchaseDetails) async {
    try {
      await _apiClient.post('/subscriptions/restore-purchase', data: {
        'product_id': purchaseDetails.productID,
        'transaction_id': purchaseDetails.transactionDate,
        'purchase_token': purchaseDetails.verificationData.serverVerificationData,
        'platform': Platform.isIOS ? 'iOS' : (Platform.isAndroid ? 'android' : 'unknown'),
      });

      await loadCurrentSubscription();
    } catch (e) {
      print('Failed to verify restored purchase: $e');
    }
  }

  Future<void> restorePurchases() async {
    if (!state.canMakePurchases) {
      throw PlatformException('Purchases are not available');
    }

    state = state.copyWith(
      isRestoring: true,
      currentFlow: PurchaseFlow.restore,
      purchaseError: null,
    );

    try {
      await _inAppPurchase.restorePurchases();

      // Wait a bit to see if any purchases are restored
      await Future.delayed(const Duration(seconds: 2));

      // If still restoring (no purchases were found), stop restoring
      if (state.isRestoring) {
        state = state.copyWith(
          isRestoring: false,
          currentFlow: PurchaseFlow.none,
          lastPurchaseResult: PurchaseResult(
            success: false,
            planId: '',
            message: 'No previous purchases to restore',
            purchaseDate: DateTime.now(),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(
        isRestoring: false,
        currentFlow: PurchaseFlow.none,
        purchaseError: 'No previous purchases to restore',
      );
      // Don't rethrow - handle gracefully like React Native
    }
  }

  Future<void> _autoRestorePurchasesOnStartup() async {
    if (!state.canMakePurchases) return;

    try {
      print('🔄 Auto-restoring purchases on startup like React Native...');
      // Silently restore purchases on startup like React Native
      await _inAppPurchase.restorePurchases();

      // IMPORTANT: This matches React Native behavior from Home.js:267-283
      // The purchase stream handler will call _handleRestoredPurchase
      // which will update the backend subscription status
    } catch (e) {
      // Silently fail - user hasn't purchased before
      print('No previous purchases found: $e');
    }
  }

  Future<void> cancelSubscription() async {
    try {
      await _apiClient.post('/subscriptions/cancel');
      await loadCurrentSubscription();
    } catch (e) {
      throw SubscriptionException('Failed to cancel subscription: ${_getErrorMessage(e)}');
    }
  }

  Future<void> resumeSubscription() async {
    try {
      await _apiClient.post('/subscriptions/resume');
      await loadCurrentSubscription();
    } catch (e) {
      throw SubscriptionException('Failed to resume subscription: ${_getErrorMessage(e)}');
    }
  }

  Future<void> updatePaymentMethod(PaymentMethodModel paymentMethod) async {
    try {
      await _apiClient.post('/subscriptions/payment-method', data: paymentMethod.toJson());
      state = state.copyWith(hasValidPaymentMethod: true);
    } catch (e) {
      throw PaymentException('Failed to update payment method: ${_getErrorMessage(e)}');
    }
  }

  Future<List<PaymentModel>> getPaymentHistory() async {
    try {
      final response = await _apiClient.get('/subscriptions/payments');
      return (response.data['data'] as List)
          .map((json) => PaymentModel.fromJson(json))
          .toList();
    } catch (e) {
      throw NetworkException('Failed to load payment history: ${_getErrorMessage(e)}');
    }
  }

  Future<void> requestRefund(String transactionId) async {
    try {
      await _apiClient.post('/subscriptions/refund', data: {
        'transaction_id': transactionId,
      });
    } catch (e) {
      throw PaymentException('Failed to request refund: ${_getErrorMessage(e)}');
    }
  }

  Future<void> redeemPromoCode(String promoCode) async {
    try {
      final response = await _apiClient.post('/subscriptions/promo', data: {
        'promo_code': promoCode,
      });

      final subscription = UserSubscriptionModel.fromJson(response.data['data']);
      state = state.copyWith(
        currentSubscription: subscription,
        hasActiveSubscription: subscription.isActive,
      );

    } catch (e) {
      throw PaymentException('Failed to redeem promo code: ${_getErrorMessage(e)}');
    }
  }

  // Feature access methods
  bool hasFeatureAccess(String featureKey) {
    if (state.currentSubscription == null || !state.hasActiveSubscription) {
      // Check if feature is available in free plan
      final freePlanList = state.availablePlans.where((p) => p.isFree);
      final freePlan = freePlanList.isEmpty ? null : freePlanList.first;
      return freePlan?.hasFeature(featureKey) ?? false;
    }

    final currentPlanList = state.availablePlans
        .where((p) => p.id == state.currentSubscription?.planId);
    final currentPlan = currentPlanList.isEmpty ? null : currentPlanList.first;

    return currentPlan?.hasFeature(featureKey) ?? false;
  }

  FeatureModel? getFeature(String featureKey) {
    SubscriptionPlanModel? currentPlan;

    if (state.currentSubscription != null && state.hasActiveSubscription) {
      final currentPlanList = state.availablePlans
          .where((p) => p.id == state.currentSubscription?.planId);
      currentPlan = currentPlanList.isEmpty ? null : currentPlanList.first;
    } else {
      final freePlanList = state.availablePlans.where((p) => p.isFree);
      currentPlan = freePlanList.isEmpty ? null : freePlanList.first;
    }

    return currentPlan?.getFeature(featureKey);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearPurchaseError() {
    state = state.copyWith(purchaseError: null);
  }

  void clearLastPurchaseResult() {
    state = state.copyWith(lastPurchaseResult: null);
  }

  Future<void> refreshSubscription() async {
    await loadCurrentSubscription();
  }

  String _getErrorMessage(dynamic error) {
    if (error is AppException) {
      return error.message;
    } else if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    } else {
      return error.toString();
    }
  }
}

// Enums
enum PurchaseFlow {
  none,
  purchase,
  restore,
  pending,
}

// Providers
final purchaseControllerProvider = StateNotifierProvider<PurchaseController, PurchaseState>((ref) {
  final apiClient = ApiClient();
  return PurchaseController(apiClient, ref);
});

// State providers
final subscriptionPlansProvider = Provider<List<SubscriptionPlanModel>>((ref) {
  return ref.watch(purchaseControllerProvider).availablePlans;
});

final currentSubscriptionProvider = Provider<UserSubscriptionModel?>((ref) {
  return ref.watch(purchaseControllerProvider).currentSubscription;
});

final selectedPlanProvider = Provider<SubscriptionPlanModel?>((ref) {
  return ref.watch(purchaseControllerProvider).selectedPlan;
});

final isLoadingPurchaseProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).isLoading;
});

final purchaseErrorProvider = Provider<String?>((ref) {
  return ref.watch(purchaseControllerProvider).error;
});

final lastPurchaseResultProvider = Provider<PurchaseResult?>((ref) {
  return ref.watch(purchaseControllerProvider).lastPurchaseResult;
});

// Plan category providers
final freePlansProvider = Provider<List<SubscriptionPlanModel>>((ref) {
  return ref.watch(purchaseControllerProvider).freePlans;
});

final paidPlansProvider = Provider<List<SubscriptionPlanModel>>((ref) {
  return ref.watch(purchaseControllerProvider).paidPlans;
});

final popularPlansProvider = Provider<List<SubscriptionPlanModel>>((ref) {
  return ref.watch(purchaseControllerProvider).popularPlans;
});

final recommendedPlansProvider = Provider<List<SubscriptionPlanModel>>((ref) {
  return ref.watch(purchaseControllerProvider).recommendedPlans;
});

// Subscription status providers
final hasActiveSubscriptionProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).hasActiveSubscription;
});

final isTrialActiveProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).isTrialActive;
});

final isSubscriptionExpiringProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).isSubscriptionExpiring;
});

final trialDaysRemainingProvider = Provider<int?>((ref) {
  return ref.watch(purchaseControllerProvider).trialDaysRemaining;
});

// Purchase flow providers
final isPurchaseInProgressProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).isPurchaseInProgress;
});

final canMakePurchasesProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).canMakePurchases;
});

// Action providers
final purchaseSubscriptionProvider = Provider<Future<void> Function(String)>((ref) {
  return (planId) async {
    await ref.read(purchaseControllerProvider.notifier).purchaseSubscription(planId);
  };
});

final restorePurchasesProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    await ref.read(purchaseControllerProvider.notifier).restorePurchases();
  };
});

final cancelSubscriptionProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    await ref.read(purchaseControllerProvider.notifier).cancelSubscription();
  };
});

// Feature access providers
final hasFeatureAccessProvider = Provider.family<bool, String>((ref, featureKey) {
  return ref.watch(purchaseControllerProvider.notifier).hasFeatureAccess(featureKey);
});

final getFeatureProvider = Provider.family<FeatureModel?, String>((ref, featureKey) {
  return ref.watch(purchaseControllerProvider.notifier).getFeature(featureKey);
});

// UI state providers
final hasPurchaseDataProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).hasData;
});

final isPurchaseEmptyProvider = Provider<bool>((ref) {
  return ref.watch(purchaseControllerProvider).isEmpty;
});