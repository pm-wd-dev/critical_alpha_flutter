// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentImpl _$$AssessmentImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      planId: json['planId'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AssessmentImplToJson(_$AssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'planId': instance.planId,
      'data': instance.data,
    };

_$AssessmentLineGraphDataImpl _$$AssessmentLineGraphDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentLineGraphDataImpl(
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      dataset:
          AssessmentDataset.fromJson(json['dataset'] as Map<String, dynamic>),
      legend:
          (json['legend'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AssessmentLineGraphDataImplToJson(
        _$AssessmentLineGraphDataImpl instance) =>
    <String, dynamic>{
      'labels': instance.labels,
      'dataset': instance.dataset,
      'legend': instance.legend,
    };

_$AssessmentDatasetImpl _$$AssessmentDatasetImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentDatasetImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      color: json['color'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AssessmentDatasetImplToJson(
        _$AssessmentDatasetImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'color': instance.color,
      'runtimeType': instance.$type,
    };

_$AssessmentDatasetMultipleImpl _$$AssessmentDatasetMultipleImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentDatasetMultipleImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => AssessmentDatasetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AssessmentDatasetMultipleImplToJson(
        _$AssessmentDatasetMultipleImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'runtimeType': instance.$type,
    };

_$AssessmentDatasetItemImpl _$$AssessmentDatasetItemImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentDatasetItemImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      color: json['color'] as String,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$AssessmentDatasetItemImplToJson(
        _$AssessmentDatasetItemImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'color': instance.color,
      'label': instance.label,
    };
