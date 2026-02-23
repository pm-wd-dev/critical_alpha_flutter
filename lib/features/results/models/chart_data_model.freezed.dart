// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChartDataModel _$ChartDataModelFromJson(Map<String, dynamic> json) {
  return _ChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$ChartDataModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ChartType get type => throw _privateConstructorUsedError;
  List<DataPoint> get dataPoints => throw _privateConstructorUsedError;
  ChartMetadata? get metadata => throw _privateConstructorUsedError;
  ChartStyle? get style => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartDataModelCopyWith<ChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataModelCopyWith<$Res> {
  factory $ChartDataModelCopyWith(
          ChartDataModel value, $Res Function(ChartDataModel) then) =
      _$ChartDataModelCopyWithImpl<$Res, ChartDataModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      ChartType type,
      List<DataPoint> dataPoints,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ChartMetadataCopyWith<$Res>? get metadata;
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class _$ChartDataModelCopyWithImpl<$Res, $Val extends ChartDataModel>
    implements $ChartDataModelCopyWith<$Res> {
  _$ChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? dataPoints = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartType,
      dataPoints: null == dataPoints
          ? _value.dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChartMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartStyleCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $ChartStyleCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartDataModelImplCopyWith<$Res>
    implements $ChartDataModelCopyWith<$Res> {
  factory _$$ChartDataModelImplCopyWith(_$ChartDataModelImpl value,
          $Res Function(_$ChartDataModelImpl) then) =
      __$$ChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      ChartType type,
      List<DataPoint> dataPoints,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ChartMetadataCopyWith<$Res>? get metadata;
  @override
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class __$$ChartDataModelImplCopyWithImpl<$Res>
    extends _$ChartDataModelCopyWithImpl<$Res, _$ChartDataModelImpl>
    implements _$$ChartDataModelImplCopyWith<$Res> {
  __$$ChartDataModelImplCopyWithImpl(
      _$ChartDataModelImpl _value, $Res Function(_$ChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? dataPoints = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ChartDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartType,
      dataPoints: null == dataPoints
          ? _value._dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataModelImpl extends _ChartDataModel {
  const _$ChartDataModelImpl(
      {required this.id,
      required this.title,
      required this.type,
      required final List<DataPoint> dataPoints,
      this.metadata,
      this.style,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _dataPoints = dataPoints,
        super._();

  factory _$ChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final ChartType type;
  final List<DataPoint> _dataPoints;
  @override
  List<DataPoint> get dataPoints {
    if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataPoints);
  }

  @override
  final ChartMetadata? metadata;
  @override
  final ChartStyle? style;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ChartDataModel(id: $id, title: $title, type: $type, dataPoints: $dataPoints, metadata: $metadata, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._dataPoints, _dataPoints) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      const DeepCollectionEquality().hash(_dataPoints),
      metadata,
      style,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataModelImplCopyWith<_$ChartDataModelImpl> get copyWith =>
      __$$ChartDataModelImplCopyWithImpl<_$ChartDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _ChartDataModel extends ChartDataModel {
  const factory _ChartDataModel(
          {required final String id,
          required final String title,
          required final ChartType type,
          required final List<DataPoint> dataPoints,
          final ChartMetadata? metadata,
          final ChartStyle? style,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$ChartDataModelImpl;
  const _ChartDataModel._() : super._();

  factory _ChartDataModel.fromJson(Map<String, dynamic> json) =
      _$ChartDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  ChartType get type;
  @override
  List<DataPoint> get dataPoints;
  @override
  ChartMetadata? get metadata;
  @override
  ChartStyle? get style;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ChartDataModelImplCopyWith<_$ChartDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataPoint _$DataPointFromJson(Map<String, dynamic> json) {
  return _DataPoint.fromJson(json);
}

/// @nodoc
mixin _$DataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataPointCopyWith<DataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPointCopyWith<$Res> {
  factory $DataPointCopyWith(DataPoint value, $Res Function(DataPoint) then) =
      _$DataPointCopyWithImpl<$Res, DataPoint>;
  @useResult
  $Res call(
      {DateTime date,
      double value,
      String? label,
      String? category,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$DataPointCopyWithImpl<$Res, $Val extends DataPoint>
    implements $DataPointCopyWith<$Res> {
  _$DataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? label = freezed,
    Object? category = freezed,
    Object? color = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPointImplCopyWith<$Res>
    implements $DataPointCopyWith<$Res> {
  factory _$$DataPointImplCopyWith(
          _$DataPointImpl value, $Res Function(_$DataPointImpl) then) =
      __$$DataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double value,
      String? label,
      String? category,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$DataPointImplCopyWithImpl<$Res>
    extends _$DataPointCopyWithImpl<$Res, _$DataPointImpl>
    implements _$$DataPointImplCopyWith<$Res> {
  __$$DataPointImplCopyWithImpl(
      _$DataPointImpl _value, $Res Function(_$DataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? label = freezed,
    Object? category = freezed,
    Object? color = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$DataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPointImpl extends _DataPoint {
  const _$DataPointImpl(
      {required this.date,
      required this.value,
      this.label,
      this.category,
      @JsonKey(includeFromJson: false, includeToJson: false) this.color,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$DataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double value;
  @override
  final String? label;
  @override
  final String? category;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? color;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DataPoint(date: $date, value: $value, label: $label, category: $category, color: $color, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, value, label, category,
      color, const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      __$$DataPointImplCopyWithImpl<_$DataPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPointImplToJson(
      this,
    );
  }
}

abstract class _DataPoint extends DataPoint {
  const factory _DataPoint(
      {required final DateTime date,
      required final double value,
      final String? label,
      final String? category,
      @JsonKey(includeFromJson: false, includeToJson: false) final Color? color,
      final Map<String, dynamic>? metadata}) = _$DataPointImpl;
  const _DataPoint._() : super._();

  factory _DataPoint.fromJson(Map<String, dynamic> json) =
      _$DataPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get value;
  @override
  String? get label;
  @override
  String? get category;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$DataPointImplCopyWith<_$DataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartMetadata _$ChartMetadataFromJson(Map<String, dynamic> json) {
  return _ChartMetadata.fromJson(json);
}

/// @nodoc
mixin _$ChartMetadata {
  String? get xAxisLabel => throw _privateConstructorUsedError;
  String? get yAxisLabel => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get dataSource => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_legend')
  bool get showLegend => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_grid')
  bool get showGrid => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_values')
  bool get showValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'animate')
  bool get animate => throw _privateConstructorUsedError;
  double? get minY => throw _privateConstructorUsedError;
  double? get maxY => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customProperties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartMetadataCopyWith<ChartMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartMetadataCopyWith<$Res> {
  factory $ChartMetadataCopyWith(
          ChartMetadata value, $Res Function(ChartMetadata) then) =
      _$ChartMetadataCopyWithImpl<$Res, ChartMetadata>;
  @useResult
  $Res call(
      {String? xAxisLabel,
      String? yAxisLabel,
      String? description,
      String? dataSource,
      String? unit,
      @JsonKey(name: 'show_legend') bool showLegend,
      @JsonKey(name: 'show_grid') bool showGrid,
      @JsonKey(name: 'show_values') bool showValues,
      @JsonKey(name: 'animate') bool animate,
      double? minY,
      double? maxY,
      Map<String, dynamic>? customProperties});
}

/// @nodoc
class _$ChartMetadataCopyWithImpl<$Res, $Val extends ChartMetadata>
    implements $ChartMetadataCopyWith<$Res> {
  _$ChartMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xAxisLabel = freezed,
    Object? yAxisLabel = freezed,
    Object? description = freezed,
    Object? dataSource = freezed,
    Object? unit = freezed,
    Object? showLegend = null,
    Object? showGrid = null,
    Object? showValues = null,
    Object? animate = null,
    Object? minY = freezed,
    Object? maxY = freezed,
    Object? customProperties = freezed,
  }) {
    return _then(_value.copyWith(
      xAxisLabel: freezed == xAxisLabel
          ? _value.xAxisLabel
          : xAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      yAxisLabel: freezed == yAxisLabel
          ? _value.yAxisLabel
          : yAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSource: freezed == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      showLegend: null == showLegend
          ? _value.showLegend
          : showLegend // ignore: cast_nullable_to_non_nullable
              as bool,
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
      showValues: null == showValues
          ? _value.showValues
          : showValues // ignore: cast_nullable_to_non_nullable
              as bool,
      animate: null == animate
          ? _value.animate
          : animate // ignore: cast_nullable_to_non_nullable
              as bool,
      minY: freezed == minY
          ? _value.minY
          : minY // ignore: cast_nullable_to_non_nullable
              as double?,
      maxY: freezed == maxY
          ? _value.maxY
          : maxY // ignore: cast_nullable_to_non_nullable
              as double?,
      customProperties: freezed == customProperties
          ? _value.customProperties
          : customProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartMetadataImplCopyWith<$Res>
    implements $ChartMetadataCopyWith<$Res> {
  factory _$$ChartMetadataImplCopyWith(
          _$ChartMetadataImpl value, $Res Function(_$ChartMetadataImpl) then) =
      __$$ChartMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? xAxisLabel,
      String? yAxisLabel,
      String? description,
      String? dataSource,
      String? unit,
      @JsonKey(name: 'show_legend') bool showLegend,
      @JsonKey(name: 'show_grid') bool showGrid,
      @JsonKey(name: 'show_values') bool showValues,
      @JsonKey(name: 'animate') bool animate,
      double? minY,
      double? maxY,
      Map<String, dynamic>? customProperties});
}

/// @nodoc
class __$$ChartMetadataImplCopyWithImpl<$Res>
    extends _$ChartMetadataCopyWithImpl<$Res, _$ChartMetadataImpl>
    implements _$$ChartMetadataImplCopyWith<$Res> {
  __$$ChartMetadataImplCopyWithImpl(
      _$ChartMetadataImpl _value, $Res Function(_$ChartMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xAxisLabel = freezed,
    Object? yAxisLabel = freezed,
    Object? description = freezed,
    Object? dataSource = freezed,
    Object? unit = freezed,
    Object? showLegend = null,
    Object? showGrid = null,
    Object? showValues = null,
    Object? animate = null,
    Object? minY = freezed,
    Object? maxY = freezed,
    Object? customProperties = freezed,
  }) {
    return _then(_$ChartMetadataImpl(
      xAxisLabel: freezed == xAxisLabel
          ? _value.xAxisLabel
          : xAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      yAxisLabel: freezed == yAxisLabel
          ? _value.yAxisLabel
          : yAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSource: freezed == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      showLegend: null == showLegend
          ? _value.showLegend
          : showLegend // ignore: cast_nullable_to_non_nullable
              as bool,
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
      showValues: null == showValues
          ? _value.showValues
          : showValues // ignore: cast_nullable_to_non_nullable
              as bool,
      animate: null == animate
          ? _value.animate
          : animate // ignore: cast_nullable_to_non_nullable
              as bool,
      minY: freezed == minY
          ? _value.minY
          : minY // ignore: cast_nullable_to_non_nullable
              as double?,
      maxY: freezed == maxY
          ? _value.maxY
          : maxY // ignore: cast_nullable_to_non_nullable
              as double?,
      customProperties: freezed == customProperties
          ? _value._customProperties
          : customProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartMetadataImpl implements _ChartMetadata {
  const _$ChartMetadataImpl(
      {this.xAxisLabel,
      this.yAxisLabel,
      this.description,
      this.dataSource,
      this.unit,
      @JsonKey(name: 'show_legend') this.showLegend = true,
      @JsonKey(name: 'show_grid') this.showGrid = true,
      @JsonKey(name: 'show_values') this.showValues = false,
      @JsonKey(name: 'animate') this.animate = true,
      this.minY,
      this.maxY,
      final Map<String, dynamic>? customProperties})
      : _customProperties = customProperties;

  factory _$ChartMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartMetadataImplFromJson(json);

  @override
  final String? xAxisLabel;
  @override
  final String? yAxisLabel;
  @override
  final String? description;
  @override
  final String? dataSource;
  @override
  final String? unit;
  @override
  @JsonKey(name: 'show_legend')
  final bool showLegend;
  @override
  @JsonKey(name: 'show_grid')
  final bool showGrid;
  @override
  @JsonKey(name: 'show_values')
  final bool showValues;
  @override
  @JsonKey(name: 'animate')
  final bool animate;
  @override
  final double? minY;
  @override
  final double? maxY;
  final Map<String, dynamic>? _customProperties;
  @override
  Map<String, dynamic>? get customProperties {
    final value = _customProperties;
    if (value == null) return null;
    if (_customProperties is EqualUnmodifiableMapView) return _customProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChartMetadata(xAxisLabel: $xAxisLabel, yAxisLabel: $yAxisLabel, description: $description, dataSource: $dataSource, unit: $unit, showLegend: $showLegend, showGrid: $showGrid, showValues: $showValues, animate: $animate, minY: $minY, maxY: $maxY, customProperties: $customProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartMetadataImpl &&
            (identical(other.xAxisLabel, xAxisLabel) ||
                other.xAxisLabel == xAxisLabel) &&
            (identical(other.yAxisLabel, yAxisLabel) ||
                other.yAxisLabel == yAxisLabel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.showLegend, showLegend) ||
                other.showLegend == showLegend) &&
            (identical(other.showGrid, showGrid) ||
                other.showGrid == showGrid) &&
            (identical(other.showValues, showValues) ||
                other.showValues == showValues) &&
            (identical(other.animate, animate) || other.animate == animate) &&
            (identical(other.minY, minY) || other.minY == minY) &&
            (identical(other.maxY, maxY) || other.maxY == maxY) &&
            const DeepCollectionEquality()
                .equals(other._customProperties, _customProperties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      xAxisLabel,
      yAxisLabel,
      description,
      dataSource,
      unit,
      showLegend,
      showGrid,
      showValues,
      animate,
      minY,
      maxY,
      const DeepCollectionEquality().hash(_customProperties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartMetadataImplCopyWith<_$ChartMetadataImpl> get copyWith =>
      __$$ChartMetadataImplCopyWithImpl<_$ChartMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartMetadataImplToJson(
      this,
    );
  }
}

abstract class _ChartMetadata implements ChartMetadata {
  const factory _ChartMetadata(
      {final String? xAxisLabel,
      final String? yAxisLabel,
      final String? description,
      final String? dataSource,
      final String? unit,
      @JsonKey(name: 'show_legend') final bool showLegend,
      @JsonKey(name: 'show_grid') final bool showGrid,
      @JsonKey(name: 'show_values') final bool showValues,
      @JsonKey(name: 'animate') final bool animate,
      final double? minY,
      final double? maxY,
      final Map<String, dynamic>? customProperties}) = _$ChartMetadataImpl;

  factory _ChartMetadata.fromJson(Map<String, dynamic> json) =
      _$ChartMetadataImpl.fromJson;

  @override
  String? get xAxisLabel;
  @override
  String? get yAxisLabel;
  @override
  String? get description;
  @override
  String? get dataSource;
  @override
  String? get unit;
  @override
  @JsonKey(name: 'show_legend')
  bool get showLegend;
  @override
  @JsonKey(name: 'show_grid')
  bool get showGrid;
  @override
  @JsonKey(name: 'show_values')
  bool get showValues;
  @override
  @JsonKey(name: 'animate')
  bool get animate;
  @override
  double? get minY;
  @override
  double? get maxY;
  @override
  Map<String, dynamic>? get customProperties;
  @override
  @JsonKey(ignore: true)
  _$$ChartMetadataImplCopyWith<_$ChartMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartStyle _$ChartStyleFromJson(Map<String, dynamic> json) {
  return _ChartStyle.fromJson(json);
}

/// @nodoc
mixin _$ChartStyle {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get primaryColor => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get secondaryColor => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get backgroundColor => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get gridColor => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get textColor => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;
  double get fontSize => throw _privateConstructorUsedError;
  String? get fontFamily => throw _privateConstructorUsedError;
  @JsonKey(name: 'border_radius')
  double get borderRadius => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customStyles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartStyleCopyWith<ChartStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartStyleCopyWith<$Res> {
  factory $ChartStyleCopyWith(
          ChartStyle value, $Res Function(ChartStyle) then) =
      _$ChartStyleCopyWithImpl<$Res, ChartStyle>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      Color? primaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Color? secondaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Color? backgroundColor,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? gridColor,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? textColor,
      double strokeWidth,
      double fontSize,
      String? fontFamily,
      @JsonKey(name: 'border_radius') double borderRadius,
      double padding,
      Map<String, dynamic>? customStyles});
}

/// @nodoc
class _$ChartStyleCopyWithImpl<$Res, $Val extends ChartStyle>
    implements $ChartStyleCopyWith<$Res> {
  _$ChartStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = freezed,
    Object? secondaryColor = freezed,
    Object? backgroundColor = freezed,
    Object? gridColor = freezed,
    Object? textColor = freezed,
    Object? strokeWidth = null,
    Object? fontSize = null,
    Object? fontFamily = freezed,
    Object? borderRadius = null,
    Object? padding = null,
    Object? customStyles = freezed,
  }) {
    return _then(_value.copyWith(
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      secondaryColor: freezed == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      gridColor: freezed == gridColor
          ? _value.gridColor
          : gridColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      textColor: freezed == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontFamily: freezed == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      customStyles: freezed == customStyles
          ? _value.customStyles
          : customStyles // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartStyleImplCopyWith<$Res>
    implements $ChartStyleCopyWith<$Res> {
  factory _$$ChartStyleImplCopyWith(
          _$ChartStyleImpl value, $Res Function(_$ChartStyleImpl) then) =
      __$$ChartStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      Color? primaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Color? secondaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Color? backgroundColor,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? gridColor,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? textColor,
      double strokeWidth,
      double fontSize,
      String? fontFamily,
      @JsonKey(name: 'border_radius') double borderRadius,
      double padding,
      Map<String, dynamic>? customStyles});
}

/// @nodoc
class __$$ChartStyleImplCopyWithImpl<$Res>
    extends _$ChartStyleCopyWithImpl<$Res, _$ChartStyleImpl>
    implements _$$ChartStyleImplCopyWith<$Res> {
  __$$ChartStyleImplCopyWithImpl(
      _$ChartStyleImpl _value, $Res Function(_$ChartStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = freezed,
    Object? secondaryColor = freezed,
    Object? backgroundColor = freezed,
    Object? gridColor = freezed,
    Object? textColor = freezed,
    Object? strokeWidth = null,
    Object? fontSize = null,
    Object? fontFamily = freezed,
    Object? borderRadius = null,
    Object? padding = null,
    Object? customStyles = freezed,
  }) {
    return _then(_$ChartStyleImpl(
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      secondaryColor: freezed == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      gridColor: freezed == gridColor
          ? _value.gridColor
          : gridColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      textColor: freezed == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontFamily: freezed == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      customStyles: freezed == customStyles
          ? _value._customStyles
          : customStyles // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartStyleImpl implements _ChartStyle {
  const _$ChartStyleImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.primaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.secondaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.backgroundColor,
      @JsonKey(includeFromJson: false, includeToJson: false) this.gridColor,
      @JsonKey(includeFromJson: false, includeToJson: false) this.textColor,
      this.strokeWidth = 2.0,
      this.fontSize = 12.0,
      this.fontFamily,
      @JsonKey(name: 'border_radius') this.borderRadius = 8.0,
      this.padding = 16.0,
      final Map<String, dynamic>? customStyles})
      : _customStyles = customStyles;

  factory _$ChartStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartStyleImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? primaryColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? secondaryColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? backgroundColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? gridColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? textColor;
  @override
  @JsonKey()
  final double strokeWidth;
  @override
  @JsonKey()
  final double fontSize;
  @override
  final String? fontFamily;
  @override
  @JsonKey(name: 'border_radius')
  final double borderRadius;
  @override
  @JsonKey()
  final double padding;
  final Map<String, dynamic>? _customStyles;
  @override
  Map<String, dynamic>? get customStyles {
    final value = _customStyles;
    if (value == null) return null;
    if (_customStyles is EqualUnmodifiableMapView) return _customStyles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChartStyle(primaryColor: $primaryColor, secondaryColor: $secondaryColor, backgroundColor: $backgroundColor, gridColor: $gridColor, textColor: $textColor, strokeWidth: $strokeWidth, fontSize: $fontSize, fontFamily: $fontFamily, borderRadius: $borderRadius, padding: $padding, customStyles: $customStyles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartStyleImpl &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.secondaryColor, secondaryColor) ||
                other.secondaryColor == secondaryColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.gridColor, gridColor) ||
                other.gridColor == gridColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            const DeepCollectionEquality()
                .equals(other._customStyles, _customStyles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      primaryColor,
      secondaryColor,
      backgroundColor,
      gridColor,
      textColor,
      strokeWidth,
      fontSize,
      fontFamily,
      borderRadius,
      padding,
      const DeepCollectionEquality().hash(_customStyles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartStyleImplCopyWith<_$ChartStyleImpl> get copyWith =>
      __$$ChartStyleImplCopyWithImpl<_$ChartStyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartStyleImplToJson(
      this,
    );
  }
}

abstract class _ChartStyle implements ChartStyle {
  const factory _ChartStyle(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      final Color? primaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Color? secondaryColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Color? backgroundColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Color? gridColor,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Color? textColor,
      final double strokeWidth,
      final double fontSize,
      final String? fontFamily,
      @JsonKey(name: 'border_radius') final double borderRadius,
      final double padding,
      final Map<String, dynamic>? customStyles}) = _$ChartStyleImpl;

  factory _ChartStyle.fromJson(Map<String, dynamic> json) =
      _$ChartStyleImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get primaryColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get secondaryColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get backgroundColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get gridColor;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get textColor;
  @override
  double get strokeWidth;
  @override
  double get fontSize;
  @override
  String? get fontFamily;
  @override
  @JsonKey(name: 'border_radius')
  double get borderRadius;
  @override
  double get padding;
  @override
  Map<String, dynamic>? get customStyles;
  @override
  @JsonKey(ignore: true)
  _$$ChartStyleImplCopyWith<_$ChartStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LineChartDataModel _$LineChartDataModelFromJson(Map<String, dynamic> json) {
  return _LineChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$LineChartDataModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<LineSeriesData> get series => throw _privateConstructorUsedError;
  ChartMetadata? get metadata => throw _privateConstructorUsedError;
  ChartStyle? get style => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineChartDataModelCopyWith<LineChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineChartDataModelCopyWith<$Res> {
  factory $LineChartDataModelCopyWith(
          LineChartDataModel value, $Res Function(LineChartDataModel) then) =
      _$LineChartDataModelCopyWithImpl<$Res, LineChartDataModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<LineSeriesData> series,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ChartMetadataCopyWith<$Res>? get metadata;
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class _$LineChartDataModelCopyWithImpl<$Res, $Val extends LineChartDataModel>
    implements $LineChartDataModelCopyWith<$Res> {
  _$LineChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? series = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<LineSeriesData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChartMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartStyleCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $ChartStyleCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LineChartDataModelImplCopyWith<$Res>
    implements $LineChartDataModelCopyWith<$Res> {
  factory _$$LineChartDataModelImplCopyWith(_$LineChartDataModelImpl value,
          $Res Function(_$LineChartDataModelImpl) then) =
      __$$LineChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<LineSeriesData> series,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ChartMetadataCopyWith<$Res>? get metadata;
  @override
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class __$$LineChartDataModelImplCopyWithImpl<$Res>
    extends _$LineChartDataModelCopyWithImpl<$Res, _$LineChartDataModelImpl>
    implements _$$LineChartDataModelImplCopyWith<$Res> {
  __$$LineChartDataModelImplCopyWithImpl(_$LineChartDataModelImpl _value,
      $Res Function(_$LineChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? series = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$LineChartDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<LineSeriesData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineChartDataModelImpl extends _LineChartDataModel {
  const _$LineChartDataModelImpl(
      {required this.id,
      required this.title,
      required final List<LineSeriesData> series,
      this.metadata,
      this.style,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _series = series,
        super._();

  factory _$LineChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineChartDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<LineSeriesData> _series;
  @override
  List<LineSeriesData> get series {
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  @override
  final ChartMetadata? metadata;
  @override
  final ChartStyle? style;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LineChartDataModel(id: $id, title: $title, series: $series, metadata: $metadata, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineChartDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_series),
      metadata,
      style,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineChartDataModelImplCopyWith<_$LineChartDataModelImpl> get copyWith =>
      __$$LineChartDataModelImplCopyWithImpl<_$LineChartDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _LineChartDataModel extends LineChartDataModel {
  const factory _LineChartDataModel(
          {required final String id,
          required final String title,
          required final List<LineSeriesData> series,
          final ChartMetadata? metadata,
          final ChartStyle? style,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$LineChartDataModelImpl;
  const _LineChartDataModel._() : super._();

  factory _LineChartDataModel.fromJson(Map<String, dynamic> json) =
      _$LineChartDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<LineSeriesData> get series;
  @override
  ChartMetadata? get metadata;
  @override
  ChartStyle? get style;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$LineChartDataModelImplCopyWith<_$LineChartDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LineSeriesData _$LineSeriesDataFromJson(Map<String, dynamic> json) {
  return _LineSeriesData.fromJson(json);
}

/// @nodoc
mixin _$LineSeriesData {
  String get name => throw _privateConstructorUsedError;
  List<DataPoint> get dataPoints => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;
  bool get showDots => throw _privateConstructorUsedError;
  bool get isCurved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineSeriesDataCopyWith<LineSeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineSeriesDataCopyWith<$Res> {
  factory $LineSeriesDataCopyWith(
          LineSeriesData value, $Res Function(LineSeriesData) then) =
      _$LineSeriesDataCopyWithImpl<$Res, LineSeriesData>;
  @useResult
  $Res call(
      {String name,
      List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      double strokeWidth,
      bool showDots,
      bool isCurved});
}

/// @nodoc
class _$LineSeriesDataCopyWithImpl<$Res, $Val extends LineSeriesData>
    implements $LineSeriesDataCopyWith<$Res> {
  _$LineSeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dataPoints = null,
    Object? color = freezed,
    Object? strokeWidth = null,
    Object? showDots = null,
    Object? isCurved = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoints: null == dataPoints
          ? _value.dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      showDots: null == showDots
          ? _value.showDots
          : showDots // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurved: null == isCurved
          ? _value.isCurved
          : isCurved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LineSeriesDataImplCopyWith<$Res>
    implements $LineSeriesDataCopyWith<$Res> {
  factory _$$LineSeriesDataImplCopyWith(_$LineSeriesDataImpl value,
          $Res Function(_$LineSeriesDataImpl) then) =
      __$$LineSeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      double strokeWidth,
      bool showDots,
      bool isCurved});
}

/// @nodoc
class __$$LineSeriesDataImplCopyWithImpl<$Res>
    extends _$LineSeriesDataCopyWithImpl<$Res, _$LineSeriesDataImpl>
    implements _$$LineSeriesDataImplCopyWith<$Res> {
  __$$LineSeriesDataImplCopyWithImpl(
      _$LineSeriesDataImpl _value, $Res Function(_$LineSeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dataPoints = null,
    Object? color = freezed,
    Object? strokeWidth = null,
    Object? showDots = null,
    Object? isCurved = null,
  }) {
    return _then(_$LineSeriesDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoints: null == dataPoints
          ? _value._dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      showDots: null == showDots
          ? _value.showDots
          : showDots // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurved: null == isCurved
          ? _value.isCurved
          : isCurved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineSeriesDataImpl extends _LineSeriesData {
  const _$LineSeriesDataImpl(
      {required this.name,
      required final List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) this.color,
      this.strokeWidth = 2.0,
      this.showDots = true,
      this.isCurved = true})
      : _dataPoints = dataPoints,
        super._();

  factory _$LineSeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineSeriesDataImplFromJson(json);

  @override
  final String name;
  final List<DataPoint> _dataPoints;
  @override
  List<DataPoint> get dataPoints {
    if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataPoints);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? color;
  @override
  @JsonKey()
  final double strokeWidth;
  @override
  @JsonKey()
  final bool showDots;
  @override
  @JsonKey()
  final bool isCurved;

  @override
  String toString() {
    return 'LineSeriesData(name: $name, dataPoints: $dataPoints, color: $color, strokeWidth: $strokeWidth, showDots: $showDots, isCurved: $isCurved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineSeriesDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._dataPoints, _dataPoints) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.showDots, showDots) ||
                other.showDots == showDots) &&
            (identical(other.isCurved, isCurved) ||
                other.isCurved == isCurved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_dataPoints),
      color,
      strokeWidth,
      showDots,
      isCurved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineSeriesDataImplCopyWith<_$LineSeriesDataImpl> get copyWith =>
      __$$LineSeriesDataImplCopyWithImpl<_$LineSeriesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineSeriesDataImplToJson(
      this,
    );
  }
}

abstract class _LineSeriesData extends LineSeriesData {
  const factory _LineSeriesData(
      {required final String name,
      required final List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) final Color? color,
      final double strokeWidth,
      final bool showDots,
      final bool isCurved}) = _$LineSeriesDataImpl;
  const _LineSeriesData._() : super._();

  factory _LineSeriesData.fromJson(Map<String, dynamic> json) =
      _$LineSeriesDataImpl.fromJson;

  @override
  String get name;
  @override
  List<DataPoint> get dataPoints;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color;
  @override
  double get strokeWidth;
  @override
  bool get showDots;
  @override
  bool get isCurved;
  @override
  @JsonKey(ignore: true)
  _$$LineSeriesDataImplCopyWith<_$LineSeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BarChartDataModel _$BarChartDataModelFromJson(Map<String, dynamic> json) {
  return _BarChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$BarChartDataModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<BarSeriesData> get series => throw _privateConstructorUsedError;
  ChartMetadata? get metadata => throw _privateConstructorUsedError;
  ChartStyle? get style => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarChartDataModelCopyWith<BarChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarChartDataModelCopyWith<$Res> {
  factory $BarChartDataModelCopyWith(
          BarChartDataModel value, $Res Function(BarChartDataModel) then) =
      _$BarChartDataModelCopyWithImpl<$Res, BarChartDataModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<BarSeriesData> series,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ChartMetadataCopyWith<$Res>? get metadata;
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class _$BarChartDataModelCopyWithImpl<$Res, $Val extends BarChartDataModel>
    implements $BarChartDataModelCopyWith<$Res> {
  _$BarChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? series = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<BarSeriesData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChartMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartStyleCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $ChartStyleCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BarChartDataModelImplCopyWith<$Res>
    implements $BarChartDataModelCopyWith<$Res> {
  factory _$$BarChartDataModelImplCopyWith(_$BarChartDataModelImpl value,
          $Res Function(_$BarChartDataModelImpl) then) =
      __$$BarChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<BarSeriesData> series,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ChartMetadataCopyWith<$Res>? get metadata;
  @override
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class __$$BarChartDataModelImplCopyWithImpl<$Res>
    extends _$BarChartDataModelCopyWithImpl<$Res, _$BarChartDataModelImpl>
    implements _$$BarChartDataModelImplCopyWith<$Res> {
  __$$BarChartDataModelImplCopyWithImpl(_$BarChartDataModelImpl _value,
      $Res Function(_$BarChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? series = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BarChartDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<BarSeriesData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarChartDataModelImpl extends _BarChartDataModel {
  const _$BarChartDataModelImpl(
      {required this.id,
      required this.title,
      required final List<BarSeriesData> series,
      this.metadata,
      this.style,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _series = series,
        super._();

  factory _$BarChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarChartDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<BarSeriesData> _series;
  @override
  List<BarSeriesData> get series {
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  @override
  final ChartMetadata? metadata;
  @override
  final ChartStyle? style;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BarChartDataModel(id: $id, title: $title, series: $series, metadata: $metadata, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarChartDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_series),
      metadata,
      style,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarChartDataModelImplCopyWith<_$BarChartDataModelImpl> get copyWith =>
      __$$BarChartDataModelImplCopyWithImpl<_$BarChartDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _BarChartDataModel extends BarChartDataModel {
  const factory _BarChartDataModel(
          {required final String id,
          required final String title,
          required final List<BarSeriesData> series,
          final ChartMetadata? metadata,
          final ChartStyle? style,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$BarChartDataModelImpl;
  const _BarChartDataModel._() : super._();

  factory _BarChartDataModel.fromJson(Map<String, dynamic> json) =
      _$BarChartDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<BarSeriesData> get series;
  @override
  ChartMetadata? get metadata;
  @override
  ChartStyle? get style;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BarChartDataModelImplCopyWith<_$BarChartDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BarSeriesData _$BarSeriesDataFromJson(Map<String, dynamic> json) {
  return _BarSeriesData.fromJson(json);
}

/// @nodoc
mixin _$BarSeriesData {
  String get name => throw _privateConstructorUsedError;
  List<DataPoint> get dataPoints => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarSeriesDataCopyWith<BarSeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarSeriesDataCopyWith<$Res> {
  factory $BarSeriesDataCopyWith(
          BarSeriesData value, $Res Function(BarSeriesData) then) =
      _$BarSeriesDataCopyWithImpl<$Res, BarSeriesData>;
  @useResult
  $Res call(
      {String name,
      List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color});
}

/// @nodoc
class _$BarSeriesDataCopyWithImpl<$Res, $Val extends BarSeriesData>
    implements $BarSeriesDataCopyWith<$Res> {
  _$BarSeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dataPoints = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoints: null == dataPoints
          ? _value.dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarSeriesDataImplCopyWith<$Res>
    implements $BarSeriesDataCopyWith<$Res> {
  factory _$$BarSeriesDataImplCopyWith(
          _$BarSeriesDataImpl value, $Res Function(_$BarSeriesDataImpl) then) =
      __$$BarSeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color});
}

/// @nodoc
class __$$BarSeriesDataImplCopyWithImpl<$Res>
    extends _$BarSeriesDataCopyWithImpl<$Res, _$BarSeriesDataImpl>
    implements _$$BarSeriesDataImplCopyWith<$Res> {
  __$$BarSeriesDataImplCopyWithImpl(
      _$BarSeriesDataImpl _value, $Res Function(_$BarSeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dataPoints = null,
    Object? color = freezed,
  }) {
    return _then(_$BarSeriesDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoints: null == dataPoints
          ? _value._dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarSeriesDataImpl implements _BarSeriesData {
  const _$BarSeriesDataImpl(
      {required this.name,
      required final List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false) this.color})
      : _dataPoints = dataPoints;

  factory _$BarSeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarSeriesDataImplFromJson(json);

  @override
  final String name;
  final List<DataPoint> _dataPoints;
  @override
  List<DataPoint> get dataPoints {
    if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataPoints);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? color;

  @override
  String toString() {
    return 'BarSeriesData(name: $name, dataPoints: $dataPoints, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarSeriesDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._dataPoints, _dataPoints) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_dataPoints), color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarSeriesDataImplCopyWith<_$BarSeriesDataImpl> get copyWith =>
      __$$BarSeriesDataImplCopyWithImpl<_$BarSeriesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarSeriesDataImplToJson(
      this,
    );
  }
}

abstract class _BarSeriesData implements BarSeriesData {
  const factory _BarSeriesData(
      {required final String name,
      required final List<DataPoint> dataPoints,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Color? color}) = _$BarSeriesDataImpl;

  factory _BarSeriesData.fromJson(Map<String, dynamic> json) =
      _$BarSeriesDataImpl.fromJson;

  @override
  String get name;
  @override
  List<DataPoint> get dataPoints;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$BarSeriesDataImplCopyWith<_$BarSeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PieChartDataModel _$PieChartDataModelFromJson(Map<String, dynamic> json) {
  return _PieChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$PieChartDataModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<PieSliceData> get slices => throw _privateConstructorUsedError;
  ChartMetadata? get metadata => throw _privateConstructorUsedError;
  ChartStyle? get style => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PieChartDataModelCopyWith<PieChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieChartDataModelCopyWith<$Res> {
  factory $PieChartDataModelCopyWith(
          PieChartDataModel value, $Res Function(PieChartDataModel) then) =
      _$PieChartDataModelCopyWithImpl<$Res, PieChartDataModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<PieSliceData> slices,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ChartMetadataCopyWith<$Res>? get metadata;
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class _$PieChartDataModelCopyWithImpl<$Res, $Val extends PieChartDataModel>
    implements $PieChartDataModelCopyWith<$Res> {
  _$PieChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slices = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slices: null == slices
          ? _value.slices
          : slices // ignore: cast_nullable_to_non_nullable
              as List<PieSliceData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChartMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartStyleCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $ChartStyleCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PieChartDataModelImplCopyWith<$Res>
    implements $PieChartDataModelCopyWith<$Res> {
  factory _$$PieChartDataModelImplCopyWith(_$PieChartDataModelImpl value,
          $Res Function(_$PieChartDataModelImpl) then) =
      __$$PieChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<PieSliceData> slices,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ChartMetadataCopyWith<$Res>? get metadata;
  @override
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class __$$PieChartDataModelImplCopyWithImpl<$Res>
    extends _$PieChartDataModelCopyWithImpl<$Res, _$PieChartDataModelImpl>
    implements _$$PieChartDataModelImplCopyWith<$Res> {
  __$$PieChartDataModelImplCopyWithImpl(_$PieChartDataModelImpl _value,
      $Res Function(_$PieChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slices = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PieChartDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slices: null == slices
          ? _value._slices
          : slices // ignore: cast_nullable_to_non_nullable
              as List<PieSliceData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PieChartDataModelImpl extends _PieChartDataModel {
  const _$PieChartDataModelImpl(
      {required this.id,
      required this.title,
      required final List<PieSliceData> slices,
      this.metadata,
      this.style,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _slices = slices,
        super._();

  factory _$PieChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PieChartDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<PieSliceData> _slices;
  @override
  List<PieSliceData> get slices {
    if (_slices is EqualUnmodifiableListView) return _slices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slices);
  }

  @override
  final ChartMetadata? metadata;
  @override
  final ChartStyle? style;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PieChartDataModel(id: $id, title: $title, slices: $slices, metadata: $metadata, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieChartDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._slices, _slices) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_slices),
      metadata,
      style,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PieChartDataModelImplCopyWith<_$PieChartDataModelImpl> get copyWith =>
      __$$PieChartDataModelImplCopyWithImpl<_$PieChartDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PieChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _PieChartDataModel extends PieChartDataModel {
  const factory _PieChartDataModel(
          {required final String id,
          required final String title,
          required final List<PieSliceData> slices,
          final ChartMetadata? metadata,
          final ChartStyle? style,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$PieChartDataModelImpl;
  const _PieChartDataModel._() : super._();

  factory _PieChartDataModel.fromJson(Map<String, dynamic> json) =
      _$PieChartDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<PieSliceData> get slices;
  @override
  ChartMetadata? get metadata;
  @override
  ChartStyle? get style;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PieChartDataModelImplCopyWith<_$PieChartDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PieSliceData _$PieSliceDataFromJson(Map<String, dynamic> json) {
  return _PieSliceData.fromJson(json);
}

/// @nodoc
mixin _$PieSliceData {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PieSliceDataCopyWith<PieSliceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieSliceDataCopyWith<$Res> {
  factory $PieSliceDataCopyWith(
          PieSliceData value, $Res Function(PieSliceData) then) =
      _$PieSliceDataCopyWithImpl<$Res, PieSliceData>;
  @useResult
  $Res call(
      {String label,
      double value,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      String? description});
}

/// @nodoc
class _$PieSliceDataCopyWithImpl<$Res, $Val extends PieSliceData>
    implements $PieSliceDataCopyWith<$Res> {
  _$PieSliceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PieSliceDataImplCopyWith<$Res>
    implements $PieSliceDataCopyWith<$Res> {
  factory _$$PieSliceDataImplCopyWith(
          _$PieSliceDataImpl value, $Res Function(_$PieSliceDataImpl) then) =
      __$$PieSliceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      double value,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      String? description});
}

/// @nodoc
class __$$PieSliceDataImplCopyWithImpl<$Res>
    extends _$PieSliceDataCopyWithImpl<$Res, _$PieSliceDataImpl>
    implements _$$PieSliceDataImplCopyWith<$Res> {
  __$$PieSliceDataImplCopyWithImpl(
      _$PieSliceDataImpl _value, $Res Function(_$PieSliceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PieSliceDataImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PieSliceDataImpl extends _PieSliceData {
  const _$PieSliceDataImpl(
      {required this.label,
      required this.value,
      @JsonKey(includeFromJson: false, includeToJson: false) this.color,
      this.description})
      : super._();

  factory _$PieSliceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PieSliceDataImplFromJson(json);

  @override
  final String label;
  @override
  final double value;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? color;
  @override
  final String? description;

  @override
  String toString() {
    return 'PieSliceData(label: $label, value: $value, color: $color, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieSliceDataImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, value, color, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PieSliceDataImplCopyWith<_$PieSliceDataImpl> get copyWith =>
      __$$PieSliceDataImplCopyWithImpl<_$PieSliceDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PieSliceDataImplToJson(
      this,
    );
  }
}

abstract class _PieSliceData extends PieSliceData {
  const factory _PieSliceData(
      {required final String label,
      required final double value,
      @JsonKey(includeFromJson: false, includeToJson: false) final Color? color,
      final String? description}) = _$PieSliceDataImpl;
  const _PieSliceData._() : super._();

  factory _PieSliceData.fromJson(Map<String, dynamic> json) =
      _$PieSliceDataImpl.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PieSliceDataImplCopyWith<_$PieSliceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RadarChartDataModel _$RadarChartDataModelFromJson(Map<String, dynamic> json) {
  return _RadarChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$RadarChartDataModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<RadarSeriesData> get series => throw _privateConstructorUsedError;
  ChartMetadata? get metadata => throw _privateConstructorUsedError;
  ChartStyle? get style => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadarChartDataModelCopyWith<RadarChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadarChartDataModelCopyWith<$Res> {
  factory $RadarChartDataModelCopyWith(
          RadarChartDataModel value, $Res Function(RadarChartDataModel) then) =
      _$RadarChartDataModelCopyWithImpl<$Res, RadarChartDataModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> categories,
      List<RadarSeriesData> series,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ChartMetadataCopyWith<$Res>? get metadata;
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class _$RadarChartDataModelCopyWithImpl<$Res, $Val extends RadarChartDataModel>
    implements $RadarChartDataModelCopyWith<$Res> {
  _$RadarChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? categories = null,
    Object? series = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<RadarSeriesData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChartMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartStyleCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $ChartStyleCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RadarChartDataModelImplCopyWith<$Res>
    implements $RadarChartDataModelCopyWith<$Res> {
  factory _$$RadarChartDataModelImplCopyWith(_$RadarChartDataModelImpl value,
          $Res Function(_$RadarChartDataModelImpl) then) =
      __$$RadarChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> categories,
      List<RadarSeriesData> series,
      ChartMetadata? metadata,
      ChartStyle? style,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ChartMetadataCopyWith<$Res>? get metadata;
  @override
  $ChartStyleCopyWith<$Res>? get style;
}

/// @nodoc
class __$$RadarChartDataModelImplCopyWithImpl<$Res>
    extends _$RadarChartDataModelCopyWithImpl<$Res, _$RadarChartDataModelImpl>
    implements _$$RadarChartDataModelImplCopyWith<$Res> {
  __$$RadarChartDataModelImplCopyWithImpl(_$RadarChartDataModelImpl _value,
      $Res Function(_$RadarChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? categories = null,
    Object? series = null,
    Object? metadata = freezed,
    Object? style = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RadarChartDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      series: null == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<RadarSeriesData>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChartMetadata?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ChartStyle?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RadarChartDataModelImpl extends _RadarChartDataModel {
  const _$RadarChartDataModelImpl(
      {required this.id,
      required this.title,
      required final List<String> categories,
      required final List<RadarSeriesData> series,
      this.metadata,
      this.style,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _categories = categories,
        _series = series,
        super._();

  factory _$RadarChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadarChartDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<RadarSeriesData> _series;
  @override
  List<RadarSeriesData> get series {
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  @override
  final ChartMetadata? metadata;
  @override
  final ChartStyle? style;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RadarChartDataModel(id: $id, title: $title, categories: $categories, series: $series, metadata: $metadata, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadarChartDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_series),
      metadata,
      style,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadarChartDataModelImplCopyWith<_$RadarChartDataModelImpl> get copyWith =>
      __$$RadarChartDataModelImplCopyWithImpl<_$RadarChartDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RadarChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _RadarChartDataModel extends RadarChartDataModel {
  const factory _RadarChartDataModel(
          {required final String id,
          required final String title,
          required final List<String> categories,
          required final List<RadarSeriesData> series,
          final ChartMetadata? metadata,
          final ChartStyle? style,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$RadarChartDataModelImpl;
  const _RadarChartDataModel._() : super._();

  factory _RadarChartDataModel.fromJson(Map<String, dynamic> json) =
      _$RadarChartDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get categories;
  @override
  List<RadarSeriesData> get series;
  @override
  ChartMetadata? get metadata;
  @override
  ChartStyle? get style;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RadarChartDataModelImplCopyWith<_$RadarChartDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RadarSeriesData _$RadarSeriesDataFromJson(Map<String, dynamic> json) {
  return _RadarSeriesData.fromJson(json);
}

/// @nodoc
mixin _$RadarSeriesData {
  String get name => throw _privateConstructorUsedError;
  List<double> get values => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;
  double get fillOpacity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadarSeriesDataCopyWith<RadarSeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadarSeriesDataCopyWith<$Res> {
  factory $RadarSeriesDataCopyWith(
          RadarSeriesData value, $Res Function(RadarSeriesData) then) =
      _$RadarSeriesDataCopyWithImpl<$Res, RadarSeriesData>;
  @useResult
  $Res call(
      {String name,
      List<double> values,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      double strokeWidth,
      double fillOpacity});
}

/// @nodoc
class _$RadarSeriesDataCopyWithImpl<$Res, $Val extends RadarSeriesData>
    implements $RadarSeriesDataCopyWith<$Res> {
  _$RadarSeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? values = null,
    Object? color = freezed,
    Object? strokeWidth = null,
    Object? fillOpacity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      fillOpacity: null == fillOpacity
          ? _value.fillOpacity
          : fillOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadarSeriesDataImplCopyWith<$Res>
    implements $RadarSeriesDataCopyWith<$Res> {
  factory _$$RadarSeriesDataImplCopyWith(_$RadarSeriesDataImpl value,
          $Res Function(_$RadarSeriesDataImpl) then) =
      __$$RadarSeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<double> values,
      @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
      double strokeWidth,
      double fillOpacity});
}

/// @nodoc
class __$$RadarSeriesDataImplCopyWithImpl<$Res>
    extends _$RadarSeriesDataCopyWithImpl<$Res, _$RadarSeriesDataImpl>
    implements _$$RadarSeriesDataImplCopyWith<$Res> {
  __$$RadarSeriesDataImplCopyWithImpl(
      _$RadarSeriesDataImpl _value, $Res Function(_$RadarSeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? values = null,
    Object? color = freezed,
    Object? strokeWidth = null,
    Object? fillOpacity = null,
  }) {
    return _then(_$RadarSeriesDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      fillOpacity: null == fillOpacity
          ? _value.fillOpacity
          : fillOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RadarSeriesDataImpl implements _RadarSeriesData {
  const _$RadarSeriesDataImpl(
      {required this.name,
      required final List<double> values,
      @JsonKey(includeFromJson: false, includeToJson: false) this.color,
      this.strokeWidth = 2.0,
      this.fillOpacity = 0.3})
      : _values = values;

  factory _$RadarSeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadarSeriesDataImplFromJson(json);

  @override
  final String name;
  final List<double> _values;
  @override
  List<double> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color? color;
  @override
  @JsonKey()
  final double strokeWidth;
  @override
  @JsonKey()
  final double fillOpacity;

  @override
  String toString() {
    return 'RadarSeriesData(name: $name, values: $values, color: $color, strokeWidth: $strokeWidth, fillOpacity: $fillOpacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadarSeriesDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.fillOpacity, fillOpacity) ||
                other.fillOpacity == fillOpacity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_values),
      color,
      strokeWidth,
      fillOpacity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadarSeriesDataImplCopyWith<_$RadarSeriesDataImpl> get copyWith =>
      __$$RadarSeriesDataImplCopyWithImpl<_$RadarSeriesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RadarSeriesDataImplToJson(
      this,
    );
  }
}

abstract class _RadarSeriesData implements RadarSeriesData {
  const factory _RadarSeriesData(
      {required final String name,
      required final List<double> values,
      @JsonKey(includeFromJson: false, includeToJson: false) final Color? color,
      final double strokeWidth,
      final double fillOpacity}) = _$RadarSeriesDataImpl;

  factory _RadarSeriesData.fromJson(Map<String, dynamic> json) =
      _$RadarSeriesDataImpl.fromJson;

  @override
  String get name;
  @override
  List<double> get values;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color? get color;
  @override
  double get strokeWidth;
  @override
  double get fillOpacity;
  @override
  @JsonKey(ignore: true)
  _$$RadarSeriesDataImplCopyWith<_$RadarSeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
