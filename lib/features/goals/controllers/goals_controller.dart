import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/errors/failures.dart';
import '../../auth/controllers/auth_controller.dart';
import '../models/goal_model.dart';

part 'goals_controller.freezed.dart';

@freezed
class GoalsState with _$GoalsState {
  const factory GoalsState({
    @Default(true) bool isLoading,
    @Default([]) List<GoalModel> goals,
    @Default(GoalFilter.all) GoalFilter currentFilter,
    @Default(GoalSortBy.updatedAt) GoalSortBy sortBy,
    @Default(true) bool sortDescending,
    String? searchQuery,
    GoalCategory? selectedCategory,
    String? error,
    // CRUD states
    @Default(false) bool isCreating,
    @Default(false) bool isUpdating,
    @Default(false) bool isDeleting,
    String? crudError,
  }) = _GoalsState;

  const GoalsState._();

  bool get hasError => error != null;
  bool get hasCrudError => crudError != null;
  bool get hasData => goals.isNotEmpty;
  bool get isEmpty => goals.isEmpty && !isLoading;

  // Filtered and sorted goals
  List<GoalModel> get filteredGoals {
    var filtered = goals;

    // Apply search filter
    if (searchQuery != null && searchQuery!.trim().isNotEmpty) {
      final query = searchQuery!.toLowerCase();
      filtered = filtered.where((goal) {
        return goal.title.toLowerCase().contains(query) ||
               goal.description.toLowerCase().contains(query) ||
               goal.tags?.any((tag) => tag.toLowerCase().contains(query)) == true;
      }).toList();
    }

    // Apply category filter
    if (selectedCategory != null) {
      filtered = filtered.where((goal) => goal.category == selectedCategory).toList();
    }

    // Apply status filter
    switch (currentFilter) {
      case GoalFilter.active:
        filtered = filtered.where((goal) => goal.isActive).toList();
        break;
      case GoalFilter.completed:
        filtered = filtered.where((goal) => goal.isCompleted).toList();
        break;
      case GoalFilter.overdue:
        filtered = filtered.where((goal) => goal.isOverdue).toList();
        break;
      case GoalFilter.dueSoon:
        filtered = filtered.where((goal) => goal.isDueSoon).toList();
        break;
      case GoalFilter.all:
        break;
    }

    // Apply sorting
    filtered.sort((a, b) {
      int comparison;
      switch (sortBy) {
        case GoalSortBy.title:
          comparison = a.title.compareTo(b.title);
          break;
        case GoalSortBy.createdAt:
          comparison = a.createdAt.compareTo(b.createdAt);
          break;
        case GoalSortBy.updatedAt:
          comparison = a.updatedAt.compareTo(b.updatedAt);
          break;
        case GoalSortBy.dueDate:
          if (a.dueDate == null && b.dueDate == null) comparison = 0;
          else if (a.dueDate == null) comparison = 1;
          else if (b.dueDate == null) comparison = -1;
          else comparison = a.dueDate!.compareTo(b.dueDate!);
          break;
        case GoalSortBy.progress:
          comparison = a.progress.compareTo(b.progress);
          break;
        case GoalSortBy.priority:
          comparison = a.priority.index.compareTo(b.priority.index);
          break;
      }
      return sortDescending ? -comparison : comparison;
    });

    return filtered;
  }

  // Statistics
  int get totalGoals => goals.length;
  int get activeGoals => goals.where((goal) => goal.isActive).length;
  int get completedGoals => goals.where((goal) => goal.isCompleted).length;
  int get overdueGoals => goals.where((goal) => goal.isOverdue).length;
  int get dueSoonGoals => goals.where((goal) => goal.isDueSoon).length;

  double get completionRate => totalGoals > 0 ? (completedGoals / totalGoals) * 100 : 0.0;
  double get averageProgress => totalGoals > 0
      ? goals.fold(0.0, (sum, goal) => sum + goal.progress) / totalGoals
      : 0.0;
}

class GoalsController extends StateNotifier<GoalsState> {
  final ApiClient _apiClient;
  final Ref _ref;

