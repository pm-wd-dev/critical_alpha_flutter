// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_action_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuickActionModel _$QuickActionModelFromJson(Map<String, dynamic> json) {
  return _QuickActionModel.fromJson(json);
}

/// @nodoc
mixin _$QuickActionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  QuickActionType get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get apiEndpoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuickActionModelCopyWith<QuickActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickActionModelCopyWith<$Res> {
  factory $QuickActionModelCopyWith(
          QuickActionModel value, $Res Function(QuickActionModel) then) =
      _$QuickActionModelCopyWithImpl<$Res, QuickActionModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String icon,
      String route,
      QuickActionType type,
      Map<String, dynamic>? metadata,
      String? apiEndpoint});
}

/// @nodoc
class _$QuickActionModelCopyWithImpl<$Res, $Val extends QuickActionModel>
    implements $QuickActionModelCopyWith<$Res> {
  _$QuickActionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? icon = null,
    Object? route = null,
    Object? type = null,
    Object? metadata = freezed,
    Object? apiEndpoint = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuickActionType,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      apiEndpoint: freezed == apiEndpoint
          ? _value.apiEndpoint
          : apiEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuickActionModelImplCopyWith<$Res>
    implements $QuickActionModelCopyWith<$Res> {
  factory _$$QuickActionModelImplCopyWith(_$QuickActionModelImpl value,
          $Res Function(_$QuickActionModelImpl) then) =
      __$$QuickActionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String icon,
      String route,
      QuickActionType type,
      Map<String, dynamic>? metadata,
      String? apiEndpoint});
}

/// @nodoc
class __$$QuickActionModelImplCopyWithImpl<$Res>
    extends _$QuickActionModelCopyWithImpl<$Res, _$QuickActionModelImpl>
    implements _$$QuickActionModelImplCopyWith<$Res> {
  __$$QuickActionModelImplCopyWithImpl(_$QuickActionModelImpl _value,
      $Res Function(_$QuickActionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? icon = null,
    Object? route = null,
    Object? type = null,
    Object? metadata = freezed,
    Object? apiEndpoint = freezed,
  }) {
    return _then(_$QuickActionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuickActionType,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      apiEndpoint: freezed == apiEndpoint
          ? _value.apiEndpoint
          : apiEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickActionModelImpl implements _QuickActionModel {
  const _$QuickActionModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.icon,
      required this.route,
      required this.type,
      final Map<String, dynamic>? metadata,
      this.apiEndpoint})
      : _metadata = metadata;

  factory _$QuickActionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickActionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String icon;
  @override
  final String route;
  @override
  final QuickActionType type;
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
  final String? apiEndpoint;

  @override
  String toString() {
    return 'QuickActionModel(id: $id, title: $title, description: $description, icon: $icon, route: $route, type: $type, metadata: $metadata, apiEndpoint: $apiEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickActionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.apiEndpoint, apiEndpoint) ||
                other.apiEndpoint == apiEndpoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, icon,
      route, type, const DeepCollectionEquality().hash(_metadata), apiEndpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickActionModelImplCopyWith<_$QuickActionModelImpl> get copyWith =>
      __$$QuickActionModelImplCopyWithImpl<_$QuickActionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickActionModelImplToJson(
      this,
    );
  }
}

abstract class _QuickActionModel implements QuickActionModel {
  const factory _QuickActionModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String icon,
      required final String route,
      required final QuickActionType type,
      final Map<String, dynamic>? metadata,
      final String? apiEndpoint}) = _$QuickActionModelImpl;

  factory _QuickActionModel.fromJson(Map<String, dynamic> json) =
      _$QuickActionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get icon;
  @override
  String get route;
  @override
  QuickActionType get type;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get apiEndpoint;
  @override
  @JsonKey(ignore: true)
  _$$QuickActionModelImplCopyWith<_$QuickActionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsightModel _$InsightModelFromJson(Map<String, dynamic> json) {
  return _InsightModel.fromJson(json);
}

/// @nodoc
mixin _$InsightModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get actionRoute => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsightModelCopyWith<InsightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightModelCopyWith<$Res> {
  factory $InsightModelCopyWith(
          InsightModel value, $Res Function(InsightModel) then) =
      _$InsightModelCopyWithImpl<$Res, InsightModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String? actionRoute,
      Map<String, dynamic>? metadata,
      DateTime? createdAt});
}

