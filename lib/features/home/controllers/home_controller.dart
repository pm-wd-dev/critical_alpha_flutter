import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/errors/failures.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../goals/models/goal_model.dart';
import '../../purchase/controllers/purchase_controller.dart';
import '../models/assessment_model.dart';
import '../models/dashboard_models.dart';
import '../models/quick_action_model.dart';

part 'home_controller.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    @Default([]) List<GoalModel> recentGoals,
    @Default([]) List<AssessmentModel> upcomingAssessments,
    DashboardStats? stats,
    @Default([]) List<InsightModel> insights,
    WeeklyProgressData? weeklyProgress,
    @Default([]) List<QuickActionModel> quickActions,
    String? error,
    @Default(false) bool isPurchased,
  }) = _HomeState;

  const HomeState._();

  bool get hasError => error != null;
  bool get hasData => stats != null;
}

class HomeController extends StateNotifier<HomeState> {
  final ApiClient _apiClient;
  final Ref _ref;

  HomeController(this._apiClient, this._ref) : super(const HomeState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    // Check subscription status on startup like React Native
    await _checkSubscriptionStatus();
    await loadDashboardData();

    // Listen for subscription state changes
    _ref.listen<PurchaseState>(purchaseControllerProvider, (previous, current) {
      print('Home: Subscription state changed - has active: ${current.hasActiveSubscription}');
      state = state.copyWith(isPurchased: current.hasActiveSubscription);
    });
  }

  Future<void> _checkSubscriptionStatus() async {
    try {
      // Initialize purchase controller to auto-restore purchases
      final purchaseController = _ref.read(purchaseControllerProvider.notifier);

      // Wait for purchase restoration to complete
      await Future.delayed(const Duration(seconds: 1));

      // Check if user has active subscription
      final purchaseState = _ref.read(purchaseControllerProvider);
      state = state.copyWith(isPurchased: purchaseState.hasActiveSubscription);
    } catch (e) {
      print('Failed to check subscription status: $e');
      // Continue without subscription - free tier
      state = state.copyWith(isPurchased: false);
    }
  }

