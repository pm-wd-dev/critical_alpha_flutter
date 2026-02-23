// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanModelImpl _$$PlanModelImplFromJson(Map<String, dynamic> json) =>
    _$PlanModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['discription'] as String?,
      contingency: json['contingency'] as String?,
      improve: json['improve'] as String?,
      status: json['status'] as String? ?? 'false',
      type: json['type'] as String?,
      reminderDate: json['reminderDate'] == null
          ? null
          : DateTime.parse(json['reminderDate'] as String),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PlanModelImplToJson(_$PlanModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'discription': instance.description,
      'contingency': instance.contingency,
      'improve': instance.improve,
      'status': instance.status,
      'type': instance.type,
      'reminderDate': instance.reminderDate?.toIso8601String(),
      'deadline': instance.deadline?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