/// @nodoc
class _$InsightModelCopyWithImpl<$Res, $Val extends InsightModel>
    implements $InsightModelCopyWith<$Res> {
  _$InsightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? actionRoute = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightModelImplCopyWith<$Res>
    implements $InsightModelCopyWith<$Res> {
  factory _$$InsightModelImplCopyWith(
          _$InsightModelImpl value, $Res Function(_$InsightModelImpl) then) =
      __$$InsightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String? actionRoute,
      Map<String, dynamic>? metadata,
      DateTime? createdAt});
}

/// @nodoc
class __$$InsightModelImplCopyWithImpl<$Res>
    extends _$InsightModelCopyWithImpl<$Res, _$InsightModelImpl>
    implements _$$InsightModelImplCopyWith<$Res> {
  __$$InsightModelImplCopyWithImpl(
      _$InsightModelImpl _value, $Res Function(_$InsightModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? actionRoute = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$InsightModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightModelImpl implements _InsightModel {
  const _$InsightModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      this.actionRoute,
      final Map<String, dynamic>? metadata,
      this.createdAt})
      : _metadata = metadata;

  factory _$InsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  final String? actionRoute;
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
  final DateTime? createdAt;

  @override
  String toString() {
    return 'InsightModel(id: $id, title: $title, description: $description, type: $type, actionRoute: $actionRoute, metadata: $metadata, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      actionRoute, const DeepCollectionEquality().hash(_metadata), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightModelImplCopyWith<_$InsightModelImpl> get copyWith =>
      __$$InsightModelImplCopyWithImpl<_$InsightModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightModelImplToJson(
      this,
    );
  }
}

abstract class _InsightModel implements InsightModel {
  const factory _InsightModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String type,
      final String? actionRoute,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt}) = _$InsightModelImpl;

  factory _InsightModel.fromJson(Map<String, dynamic> json) =
      _$InsightModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  String? get actionRoute;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$InsightModelImplCopyWith<_$InsightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyProgressData _$WeeklyProgressDataFromJson(Map<String, dynamic> json) {
  return _WeeklyProgressData.fromJson(json);
}

/// @nodoc
mixin _$WeeklyProgressData {
  List<DayData> get days => throw _privateConstructorUsedError;
  double get totalProgress => throw _privateConstructorUsedError;
  double get averageDaily => throw _privateConstructorUsedError;
  double get weeklyGoal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyProgressDataCopyWith<WeeklyProgressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyProgressDataCopyWith<$Res> {
  factory $WeeklyProgressDataCopyWith(
          WeeklyProgressData value, $Res Function(WeeklyProgressData) then) =
      _$WeeklyProgressDataCopyWithImpl<$Res, WeeklyProgressData>;
  @useResult
  $Res call(
      {List<DayData> days,
      double totalProgress,
      double averageDaily,
      double weeklyGoal});
}

/// @nodoc
class _$WeeklyProgressDataCopyWithImpl<$Res, $Val extends WeeklyProgressData>
    implements $WeeklyProgressDataCopyWith<$Res> {
  _$WeeklyProgressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? totalProgress = null,
    Object? averageDaily = null,
    Object? weeklyGoal = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayData>,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as double,
      averageDaily: null == averageDaily
          ? _value.averageDaily
          : averageDaily // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyGoal: null == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyProgressDataImplCopyWith<$Res>
    implements $WeeklyProgressDataCopyWith<$Res> {
  factory _$$WeeklyProgressDataImplCopyWith(_$WeeklyProgressDataImpl value,
          $Res Function(_$WeeklyProgressDataImpl) then) =
      __$$WeeklyProgressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DayData> days,
      double totalProgress,
      double averageDaily,
      double weeklyGoal});
}

