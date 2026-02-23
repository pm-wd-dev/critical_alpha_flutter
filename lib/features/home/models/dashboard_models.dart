import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardStats stats,
    required List<RecentGoal> recentGoals,
    required List<UpcomingAssessment> upcomingAssessments,
    required List<DashboardInsight> insights,
    required WeeklyProgress weeklyProgress,
    @Default([]) List<DashboardNotification> notifications,
    DateTime? lastUpdated,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    @Default(0) int totalGoals,
    @Default(0) int activeGoals,
    @Default(0) int completedGoals,
    @Default(0) int streakDays,
    @Default(0.0) double completionRate,
    @Default(0) int totalAssessments,
    @Default(0) int hoursSpentLearning,
    @Default(0.0) double averageScore,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);

  const DashboardStats._();

  String get completionRateString => '${(completionRate * 100).toStringAsFixed(1)}%';
  String get averageScoreString => averageScore.toStringAsFixed(1);
  String get streakText => streakDays == 1 ? '$streakDays day' : '$streakDays days';
}

@freezed
class RecentGoal with _$RecentGoal {
  const factory RecentGoal({
    required String id,
    required String title,
    required String category,
    required double progress,
    required DateTime deadline,
    required GoalStatus status,
    String? description,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _RecentGoal;

  factory RecentGoal.fromJson(Map<String, dynamic> json) =>
      _$RecentGoalFromJson(json);

  const RecentGoal._();

  String get progressString => '${(progress * 100).toStringAsFixed(0)}%';
  bool get isOverdue => deadline.isBefore(DateTime.now()) && status != GoalStatus.completed;
  bool get isDueSoon => deadline.difference(DateTime.now()).inDays <= 3 && status != GoalStatus.completed;

  Color get statusColor {
    switch (status) {
      case GoalStatus.completed:
        return const Color(0xFF10B981); // Green
      case GoalStatus.inProgress:
        return const Color(0xFF6366F1); // Blue
      case GoalStatus.notStarted:
        return const Color(0xFF9CA3AF); // Gray
      case GoalStatus.paused:
        return const Color(0xFFF59E0B); // Orange
      case GoalStatus.overdue:
        return const Color(0xFFEF4444); // Red
    }
  }
}

enum GoalStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('paused')
  paused,
  @JsonValue('overdue')
  overdue,
}

@freezed
class UpcomingAssessment with _$UpcomingAssessment {
  const factory UpcomingAssessment({
    required String id,
    required String title,
    required String type,
    required DateTime scheduledDate,
    required int duration,
    @Default(false) bool isCompleted,
    String? description,
    String? category,
  }) = _UpcomingAssessment;

  factory UpcomingAssessment.fromJson(Map<String, dynamic> json) =>
      _$UpcomingAssessmentFromJson(json);

  const UpcomingAssessment._();

  String get durationString => '$duration min';
  String get timeUntil {
    final difference = scheduledDate.difference(DateTime.now());
    if (difference.inDays > 0) {
      return '${difference.inDays} days';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes';
    } else {
      return 'Now';
    }
  }
}

@freezed
class DashboardInsight with _$DashboardInsight {
  const factory DashboardInsight({
    required String id,
    required String title,
    required String description,
    required InsightType type,
    required InsightPriority priority,
    String? actionText,
    String? actionRoute,
    Map<String, dynamic>? actionData,
    DateTime? createdAt,
  }) = _DashboardInsight;

  factory DashboardInsight.fromJson(Map<String, dynamic> json) =>
      _$DashboardInsightFromJson(json);

  const DashboardInsight._();

  Color get priorityColor {
    switch (priority) {
      case InsightPriority.high:
        return const Color(0xFFEF4444); // Red
      case InsightPriority.medium:
        return const Color(0xFFF59E0B); // Orange
      case InsightPriority.low:
        return const Color(0xFF10B981); // Green
    }
  }

  IconData get typeIcon {
    switch (type) {
      case InsightType.achievement:
        return Icons.emoji_events;
      case InsightType.reminder:
        return Icons.alarm;
      case InsightType.suggestion:
        return Icons.lightbulb_outline;
      case InsightType.warning:
        return Icons.warning_outlined;
      case InsightType.celebration:
        return Icons.celebration;
    }
  }
}

enum InsightType {
  @JsonValue('achievement')
  achievement,
  @JsonValue('reminder')
  reminder,
  @JsonValue('suggestion')
  suggestion,
  @JsonValue('warning')
  warning,
  @JsonValue('celebration')
  celebration,
}

enum InsightPriority {
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
}

@freezed
class WeeklyProgress with _$WeeklyProgress {
  const factory WeeklyProgress({
    required List<DayProgress> days,
    @Default(0.0) double averageDaily,
    @Default(0.0) double weeklyGoal,
    @Default(0.0) double totalProgress,
  }) = _WeeklyProgress;

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) =>
      _$WeeklyProgressFromJson(json);

  const WeeklyProgress._();

  double get weeklyGoalPercentage => weeklyGoal > 0 ? (totalProgress / weeklyGoal).clamp(0.0, 1.0) : 0.0;
  String get weeklyGoalString => '${(weeklyGoalPercentage * 100).toStringAsFixed(0)}%';
}

@freezed
class DayProgress with _$DayProgress {
  const factory DayProgress({
    required DateTime date,
    @Default(0.0) double progress,
    @Default(0) int goalsWorkedOn,
    @Default(0) int goalsCompleted,
    @Default(0) int minutesSpent,
  }) = _DayProgress;

  factory DayProgress.fromJson(Map<String, dynamic> json) =>
      _$DayProgressFromJson(json);

  const DayProgress._();

  String get dayName => ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][date.weekday - 1];
  bool get hasActivity => goalsWorkedOn > 0 || minutesSpent > 0;
}

@freezed
class DashboardNotification with _$DashboardNotification {
  const factory DashboardNotification({
    required String id,
    required String title,
    required String message,
    required NotificationType type,
    @Default(false) bool isRead,
    DateTime? createdAt,
    String? actionRoute,
    Map<String, dynamic>? actionData,
  }) = _DashboardNotification;

  factory DashboardNotification.fromJson(Map<String, dynamic> json) =>
      _$DashboardNotificationFromJson(json);

  const DashboardNotification._();

  String get timeAgo {
    if (createdAt == null) return '';
    final difference = DateTime.now().difference(createdAt!);
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  Color get typeColor {
    switch (type) {
      case NotificationType.success:
        return const Color(0xFF10B981);
      case NotificationType.warning:
        return const Color(0xFFF59E0B);
      case NotificationType.error:
        return const Color(0xFFEF4444);
      case NotificationType.info:
        return const Color(0xFF6366F1);
    }
  }

  IconData get typeIcon {
    switch (type) {
      case NotificationType.success:
        return Icons.check_circle_outline;
      case NotificationType.warning:
        return Icons.warning_outlined;
      case NotificationType.error:
        return Icons.error_outline;
      case NotificationType.info:
        return Icons.info_outline;
    }
  }
}

enum NotificationType {
  @JsonValue('success')
  success,
  @JsonValue('warning')
  warning,
  @JsonValue('error')
  error,
  @JsonValue('info')
  info,
}