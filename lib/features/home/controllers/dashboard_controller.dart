import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../purchase/controllers/purchase_controller.dart';

part 'dashboard_controller.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default(null) Map<String, dynamic>? dashboardData,
    @Default(null) Map<String, dynamic>? user,
    @Default(null) Map<String, dynamic>? assessment,
    @Default([]) List<dynamic> meterAssessmentData,
    @Default(false) bool isPurchased,
    @Default(null) String? error,
  }) = _DashboardState;
}

class DashboardController extends StateNotifier<DashboardState> {
  final Ref _ref;
  final ApiClient _apiClient = ApiClient();

  DashboardController(this._ref) : super(const DashboardState()) {
    // Delay initial load to ensure auth is ready
    Future.delayed(const Duration(milliseconds: 500), () {
      _loadDashboard();
    });

    // Listen for purchase state changes
    _ref.listen<PurchaseState>(purchaseControllerProvider, (previous, current) {
      print('Dashboard: Subscription state changed - has active: ${current.hasActiveSubscription}');
      if (previous?.hasActiveSubscription != current.hasActiveSubscription) {
        state = state.copyWith(isPurchased: current.hasActiveSubscription);
      }
    });
  }

  Future<void> _loadDashboard() async {
    await loadDashboard();
  }

  Future<void> loadDashboard() async {
    state = state.copyWith(isLoading: true, error: null);

    // IMPORTANT: This matches React Native flow from Home.js
    // 1. First check device IAP purchases (will be updated by PurchaseController auto-restore)
    // 2. Then call personal_dashboard API which may have user-specific subscription status
    // 3. API subscription status takes priority over device IAP to handle multi-user scenario

    // Check current purchase state from IAP
    try {
      final purchaseState = _ref.read(purchaseControllerProvider);
      state = state.copyWith(isPurchased: purchaseState.hasActiveSubscription);
      print('📱 Dashboard loaded with IAP purchase state: ${purchaseState.hasActiveSubscription}');
    } catch (e) {
      print('⚠️ Could not check IAP purchase state: $e');
    }

    try {
      final token = _apiClient.authToken;
      print('🔍 Dashboard API - Token available: ${token != null}');

      if (token == null) {
        print('❌ Dashboard API - No token found');
        state = state.copyWith(
          isLoading: false,
          error: 'User not authenticated',
        );
        return;
      }

      print('📡 Calling Dashboard API: /user/home/v2/personal_dashboard');

      // Call the personal dashboard API
      final response = await _apiClient.get(
        '/user/home/v2/personal_dashboard',
      );

      print('========== FULL API RESPONSE: /user/home/v2/personal_dashboard ==========');
      print('✅ Dashboard API Response received');
      print('Response data type: ${response.data.runtimeType}');
      print('Full response data: ${response.data}');

      // Log detailed structure
      if (response.data is Map) {
        final data = response.data as Map;
        print('Response keys: ${data.keys.toList()}');

        // Check for User object
        if (data['User'] != null || data['user'] != null) {
          final userData = data['User'] ?? data['user'];
          print('User object found: $userData');
          print('User keys: ${userData is Map ? userData.keys.toList() : "Not a Map"}');

          // Check for subscription flags
          if (userData is Map) {
            print('isSubscribed in User: ${userData['isSubscribed']}');
            print('isPremium in User: ${userData['isPremium']}');
            print('isPurchased in User: ${userData['isPurchased']}');
            print('subscriptionStatus in User: ${userData['subscriptionStatus']}');
          }
        }

        // Check for Assessment
        if (data['Assessment'] != null || data['assessment'] != null) {
          final assessmentData = data['Assessment'] ?? data['assessment'];
          print('Assessment data: $assessmentData');
        }

        // Check for meterAssessmentData
        if (data['meterAssessmentData'] != null) {
          print('meterAssessmentData: ${data['meterAssessmentData']}');
        }
      }
      print('========== END API RESPONSE ==========');

      // Handle different response structures
      dynamic responseData;

      if (response.data is List) {
        // If response is a List, it might be the assessment data directly
        print('⚠️ Response is a List, not a Map. Using as meterAssessmentData');

        // Create a proper dashboard structure
        responseData = {
          'meterAssessmentData': response.data,
          'User': null,
          'Assessment': null,
        };
      } else if (response.data is Map) {
        // Check if data is wrapped in 'data' field
        if (response.data['data'] != null) {
          responseData = response.data['data'];
        } else {
          responseData = response.data;
        }
      } else {
        responseData = {'error': 'Unexpected response type'};
      }

      print('📊 Extracted/formatted data: $responseData');

      // Extract user, assessment, and meter data safely
      Map<String, dynamic>? userData;
      dynamic assessmentData;  // Can be List or Map
      dynamic meterData;  // Can be List or Map
      bool isUserSubscribed = false;  // Track subscription status from API

      if (responseData is Map) {
        userData = responseData['User'] is Map ? responseData['User'] :
                  responseData['user'] is Map ? responseData['user'] : null;

        // Check if user has subscription status in the API response
        if (userData != null && userData is Map) {
          isUserSubscribed = userData['isSubscribed'] == true ||
                           userData['isPremium'] == true ||
                           userData['isPurchased'] == true ||
                           userData['subscriptionStatus'] == 'active';

          print('🔐 Subscription status from API - isSubscribed: ${userData['isSubscribed']}, isPremium: ${userData['isPremium']}, final: $isUserSubscribed');
        }

        // Assessment can be a List or Map
        assessmentData = responseData['Assessment'] ?? responseData['assessment'];

        // meterAssessmentData is actually a Map with mostRecent and average
        meterData = responseData['meterAssessmentData'] ??
                   responseData['meter_assessment_data'] ??
                   responseData['assessments'] ??
                   {};
      }

      print('🔍 Raw meterAssessmentData: $meterData');

      // If no user data from dashboard, try to get from auth
      if (userData == null) {
        try {
          final authController = _ref.read(authControllerProvider);
          if (authController.user != null) {
            userData = {
              'username': authController.user!.username,
              'firstName': authController.user!.firstName,
              'lastName': authController.user!.lastName,
              'email': authController.user!.email,
              'profilePicture': authController.user!.profilePicture,
            };
            print('📱 Using user data from auth controller: $userData');
          }
        } catch (e) {
          print('⚠️ Could not get user from auth: $e');
        }
      }

      print('👤 User data: $userData');
      print('📈 Assessment data: $assessmentData');
      print('📊 Meter data: $meterData');

      // Parse assessment data if it's a List
      Map<String, dynamic>? firstAssessment;
      if (assessmentData is List && assessmentData.isNotEmpty) {
        firstAssessment = assessmentData[0] is Map ? Map<String, dynamic>.from(assessmentData[0]) : null;
      } else if (assessmentData is Map && assessmentData.isNotEmpty) {
        firstAssessment = Map<String, dynamic>.from(assessmentData);
      }

      // Parse meter data - it's a Map with mostRecent and average
      List<dynamic> meterDataList = [];
      if (meterData is Map) {
        // Extract mostRecent data
        final mostRecent = meterData['mostRecent'];
        if (mostRecent != null && mostRecent is Map) {
          // Add the mostRecent data with score if available
          meterDataList.add({
            'type': 'mostRecent',
            'score': mostRecent['score'] ?? mostRecent['value'] ?? 0,
            ...mostRecent,
          });
        }

        // Extract average data
        final average = meterData['average'];
        if (average != null && average is Map) {
          // Add the average data with score if available
          meterDataList.add({
            'type': 'average',
            'score': average['score'] ?? average['value'] ?? 0,
            ...average,
          });
        }

        // If both are empty, add default values
        if (meterDataList.isEmpty) {
          meterDataList = [
            {'type': 'mostRecent', 'score': 0},
            {'type': 'average', 'score': 0},
          ];
        }
      } else if (meterData is List) {
        meterDataList = meterData;
      }

      // Determine final subscription status
      // Priority: API subscription status > IAP purchase state
      bool finalSubscriptionStatus = isUserSubscribed;

      // Only check IAP if API doesn't have subscription info
      if (!isUserSubscribed) {
        try {
          final purchaseState = _ref.read(purchaseControllerProvider);
          finalSubscriptionStatus = purchaseState.hasActiveSubscription;
          print('📱 Using IAP subscription status: $finalSubscriptionStatus');
        } catch (e) {
          print('⚠️ Could not check IAP state: $e');
        }
      } else {
        print('✅ Using API subscription status: $finalSubscriptionStatus');
      }

      // Update state with dashboard data
      state = state.copyWith(
        isLoading: false,
        dashboardData: responseData is Map ? Map<String, dynamic>.from(responseData) : {},
        user: userData,
        assessment: firstAssessment,
        meterAssessmentData: meterDataList,
        isPurchased: finalSubscriptionStatus,  // Set the subscription status
      );

      print('✅ Dashboard state updated successfully');
      print('🔓 Final subscription status: $finalSubscriptionStatus');

    } catch (e, stackTrace) {
      print('❌ Dashboard API Error: $e');
      print('Stack trace: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> updateSubscription({
    required String transactionId,
    required double amount,
    required bool isSubscribed,
  }) async {
    try {
      final token = _apiClient.authToken;
      if (token == null) return;

      final data = {
        'subscriptionTransactionId': transactionId,
        'subscriptionAmount': amount,
        'isSubscribed': isSubscribed,
      };

      await _apiClient.post(
        ApiEndpoints.updateSubscription,
        data: data,
      );

      state = state.copyWith(isPurchased: isSubscribed);

      // Reload dashboard to get updated data
      await loadDashboard();
    } catch (e) {
      print('Subscription update error: $e');
    }
  }

  void setPurchased(bool value) {
    state = state.copyWith(isPurchased: value);
  }

  Future<void> refreshDashboard() async {
    await loadDashboard();
  }
}

final dashboardControllerProvider = StateNotifierProvider<DashboardController, DashboardState>((ref) {
  return DashboardController(ref);
});

// Convenient providers for specific data
final dashboardUserProvider = Provider<Map<String, dynamic>?>((ref) {
  return ref.watch(dashboardControllerProvider).user;
});

final dashboardAssessmentProvider = Provider<Map<String, dynamic>?>((ref) {
  return ref.watch(dashboardControllerProvider).assessment;
});

final meterAssessmentDataProvider = Provider<List<dynamic>>((ref) {
  return ref.watch(dashboardControllerProvider).meterAssessmentData;
});

final isPurchasedProvider = Provider<bool>((ref) {
  return ref.watch(dashboardControllerProvider).isPurchased;
});