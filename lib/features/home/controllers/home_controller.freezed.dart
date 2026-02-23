// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<GoalModel> get recentGoals => throw _privateConstructorUsedError;
  List<AssessmentModel> get upcomingAssessments =>
      throw _privateConstructorUsedError;
  DashboardStats? get stats => throw _privateConstructorUsedError;
  List<InsightModel> get insights => throw _privateConstructorUsedError;
  WeeklyProgressData? get weeklyProgress => throw _privateConstructorUsedError;
  List<QuickActionModel> get quickActions => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<GoalModel> recentGoals,
      List<AssessmentModel> upcomingAssessments,
      DashboardStats? stats,
      List<InsightModel> insights,
      WeeklyProgressData? weeklyProgress,
      List<QuickActionModel> quickActions,
      String? error});

  $DashboardStatsCopyWith<$Res>? get stats;
  $WeeklyProgressDataCopyWith<$Res>? get weeklyProgress;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? recentGoals = null,
    Object? upcomingAssessments = null,
    Object? stats = freezed,
    Object? insights = null,
    Object? weeklyProgress = freezed,
    Object? quickActions = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      recentGoals: null == recentGoals
          ? _value.recentGoals
          : recentGoals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
      upcomingAssessments: null == upcomingAssessments
          ? _value.upcomingAssessments
          : upcomingAssessments // ignore: cast_nullable_to_non_nullable
              as List<AssessmentModel>,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats?,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InsightModel>,
      weeklyProgress: freezed == weeklyProgress
          ? _value.weeklyProgress
          : weeklyProgress // ignore: cast_nullable_to_non_nullable
              as WeeklyProgressData?,
      quickActions: null == quickActions
          ? _value.quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $DashboardStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeeklyProgressDataCopyWith<$Res>? get weeklyProgress {
    if (_value.weeklyProgress == null) {
      return null;
    }

    return $WeeklyProgressDataCopyWith<$Res>(_value.weeklyProgress!, (value) {
      return _then(_value.copyWith(weeklyProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<GoalModel> recentGoals,
      List<AssessmentModel> upcomingAssessments,
      DashboardStats? stats,
      List<InsightModel> insights,
      WeeklyProgressData? weeklyProgress,
      List<QuickActionModel> quickActions,
      String? error});

  @override
  $DashboardStatsCopyWith<$Res>? get stats;
  @override
  $WeeklyProgressDataCopyWith<$Res>? get weeklyProgress;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? recentGoals = null,
    Object? upcomingAssessments = null,
    Object? stats = freezed,
    Object? insights = null,
    Object? weeklyProgress = freezed,
    Object? quickActions = null,
    Object? error = freezed,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      recentGoals: null == recentGoals
          ? _value._recentGoals
          : recentGoals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
      upcomingAssessments: null == upcomingAssessments
          ? _value._upcomingAssessments
          : upcomingAssessments // ignore: cast_nullable_to_non_nullable
              as List<AssessmentModel>,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats?,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InsightModel>,
      weeklyProgress: freezed == weeklyProgress
          ? _value.weeklyProgress
          : weeklyProgress // ignore: cast_nullable_to_non_nullable
              as WeeklyProgressData?,
      quickActions: null == quickActions
          ? _value._quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.isLoading = true,
      final List<GoalModel> recentGoals = const [],
      final List<AssessmentModel> upcomingAssessments = const [],
      this.stats,
      final List<InsightModel> insights = const [],
      this.weeklyProgress,
      final List<QuickActionModel> quickActions = const [],
      this.error})
      : _recentGoals = recentGoals,
        _upcomingAssessments = upcomingAssessments,
        _insights = insights,
        _quickActions = quickActions,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<GoalModel> _recentGoals;
  @override
  @JsonKey()
  List<GoalModel> get recentGoals {
    if (_recentGoals is EqualUnmodifiableListView) return _recentGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentGoals);
  }

  final List<AssessmentModel> _upcomingAssessments;
  @override
  @JsonKey()
  List<AssessmentModel> get upcomingAssessments {
    if (_upcomingAssessments is EqualUnmodifiableListView)
      return _upcomingAssessments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingAssessments);
  }

  @override
  final DashboardStats? stats;
  final List<InsightModel> _insights;
  @override
  @JsonKey()
  List<InsightModel> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  @override
  final WeeklyProgressData? weeklyProgress;
  final List<QuickActionModel> _quickActions;
  @override
  @JsonKey()
  List<QuickActionModel> get quickActions {
    if (_quickActions is EqualUnmodifiableListView) return _quickActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickActions);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, recentGoals: $recentGoals, upcomingAssessments: $upcomingAssessments, stats: $stats, insights: $insights, weeklyProgress: $weeklyProgress, quickActions: $quickActions, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._recentGoals, _recentGoals) &&
            const DeepCollectionEquality()
                .equals(other._upcomingAssessments, _upcomingAssessments) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.weeklyProgress, weeklyProgress) ||
                other.weeklyProgress == weeklyProgress) &&
            const DeepCollectionEquality()
                .equals(other._quickActions, _quickActions) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_recentGoals),
      const DeepCollectionEquality().hash(_upcomingAssessments),
      stats,
      const DeepCollectionEquality().hash(_insights),
      weeklyProgress,
      const DeepCollectionEquality().hash(_quickActions),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final bool isLoading,
      final List<GoalModel> recentGoals,
      final List<AssessmentModel> upcomingAssessments,
      final DashboardStats? stats,
      final List<InsightModel> insights,
      final WeeklyProgressData? weeklyProgress,
      final List<QuickActionModel> quickActions,
      final String? error}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  bool get isLoading;
  @override
  List<GoalModel> get recentGoals;
  @override
  List<AssessmentModel> get upcomingAssessments;
  @override
  DashboardStats? get stats;
  @override
  List<InsightModel> get insights;
  @override
  WeeklyProgressData? get weeklyProgress;
  @override
  List<QuickActionModel> get quickActions;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
