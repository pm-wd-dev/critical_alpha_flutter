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

    // Check current purchase state
    try {
      final purchaseState = _ref.read(purchaseControllerProvider);
      state = state.copyWith(isPurchased: purchaseState.hasActiveSubscription);
      print('📱 Dashboard loaded with purchase state: ${purchaseState.hasActiveSubscription}');
    } catch (e) {
      print('⚠️ Could not check purchase state: $e');
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

      print('✅ Dashboard API Response received');
      print('Response data type: ${response.data.runtimeType}');
      print('Response data: ${response.data}');

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

      if (responseData is Map) {
        userData = responseData['User'] is Map ? responseData['User'] :
                  responseData['user'] is Map ? responseData['user'] : null;

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

      // Update state with dashboard data
      state = state.copyWith(
        isLoading: false,
        dashboardData: responseData is Map ? Map<String, dynamic>.from(responseData) : {},
        user: userData,
        assessment: firstAssessment,
        meterAssessmentData: meterDataList,
      );

      print('✅ Dashboard state updated successfully');

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