/// @nodoc
class __$$WeeklyProgressDataImplCopyWithImpl<$Res>
    extends _$WeeklyProgressDataCopyWithImpl<$Res, _$WeeklyProgressDataImpl>
    implements _$$WeeklyProgressDataImplCopyWith<$Res> {
  __$$WeeklyProgressDataImplCopyWithImpl(_$WeeklyProgressDataImpl _value,
      $Res Function(_$WeeklyProgressDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? totalProgress = null,
    Object? averageDaily = null,
    Object? weeklyGoal = null,
  }) {
    return _then(_$WeeklyProgressDataImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayData>,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as double,
      averageDaily: null == averageDaily
          ? _value.averageDaily
          : averageDaily // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyGoal: null == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyProgressDataImpl extends _WeeklyProgressData {
  const _$WeeklyProgressDataImpl(
      {final List<DayData> days = const [],
      this.totalProgress = 0.0,
      this.averageDaily = 0.0,
      this.weeklyGoal = 0.0})
      : _days = days,
        super._();

  factory _$WeeklyProgressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyProgressDataImplFromJson(json);

  final List<DayData> _days;
  @override
  @JsonKey()
  List<DayData> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  @JsonKey()
  final double totalProgress;
  @override
  @JsonKey()
  final double averageDaily;
  @override
  @JsonKey()
  final double weeklyGoal;

  @override
  String toString() {
    return 'WeeklyProgressData(days: $days, totalProgress: $totalProgress, averageDaily: $averageDaily, weeklyGoal: $weeklyGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyProgressDataImpl &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.totalProgress, totalProgress) ||
                other.totalProgress == totalProgress) &&
            (identical(other.averageDaily, averageDaily) ||
                other.averageDaily == averageDaily) &&
            (identical(other.weeklyGoal, weeklyGoal) ||
                other.weeklyGoal == weeklyGoal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_days),
      totalProgress,
      averageDaily,
      weeklyGoal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyProgressDataImplCopyWith<_$WeeklyProgressDataImpl> get copyWith =>
      __$$WeeklyProgressDataImplCopyWithImpl<_$WeeklyProgressDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyProgressDataImplToJson(
      this,
    );
  }
}

abstract class _WeeklyProgressData extends WeeklyProgressData {
  const factory _WeeklyProgressData(
      {final List<DayData> days,
      final double totalProgress,
      final double averageDaily,
      final double weeklyGoal}) = _$WeeklyProgressDataImpl;
  const _WeeklyProgressData._() : super._();

  factory _WeeklyProgressData.fromJson(Map<String, dynamic> json) =
      _$WeeklyProgressDataImpl.fromJson;

  @override
  List<DayData> get days;
  @override
  double get totalProgress;
  @override
  double get averageDaily;
  @override
  double get weeklyGoal;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyProgressDataImplCopyWith<_$WeeklyProgressDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayData _$DayDataFromJson(Map<String, dynamic> json) {
  return _DayData.fromJson(json);
}

/// @nodoc
mixin _$DayData {
  DateTime get date => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  int get activitiesCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayDataCopyWith<DayData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayDataCopyWith<$Res> {
  factory $DayDataCopyWith(DayData value, $Res Function(DayData) then) =
      _$DayDataCopyWithImpl<$Res, DayData>;
  @useResult
  $Res call({DateTime date, double progress, int activitiesCompleted});
}

/// @nodoc
class _$DayDataCopyWithImpl<$Res, $Val extends DayData>
    implements $DayDataCopyWith<$Res> {
  _$DayDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? progress = null,
    Object? activitiesCompleted = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      activitiesCompleted: null == activitiesCompleted
          ? _value.activitiesCompleted
          : activitiesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayDataImplCopyWith<$Res> implements $DayDataCopyWith<$Res> {
  factory _$$DayDataImplCopyWith(
          _$DayDataImpl value, $Res Function(_$DayDataImpl) then) =
      __$$DayDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double progress, int activitiesCompleted});
}

/// @nodoc
class __$$DayDataImplCopyWithImpl<$Res>
    extends _$DayDataCopyWithImpl<$Res, _$DayDataImpl>
    implements _$$DayDataImplCopyWith<$Res> {
  __$$DayDataImplCopyWithImpl(
      _$DayDataImpl _value, $Res Function(_$DayDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? progress = null,
    Object? activitiesCompleted = null,
  }) {
    return _then(_$DayDataImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      activitiesCompleted: null == activitiesCompleted
          ? _value.activitiesCompleted
          : activitiesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayDataImpl extends _DayData {
  const _$DayDataImpl(
      {required this.date, this.progress = 0.0, this.activitiesCompleted = 0})
      : super._();

  factory _$DayDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayDataImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final int activitiesCompleted;

  @override
  String toString() {
    return 'DayData(date: $date, progress: $progress, activitiesCompleted: $activitiesCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.activitiesCompleted, activitiesCompleted) ||
                other.activitiesCompleted == activitiesCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, progress, activitiesCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayDataImplCopyWith<_$DayDataImpl> get copyWith =>
      __$$DayDataImplCopyWithImpl<_$DayDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayDataImplToJson(
      this,
    );
  }
}

abstract class _DayData extends DayData {
  const factory _DayData(
      {required final DateTime date,
      final double progress,
      final int activitiesCompleted}) = _$DayDataImpl;
  const _DayData._() : super._();

  factory _DayData.fromJson(Map<String, dynamic> json) = _$DayDataImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get progress;
  @override
  int get activitiesCompleted;
  @override
  @JsonKey(ignore: true)
  _$$DayDataImplCopyWith<_$DayDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