  Future<void> loadDashboardData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'User not authenticated',
        );
        return;
      }

      await Future.wait([
        _loadStats(),
        _loadRecentGoals(),
        _loadUpcomingAssessments(),
        _loadInsights(),
        _loadWeeklyProgress(),
        _loadQuickActions(),
      ]);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> _loadStats() async {
    try {
      final response = await _apiClient.get('/dashboard/stats');
      final stats = DashboardStats.fromJson(response.data['data']);
      state = state.copyWith(stats: stats);
    } catch (e) {
      // Continue loading other data even if stats fail
      print('Failed to load stats: $e');
    }
  }

  Future<void> _loadRecentGoals() async {
    try {
      final response = await _apiClient.get('/goals', queryParameters: {
        'limit': 5,
        'sort': 'updated_at',
        'order': 'desc',
      });

      final goals = (response.data['data'] as List)
          .map((json) => GoalModel.fromJson(json))
          .toList();

      state = state.copyWith(recentGoals: goals);
    } catch (e) {
      print('Failed to load recent goals: $e');
    }
  }

  Future<void> _loadUpcomingAssessments() async {
    try {
      final response = await _apiClient.get('/assessments/upcoming', queryParameters: {
        'limit': 3,
      });

      final assessments = (response.data['data'] as List)
          .map((json) => AssessmentModel.fromJson(json))
          .toList();

      state = state.copyWith(upcomingAssessments: assessments);
    } catch (e) {
      print('Failed to load upcoming assessments: $e');
    }
  }

  Future<void> _loadInsights() async {
    try {
      final response = await _apiClient.get('/dashboard/insights');
      final insights = (response.data['data'] as List)
          .map((json) => InsightModel.fromJson(json))
          .toList();

      state = state.copyWith(insights: insights);
    } catch (e) {
      print('Failed to load insights: $e');
    }
  }

  Future<void> _loadWeeklyProgress() async {
    try {
      final response = await _apiClient.get('/dashboard/weekly-progress');
      final weeklyProgress = WeeklyProgressData.fromJson(response.data['data']);
      state = state.copyWith(weeklyProgress: weeklyProgress);
    } catch (e) {
      print('Failed to load weekly progress: $e');
    }
  }

  Future<void> _loadQuickActions() async {
    try {
      // Generate quick actions based on user state
      final quickActions = await _generateQuickActions();
      state = state.copyWith(quickActions: quickActions);
    } catch (e) {
      print('Failed to load quick actions: $e');
    }
  }

  Future<List<QuickActionModel>> _generateQuickActions() async {
    final actions = <QuickActionModel>[];

    // Add goal action if user has few goals
    if (state.recentGoals.length < 3) {
      actions.add(const QuickActionModel(
        id: 'add_goal',
        title: 'Set a New Goal',
        description: 'Define your next achievement',
        icon: 'add_goal',
        route: '/goals/add',
        type: QuickActionType.navigation,
      ));
    }

    // Add assessment action if user has pending assessments
    if (state.upcomingAssessments.isNotEmpty) {
      final nextAssessment = state.upcomingAssessments.first;
      actions.add(QuickActionModel(
        id: 'take_assessment',
        title: 'Take Assessment',
        description: nextAssessment.title,
        icon: 'assessment',
        route: '/goals/assessment',
        type: QuickActionType.navigation,
        metadata: {'assessmentId': nextAssessment.id},
      ));
    }

    // Add view results if user has completed goals
    if (state.stats?.completedGoals != null && state.stats!.completedGoals > 0) {
      actions.add(const QuickActionModel(
        id: 'view_results',
        title: 'View Progress',
        description: 'Check your achievements',
        icon: 'chart',
        route: '/results',
        type: QuickActionType.navigation,
      ));
    }

    // Add explore audio content
    actions.add(const QuickActionModel(
      id: 'explore_audio',
      title: 'Explore Content',
      description: 'Discover new audio lessons',
      icon: 'headphones',
      route: '/audio',
      type: QuickActionType.navigation,
    ));

    return actions;
  }

  Future<void> refreshDashboard() async {
    await loadDashboardData();
  }

  Future<void> markGoalAsComplete(String goalId) async {
    try {
      await _apiClient.patch('/goals/$goalId', data: {
        'status': 'completed',
        'completed_date': DateTime.now().toIso8601String(),
      });

      // Refresh dashboard data
      await loadDashboardData();
    } catch (e) {
      throw BusinessLogicException('Failed to mark goal as complete: ${_getErrorMessage(e)}');
    }
  }

  Future<void> startAssessment(String assessmentId) async {
    try {
      await _apiClient.post('/assessments/$assessmentId/start', data: {
        'started_at': DateTime.now().toIso8601String(),
      });

      // Refresh upcoming assessments
      await _loadUpcomingAssessments();
    } catch (e) {
      throw BusinessLogicException('Failed to start assessment: ${_getErrorMessage(e)}');
    }
  }

  Future<void> dismissInsight(String insightId) async {
    try {
      await _apiClient.post('/dashboard/insights/$insightId/dismiss');

      // Remove from local state
      final updatedInsights = state.insights
          .where((insight) => insight.id != insightId)
          .toList();

      state = state.copyWith(insights: updatedInsights);
    } catch (e) {
      throw NetworkException('Failed to dismiss insight: ${_getErrorMessage(e)}');
    }
  }

  Future<void> executeQuickAction(QuickActionModel action) async {
    try {
      if (action.type == QuickActionType.api) {
        // Execute API call
        if (action.apiEndpoint != null) {
          await _apiClient.post(action.apiEndpoint!, data: action.metadata);
        }
      }

      // Refresh dashboard after action
      await loadDashboardData();
    } catch (e) {
      throw BusinessLogicException('Failed to execute action: ${_getErrorMessage(e)}');
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
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

// Providers
final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>((ref) {
  final apiClient = ApiClient();
  return HomeController(apiClient, ref);
});

// Individual data providers for specific UI components
final dashboardStatsProvider = Provider<DashboardStats?>((ref) {
  return ref.watch(homeControllerProvider).stats;
});

final recentGoalsProvider = Provider<List<GoalModel>>((ref) {
  return ref.watch(homeControllerProvider).recentGoals;
});

final upcomingAssessmentsProvider = Provider<List<AssessmentModel>>((ref) {
  return ref.watch(homeControllerProvider).upcomingAssessments;
});

final insightsProvider = Provider<List<InsightModel>>((ref) {
  return ref.watch(homeControllerProvider).insights;
});

final weeklyProgressProvider = Provider<WeeklyProgressData?>((ref) {
  return ref.watch(homeControllerProvider).weeklyProgress;
});

final quickActionsProvider = Provider<List<QuickActionModel>>((ref) {
  return ref.watch(homeControllerProvider).quickActions;
});

// Computed providers
final totalActiveGoalsProvider = Provider<int>((ref) {
  final goals = ref.watch(recentGoalsProvider);
  return goals.where((goal) => goal.isActive).length;
});

final completionRateProvider = Provider<double>((ref) {
  final stats = ref.watch(dashboardStatsProvider);
  if (stats == null || stats.totalGoals == 0) return 0.0;
  return (stats.completedGoals / stats.totalGoals) * 100;
});

final hasUpcomingDeadlinesProvider = Provider<bool>((ref) {
  final goals = ref.watch(recentGoalsProvider);
  return goals.any((goal) => goal.isDueSoon);
});

final streakDaysProvider = Provider<int>((ref) {
  final stats = ref.watch(dashboardStatsProvider);
  return stats?.streakDays ?? 0;
});

// Action providers
final refreshDashboardProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    await ref.read(homeControllerProvider.notifier).refreshDashboard();
  };
});

final markGoalCompleteProvider = Provider.family<Future<void> Function(), String>((ref, goalId) {
  return () async {
    await ref.read(homeControllerProvider.notifier).markGoalAsComplete(goalId);
  };
});

final startAssessmentProvider = Provider.family<Future<void> Function(), String>((ref, assessmentId) {
  return () async {
    await ref.read(homeControllerProvider.notifier).startAssessment(assessmentId);
  };
});

// UI state providers
final isLoadingDashboardProvider = Provider<bool>((ref) {
  return ref.watch(homeControllerProvider).isLoading;
});

final dashboardErrorProvider = Provider<String?>((ref) {
  return ref.watch(homeControllerProvider).error;
});

final hasDashboardDataProvider = Provider<bool>((ref) {
  return ref.watch(homeControllerProvider).hasData;
});

// Helper providers for UI components
final shouldShowWelcomeProvider = Provider<bool>((ref) {
  final stats = ref.watch(dashboardStatsProvider);
  return stats == null || stats.totalGoals == 0;
});

final shouldShowStreakProvider = Provider<bool>((ref) {
  final streak = ref.watch(streakDaysProvider);
  return streak > 0;
});

final shouldShowQuickActionsProvider = Provider<bool>((ref) {
  final actions = ref.watch(quickActionsProvider);
  return actions.isNotEmpty;
});