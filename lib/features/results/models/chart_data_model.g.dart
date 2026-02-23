// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartDataModelImpl _$$ChartDataModelImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$ChartTypeEnumMap, json['type']),
      dataPoints: (json['dataPoints'] as List<dynamic>)
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : ChartMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : ChartStyle.fromJson(json['style'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ChartDataModelImplToJson(
        _$ChartDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$ChartTypeEnumMap[instance.type]!,
      'dataPoints': instance.dataPoints,
      'metadata': instance.metadata,
      'style': instance.style,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ChartTypeEnumMap = {
  ChartType.line: 'line',
  ChartType.bar: 'bar',
  ChartType.pie: 'pie',
  ChartType.radar: 'radar',
  ChartType.area: 'area',
  ChartType.scatter: 'scatter',
};

_$DataPointImpl _$$DataPointImplFromJson(Map<String, dynamic> json) =>
    _$DataPointImpl(
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toDouble(),
      label: json['label'] as String?,
      category: json['category'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DataPointImplToJson(_$DataPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
      'label': instance.label,
      'category': instance.category,
      'metadata': instance.metadata,
    };

_$ChartMetadataImpl _$$ChartMetadataImplFromJson(Map<String, dynamic> json) =>
    _$ChartMetadataImpl(
      xAxisLabel: json['xAxisLabel'] as String?,
      yAxisLabel: json['yAxisLabel'] as String?,
      description: json['description'] as String?,
      dataSource: json['dataSource'] as String?,
      unit: json['unit'] as String?,
      showLegend: json['show_legend'] as bool? ?? true,
      showGrid: json['show_grid'] as bool? ?? true,
      showValues: json['show_values'] as bool? ?? false,
      animate: json['animate'] as bool? ?? true,
      minY: (json['minY'] as num?)?.toDouble(),
      maxY: (json['maxY'] as num?)?.toDouble(),
      customProperties: json['customProperties'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChartMetadataImplToJson(_$ChartMetadataImpl instance) =>
    <String, dynamic>{
      'xAxisLabel': instance.xAxisLabel,
      'yAxisLabel': instance.yAxisLabel,
      'description': instance.description,
      'dataSource': instance.dataSource,
      'unit': instance.unit,
      'show_legend': instance.showLegend,
      'show_grid': instance.showGrid,
      'show_values': instance.showValues,
      'animate': instance.animate,
      'minY': instance.minY,
      'maxY': instance.maxY,
      'customProperties': instance.customProperties,
    };

_$ChartStyleImpl _$$ChartStyleImplFromJson(Map<String, dynamic> json) =>
    _$ChartStyleImpl(
      strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 2.0,
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 12.0,
      fontFamily: json['fontFamily'] as String?,
      borderRadius: (json['border_radius'] as num?)?.toDouble() ?? 8.0,
      padding: (json['padding'] as num?)?.toDouble() ?? 16.0,
      customStyles: json['customStyles'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChartStyleImplToJson(_$ChartStyleImpl instance) =>
    <String, dynamic>{
      'strokeWidth': instance.strokeWidth,
      'fontSize': instance.fontSize,
      'fontFamily': instance.fontFamily,
      'border_radius': instance.borderRadius,
      'padding': instance.padding,
      'customStyles': instance.customStyles,
    };

_$LineChartDataModelImpl _$$LineChartDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LineChartDataModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      series: (json['series'] as List<dynamic>)
          .map((e) => LineSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : ChartMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : ChartStyle.fromJson(json['style'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$LineChartDataModelImplToJson(
        _$LineChartDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'series': instance.series,
      'metadata': instance.metadata,
      'style': instance.style,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$LineSeriesDataImpl _$$LineSeriesDataImplFromJson(Map<String, dynamic> json) =>
    _$LineSeriesDataImpl(
      name: json['name'] as String,
      dataPoints: (json['dataPoints'] as List<dynamic>)
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 2.0,
      showDots: json['showDots'] as bool? ?? true,
      isCurved: json['isCurved'] as bool? ?? true,
    );

Map<String, dynamic> _$$LineSeriesDataImplToJson(
        _$LineSeriesDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dataPoints': instance.dataPoints,
      'strokeWidth': instance.strokeWidth,
      'showDots': instance.showDots,
      'isCurved': instance.isCurved,
    };

_$BarChartDataModelImpl _$$BarChartDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BarChartDataModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      series: (json['series'] as List<dynamic>)
          .map((e) => BarSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : ChartMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : ChartStyle.fromJson(json['style'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BarChartDataModelImplToJson(
        _$BarChartDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'series': instance.series,
      'metadata': instance.metadata,
      'style': instance.style,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$BarSeriesDataImpl _$$BarSeriesDataImplFromJson(Map<String, dynamic> json) =>
    _$BarSeriesDataImpl(
      name: json['name'] as String,
      dataPoints: (json['dataPoints'] as List<dynamic>)
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BarSeriesDataImplToJson(_$BarSeriesDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dataPoints': instance.dataPoints,
    };

_$PieChartDataModelImpl _$$PieChartDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PieChartDataModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      slices: (json['slices'] as List<dynamic>)
          .map((e) => PieSliceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : ChartMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : ChartStyle.fromJson(json['style'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PieChartDataModelImplToJson(
        _$PieChartDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slices': instance.slices,
      'metadata': instance.metadata,
      'style': instance.style,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$PieSliceDataImpl _$$PieSliceDataImplFromJson(Map<String, dynamic> json) =>
    _$PieSliceDataImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PieSliceDataImplToJson(_$PieSliceDataImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'description': instance.description,
    };

_$RadarChartDataModelImpl _$$RadarChartDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RadarChartDataModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      series: (json['series'] as List<dynamic>)
          .map((e) => RadarSeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : ChartMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : ChartStyle.fromJson(json['style'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$RadarChartDataModelImplToJson(
        _$RadarChartDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categories': instance.categories,
      'series': instance.series,
      'metadata': instance.metadata,
      'style': instance.style,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$RadarSeriesDataImpl _$$RadarSeriesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RadarSeriesDataImpl(
      name: json['name'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 2.0,
      fillOpacity: (json['fillOpacity'] as num?)?.toDouble() ?? 0.3,
    );

Map<String, dynamic> _$$RadarSeriesDataImplToJson(
        _$RadarSeriesDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
      'strokeWidth': instance.strokeWidth,
      'fillOpacity': instance.fillOpacity,
    };
