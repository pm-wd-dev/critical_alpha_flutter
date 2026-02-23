import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
class GoalModel with _$GoalModel {
  const factory GoalModel({
    required String id,
    required String title,
    required String description,
    required GoalCategory category,
    required GoalStatus status,
    required GoalPriority priority,
    @JsonKey(name: 'target_value') double? targetValue,
    @JsonKey(name: 'current_value') @Default(0.0) double currentValue,
    String? unit,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'completed_date') DateTime? completedDate,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    List<MilestoneModel>? milestones,
    List<TaskModel>? tasks,
    List<String>? tags,
    String? notes,
    @JsonKey(name: 'reminder_frequency') ReminderFrequency? reminderFrequency,
    @JsonKey(name: 'is_public') @Default(false) bool isPublic,
    @JsonKey(name: 'is_archived') @Default(false) bool isArchived,
    GoalMetrics? metrics,
    Map<String, dynamic>? metadata,
  }) = _GoalModel;

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  const GoalModel._();

  /// Progress as percentage (0.0 to 1.0)
  double get progress {
    if (targetValue == null || targetValue! <= 0) {
      // For goals without numeric targets, use task/milestone completion
      final totalTasks = tasks?.length ?? 0;
      final completedTasks = tasks?.where((t) => t.isCompleted).length ?? 0;

      if (totalTasks > 0) {
        return completedTasks / totalTasks;
      }

      final totalMilestones = milestones?.length ?? 0;
      final completedMilestones = milestones?.where((m) => m.isCompleted).length ?? 0;

      if (totalMilestones > 0) {
        return completedMilestones / totalMilestones;
      }

      return status == GoalStatus.completed ? 1.0 : 0.0;
    }

    return (currentValue / targetValue!).clamp(0.0, 1.0);
  }

  /// Progress as percentage (0 to 100)
  int get progressPercentage => (progress * 100).round();

  /// Whether the goal is completed
  bool get isCompleted => status == GoalStatus.completed;

  /// Whether the goal is active
  bool get isActive => status == GoalStatus.active;

  /// Whether the goal is paused
  bool get isPaused => status == GoalStatus.paused;

  /// Whether the goal is on hold
  bool get isOnHold => status == GoalStatus.onHold;

  /// Whether the goal is overdue
  bool get isOverdue {
    if (isCompleted || dueDate == null) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  /// Days until due date (negative if overdue)
  int? get daysUntilDue {
    if (dueDate == null) return null;
    return dueDate!.difference(DateTime.now()).inDays;
  }

  /// Whether the goal is due soon (within 7 days)
  bool get isDueSoon {
    final days = daysUntilDue;
    return days != null && days <= 7 && days >= 0;
  }

  /// Duration since goal was created
  Duration get age => DateTime.now().difference(createdAt);

  /// Duration to complete (if completed)
  Duration? get completionDuration {
    if (completedDate == null) return null;
    final start = startDate ?? createdAt;
    return completedDate!.difference(start);
  }

  /// Next milestone to achieve
  MilestoneModel? get nextMilestone {
    if (milestones == null) return null;
    final incompleteMilestones = milestones!
        .where((m) => !m.isCompleted)
        .toList()
      ..sort((a, b) => (a.dueDate ?? DateTime.now())
          .compareTo(b.dueDate ?? DateTime.now()));
    return incompleteMilestones.isEmpty ? null : incompleteMilestones.first;
  }

  /// Next task to complete
  TaskModel? get nextTask {
    if (tasks == null) return null;
    final incompleteTasks = tasks!
        .where((t) => !t.isCompleted)
        .toList()
      ..sort((a, b) => a.priority.index.compareTo(b.priority.index));
    return incompleteTasks.isEmpty ? null : incompleteTasks.first;
  }

  /// Remaining value to achieve target
  double get remainingValue {
    if (targetValue == null) return 0.0;
    return (targetValue! - currentValue).clamp(0.0, targetValue!);
  }

  /// Daily progress needed to meet deadline
  double? get dailyProgressNeeded {
    if (targetValue == null || dueDate == null || isCompleted) return null;

    final daysRemaining = daysUntilDue;
    if (daysRemaining == null || daysRemaining <= 0) return null;

    return remainingValue / daysRemaining;
  }

  /// Goal difficulty based on various factors
  GoalDifficulty get difficulty {
    int score = 0;

    // Time factor
    if (dueDate != null) {
      final days = daysUntilDue ?? 0;
      if (days < 30) score += 2;
      else if (days < 90) score += 1;
    }

    // Target factor
    if (targetValue != null && targetValue! > 100) score += 1;

    // Task/milestone factor
    final totalItems = (tasks?.length ?? 0) + (milestones?.length ?? 0);
    if (totalItems > 10) score += 2;
    else if (totalItems > 5) score += 1;

    // Priority factor
    if (priority == GoalPriority.high) score += 1;

    if (score >= 4) return GoalDifficulty.hard;
    if (score >= 2) return GoalDifficulty.medium;
    return GoalDifficulty.easy;
  }

  /// Formatted target with unit
  String? get formattedTarget {
    if (targetValue == null) return null;
    final value = targetValue!;
    final unitStr = unit ?? '';

    if (value == value.round()) {
      return '${value.round()} $unitStr'.trim();
    } else {
      return '${value.toStringAsFixed(1)} $unitStr'.trim();
    }
  }

  /// Formatted current value with unit
  String get formattedCurrent {
    final value = currentValue;
    final unitStr = unit ?? '';

    if (value == value.round()) {
      return '${value.round()} $unitStr'.trim();
    } else {
      return '${value.toStringAsFixed(1)} $unitStr'.trim();
    }
  }

  /// Status color
  String get statusColor {
    switch (status) {
      case GoalStatus.active:
        return '#10B981'; // Green
      case GoalStatus.completed:
        return '#059669'; // Dark green
      case GoalStatus.paused:
        return '#F59E0B'; // Orange
      case GoalStatus.onHold:
        return '#6B7280'; // Gray
      case GoalStatus.cancelled:
        return '#EF4444'; // Red
    }
  }

  /// Priority color
  String get priorityColor {
    switch (priority) {
      case GoalPriority.low:
        return '#6B7280'; // Gray
      case GoalPriority.medium:
        return '#F59E0B'; // Orange
      case GoalPriority.high:
        return '#EF4444'; // Red
    }
  }
}