  GoalsController(this._apiClient, this._ref) : super(const GoalsState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadGoals();
  }

  Future<void> loadGoals() async {
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

      final response = await _apiClient.get(ApiEndpoints.goals);  // Uses /user/plans
      final goals = (response.data['data'] as List)
          .map((json) => GoalModel.fromJson(json))
          .toList();

      state = state.copyWith(
        isLoading: false,
        goals: goals,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> createGoal(GoalModel goal) async {
    state = state.copyWith(isCreating: true, crudError: null);

    try {
      final response = await _apiClient.post(ApiEndpoints.createGoal, data: goal.toJson());  // Uses /user/plans/create
      final createdGoal = GoalModel.fromJson(response.data['data']);

      final updatedGoals = [...state.goals, createdGoal];
      state = state.copyWith(
        isCreating: false,
        goals: updatedGoals,
      );
    } catch (e) {
      state = state.copyWith(
        isCreating: false,
        crudError: _getErrorMessage(e),
      );
      rethrow;
    }
  }

  Future<void> updateGoal(GoalModel goal) async {
    state = state.copyWith(isUpdating: true, crudError: null);

    try {
      final response = await _apiClient.put('${ApiEndpoints.updateGoal}?id=${goal.id}', data: goal.toJson());
      final updatedGoal = GoalModel.fromJson(response.data['data']);

      final updatedGoals = state.goals
          .map((g) => g.id == goal.id ? updatedGoal : g)
          .toList();

      state = state.copyWith(
        isUpdating: false,
        goals: updatedGoals,
      );
    } catch (e) {
      state = state.copyWith(
        isUpdating: false,
        crudError: _getErrorMessage(e),
      );
      rethrow;
    }
  }

  Future<void> deleteGoal(String goalId) async {
    state = state.copyWith(isDeleting: true, crudError: null);

    try {
      await _apiClient.delete('${ApiEndpoints.deleteGoal}?id=$goalId');

      final updatedGoals = state.goals
          .where((goal) => goal.id != goalId)
          .toList();

      state = state.copyWith(
        isDeleting: false,
        goals: updatedGoals,
      );
    } catch (e) {
      state = state.copyWith(
        isDeleting: false,
        crudError: _getErrorMessage(e),
      );
      rethrow;
    }
  }

  Future<void> updateGoalProgress(String goalId, double progress) async {
    try {
      final goal = state.goals.firstWhere((g) => g.id == goalId);
      final updatedGoal = goal.copyWith(
        currentValue: progress,
        updatedAt: DateTime.now(),
      );

      // Update locally first for immediate UI feedback
      final updatedGoals = state.goals
          .map((g) => g.id == goalId ? updatedGoal : g)
          .toList();
      state = state.copyWith(goals: updatedGoals);

      // Update on server
      await _apiClient.patch('/goals/$goalId/progress', data: {
        'current_value': progress,
      });

      // Refresh from server to get updated data
      await loadGoals();
    } catch (e) {
      // Revert local changes if server update fails
      await loadGoals();
      throw NetworkException('Failed to update progress: ${_getErrorMessage(e)}');
    }
  }

  Future<void> completeGoal(String goalId) async {
    try {
      await _apiClient.patch('/goals/$goalId', data: {
        'status': 'completed',
        'completed_date': DateTime.now().toIso8601String(),
      });

      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to complete goal: ${_getErrorMessage(e)}');
    }
  }

  Future<void> pauseGoal(String goalId) async {
    try {
      await _apiClient.patch('/goals/$goalId', data: {
        'status': 'paused',
      });

      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to pause goal: ${_getErrorMessage(e)}');
    }
  }

  Future<void> resumeGoal(String goalId) async {
    try {
      await _apiClient.patch('/goals/$goalId', data: {
        'status': 'active',
      });

      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to resume goal: ${_getErrorMessage(e)}');
    }
  }

  Future<void> archiveGoal(String goalId) async {
    try {
      await _apiClient.patch('/goals/$goalId', data: {
        'is_archived': true,
      });

      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to archive goal: ${_getErrorMessage(e)}');
    }
  }

  Future<void> duplicateGoal(String goalId) async {
    try {
      final response = await _apiClient.post('${ApiEndpoints.goals}/$goalId/duplicate');
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to duplicate goal: ${_getErrorMessage(e)}');
    }
  }

  // Filter and sort methods
  void setFilter(GoalFilter filter) {
    state = state.copyWith(currentFilter: filter);
  }

  void setSortBy(GoalSortBy sortBy) {
    if (state.sortBy == sortBy) {
      // If same sort field, toggle order
      state = state.copyWith(sortDescending: !state.sortDescending);
    } else {
      // New sort field, default to descending
      state = state.copyWith(sortBy: sortBy, sortDescending: true);
    }
  }

  void setSearchQuery(String? query) {
    state = state.copyWith(searchQuery: query);
  }

  void setSelectedCategory(GoalCategory? category) {
    state = state.copyWith(selectedCategory: category);
  }

  void clearFilters() {
    state = state.copyWith(
      currentFilter: GoalFilter.all,
      searchQuery: null,
      selectedCategory: null,
    );
  }

  // Task management
  Future<void> addTask(String goalId, TaskModel task) async {
    try {
      final response = await _apiClient.post('${ApiEndpoints.goals}/$goalId/tasks', data: task.toJson());
      await loadGoals(); // Refresh to get updated goal with tasks
    } catch (e) {
      throw BusinessLogicException('Failed to add task: ${_getErrorMessage(e)}');
    }
  }

  Future<void> updateTask(String goalId, TaskModel task) async {
    try {
      await _apiClient.put('${ApiEndpoints.goals}/$goalId/tasks/${task.id}', data: task.toJson());
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to update task: ${_getErrorMessage(e)}');
    }
  }

  Future<void> deleteTask(String goalId, String taskId) async {
    try {
      await _apiClient.delete('${ApiEndpoints.goals}/$goalId/tasks/$taskId');
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to delete task: ${_getErrorMessage(e)}');
    }
  }

  Future<void> completeTask(String goalId, String taskId) async {
    try {
      await _apiClient.patch('/goals/$goalId/tasks/$taskId', data: {
        'status': 'done',
        'completed_date': DateTime.now().toIso8601String(),
      });
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to complete task: ${_getErrorMessage(e)}');
    }
  }

  // Milestone management
  Future<void> addMilestone(String goalId, MilestoneModel milestone) async {
    try {
      final response = await _apiClient.post('${ApiEndpoints.goals}/$goalId/milestones', data: milestone.toJson());
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to add milestone: ${_getErrorMessage(e)}');
    }
  }

  Future<void> updateMilestone(String goalId, MilestoneModel milestone) async {
    try {
      await _apiClient.put('${ApiEndpoints.goals}/$goalId/milestones/${milestone.id}', data: milestone.toJson());
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to update milestone: ${_getErrorMessage(e)}');
    }
  }

  Future<void> completeMilestone(String goalId, String milestoneId) async {
    try {
      await _apiClient.patch('/goals/$goalId/milestones/$milestoneId', data: {
        'status': 'completed',
        'completed_date': DateTime.now().toIso8601String(),
      });
      await loadGoals();
    } catch (e) {
      throw BusinessLogicException('Failed to complete milestone: ${_getErrorMessage(e)}');
    }
  }

  // Utility methods
  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearCrudError() {
    state = state.copyWith(crudError: null);
  }

  Future<void> refreshGoals() async {
    await loadGoals();
  }

  GoalModel? getGoalById(String goalId) {
    try {
      return state.goals.firstWhere((goal) => goal.id == goalId);
    } catch (e) {
      return null;
    }
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

// Enums for filtering and sorting
enum GoalFilter {
  all,
  active,
  completed,
  overdue,
  dueSoon,
}

enum GoalSortBy {
  title,
  createdAt,
  updatedAt,
  dueDate,
  progress,
  priority,
}

// Providers
final goalsControllerProvider = StateNotifierProvider<GoalsController, GoalsState>((ref) {
  final apiClient = ApiClient();
  return GoalsController(apiClient, ref);
});

// Individual state providers
final goalsListProvider = Provider<List<GoalModel>>((ref) {
  return ref.watch(goalsControllerProvider).filteredGoals;
});

final isLoadingGoalsProvider = Provider<bool>((ref) {
  return ref.watch(goalsControllerProvider).isLoading;
});

final goalsErrorProvider = Provider<String?>((ref) {
  return ref.watch(goalsControllerProvider).error;
});

final goalsCrudErrorProvider = Provider<String?>((ref) {
  return ref.watch(goalsControllerProvider).crudError;
});

// Statistics providers
final totalGoalsProvider = Provider<int>((ref) {
  return ref.watch(goalsControllerProvider).totalGoals;
});

final activeGoalsProvider = Provider<int>((ref) {
  return ref.watch(goalsControllerProvider).activeGoals;
});

final completedGoalsProvider = Provider<int>((ref) {
  return ref.watch(goalsControllerProvider).completedGoals;
});

final overdueGoalsProvider = Provider<int>((ref) {
  return ref.watch(goalsControllerProvider).overdueGoals;
});

final goalsCompletionRateProvider = Provider<double>((ref) {
  return ref.watch(goalsControllerProvider).completionRate;
});

final averageProgressProvider = Provider<double>((ref) {
  return ref.watch(goalsControllerProvider).averageProgress;
});

// Filter providers
final currentGoalFilterProvider = Provider<GoalFilter>((ref) {
  return ref.watch(goalsControllerProvider).currentFilter;
});

final goalSortByProvider = Provider<GoalSortBy>((ref) {
  return ref.watch(goalsControllerProvider).sortBy;
});

final goalSearchQueryProvider = Provider<String?>((ref) {
  return ref.watch(goalsControllerProvider).searchQuery;
});

final selectedGoalCategoryProvider = Provider<GoalCategory?>((ref) {
  return ref.watch(goalsControllerProvider).selectedCategory;
});

// Action providers
final refreshGoalsProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    await ref.read(goalsControllerProvider.notifier).refreshGoals();
  };
});

final createGoalProvider = Provider<Future<void> Function(GoalModel)>((ref) {
  return (goal) async {
    await ref.read(goalsControllerProvider.notifier).createGoal(goal);
  };
});

final updateGoalProvider = Provider<Future<void> Function(GoalModel)>((ref) {
  return (goal) async {
    await ref.read(goalsControllerProvider.notifier).updateGoal(goal);
  };
});

final deleteGoalProvider = Provider<Future<void> Function(String)>((ref) {
  return (goalId) async {
    await ref.read(goalsControllerProvider.notifier).deleteGoal(goalId);
  };
});

// Specific goal provider
final goalProvider = Provider.family<GoalModel?, String>((ref, goalId) {
  return ref.watch(goalsControllerProvider.notifier).getGoalById(goalId);
});

// Categories provider for filtering
final goalCategoriesProvider = Provider<List<GoalCategory>>((ref) {
  final goals = ref.watch(goalsListProvider);
  final categories = goals.map((goal) => goal.category).toSet().toList();
  return categories..sort((a, b) => a.name.compareTo(b.name));
});

// UI state providers
final hasGoalsProvider = Provider<bool>((ref) {
  return ref.watch(goalsControllerProvider).hasData;
});

final isGoalsEmptyProvider = Provider<bool>((ref) {
  return ref.watch(goalsControllerProvider).isEmpty;
});

final goalsWithUpcomingDeadlinesProvider = Provider<List<GoalModel>>((ref) {
  return ref.watch(goalsListProvider).where((goal) => goal.isDueSoon).toList();
});

final highPriorityGoalsProvider = Provider<List<GoalModel>>((ref) {
  return ref.watch(goalsListProvider).where((goal) => goal.priority == GoalPriority.high).toList();
});