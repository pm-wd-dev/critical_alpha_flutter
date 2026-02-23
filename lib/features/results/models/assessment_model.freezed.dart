// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return _Assessment.fromJson(json);
}

/// @nodoc
mixin _$Assessment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get planId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentCopyWith<Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentCopyWith<$Res> {
  factory $AssessmentCopyWith(
          Assessment value, $Res Function(Assessment) then) =
      _$AssessmentCopyWithImpl<$Res, Assessment>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      String? planId,
      Map<String, dynamic>? data});
}

/// @nodoc
class _$AssessmentCopyWithImpl<$Res, $Val extends Assessment>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? planId = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentImplCopyWith<$Res>
    implements $AssessmentCopyWith<$Res> {
  factory _$$AssessmentImplCopyWith(
          _$AssessmentImpl value, $Res Function(_$AssessmentImpl) then) =
      __$$AssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      String? planId,
      Map<String, dynamic>? data});
}

/// @nodoc
class __$$AssessmentImplCopyWithImpl<$Res>
    extends _$AssessmentCopyWithImpl<$Res, _$AssessmentImpl>
    implements _$$AssessmentImplCopyWith<$Res> {
  __$$AssessmentImplCopyWithImpl(
      _$AssessmentImpl _value, $Res Function(_$AssessmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? planId = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AssessmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentImpl implements _Assessment {
  const _$AssessmentImpl(
      {required this.id,
      required this.name,
      required this.createdAt,
      this.planId,
      final Map<String, dynamic>? data})
      : _data = data;

  factory _$AssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final String? planId;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Assessment(id: $id, name: $name, createdAt: $createdAt, planId: $planId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, planId,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      __$$AssessmentImplCopyWithImpl<_$AssessmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentImplToJson(
      this,
    );
  }
}

abstract class _Assessment implements Assessment {
  const factory _Assessment(
      {required final String id,
      required final String name,
      required final DateTime createdAt,
      final String? planId,
      final Map<String, dynamic>? data}) = _$AssessmentImpl;

  factory _Assessment.fromJson(Map<String, dynamic> json) =
      _$AssessmentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  String? get planId;
  @override
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentLineGraphData _$AssessmentLineGraphDataFromJson(
    Map<String, dynamic> json) {
  return _AssessmentLineGraphData.fromJson(json);
}

/// @nodoc
mixin _$AssessmentLineGraphData {
  List<String> get labels => throw _privateConstructorUsedError;
  AssessmentDataset get dataset => throw _privateConstructorUsedError;
  List<String>? get legend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentLineGraphDataCopyWith<AssessmentLineGraphData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentLineGraphDataCopyWith<$Res> {
  factory $AssessmentLineGraphDataCopyWith(AssessmentLineGraphData value,
          $Res Function(AssessmentLineGraphData) then) =
      _$AssessmentLineGraphDataCopyWithImpl<$Res, AssessmentLineGraphData>;
  @useResult
  $Res call(
      {List<String> labels, AssessmentDataset dataset, List<String>? legend});

  $AssessmentDatasetCopyWith<$Res> get dataset;
}

/// @nodoc
class _$AssessmentLineGraphDataCopyWithImpl<$Res,
        $Val extends AssessmentLineGraphData>
    implements $AssessmentLineGraphDataCopyWith<$Res> {
  _$AssessmentLineGraphDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? labels = null,
    Object? dataset = null,
    Object? legend = freezed,
  }) {
    return _then(_value.copyWith(
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataset: null == dataset
          ? _value.dataset
          : dataset // ignore: cast_nullable_to_non_nullable
              as AssessmentDataset,
      legend: freezed == legend
          ? _value.legend
          : legend // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssessmentDatasetCopyWith<$Res> get dataset {
    return $AssessmentDatasetCopyWith<$Res>(_value.dataset, (value) {
      return _then(_value.copyWith(dataset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentLineGraphDataImplCopyWith<$Res>
    implements $AssessmentLineGraphDataCopyWith<$Res> {
  factory _$$AssessmentLineGraphDataImplCopyWith(
          _$AssessmentLineGraphDataImpl value,
          $Res Function(_$AssessmentLineGraphDataImpl) then) =
      __$$AssessmentLineGraphDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> labels, AssessmentDataset dataset, List<String>? legend});

  @override
  $AssessmentDatasetCopyWith<$Res> get dataset;
}

/// @nodoc
class __$$AssessmentLineGraphDataImplCopyWithImpl<$Res>
    extends _$AssessmentLineGraphDataCopyWithImpl<$Res,
        _$AssessmentLineGraphDataImpl>
    implements _$$AssessmentLineGraphDataImplCopyWith<$Res> {
  __$$AssessmentLineGraphDataImplCopyWithImpl(
      _$AssessmentLineGraphDataImpl _value,
      $Res Function(_$AssessmentLineGraphDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? labels = null,
    Object? dataset = null,
    Object? legend = freezed,
  }) {
    return _then(_$AssessmentLineGraphDataImpl(
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataset: null == dataset
          ? _value.dataset
          : dataset // ignore: cast_nullable_to_non_nullable
              as AssessmentDataset,
      legend: freezed == legend
          ? _value._legend
          : legend // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentLineGraphDataImpl implements _AssessmentLineGraphData {
  const _$AssessmentLineGraphDataImpl(
      {required final List<String> labels,
      required this.dataset,
      final List<String>? legend})
      : _labels = labels,
        _legend = legend;

  factory _$AssessmentLineGraphDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentLineGraphDataImplFromJson(json);

  final List<String> _labels;
  @override
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  final AssessmentDataset dataset;
  final List<String>? _legend;
  @override
  List<String>? get legend {
    final value = _legend;
    if (value == null) return null;
    if (_legend is EqualUnmodifiableListView) return _legend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AssessmentLineGraphData(labels: $labels, dataset: $dataset, legend: $legend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentLineGraphDataImpl &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.dataset, dataset) || other.dataset == dataset) &&
            const DeepCollectionEquality().equals(other._legend, _legend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_labels),
      dataset,
      const DeepCollectionEquality().hash(_legend));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentLineGraphDataImplCopyWith<_$AssessmentLineGraphDataImpl>
      get copyWith => __$$AssessmentLineGraphDataImplCopyWithImpl<
          _$AssessmentLineGraphDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentLineGraphDataImplToJson(
      this,
    );
  }
}

abstract class _AssessmentLineGraphData implements AssessmentLineGraphData {
  const factory _AssessmentLineGraphData(
      {required final List<String> labels,
      required final AssessmentDataset dataset,
      final List<String>? legend}) = _$AssessmentLineGraphDataImpl;

  factory _AssessmentLineGraphData.fromJson(Map<String, dynamic> json) =
      _$AssessmentLineGraphDataImpl.fromJson;

  @override
  List<String> get labels;
  @override
  AssessmentDataset get dataset;
  @override
  List<String>? get legend;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentLineGraphDataImplCopyWith<_$AssessmentLineGraphDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AssessmentDataset _$AssessmentDatasetFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _AssessmentDataset.fromJson(json);
    case 'multiple':
      return _AssessmentDatasetMultiple.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AssessmentDataset',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AssessmentDataset {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<double> data, String color) $default, {
    required TResult Function(List<AssessmentDatasetItem> items) multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<double> data, String color)? $default, {
    TResult? Function(List<AssessmentDatasetItem> items)? multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<double> data, String color)? $default, {
    TResult Function(List<AssessmentDatasetItem> items)? multiple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AssessmentDataset value) $default, {
    required TResult Function(_AssessmentDatasetMultiple value) multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AssessmentDataset value)? $default, {
    TResult? Function(_AssessmentDatasetMultiple value)? multiple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AssessmentDataset value)? $default, {
    TResult Function(_AssessmentDatasetMultiple value)? multiple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentDatasetCopyWith<$Res> {
  factory $AssessmentDatasetCopyWith(
          AssessmentDataset value, $Res Function(AssessmentDataset) then) =
      _$AssessmentDatasetCopyWithImpl<$Res, AssessmentDataset>;
}

/// @nodoc
class _$AssessmentDatasetCopyWithImpl<$Res, $Val extends AssessmentDataset>
    implements $AssessmentDatasetCopyWith<$Res> {
  _$AssessmentDatasetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AssessmentDatasetImplCopyWith<$Res> {
  factory _$$AssessmentDatasetImplCopyWith(_$AssessmentDatasetImpl value,
          $Res Function(_$AssessmentDatasetImpl) then) =
      __$$AssessmentDatasetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<double> data, String color});
}

/// @nodoc
class __$$AssessmentDatasetImplCopyWithImpl<$Res>
    extends _$AssessmentDatasetCopyWithImpl<$Res, _$AssessmentDatasetImpl>
    implements _$$AssessmentDatasetImplCopyWith<$Res> {
  __$$AssessmentDatasetImplCopyWithImpl(_$AssessmentDatasetImpl _value,
      $Res Function(_$AssessmentDatasetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? color = null,
  }) {
    return _then(_$AssessmentDatasetImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<double>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentDatasetImpl implements _AssessmentDataset {
  const _$AssessmentDatasetImpl(
      {required final List<double> data,
      required this.color,
      final String? $type})
      : _data = data,
        $type = $type ?? 'default';

  factory _$AssessmentDatasetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentDatasetImplFromJson(json);

  final List<double> _data;
  @override
  List<double> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AssessmentDataset(data: $data, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentDatasetImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentDatasetImplCopyWith<_$AssessmentDatasetImpl> get copyWith =>
      __$$AssessmentDatasetImplCopyWithImpl<_$AssessmentDatasetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<double> data, String color) $default, {
    required TResult Function(List<AssessmentDatasetItem> items) multiple,
  }) {
    return $default(data, color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<double> data, String color)? $default, {
    TResult? Function(List<AssessmentDatasetItem> items)? multiple,
  }) {
    return $default?.call(data, color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<double> data, String color)? $default, {
    TResult Function(List<AssessmentDatasetItem> items)? multiple,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(data, color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AssessmentDataset value) $default, {
    required TResult Function(_AssessmentDatasetMultiple value) multiple,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AssessmentDataset value)? $default, {
    TResult? Function(_AssessmentDatasetMultiple value)? multiple,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AssessmentDataset value)? $default, {
    TResult Function(_AssessmentDatasetMultiple value)? multiple,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentDatasetImplToJson(
      this,
    );
  }
}

abstract class _AssessmentDataset implements AssessmentDataset {
  const factory _AssessmentDataset(
      {required final List<double> data,
      required final String color}) = _$AssessmentDatasetImpl;

  factory _AssessmentDataset.fromJson(Map<String, dynamic> json) =
      _$AssessmentDatasetImpl.fromJson;

  List<double> get data;
  String get color;
  @JsonKey(ignore: true)
  _$$AssessmentDatasetImplCopyWith<_$AssessmentDatasetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssessmentDatasetMultipleImplCopyWith<$Res> {
  factory _$$AssessmentDatasetMultipleImplCopyWith(
          _$AssessmentDatasetMultipleImpl value,
          $Res Function(_$AssessmentDatasetMultipleImpl) then) =
      __$$AssessmentDatasetMultipleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AssessmentDatasetItem> items});
}

/// @nodoc
class __$$AssessmentDatasetMultipleImplCopyWithImpl<$Res>
    extends _$AssessmentDatasetCopyWithImpl<$Res,
        _$AssessmentDatasetMultipleImpl>
    implements _$$AssessmentDatasetMultipleImplCopyWith<$Res> {
  __$$AssessmentDatasetMultipleImplCopyWithImpl(
      _$AssessmentDatasetMultipleImpl _value,
      $Res Function(_$AssessmentDatasetMultipleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$AssessmentDatasetMultipleImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AssessmentDatasetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentDatasetMultipleImpl implements _AssessmentDatasetMultiple {
  const _$AssessmentDatasetMultipleImpl(
      {required final List<AssessmentDatasetItem> items, final String? $type})
      : _items = items,
        $type = $type ?? 'multiple';

  factory _$AssessmentDatasetMultipleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentDatasetMultipleImplFromJson(json);

  final List<AssessmentDatasetItem> _items;
  @override
  List<AssessmentDatasetItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AssessmentDataset.multiple(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentDatasetMultipleImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentDatasetMultipleImplCopyWith<_$AssessmentDatasetMultipleImpl>
      get copyWith => __$$AssessmentDatasetMultipleImplCopyWithImpl<
          _$AssessmentDatasetMultipleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<double> data, String color) $default, {
    required TResult Function(List<AssessmentDatasetItem> items) multiple,
  }) {
    return multiple(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<double> data, String color)? $default, {
    TResult? Function(List<AssessmentDatasetItem> items)? multiple,
  }) {
    return multiple?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<double> data, String color)? $default, {
    TResult Function(List<AssessmentDatasetItem> items)? multiple,
    required TResult orElse(),
  }) {
    if (multiple != null) {
      return multiple(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AssessmentDataset value) $default, {
    required TResult Function(_AssessmentDatasetMultiple value) multiple,
  }) {
    return multiple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AssessmentDataset value)? $default, {
    TResult? Function(_AssessmentDatasetMultiple value)? multiple,
  }) {
    return multiple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AssessmentDataset value)? $default, {
    TResult Function(_AssessmentDatasetMultiple value)? multiple,
    required TResult orElse(),
  }) {
    if (multiple != null) {
      return multiple(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentDatasetMultipleImplToJson(
      this,
    );
  }
}

abstract class _AssessmentDatasetMultiple implements AssessmentDataset {
  const factory _AssessmentDatasetMultiple(
          {required final List<AssessmentDatasetItem> items}) =
      _$AssessmentDatasetMultipleImpl;

  factory _AssessmentDatasetMultiple.fromJson(Map<String, dynamic> json) =
      _$AssessmentDatasetMultipleImpl.fromJson;

  List<AssessmentDatasetItem> get items;
  @JsonKey(ignore: true)
  _$$AssessmentDatasetMultipleImplCopyWith<_$AssessmentDatasetMultipleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AssessmentDatasetItem _$AssessmentDatasetItemFromJson(
    Map<String, dynamic> json) {
  return _AssessmentDatasetItem.fromJson(json);
}

/// @nodoc
mixin _$AssessmentDatasetItem {
  List<double> get data => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentDatasetItemCopyWith<AssessmentDatasetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentDatasetItemCopyWith<$Res> {
  factory $AssessmentDatasetItemCopyWith(AssessmentDatasetItem value,
          $Res Function(AssessmentDatasetItem) then) =
      _$AssessmentDatasetItemCopyWithImpl<$Res, AssessmentDatasetItem>;
  @useResult
  $Res call({List<double> data, String color, String? label});
}

/// @nodoc
class _$AssessmentDatasetItemCopyWithImpl<$Res,
        $Val extends AssessmentDatasetItem>
    implements $AssessmentDatasetItemCopyWith<$Res> {
  _$AssessmentDatasetItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? color = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<double>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentDatasetItemImplCopyWith<$Res>
    implements $AssessmentDatasetItemCopyWith<$Res> {
  factory _$$AssessmentDatasetItemImplCopyWith(
          _$AssessmentDatasetItemImpl value,
          $Res Function(_$AssessmentDatasetItemImpl) then) =
      __$$AssessmentDatasetItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> data, String color, String? label});
}

/// @nodoc
class __$$AssessmentDatasetItemImplCopyWithImpl<$Res>
    extends _$AssessmentDatasetItemCopyWithImpl<$Res,
        _$AssessmentDatasetItemImpl>
    implements _$$AssessmentDatasetItemImplCopyWith<$Res> {
  __$$AssessmentDatasetItemImplCopyWithImpl(_$AssessmentDatasetItemImpl _value,
      $Res Function(_$AssessmentDatasetItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? color = null,
    Object? label = freezed,
  }) {
    return _then(_$AssessmentDatasetItemImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<double>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentDatasetItemImpl implements _AssessmentDatasetItem {
  const _$AssessmentDatasetItemImpl(
      {required final List<double> data, required this.color, this.label})
      : _data = data;

  factory _$AssessmentDatasetItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentDatasetItemImplFromJson(json);

  final List<double> _data;
  @override
  List<double> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String color;
  @override
  final String? label;

  @override
  String toString() {
    return 'AssessmentDatasetItem(data: $data, color: $color, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentDatasetItemImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), color, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentDatasetItemImplCopyWith<_$AssessmentDatasetItemImpl>
      get copyWith => __$$AssessmentDatasetItemImplCopyWithImpl<
          _$AssessmentDatasetItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentDatasetItemImplToJson(
      this,
    );
  }
}

abstract class _AssessmentDatasetItem implements AssessmentDatasetItem {
  const factory _AssessmentDatasetItem(
      {required final List<double> data,
      required final String color,
      final String? label}) = _$AssessmentDatasetItemImpl;

  factory _AssessmentDatasetItem.fromJson(Map<String, dynamic> json) =
      _$AssessmentDatasetItemImpl.fromJson;

  @override
  List<double> get data;
  @override
  String get color;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentDatasetItemImplCopyWith<_$AssessmentDatasetItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