@freezed
class MilestoneModel with _$MilestoneModel {
  const factory MilestoneModel({
    required String id,
    required String goalId,
    required String title,
    String? description,
    @JsonKey(name: 'target_value') double? targetValue,
    @JsonKey(name: 'current_value') @Default(0.0) double currentValue,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'completed_date') DateTime? completedDate,
    @Default(MilestoneStatus.notStarted) MilestoneStatus status,
    @Default(1) int order,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? notes,
    Map<String, dynamic>? metadata,
  }) = _MilestoneModel;

  factory MilestoneModel.fromJson(Map<String, dynamic> json) =>
      _$MilestoneModelFromJson(json);

  const MilestoneModel._();

  /// Whether the milestone is completed
  bool get isCompleted => status == MilestoneStatus.completed;

  /// Whether the milestone is in progress
  bool get isInProgress => status == MilestoneStatus.inProgress;

  /// Progress as percentage (0.0 to 1.0)
  double get progress {
    if (targetValue == null || targetValue! <= 0) {
      return isCompleted ? 1.0 : 0.0;
    }
    return (currentValue / targetValue!).clamp(0.0, 1.0);
  }

  /// Whether the milestone is overdue
  bool get isOverdue {
    if (isCompleted || dueDate == null) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  /// Days until due date
  int? get daysUntilDue {
    if (dueDate == null) return null;
    return dueDate!.difference(DateTime.now()).inDays;
  }
}

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String goalId,
    required String title,
    String? description,
    @Default(TaskStatus.todo) TaskStatus status,
    @Default(TaskPriority.medium) TaskPriority priority,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'completed_date') DateTime? completedDate,
    @JsonKey(name: 'estimated_hours') double? estimatedHours,
    @JsonKey(name: 'actual_hours') double? actualHours,
    @Default(1) int order,
    List<String>? tags,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    Map<String, dynamic>? metadata,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  const TaskModel._();

  /// Whether the task is completed
  bool get isCompleted => status == TaskStatus.done;

  /// Whether the task is in progress
  bool get isInProgress => status == TaskStatus.inProgress;

  /// Whether the task is overdue
  bool get isOverdue {
    if (isCompleted || dueDate == null) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  /// Days until due date
  int? get daysUntilDue {
    if (dueDate == null) return null;
    return dueDate!.difference(DateTime.now()).inDays;
  }

  /// Time variance (actual vs estimated)
  double? get timeVariance {
    if (estimatedHours == null || actualHours == null) return null;
    return actualHours! - estimatedHours!;
  }

  /// Whether the task was completed on time
  bool? get completedOnTime {
    if (completedDate == null || dueDate == null) return null;
    return completedDate!.isBefore(dueDate!) || completedDate!.isAtSameMomentAs(dueDate!);
  }
}

