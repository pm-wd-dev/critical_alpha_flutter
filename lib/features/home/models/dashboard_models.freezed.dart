// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  DashboardStats get stats => throw _privateConstructorUsedError;
  List<RecentGoal> get recentGoals => throw _privateConstructorUsedError;
  List<UpcomingAssessment> get upcomingAssessments =>
      throw _privateConstructorUsedError;
  List<DashboardInsight> get insights => throw _privateConstructorUsedError;
  WeeklyProgress get weeklyProgress => throw _privateConstructorUsedError;
  List<DashboardNotification> get notifications =>
      throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {DashboardStats stats,
      List<RecentGoal> recentGoals,
      List<UpcomingAssessment> upcomingAssessments,
      List<DashboardInsight> insights,
      WeeklyProgress weeklyProgress,
      List<DashboardNotification> notifications,
      DateTime? lastUpdated});

  $DashboardStatsCopyWith<$Res> get stats;
  $WeeklyProgressCopyWith<$Res> get weeklyProgress;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? recentGoals = null,
    Object? upcomingAssessments = null,
    Object? insights = null,
    Object? weeklyProgress = null,
    Object? notifications = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats,
      recentGoals: null == recentGoals
          ? _value.recentGoals
          : recentGoals // ignore: cast_nullable_to_non_nullable
              as List<RecentGoal>,
      upcomingAssessments: null == upcomingAssessments
          ? _value.upcomingAssessments
          : upcomingAssessments // ignore: cast_nullable_to_non_nullable
              as List<UpcomingAssessment>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<DashboardInsight>,
      weeklyProgress: null == weeklyProgress
          ? _value.weeklyProgress
          : weeklyProgress // ignore: cast_nullable_to_non_nullable
              as WeeklyProgress,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<DashboardNotification>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardStatsCopyWith<$Res> get stats {
    return $DashboardStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeeklyProgressCopyWith<$Res> get weeklyProgress {
    return $WeeklyProgressCopyWith<$Res>(_value.weeklyProgress, (value) {
      return _then(_value.copyWith(weeklyProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardStats stats,
      List<RecentGoal> recentGoals,
      List<UpcomingAssessment> upcomingAssessments,
      List<DashboardInsight> insights,
      WeeklyProgress weeklyProgress,
      List<DashboardNotification> notifications,
      DateTime? lastUpdated});

  @override
  $DashboardStatsCopyWith<$Res> get stats;
  @override
  $WeeklyProgressCopyWith<$Res> get weeklyProgress;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? recentGoals = null,
    Object? upcomingAssessments = null,
    Object? insights = null,
    Object? weeklyProgress = null,
    Object? notifications = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$DashboardDataImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats,
      recentGoals: null == recentGoals
          ? _value._recentGoals
          : recentGoals // ignore: cast_nullable_to_non_nullable
              as List<RecentGoal>,
      upcomingAssessments: null == upcomingAssessments
          ? _value._upcomingAssessments
          : upcomingAssessments // ignore: cast_nullable_to_non_nullable
              as List<UpcomingAssessment>,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<DashboardInsight>,
      weeklyProgress: null == weeklyProgress
          ? _value.weeklyProgress
          : weeklyProgress // ignore: cast_nullable_to_non_nullable
              as WeeklyProgress,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<DashboardNotification>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {required this.stats,
      required final List<RecentGoal> recentGoals,
      required final List<UpcomingAssessment> upcomingAssessments,
      required final List<DashboardInsight> insights,
      required this.weeklyProgress,
      final List<DashboardNotification> notifications = const [],
      this.lastUpdated})
      : _recentGoals = recentGoals,
        _upcomingAssessments = upcomingAssessments,
        _insights = insights,
        _notifications = notifications;

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final DashboardStats stats;
  final List<RecentGoal> _recentGoals;
  @override
  List<RecentGoal> get recentGoals {
    if (_recentGoals is EqualUnmodifiableListView) return _recentGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentGoals);
  }

  final List<UpcomingAssessment> _upcomingAssessments;
  @override
  List<UpcomingAssessment> get upcomingAssessments {
    if (_upcomingAssessments is EqualUnmodifiableListView)
      return _upcomingAssessments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingAssessments);
  }

  final List<DashboardInsight> _insights;
  @override
  List<DashboardInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  @override
  final WeeklyProgress weeklyProgress;
  final List<DashboardNotification> _notifications;
  @override
  @JsonKey()
  List<DashboardNotification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'DashboardData(stats: $stats, recentGoals: $recentGoals, upcomingAssessments: $upcomingAssessments, insights: $insights, weeklyProgress: $weeklyProgress, notifications: $notifications, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality()
                .equals(other._recentGoals, _recentGoals) &&
            const DeepCollectionEquality()
                .equals(other._upcomingAssessments, _upcomingAssessments) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.weeklyProgress, weeklyProgress) ||
                other.weeklyProgress == weeklyProgress) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stats,
      const DeepCollectionEquality().hash(_recentGoals),
      const DeepCollectionEquality().hash(_upcomingAssessments),
      const DeepCollectionEquality().hash(_insights),
      weeklyProgress,
      const DeepCollectionEquality().hash(_notifications),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
      {required final DashboardStats stats,
      required final List<RecentGoal> recentGoals,
      required final List<UpcomingAssessment> upcomingAssessments,
      required final List<DashboardInsight> insights,
      required final WeeklyProgress weeklyProgress,
      final List<DashboardNotification> notifications,
      final DateTime? lastUpdated}) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  DashboardStats get stats;
  @override
  List<RecentGoal> get recentGoals;
  @override
  List<UpcomingAssessment> get upcomingAssessments;
  @override
  List<DashboardInsight> get insights;
  @override
  WeeklyProgress get weeklyProgress;
  @override
  List<DashboardNotification> get notifications;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  int get totalGoals => throw _privateConstructorUsedError;
  int get activeGoals => throw _privateConstructorUsedError;
  int get completedGoals => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get totalAssessments => throw _privateConstructorUsedError;
  int get hoursSpentLearning => throw _privateConstructorUsedError;
  double get averageScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
          DashboardStats value, $Res Function(DashboardStats) then) =
      _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call(
      {int totalGoals,
      int activeGoals,
      int completedGoals,
      int streakDays,
      double completionRate,
      int totalAssessments,
      int hoursSpentLearning,
      double averageScore});
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalGoals = null,
    Object? activeGoals = null,
    Object? completedGoals = null,
    Object? streakDays = null,
    Object? completionRate = null,
    Object? totalAssessments = null,
    Object? hoursSpentLearning = null,
    Object? averageScore = null,
  }) {
    return _then(_value.copyWith(
      totalGoals: null == totalGoals
          ? _value.totalGoals
          : totalGoals // ignore: cast_nullable_to_non_nullable
              as int,
      activeGoals: null == activeGoals
          ? _value.activeGoals
          : activeGoals // ignore: cast_nullable_to_non_nullable
              as int,
      completedGoals: null == completedGoals
          ? _value.completedGoals
          : completedGoals // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalAssessments: null == totalAssessments
          ? _value.totalAssessments
          : totalAssessments // ignore: cast_nullable_to_non_nullable
              as int,
      hoursSpentLearning: null == hoursSpentLearning
          ? _value.hoursSpentLearning
          : hoursSpentLearning // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(_$DashboardStatsImpl value,
          $Res Function(_$DashboardStatsImpl) then) =
      __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalGoals,
      int activeGoals,
      int completedGoals,
      int streakDays,
      double completionRate,
      int totalAssessments,
      int hoursSpentLearning,
      double averageScore});
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
      _$DashboardStatsImpl _value, $Res Function(_$DashboardStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalGoals = null,
    Object? activeGoals = null,
    Object? completedGoals = null,
    Object? streakDays = null,
    Object? completionRate = null,
    Object? totalAssessments = null,
    Object? hoursSpentLearning = null,
    Object? averageScore = null,
  }) {
    return _then(_$DashboardStatsImpl(
      totalGoals: null == totalGoals
          ? _value.totalGoals
          : totalGoals // ignore: cast_nullable_to_non_nullable
              as int,
      activeGoals: null == activeGoals
          ? _value.activeGoals
          : activeGoals // ignore: cast_nullable_to_non_nullable
              as int,
      completedGoals: null == completedGoals
          ? _value.completedGoals
          : completedGoals // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalAssessments: null == totalAssessments
          ? _value.totalAssessments
          : totalAssessments // ignore: cast_nullable_to_non_nullable
              as int,
      hoursSpentLearning: null == hoursSpentLearning
          ? _value.hoursSpentLearning
          : hoursSpentLearning // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl extends _DashboardStats {
  const _$DashboardStatsImpl(
      {this.totalGoals = 0,
      this.activeGoals = 0,
      this.completedGoals = 0,
      this.streakDays = 0,
      this.completionRate = 0.0,
      this.totalAssessments = 0,
      this.hoursSpentLearning = 0,
      this.averageScore = 0.0})
      : super._();

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalGoals;
  @override
  @JsonKey()
  final int activeGoals;
  @override
  @JsonKey()
  final int completedGoals;
  @override
  @JsonKey()
  final int streakDays;
  @override
  @JsonKey()
  final double completionRate;
  @override
  @JsonKey()
  final int totalAssessments;
  @override
  @JsonKey()
  final int hoursSpentLearning;
  @override
  @JsonKey()
  final double averageScore;

  @override
  String toString() {
    return 'DashboardStats(totalGoals: $totalGoals, activeGoals: $activeGoals, completedGoals: $completedGoals, streakDays: $streakDays, completionRate: $completionRate, totalAssessments: $totalAssessments, hoursSpentLearning: $hoursSpentLearning, averageScore: $averageScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.totalGoals, totalGoals) ||
                other.totalGoals == totalGoals) &&
            (identical(other.activeGoals, activeGoals) ||
                other.activeGoals == activeGoals) &&
            (identical(other.completedGoals, completedGoals) ||
                other.completedGoals == completedGoals) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.totalAssessments, totalAssessments) ||
                other.totalAssessments == totalAssessments) &&
            (identical(other.hoursSpentLearning, hoursSpentLearning) ||
                other.hoursSpentLearning == hoursSpentLearning) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalGoals,
      activeGoals,
      completedGoals,
      streakDays,
      completionRate,
      totalAssessments,
      hoursSpentLearning,
      averageScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(
      this,
    );
  }
}

