// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuickActionModelImpl _$$QuickActionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuickActionModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      route: json['route'] as String,
      type: $enumDecode(_$QuickActionTypeEnumMap, json['type']),
      metadata: json['metadata'] as Map<String, dynamic>?,
      apiEndpoint: json['apiEndpoint'] as String?,
    );

Map<String, dynamic> _$$QuickActionModelImplToJson(
        _$QuickActionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
      'route': instance.route,
      'type': _$QuickActionTypeEnumMap[instance.type]!,
      'metadata': instance.metadata,
      'apiEndpoint': instance.apiEndpoint,
    };

const _$QuickActionTypeEnumMap = {
  QuickActionType.navigation: 'navigation',
  QuickActionType.action: 'action',
  QuickActionType.api: 'api',
};

_$InsightModelImpl _$$InsightModelImplFromJson(Map<String, dynamic> json) =>
    _$InsightModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      actionRoute: json['actionRoute'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$InsightModelImplToJson(_$InsightModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'actionRoute': instance.actionRoute,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$WeeklyProgressDataImpl _$$WeeklyProgressDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyProgressDataImpl(
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => DayData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalProgress: (json['totalProgress'] as num?)?.toDouble() ?? 0.0,
      averageDaily: (json['averageDaily'] as num?)?.toDouble() ?? 0.0,
      weeklyGoal: (json['weeklyGoal'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$WeeklyProgressDataImplToJson(
        _$WeeklyProgressDataImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'totalProgress': instance.totalProgress,
      'averageDaily': instance.averageDaily,
      'weeklyGoal': instance.weeklyGoal,
    };

_$DayDataImpl _$$DayDataImplFromJson(Map<String, dynamic> json) =>
    _$DayDataImpl(
      date: DateTime.parse(json['date'] as String),
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      activitiesCompleted: (json['activitiesCompleted'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DayDataImplToJson(_$DayDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'progress': instance.progress,
      'activitiesCompleted': instance.activitiesCompleted,
    };
