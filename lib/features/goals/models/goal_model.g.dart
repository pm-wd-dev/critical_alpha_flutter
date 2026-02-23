// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalModelImpl _$$GoalModelImplFromJson(Map<String, dynamic> json) =>
    _$GoalModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$GoalCategoryEnumMap, json['category']),
      status: $enumDecode(_$GoalStatusEnumMap, json['status']),
      priority: $enumDecode(_$GoalPriorityEnumMap, json['priority']),
      targetValue: (json['target_value'] as num?)?.toDouble(),
      currentValue: (json['current_value'] as num?)?.toDouble() ?? 0.0,
      unit: json['unit'] as String?,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      completedDate: json['completed_date'] == null
          ? null
          : DateTime.parse(json['completed_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      milestones: (json['milestones'] as List<dynamic>?)
          ?.map((e) => MilestoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notes: json['notes'] as String?,
      reminderFrequency: $enumDecodeNullable(
          _$ReminderFrequencyEnumMap, json['reminder_frequency']),
      isPublic: json['is_public'] as bool? ?? false,
      isArchived: json['is_archived'] as bool? ?? false,
      metrics: json['metrics'] == null
          ? null
          : GoalMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GoalModelImplToJson(_$GoalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': _$GoalCategoryEnumMap[instance.category]!,
      'status': _$GoalStatusEnumMap[instance.status]!,
      'priority': _$GoalPriorityEnumMap[instance.priority]!,
      'target_value': instance.targetValue,
      'current_value': instance.currentValue,
      'unit': instance.unit,
      'due_date': instance.dueDate?.toIso8601String(),
      'start_date': instance.startDate?.toIso8601String(),
      'completed_date': instance.completedDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'milestones': instance.milestones,
      'tasks': instance.tasks,
      'tags': instance.tags,
      'notes': instance.notes,
      'reminder_frequency':
          _$ReminderFrequencyEnumMap[instance.reminderFrequency],
      'is_public': instance.isPublic,
      'is_archived': instance.isArchived,
      'metrics': instance.metrics,
      'metadata': instance.metadata,
    };

const _$GoalCategoryEnumMap = {
  GoalCategory.career: 'career',
  GoalCategory.education: 'education',
  GoalCategory.health: 'health',
  GoalCategory.finance: 'finance',
  GoalCategory.relationship: 'relationship',
  GoalCategory.personal: 'personal',
  GoalCategory.hobby: 'hobby',
  GoalCategory.travel: 'travel',
  GoalCategory.business: 'business',
  GoalCategory.other: 'other',
};

const _$GoalStatusEnumMap = {
  GoalStatus.active: 'active',
  GoalStatus.completed: 'completed',
  GoalStatus.paused: 'paused',
  GoalStatus.onHold: 'on_hold',
  GoalStatus.cancelled: 'cancelled',
};

const _$GoalPriorityEnumMap = {
  GoalPriority.low: 'low',
  GoalPriority.medium: 'medium',
  GoalPriority.high: 'high',
};

const _$ReminderFrequencyEnumMap = {
  ReminderFrequency.none: 'none',
  ReminderFrequency.daily: 'daily',
  ReminderFrequency.weekly: 'weekly',
  ReminderFrequency.monthly: 'monthly',
};

_$MilestoneModelImpl _$$MilestoneModelImplFromJson(Map<String, dynamic> json) =>
    _$MilestoneModelImpl(
      id: json['id'] as String,
      goalId: json['goalId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      targetValue: (json['target_value'] as num?)?.toDouble(),
      currentValue: (json['current_value'] as num?)?.toDouble() ?? 0.0,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      completedDate: json['completed_date'] == null
          ? null
          : DateTime.parse(json['completed_date'] as String),
      status: $enumDecodeNullable(_$MilestoneStatusEnumMap, json['status']) ??
          MilestoneStatus.notStarted,
      order: (json['order'] as num?)?.toInt() ?? 1,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      notes: json['notes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MilestoneModelImplToJson(
        _$MilestoneModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goalId': instance.goalId,
      'title': instance.title,
      'description': instance.description,
      'target_value': instance.targetValue,
      'current_value': instance.currentValue,
      'due_date': instance.dueDate?.toIso8601String(),
      'completed_date': instance.completedDate?.toIso8601String(),
      'status': _$MilestoneStatusEnumMap[instance.status]!,
      'order': instance.order,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'notes': instance.notes,
      'metadata': instance.metadata,
    };

const _$MilestoneStatusEnumMap = {
  MilestoneStatus.notStarted: 'not_started',
  MilestoneStatus.inProgress: 'in_progress',
  MilestoneStatus.completed: 'completed',
};

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      goalId: json['goalId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.todo,
      priority: $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
          TaskPriority.medium,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      completedDate: json['completed_date'] == null
          ? null
          : DateTime.parse(json['completed_date'] as String),
      estimatedHours: (json['estimated_hours'] as num?)?.toDouble(),
      actualHours: (json['actual_hours'] as num?)?.toDouble(),
      order: (json['order'] as num?)?.toInt() ?? 1,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goalId': instance.goalId,
      'title': instance.title,
      'description': instance.description,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'due_date': instance.dueDate?.toIso8601String(),
      'completed_date': instance.completedDate?.toIso8601String(),
      'estimated_hours': instance.estimatedHours,
      'actual_hours': instance.actualHours,
      'order': instance.order,
      'tags': instance.tags,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.inProgress: 'in_progress',
  TaskStatus.done: 'done',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};

_$GoalMetricsImpl _$$GoalMetricsImplFromJson(Map<String, dynamic> json) =>
    _$GoalMetricsImpl(
      totalTimeSpentHours:
          (json['total_time_spent_hours'] as num?)?.toDouble() ?? 0.0,
      sessionsCount: (json['sessions_count'] as num?)?.toInt() ?? 0,
      averageSessionHours:
          (json['average_session_hours'] as num?)?.toDouble() ?? 0.0,
      streakDays: (json['streak_days'] as num?)?.toInt() ?? 0,
      bestStreakDays: (json['best_streak_days'] as num?)?.toInt() ?? 0,
      completionRate: (json['completion_rate'] as num?)?.toDouble() ?? 0.0,
      lastActivityDate: json['last_activity_date'] == null
          ? null
          : DateTime.parse(json['last_activity_date'] as String),
      weeklyData: json['weeklyData'] as Map<String, dynamic>?,
      monthlyData: json['monthlyData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GoalMetricsImplToJson(_$GoalMetricsImpl instance) =>
    <String, dynamic>{
      'total_time_spent_hours': instance.totalTimeSpentHours,
      'sessions_count': instance.sessionsCount,
      'average_session_hours': instance.averageSessionHours,
      'streak_days': instance.streakDays,
      'best_streak_days': instance.bestStreakDays,
      'completion_rate': instance.completionRate,
      'last_activity_date': instance.lastActivityDate?.toIso8601String(),
      'weeklyData': instance.weeklyData,
      'monthlyData': instance.monthlyData,
    };