abstract class _DashboardStats extends DashboardStats {
  const factory _DashboardStats(
      {final int totalGoals,
      final int activeGoals,
      final int completedGoals,
      final int streakDays,
      final double completionRate,
      final int totalAssessments,
      final int hoursSpentLearning,
      final double averageScore}) = _$DashboardStatsImpl;
  const _DashboardStats._() : super._();

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  int get totalGoals;
  @override
  int get activeGoals;
  @override
  int get completedGoals;
  @override
  int get streakDays;
  @override
  double get completionRate;
  @override
  int get totalAssessments;
  @override
  int get hoursSpentLearning;
  @override
  double get averageScore;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentGoal _$RecentGoalFromJson(Map<String, dynamic> json) {
  return _RecentGoal.fromJson(json);
}

/// @nodoc
mixin _$RecentGoal {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  GoalStatus get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentGoalCopyWith<RecentGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentGoalCopyWith<$Res> {
  factory $RecentGoalCopyWith(
          RecentGoal value, $Res Function(RecentGoal) then) =
      _$RecentGoalCopyWithImpl<$Res, RecentGoal>;
  @useResult
  $Res call(
      {String id,
      String title,
      String category,
      double progress,
      DateTime deadline,
      GoalStatus status,
      String? description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$RecentGoalCopyWithImpl<$Res, $Val extends RecentGoal>
    implements $RecentGoalCopyWith<$Res> {
  _$RecentGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? progress = null,
    Object? deadline = null,
    Object? status = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GoalStatus,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentGoalImplCopyWith<$Res>
    implements $RecentGoalCopyWith<$Res> {
  factory _$$RecentGoalImplCopyWith(
          _$RecentGoalImpl value, $Res Function(_$RecentGoalImpl) then) =
      __$$RecentGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String category,
      double progress,
      DateTime deadline,
      GoalStatus status,
      String? description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$RecentGoalImplCopyWithImpl<$Res>
    extends _$RecentGoalCopyWithImpl<$Res, _$RecentGoalImpl>
    implements _$$RecentGoalImplCopyWith<$Res> {
  __$$RecentGoalImplCopyWithImpl(
      _$RecentGoalImpl _value, $Res Function(_$RecentGoalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? progress = null,
    Object? deadline = null,
    Object? status = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RecentGoalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GoalStatus,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentGoalImpl extends _RecentGoal {
  const _$RecentGoalImpl(
      {required this.id,
      required this.title,
      required this.category,
      required this.progress,
      required this.deadline,
      required this.status,
      this.description,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$RecentGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String category;
  @override
  final double progress;
  @override
  final DateTime deadline;
  @override
  final GoalStatus status;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RecentGoal(id: $id, title: $title, category: $category, progress: $progress, deadline: $deadline, status: $status, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, category, progress,
      deadline, status, description, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentGoalImplCopyWith<_$RecentGoalImpl> get copyWith =>
      __$$RecentGoalImplCopyWithImpl<_$RecentGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentGoalImplToJson(
      this,
    );
  }
}

abstract class _RecentGoal extends RecentGoal {
  const factory _RecentGoal(
          {required final String id,
          required final String title,
          required final String category,
          required final double progress,
          required final DateTime deadline,
          required final GoalStatus status,
          final String? description,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$RecentGoalImpl;
  const _RecentGoal._() : super._();

  factory _RecentGoal.fromJson(Map<String, dynamic> json) =
      _$RecentGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get category;
  @override
  double get progress;
  @override
  DateTime get deadline;
  @override
  GoalStatus get status;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RecentGoalImplCopyWith<_$RecentGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpcomingAssessment _$UpcomingAssessmentFromJson(Map<String, dynamic> json) {
  return _UpcomingAssessment.fromJson(json);
}

/// @nodoc
mixin _$UpcomingAssessment {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get scheduledDate => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpcomingAssessmentCopyWith<UpcomingAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingAssessmentCopyWith<$Res> {
  factory $UpcomingAssessmentCopyWith(
          UpcomingAssessment value, $Res Function(UpcomingAssessment) then) =
      _$UpcomingAssessmentCopyWithImpl<$Res, UpcomingAssessment>;
  @useResult
  $Res call(
      {String id,
      String title,
      String type,
      DateTime scheduledDate,
      int duration,
      bool isCompleted,
      String? description,
      String? category});
}

/// @nodoc
class _$UpcomingAssessmentCopyWithImpl<$Res, $Val extends UpcomingAssessment>
    implements $UpcomingAssessmentCopyWith<$Res> {
  _$UpcomingAssessmentCopyWithImpl(this._value, this._then);

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
    Object? scheduledDate = null,
    Object? duration = null,
    Object? isCompleted = null,
    Object? description = freezed,
    Object? category = freezed,
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
              as String,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpcomingAssessmentImplCopyWith<$Res>
    implements $UpcomingAssessmentCopyWith<$Res> {
  factory _$$UpcomingAssessmentImplCopyWith(_$UpcomingAssessmentImpl value,
          $Res Function(_$UpcomingAssessmentImpl) then) =
      __$$UpcomingAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String type,
      DateTime scheduledDate,
      int duration,
      bool isCompleted,
      String? description,
      String? category});
}

/// @nodoc
class __$$UpcomingAssessmentImplCopyWithImpl<$Res>
    extends _$UpcomingAssessmentCopyWithImpl<$Res, _$UpcomingAssessmentImpl>
    implements _$$UpcomingAssessmentImplCopyWith<$Res> {
  __$$UpcomingAssessmentImplCopyWithImpl(_$UpcomingAssessmentImpl _value,
      $Res Function(_$UpcomingAssessmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? scheduledDate = null,
    Object? duration = null,
    Object? isCompleted = null,
    Object? description = freezed,
    Object? category = freezed,
  }) {
    return _then(_$UpcomingAssessmentImpl(
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
              as String,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpcomingAssessmentImpl extends _UpcomingAssessment {
  const _$UpcomingAssessmentImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.scheduledDate,
      required this.duration,
      this.isCompleted = false,
      this.description,
      this.category})
      : super._();

  factory _$UpcomingAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpcomingAssessmentImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  final DateTime scheduledDate;
  @override
  final int duration;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String? description;
  @override
  final String? category;

  @override
  String toString() {
    return 'UpcomingAssessment(id: $id, title: $title, type: $type, scheduledDate: $scheduledDate, duration: $duration, isCompleted: $isCompleted, description: $description, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingAssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, type, scheduledDate,
      duration, isCompleted, description, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingAssessmentImplCopyWith<_$UpcomingAssessmentImpl> get copyWith =>
      __$$UpcomingAssessmentImplCopyWithImpl<_$UpcomingAssessmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpcomingAssessmentImplToJson(
      this,
    );
  }
}

abstract class _UpcomingAssessment extends UpcomingAssessment {
  const factory _UpcomingAssessment(
      {required final String id,
      required final String title,
      required final String type,
      required final DateTime scheduledDate,
      required final int duration,
      final bool isCompleted,
      final String? description,
      final String? category}) = _$UpcomingAssessmentImpl;
  const _UpcomingAssessment._() : super._();

  factory _UpcomingAssessment.fromJson(Map<String, dynamic> json) =
      _$UpcomingAssessmentImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type;
  @override
  DateTime get scheduledDate;
  @override
  int get duration;
  @override
  bool get isCompleted;
  @override
  String? get description;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$UpcomingAssessmentImplCopyWith<_$UpcomingAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardInsight _$DashboardInsightFromJson(Map<String, dynamic> json) {
  return _DashboardInsight.fromJson(json);
}

/// @nodoc
mixin _$DashboardInsight {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  InsightPriority get priority => throw _privateConstructorUsedError;
  String? get actionText => throw _privateConstructorUsedError;
  String? get actionRoute => throw _privateConstructorUsedError;
  Map<String, dynamic>? get actionData => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardInsightCopyWith<DashboardInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardInsightCopyWith<$Res> {
  factory $DashboardInsightCopyWith(
          DashboardInsight value, $Res Function(DashboardInsight) then) =
      _$DashboardInsightCopyWithImpl<$Res, DashboardInsight>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      InsightType type,
      InsightPriority priority,
      String? actionText,
      String? actionRoute,
      Map<String, dynamic>? actionData,
      DateTime? createdAt});
}

/// @nodoc
class _$DashboardInsightCopyWithImpl<$Res, $Val extends DashboardInsight>
    implements $DashboardInsightCopyWith<$Res> {
  _$DashboardInsightCopyWithImpl(this._value, this._then);

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
    Object? priority = null,
    Object? actionText = freezed,
    Object? actionRoute = freezed,
    Object? actionData = freezed,
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
              as InsightType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as InsightPriority,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      actionData: freezed == actionData
          ? _value.actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardInsightImplCopyWith<$Res>
    implements $DashboardInsightCopyWith<$Res> {
  factory _$$DashboardInsightImplCopyWith(_$DashboardInsightImpl value,
          $Res Function(_$DashboardInsightImpl) then) =
      __$$DashboardInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      InsightType type,
      InsightPriority priority,
      String? actionText,
      String? actionRoute,
      Map<String, dynamic>? actionData,
      DateTime? createdAt});
}

/// @nodoc
class __$$DashboardInsightImplCopyWithImpl<$Res>
    extends _$DashboardInsightCopyWithImpl<$Res, _$DashboardInsightImpl>
    implements _$$DashboardInsightImplCopyWith<$Res> {
  __$$DashboardInsightImplCopyWithImpl(_$DashboardInsightImpl _value,
      $Res Function(_$DashboardInsightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? actionText = freezed,
    Object? actionRoute = freezed,
    Object? actionData = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DashboardInsightImpl(
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
              as InsightType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as InsightPriority,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      actionData: freezed == actionData
          ? _value._actionData
          : actionData // ignore: cast_nullable_to_non_nullable
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
class _$DashboardInsightImpl extends _DashboardInsight {
  const _$DashboardInsightImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.priority,
      this.actionText,
      this.actionRoute,
      final Map<String, dynamic>? actionData,
      this.createdAt})
      : _actionData = actionData,
        super._();

  factory _$DashboardInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardInsightImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final InsightType type;
  @override
  final InsightPriority priority;
  @override
  final String? actionText;
  @override
  final String? actionRoute;
  final Map<String, dynamic>? _actionData;
  @override
  Map<String, dynamic>? get actionData {
    final value = _actionData;
    if (value == null) return null;
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DashboardInsight(id: $id, title: $title, description: $description, type: $type, priority: $priority, actionText: $actionText, actionRoute: $actionRoute, actionData: $actionData, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            const DeepCollectionEquality()
                .equals(other._actionData, _actionData) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      priority,
      actionText,
      actionRoute,
      const DeepCollectionEquality().hash(_actionData),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardInsightImplCopyWith<_$DashboardInsightImpl> get copyWith =>
      __$$DashboardInsightImplCopyWithImpl<_$DashboardInsightImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardInsightImplToJson(
      this,
    );
  }
}

abstract class _DashboardInsight extends DashboardInsight {
  const factory _DashboardInsight(
      {required final String id,
      required final String title,
      required final String description,
      required final InsightType type,
      required final InsightPriority priority,
      final String? actionText,
      final String? actionRoute,
      final Map<String, dynamic>? actionData,
      final DateTime? createdAt}) = _$DashboardInsightImpl;
  const _DashboardInsight._() : super._();

  factory _DashboardInsight.fromJson(Map<String, dynamic> json) =
      _$DashboardInsightImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  InsightType get type;
  @override
  InsightPriority get priority;
  @override
  String? get actionText;
  @override
  String? get actionRoute;
  @override
  Map<String, dynamic>? get actionData;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DashboardInsightImplCopyWith<_$DashboardInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyProgress _$WeeklyProgressFromJson(Map<String, dynamic> json) {
  return _WeeklyProgress.fromJson(json);
}

/// @nodoc
mixin _$WeeklyProgress {
  List<DayProgress> get days => throw _privateConstructorUsedError;
  double get averageDaily => throw _privateConstructorUsedError;
  double get weeklyGoal => throw _privateConstructorUsedError;
  double get totalProgress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyProgressCopyWith<WeeklyProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyProgressCopyWith<$Res> {
  factory $WeeklyProgressCopyWith(
          WeeklyProgress value, $Res Function(WeeklyProgress) then) =
      _$WeeklyProgressCopyWithImpl<$Res, WeeklyProgress>;
  @useResult
  $Res call(
      {List<DayProgress> days,
      double averageDaily,
      double weeklyGoal,
      double totalProgress});
}

/// @nodoc
class _$WeeklyProgressCopyWithImpl<$Res, $Val extends WeeklyProgress>
    implements $WeeklyProgressCopyWith<$Res> {
  _$WeeklyProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? averageDaily = null,
    Object? weeklyGoal = null,
    Object? totalProgress = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayProgress>,
      averageDaily: null == averageDaily
          ? _value.averageDaily
          : averageDaily // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyGoal: null == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as double,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyProgressImplCopyWith<$Res>
    implements $WeeklyProgressCopyWith<$Res> {
  factory _$$WeeklyProgressImplCopyWith(_$WeeklyProgressImpl value,
          $Res Function(_$WeeklyProgressImpl) then) =
      __$$WeeklyProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DayProgress> days,
      double averageDaily,
      double weeklyGoal,
      double totalProgress});
}

/// @nodoc
class __$$WeeklyProgressImplCopyWithImpl<$Res>
    extends _$WeeklyProgressCopyWithImpl<$Res, _$WeeklyProgressImpl>
    implements _$$WeeklyProgressImplCopyWith<$Res> {
  __$$WeeklyProgressImplCopyWithImpl(
      _$WeeklyProgressImpl _value, $Res Function(_$WeeklyProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? averageDaily = null,
    Object? weeklyGoal = null,
    Object? totalProgress = null,
  }) {
    return _then(_$WeeklyProgressImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayProgress>,
      averageDaily: null == averageDaily
          ? _value.averageDaily
          : averageDaily // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyGoal: null == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as double,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyProgressImpl extends _WeeklyProgress {
  const _$WeeklyProgressImpl(
      {required final List<DayProgress> days,
      this.averageDaily = 0.0,
      this.weeklyGoal = 0.0,
      this.totalProgress = 0.0})
      : _days = days,
        super._();

  factory _$WeeklyProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyProgressImplFromJson(json);

  final List<DayProgress> _days;
  @override
  List<DayProgress> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  @JsonKey()
  final double averageDaily;
  @override
  @JsonKey()
  final double weeklyGoal;
  @override
  @JsonKey()
  final double totalProgress;

  @override
  String toString() {
    return 'WeeklyProgress(days: $days, averageDaily: $averageDaily, weeklyGoal: $weeklyGoal, totalProgress: $totalProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyProgressImpl &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.averageDaily, averageDaily) ||
                other.averageDaily == averageDaily) &&
            (identical(other.weeklyGoal, weeklyGoal) ||
                other.weeklyGoal == weeklyGoal) &&
            (identical(other.totalProgress, totalProgress) ||
                other.totalProgress == totalProgress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_days),
      averageDaily,
      weeklyGoal,
      totalProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyProgressImplCopyWith<_$WeeklyProgressImpl> get copyWith =>
      __$$WeeklyProgressImplCopyWithImpl<_$WeeklyProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyProgressImplToJson(
      this,
    );
  }
}

abstract class _WeeklyProgress extends WeeklyProgress {
  const factory _WeeklyProgress(
      {required final List<DayProgress> days,
      final double averageDaily,
      final double weeklyGoal,
      final double totalProgress}) = _$WeeklyProgressImpl;
  const _WeeklyProgress._() : super._();

  factory _WeeklyProgress.fromJson(Map<String, dynamic> json) =
      _$WeeklyProgressImpl.fromJson;

  @override
  List<DayProgress> get days;
  @override
  double get averageDaily;
  @override
  double get weeklyGoal;
  @override
  double get totalProgress;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyProgressImplCopyWith<_$WeeklyProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayProgress _$DayProgressFromJson(Map<String, dynamic> json) {
  return _DayProgress.fromJson(json);
}

/// @nodoc
mixin _$DayProgress {
  DateTime get date => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  int get goalsWorkedOn => throw _privateConstructorUsedError;
  int get goalsCompleted => throw _privateConstructorUsedError;
  int get minutesSpent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayProgressCopyWith<DayProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayProgressCopyWith<$Res> {
  factory $DayProgressCopyWith(
          DayProgress value, $Res Function(DayProgress) then) =
      _$DayProgressCopyWithImpl<$Res, DayProgress>;
  @useResult
  $Res call(
      {DateTime date,
      double progress,
      int goalsWorkedOn,
      int goalsCompleted,
      int minutesSpent});
}

/// @nodoc
class _$DayProgressCopyWithImpl<$Res, $Val extends DayProgress>
    implements $DayProgressCopyWith<$Res> {
  _$DayProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? progress = null,
    Object? goalsWorkedOn = null,
    Object? goalsCompleted = null,
    Object? minutesSpent = null,
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
      goalsWorkedOn: null == goalsWorkedOn
          ? _value.goalsWorkedOn
          : goalsWorkedOn // ignore: cast_nullable_to_non_nullable
              as int,
      goalsCompleted: null == goalsCompleted
          ? _value.goalsCompleted
          : goalsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      minutesSpent: null == minutesSpent
          ? _value.minutesSpent
          : minutesSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayProgressImplCopyWith<$Res>
    implements $DayProgressCopyWith<$Res> {
  factory _$$DayProgressImplCopyWith(
          _$DayProgressImpl value, $Res Function(_$DayProgressImpl) then) =
      __$$DayProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double progress,
      int goalsWorkedOn,
      int goalsCompleted,
      int minutesSpent});
}

/// @nodoc
class __$$DayProgressImplCopyWithImpl<$Res>
    extends _$DayProgressCopyWithImpl<$Res, _$DayProgressImpl>
    implements _$$DayProgressImplCopyWith<$Res> {
  __$$DayProgressImplCopyWithImpl(
      _$DayProgressImpl _value, $Res Function(_$DayProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? progress = null,
    Object? goalsWorkedOn = null,
    Object? goalsCompleted = null,
    Object? minutesSpent = null,
  }) {
    return _then(_$DayProgressImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      goalsWorkedOn: null == goalsWorkedOn
          ? _value.goalsWorkedOn
          : goalsWorkedOn // ignore: cast_nullable_to_non_nullable
              as int,
      goalsCompleted: null == goalsCompleted
          ? _value.goalsCompleted
          : goalsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      minutesSpent: null == minutesSpent
          ? _value.minutesSpent
          : minutesSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayProgressImpl extends _DayProgress {
  const _$DayProgressImpl(
      {required this.date,
      this.progress = 0.0,
      this.goalsWorkedOn = 0,
      this.goalsCompleted = 0,
      this.minutesSpent = 0})
      : super._();

  factory _$DayProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayProgressImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final int goalsWorkedOn;
  @override
  @JsonKey()
  final int goalsCompleted;
  @override
  @JsonKey()
  final int minutesSpent;

  @override
  String toString() {
    return 'DayProgress(date: $date, progress: $progress, goalsWorkedOn: $goalsWorkedOn, goalsCompleted: $goalsCompleted, minutesSpent: $minutesSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayProgressImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.goalsWorkedOn, goalsWorkedOn) ||
                other.goalsWorkedOn == goalsWorkedOn) &&
            (identical(other.goalsCompleted, goalsCompleted) ||
                other.goalsCompleted == goalsCompleted) &&
            (identical(other.minutesSpent, minutesSpent) ||
                other.minutesSpent == minutesSpent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, progress, goalsWorkedOn, goalsCompleted, minutesSpent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayProgressImplCopyWith<_$DayProgressImpl> get copyWith =>
      __$$DayProgressImplCopyWithImpl<_$DayProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayProgressImplToJson(
      this,
    );
  }
}

abstract class _DayProgress extends DayProgress {
  const factory _DayProgress(
      {required final DateTime date,
      final double progress,
      final int goalsWorkedOn,
      final int goalsCompleted,
      final int minutesSpent}) = _$DayProgressImpl;
  const _DayProgress._() : super._();

  factory _DayProgress.fromJson(Map<String, dynamic> json) =
      _$DayProgressImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get progress;
  @override
  int get goalsWorkedOn;
  @override
  int get goalsCompleted;
  @override
  int get minutesSpent;
  @override
  @JsonKey(ignore: true)
  _$$DayProgressImplCopyWith<_$DayProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardNotification _$DashboardNotificationFromJson(
    Map<String, dynamic> json) {
  return _DashboardNotification.fromJson(json);
}

/// @nodoc
mixin _$DashboardNotification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get actionRoute => throw _privateConstructorUsedError;
  Map<String, dynamic>? get actionData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardNotificationCopyWith<DashboardNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardNotificationCopyWith<$Res> {
  factory $DashboardNotificationCopyWith(DashboardNotification value,
          $Res Function(DashboardNotification) then) =
      _$DashboardNotificationCopyWithImpl<$Res, DashboardNotification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      NotificationType type,
      bool isRead,
      DateTime? createdAt,
      String? actionRoute,
      Map<String, dynamic>? actionData});
}

/// @nodoc
class _$DashboardNotificationCopyWithImpl<$Res,
        $Val extends DashboardNotification>
    implements $DashboardNotificationCopyWith<$Res> {
  _$DashboardNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? createdAt = freezed,
    Object? actionRoute = freezed,
    Object? actionData = freezed,
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
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      actionData: freezed == actionData
          ? _value.actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardNotificationImplCopyWith<$Res>
    implements $DashboardNotificationCopyWith<$Res> {
  factory _$$DashboardNotificationImplCopyWith(
          _$DashboardNotificationImpl value,
          $Res Function(_$DashboardNotificationImpl) then) =
      __$$DashboardNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      NotificationType type,
      bool isRead,
      DateTime? createdAt,
      String? actionRoute,
      Map<String, dynamic>? actionData});
}

/// @nodoc
class __$$DashboardNotificationImplCopyWithImpl<$Res>
    extends _$DashboardNotificationCopyWithImpl<$Res,
        _$DashboardNotificationImpl>
    implements _$$DashboardNotificationImplCopyWith<$Res> {
  __$$DashboardNotificationImplCopyWithImpl(_$DashboardNotificationImpl _value,
      $Res Function(_$DashboardNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? createdAt = freezed,
    Object? actionRoute = freezed,
    Object? actionData = freezed,
  }) {
    return _then(_$DashboardNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      actionData: freezed == actionData
          ? _value._actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardNotificationImpl extends _DashboardNotification {
  const _$DashboardNotificationImpl(
      {required this.id,
      required this.title,
      required this.message,
      required this.type,
      this.isRead = false,
      this.createdAt,
      this.actionRoute,
      final Map<String, dynamic>? actionData})
      : _actionData = actionData,
        super._();

  factory _$DashboardNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String message;
  @override
  final NotificationType type;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final DateTime? createdAt;
  @override
  final String? actionRoute;
  final Map<String, dynamic>? _actionData;
  @override
  Map<String, dynamic>? get actionData {
    final value = _actionData;
    if (value == null) return null;
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DashboardNotification(id: $id, title: $title, message: $message, type: $type, isRead: $isRead, createdAt: $createdAt, actionRoute: $actionRoute, actionData: $actionData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            const DeepCollectionEquality()
                .equals(other._actionData, _actionData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, message, type, isRead,
      createdAt, actionRoute, const DeepCollectionEquality().hash(_actionData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardNotificationImplCopyWith<_$DashboardNotificationImpl>
      get copyWith => __$$DashboardNotificationImplCopyWithImpl<
          _$DashboardNotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardNotificationImplToJson(
      this,
    );
  }
}

abstract class _DashboardNotification extends DashboardNotification {
  const factory _DashboardNotification(
      {required final String id,
      required final String title,
      required final String message,
      required final NotificationType type,
      final bool isRead,
      final DateTime? createdAt,
      final String? actionRoute,
      final Map<String, dynamic>? actionData}) = _$DashboardNotificationImpl;
  const _DashboardNotification._() : super._();

  factory _DashboardNotification.fromJson(Map<String, dynamic> json) =
      _$DashboardNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get message;
  @override
  NotificationType get type;
  @override
  bool get isRead;
  @override
  DateTime? get createdAt;
  @override
  String? get actionRoute;
  @override
  Map<String, dynamic>? get actionData;
  @override
  @JsonKey(ignore: true)
  _$$DashboardNotificationImplCopyWith<_$DashboardNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