@freezed
class GoalMetrics with _$GoalMetrics {
  const factory GoalMetrics({
    @JsonKey(name: 'total_time_spent_hours') @Default(0.0) double totalTimeSpentHours,
    @JsonKey(name: 'sessions_count') @Default(0) int sessionsCount,
    @JsonKey(name: 'average_session_hours') @Default(0.0) double averageSessionHours,
    @JsonKey(name: 'streak_days') @Default(0) int streakDays,
    @JsonKey(name: 'best_streak_days') @Default(0) int bestStreakDays,
    @JsonKey(name: 'completion_rate') @Default(0.0) double completionRate,
    @JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,
    Map<String, dynamic>? weeklyData,
    Map<String, dynamic>? monthlyData,
  }) = _GoalMetrics;

  factory GoalMetrics.fromJson(Map<String, dynamic> json) =>
      _$GoalMetricsFromJson(json);

  const GoalMetrics._();

  /// Average hours per day
  double get averageHoursPerDay {
    if (totalTimeSpentHours <= 0) return 0.0;
    // Approximate based on sessions
    final estimatedDays = sessionsCount > 0 ? sessionsCount : 1;
    return totalTimeSpentHours / estimatedDays;
  }

  /// Whether the goal is actively being worked on
  bool get isActive {
    if (lastActivityDate == null) return false;
    return DateTime.now().difference(lastActivityDate!).inDays <= 7;
  }
}

// Enums
enum GoalCategory {
  @JsonValue('career')
  career,
  @JsonValue('education')
  education,
  @JsonValue('health')
  health,
  @JsonValue('finance')
  finance,
  @JsonValue('relationship')
  relationship,
  @JsonValue('personal')
  personal,
  @JsonValue('hobby')
  hobby,
  @JsonValue('travel')
  travel,
  @JsonValue('business')
  business,
  @JsonValue('other')
  other,
}

enum GoalStatus {
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('paused')
  paused,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('cancelled')
  cancelled,
}

enum GoalPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}

enum GoalDifficulty {
  easy,
  medium,
  hard,
}

enum MilestoneStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
}

enum TaskStatus {
  @JsonValue('todo')
  todo,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('done')
  done,
}

enum TaskPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}

enum ReminderFrequency {
  @JsonValue('none')
  none,
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('monthly')
  monthly,
}

// Extensions for List<GoalModel>
extension GoalListExtensions on List<GoalModel> {
  /// Get active goals
  List<GoalModel> get active => where((g) => g.isActive && !g.isArchived).toList();

  /// Get completed goals
  List<GoalModel> get completed => where((g) => g.isCompleted).toList();

  /// Get overdue goals
  List<GoalModel> get overdue => where((g) => g.isOverdue).toList();

  /// Get goals due soon
  List<GoalModel> get dueSoon => where((g) => g.isDueSoon).toList();

  /// Group by category
  Map<GoalCategory, List<GoalModel>> get byCategory {
    final map = <GoalCategory, List<GoalModel>>{};
    for (final goal in this) {
      (map[goal.category] ??= <GoalModel>[]).add(goal);
    }
    return map;
  }

  /// Group by status
  Map<GoalStatus, List<GoalModel>> get byStatus {
    final map = <GoalStatus, List<GoalModel>>{};
    for (final goal in this) {
      (map[goal.status] ??= <GoalModel>[]).add(goal);
    }
    return map;
  }

  /// Group by priority
  Map<GoalPriority, List<GoalModel>> get byPriority {
    final map = <GoalPriority, List<GoalModel>>{};
    for (final goal in this) {
      (map[goal.priority] ??= <GoalModel>[]).add(goal);
    }
    return map;
  }

  /// Get average completion rate
  double get averageProgress {
    if (isEmpty) return 0.0;
    return fold(0.0, (sum, goal) => sum + goal.progress) / length;
  }

  /// Get total completed goals count
  int get completedCount => completed.length;

  /// Get completion rate percentage
  double get completionRate => isEmpty ? 0.0 : (completedCount / length) * 100;

  /// Sort by priority (high to low)
  List<GoalModel> get sortedByPriority {
    final list = List<GoalModel>.from(this);
    list.sort((a, b) => b.priority.index.compareTo(a.priority.index));
    return list;
  }

  /// Sort by due date (earliest first)
  List<GoalModel> get sortedByDueDate {
    final list = List<GoalModel>.from(this);
    list.sort((a, b) {
      if (a.dueDate == null && b.dueDate == null) return 0;
      if (a.dueDate == null) return 1;
      if (b.dueDate == null) return -1;
      return a.dueDate!.compareTo(b.dueDate!);
    });
    return list;
  }

  /// Sort by progress (highest first)
  List<GoalModel> get sortedByProgress {
    final list = List<GoalModel>.from(this);
    list.sort((a, b) => b.progress.compareTo(a.progress));
    return list;
  }
}