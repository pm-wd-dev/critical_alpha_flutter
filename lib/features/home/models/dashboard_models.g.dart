// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      stats: DashboardStats.fromJson(json['stats'] as Map<String, dynamic>),
      recentGoals: (json['recentGoals'] as List<dynamic>)
          .map((e) => RecentGoal.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcomingAssessments: (json['upcomingAssessments'] as List<dynamic>)
          .map((e) => UpcomingAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => DashboardInsight.fromJson(e as Map<String, dynamic>))
          .toList(),
      weeklyProgress: WeeklyProgress.fromJson(
          json['weeklyProgress'] as Map<String, dynamic>),
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) =>
                  DashboardNotification.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'recentGoals': instance.recentGoals,
      'upcomingAssessments': instance.upcomingAssessments,
      'insights': instance.insights,
      'weeklyProgress': instance.weeklyProgress,
      'notifications': instance.notifications,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      totalGoals: (json['totalGoals'] as num?)?.toInt() ?? 0,
      activeGoals: (json['activeGoals'] as num?)?.toInt() ?? 0,
      completedGoals: (json['completedGoals'] as num?)?.toInt() ?? 0,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      completionRate: (json['completionRate'] as num?)?.toDouble() ?? 0.0,
      totalAssessments: (json['totalAssessments'] as num?)?.toInt() ?? 0,
      hoursSpentLearning: (json['hoursSpentLearning'] as num?)?.toInt() ?? 0,
      averageScore: (json['averageScore'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
        _$DashboardStatsImpl instance) =>
    <String, dynamic>{
      'totalGoals': instance.totalGoals,
      'activeGoals': instance.activeGoals,
      'completedGoals': instance.completedGoals,
      'streakDays': instance.streakDays,
      'completionRate': instance.completionRate,
      'totalAssessments': instance.totalAssessments,
      'hoursSpentLearning': instance.hoursSpentLearning,
      'averageScore': instance.averageScore,
    };

_$RecentGoalImpl _$$RecentGoalImplFromJson(Map<String, dynamic> json) =>
    _$RecentGoalImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      progress: (json['progress'] as num).toDouble(),
      deadline: DateTime.parse(json['deadline'] as String),
      status: $enumDecode(_$GoalStatusEnumMap, json['status']),
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$RecentGoalImplToJson(_$RecentGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'progress': instance.progress,
      'deadline': instance.deadline.toIso8601String(),
      'status': _$GoalStatusEnumMap[instance.status]!,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$GoalStatusEnumMap = {
  GoalStatus.notStarted: 'not_started',
  GoalStatus.inProgress: 'in_progress',
  GoalStatus.completed: 'completed',
  GoalStatus.paused: 'paused',
  GoalStatus.overdue: 'overdue',
};

_$UpcomingAssessmentImpl _$$UpcomingAssessmentImplFromJson(
        Map<String, dynamic> json) =>
    _$UpcomingAssessmentImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      duration: (json['duration'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      description: json['description'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$UpcomingAssessmentImplToJson(
        _$UpcomingAssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'duration': instance.duration,
      'isCompleted': instance.isCompleted,
      'description': instance.description,
      'category': instance.category,
    };

_$DashboardInsightImpl _$$DashboardInsightImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardInsightImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      priority: $enumDecode(_$InsightPriorityEnumMap, json['priority']),
      actionText: json['actionText'] as String?,
      actionRoute: json['actionRoute'] as String?,
      actionData: json['actionData'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DashboardInsightImplToJson(
        _$DashboardInsightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'priority': _$InsightPriorityEnumMap[instance.priority]!,
      'actionText': instance.actionText,
      'actionRoute': instance.actionRoute,
      'actionData': instance.actionData,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$InsightTypeEnumMap = {
  InsightType.achievement: 'achievement',
  InsightType.reminder: 'reminder',
  InsightType.suggestion: 'suggestion',
  InsightType.warning: 'warning',
  InsightType.celebration: 'celebration',
};

const _$InsightPriorityEnumMap = {
  InsightPriority.high: 'high',
  InsightPriority.medium: 'medium',
  InsightPriority.low: 'low',
};

_$WeeklyProgressImpl _$$WeeklyProgressImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyProgressImpl(
      days: (json['days'] as List<dynamic>)
          .map((e) => DayProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageDaily: (json['averageDaily'] as num?)?.toDouble() ?? 0.0,
      weeklyGoal: (json['weeklyGoal'] as num?)?.toDouble() ?? 0.0,
      totalProgress: (json['totalProgress'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$WeeklyProgressImplToJson(
        _$WeeklyProgressImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'averageDaily': instance.averageDaily,
      'weeklyGoal': instance.weeklyGoal,
      'totalProgress': instance.totalProgress,
    };

_$DayProgressImpl _$$DayProgressImplFromJson(Map<String, dynamic> json) =>
    _$DayProgressImpl(
      date: DateTime.parse(json['date'] as String),
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      goalsWorkedOn: (json['goalsWorkedOn'] as num?)?.toInt() ?? 0,
      goalsCompleted: (json['goalsCompleted'] as num?)?.toInt() ?? 0,
      minutesSpent: (json['minutesSpent'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DayProgressImplToJson(_$DayProgressImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'progress': instance.progress,
      'goalsWorkedOn': instance.goalsWorkedOn,
      'goalsCompleted': instance.goalsCompleted,
      'minutesSpent': instance.minutesSpent,
    };

_$DashboardNotificationImpl _$$DashboardNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardNotificationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      isRead: json['isRead'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      actionRoute: json['actionRoute'] as String?,
      actionData: json['actionData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DashboardNotificationImplToJson(
        _$DashboardNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt?.toIso8601String(),
      'actionRoute': instance.actionRoute,
      'actionData': instance.actionData,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.success: 'success',
  NotificationType.warning: 'warning',
  NotificationType.error: 'error',
  NotificationType.info: 'info',
};
