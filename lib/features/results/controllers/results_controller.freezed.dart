// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ChartDataModel> get charts => throw _privateConstructorUsedError;
  ResultsTimeRange get timeRange => throw _privateConstructorUsedError;
  ResultsCategory get category => throw _privateConstructorUsedError;
  ResultsSummary? get summary => throw _privateConstructorUsedError;
  List<GoalModel> get completedGoals => throw _privateConstructorUsedError;
  List<AssessmentModel> get completedAssessments =>
      throw _privateConstructorUsedError;
  ProgressTrends? get trends => throw _privateConstructorUsedError;
  Map<String, dynamic> get analytics => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isExporting => throw _privateConstructorUsedError;
  String? get exportError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultsStateCopyWith<ResultsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsStateCopyWith<$Res> {
  factory $ResultsStateCopyWith(
          ResultsState value, $Res Function(ResultsState) then) =
      _$ResultsStateCopyWithImpl<$Res, ResultsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<ChartDataModel> charts,
      ResultsTimeRange timeRange,
      ResultsCategory category,
      ResultsSummary? summary,
      List<GoalModel> completedGoals,
      List<AssessmentModel> completedAssessments,
      ProgressTrends? trends,
      Map<String, dynamic> analytics,
      String? error,
      bool isExporting,
      String? exportError});

  $ResultsSummaryCopyWith<$Res>? get summary;
  $ProgressTrendsCopyWith<$Res>? get trends;
}

/// @nodoc
class _$ResultsStateCopyWithImpl<$Res, $Val extends ResultsState>
    implements $ResultsStateCopyWith<$Res> {
  _$ResultsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? charts = null,
    Object? timeRange = null,
    Object? category = null,
    Object? summary = freezed,
    Object? completedGoals = null,
    Object? completedAssessments = null,
    Object? trends = freezed,
    Object? analytics = null,
    Object? error = freezed,
    Object? isExporting = null,
    Object? exportError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      charts: null == charts
          ? _value.charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartDataModel>,
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as ResultsTimeRange,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ResultsCategory,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ResultsSummary?,
      completedGoals: null == completedGoals
          ? _value.completedGoals
          : completedGoals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
      completedAssessments: null == completedAssessments
          ? _value.completedAssessments
          : completedAssessments // ignore: cast_nullable_to_non_nullable
              as List<AssessmentModel>,
      trends: freezed == trends
          ? _value.trends
          : trends // ignore: cast_nullable_to_non_nullable
              as ProgressTrends?,
      analytics: null == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isExporting: null == isExporting
          ? _value.isExporting
          : isExporting // ignore: cast_nullable_to_non_nullable
              as bool,
      exportError: freezed == exportError
          ? _value.exportError
          : exportError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultsSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $ResultsSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgressTrendsCopyWith<$Res>? get trends {
    if (_value.trends == null) {
      return null;
    }

    return $ProgressTrendsCopyWith<$Res>(_value.trends!, (value) {
      return _then(_value.copyWith(trends: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultsStateImplCopyWith<$Res>
    implements $ResultsStateCopyWith<$Res> {
  factory _$$ResultsStateImplCopyWith(
          _$ResultsStateImpl value, $Res Function(_$ResultsStateImpl) then) =
      __$$ResultsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<ChartDataModel> charts,
      ResultsTimeRange timeRange,
      ResultsCategory category,
      ResultsSummary? summary,
      List<GoalModel> completedGoals,
      List<AssessmentModel> completedAssessments,
      ProgressTrends? trends,
      Map<String, dynamic> analytics,
      String? error,
      bool isExporting,
      String? exportError});

  @override
  $ResultsSummaryCopyWith<$Res>? get summary;
  @override
  $ProgressTrendsCopyWith<$Res>? get trends;
}

/// @nodoc
class __$$ResultsStateImplCopyWithImpl<$Res>
    extends _$ResultsStateCopyWithImpl<$Res, _$ResultsStateImpl>
    implements _$$ResultsStateImplCopyWith<$Res> {
  __$$ResultsStateImplCopyWithImpl(
      _$ResultsStateImpl _value, $Res Function(_$ResultsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? charts = null,
    Object? timeRange = null,
    Object? category = null,
    Object? summary = freezed,
    Object? completedGoals = null,
    Object? completedAssessments = null,
    Object? trends = freezed,
    Object? analytics = null,
    Object? error = freezed,
    Object? isExporting = null,
    Object? exportError = freezed,
  }) {
    return _then(_$ResultsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      charts: null == charts
          ? _value._charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartDataModel>,
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as ResultsTimeRange,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ResultsCategory,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ResultsSummary?,
      completedGoals: null == completedGoals
          ? _value._completedGoals
          : completedGoals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
      completedAssessments: null == completedAssessments
          ? _value._completedAssessments
          : completedAssessments // ignore: cast_nullable_to_non_nullable
              as List<AssessmentModel>,
      trends: freezed == trends
          ? _value.trends
          : trends // ignore: cast_nullable_to_non_nullable
              as ProgressTrends?,
      analytics: null == analytics
          ? _value._analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isExporting: null == isExporting
          ? _value.isExporting
          : isExporting // ignore: cast_nullable_to_non_nullable
              as bool,
      exportError: freezed == exportError
          ? _value.exportError
          : exportError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ResultsStateImpl extends _ResultsState {
  const _$ResultsStateImpl(
      {this.isLoading = true,
      final List<ChartDataModel> charts = const [],
      this.timeRange = ResultsTimeRange.month,
      this.category = ResultsCategory.all,
      this.summary,
      final List<GoalModel> completedGoals = const [],
      final List<AssessmentModel> completedAssessments = const [],
      this.trends,
      final Map<String, dynamic> analytics = const {},
      this.error,
      this.isExporting = false,
      this.exportError})
      : _charts = charts,
        _completedGoals = completedGoals,
        _completedAssessments = completedAssessments,
        _analytics = analytics,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ChartDataModel> _charts;
  @override
  @JsonKey()
  List<ChartDataModel> get charts {
    if (_charts is EqualUnmodifiableListView) return _charts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charts);
  }

  @override
  @JsonKey()
  final ResultsTimeRange timeRange;
  @override
  @JsonKey()
  final ResultsCategory category;
  @override
  final ResultsSummary? summary;
  final List<GoalModel> _completedGoals;
  @override
  @JsonKey()
  List<GoalModel> get completedGoals {
    if (_completedGoals is EqualUnmodifiableListView) return _completedGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedGoals);
  }

  final List<AssessmentModel> _completedAssessments;
  @override
  @JsonKey()
  List<AssessmentModel> get completedAssessments {
    if (_completedAssessments is EqualUnmodifiableListView)
      return _completedAssessments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedAssessments);
  }

  @override
  final ProgressTrends? trends;
  final Map<String, dynamic> _analytics;
  @override
  @JsonKey()
  Map<String, dynamic> get analytics {
    if (_analytics is EqualUnmodifiableMapView) return _analytics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_analytics);
  }

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isExporting;
  @override
  final String? exportError;

  @override
  String toString() {
    return 'ResultsState(isLoading: $isLoading, charts: $charts, timeRange: $timeRange, category: $category, summary: $summary, completedGoals: $completedGoals, completedAssessments: $completedAssessments, trends: $trends, analytics: $analytics, error: $error, isExporting: $isExporting, exportError: $exportError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._charts, _charts) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._completedGoals, _completedGoals) &&
            const DeepCollectionEquality()
                .equals(other._completedAssessments, _completedAssessments) &&
            (identical(other.trends, trends) || other.trends == trends) &&
            const DeepCollectionEquality()
                .equals(other._analytics, _analytics) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isExporting, isExporting) ||
                other.isExporting == isExporting) &&
            (identical(other.exportError, exportError) ||
                other.exportError == exportError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_charts),
      timeRange,
      category,
      summary,
      const DeepCollectionEquality().hash(_completedGoals),
      const DeepCollectionEquality().hash(_completedAssessments),
      trends,
      const DeepCollectionEquality().hash(_analytics),
      error,
      isExporting,
      exportError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsStateImplCopyWith<_$ResultsStateImpl> get copyWith =>
      __$$ResultsStateImplCopyWithImpl<_$ResultsStateImpl>(this, _$identity);
}

abstract class _ResultsState extends ResultsState {
  const factory _ResultsState(
      {final bool isLoading,
      final List<ChartDataModel> charts,
      final ResultsTimeRange timeRange,
      final ResultsCategory category,
      final ResultsSummary? summary,
      final List<GoalModel> completedGoals,
      final List<AssessmentModel> completedAssessments,
      final ProgressTrends? trends,
      final Map<String, dynamic> analytics,
      final String? error,
      final bool isExporting,
      final String? exportError}) = _$ResultsStateImpl;
  const _ResultsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ChartDataModel> get charts;
  @override
  ResultsTimeRange get timeRange;
  @override
  ResultsCategory get category;
  @override
  ResultsSummary? get summary;
  @override
  List<GoalModel> get completedGoals;
  @override
  List<AssessmentModel> get completedAssessments;
  @override
  ProgressTrends? get trends;
  @override
  Map<String, dynamic> get analytics;
  @override
  String? get error;
  @override
  bool get isExporting;
  @override
  String? get exportError;
  @override
  @JsonKey(ignore: true)
  _$$ResultsStateImplCopyWith<_$ResultsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultsSummary _$ResultsSummaryFromJson(Map<String, dynamic> json) {
  return _ResultsSummary.fromJson(json);
}

/// @nodoc
mixin _$ResultsSummary {
  int get totalGoalsCompleted => throw _privateConstructorUsedError;
  int get totalAssessmentsCompleted => throw _privateConstructorUsedError;
  double get averageGoalCompletionTime => throw _privateConstructorUsedError;
  double get averageAssessmentScore => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  double get overallProgress => throw _privateConstructorUsedError;
  Map<GoalCategory, int> get goalsByCategory =>
      throw _privateConstructorUsedError;
  Map<String, double> get skillsProgress => throw _privateConstructorUsedError;
  DateTime? get lastActivity => throw _privateConstructorUsedError;
  int get activeDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultsSummaryCopyWith<ResultsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsSummaryCopyWith<$Res> {
  factory $ResultsSummaryCopyWith(
          ResultsSummary value, $Res Function(ResultsSummary) then) =
      _$ResultsSummaryCopyWithImpl<$Res, ResultsSummary>;
  @useResult
  $Res call(
      {int totalGoalsCompleted,
      int totalAssessmentsCompleted,
      double averageGoalCompletionTime,
      double averageAssessmentScore,
      int currentStreak,
      int longestStreak,
      double overallProgress,
      Map<GoalCategory, int> goalsByCategory,
      Map<String, double> skillsProgress,
      DateTime? lastActivity,
      int activeDays});
}

/// @nodoc
class _$ResultsSummaryCopyWithImpl<$Res, $Val extends ResultsSummary>
    implements $ResultsSummaryCopyWith<$Res> {
  _$ResultsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalGoalsCompleted = null,
    Object? totalAssessmentsCompleted = null,
    Object? averageGoalCompletionTime = null,
    Object? averageAssessmentScore = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? overallProgress = null,
    Object? goalsByCategory = null,
    Object? skillsProgress = null,
    Object? lastActivity = freezed,
    Object? activeDays = null,
  }) {
    return _then(_value.copyWith(
      totalGoalsCompleted: null == totalGoalsCompleted
          ? _value.totalGoalsCompleted
          : totalGoalsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssessmentsCompleted: null == totalAssessmentsCompleted
          ? _value.totalAssessmentsCompleted
          : totalAssessmentsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      averageGoalCompletionTime: null == averageGoalCompletionTime
          ? _value.averageGoalCompletionTime
          : averageGoalCompletionTime // ignore: cast_nullable_to_non_nullable
              as double,
      averageAssessmentScore: null == averageAssessmentScore
          ? _value.averageAssessmentScore
          : averageAssessmentScore // ignore: cast_nullable_to_non_nullable
              as double,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      overallProgress: null == overallProgress
          ? _value.overallProgress
          : overallProgress // ignore: cast_nullable_to_non_nullable
              as double,
      goalsByCategory: null == goalsByCategory
          ? _value.goalsByCategory
          : goalsByCategory // ignore: cast_nullable_to_non_nullable
              as Map<GoalCategory, int>,
      skillsProgress: null == skillsProgress
          ? _value.skillsProgress
          : skillsProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeDays: null == activeDays
          ? _value.activeDays
          : activeDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultsSummaryImplCopyWith<$Res>
    implements $ResultsSummaryCopyWith<$Res> {
  factory _$$ResultsSummaryImplCopyWith(_$ResultsSummaryImpl value,
          $Res Function(_$ResultsSummaryImpl) then) =
      __$$ResultsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalGoalsCompleted,
      int totalAssessmentsCompleted,
      double averageGoalCompletionTime,
      double averageAssessmentScore,
      int currentStreak,
      int longestStreak,
      double overallProgress,
      Map<GoalCategory, int> goalsByCategory,
      Map<String, double> skillsProgress,
      DateTime? lastActivity,
      int activeDays});
}

/// @nodoc
class __$$ResultsSummaryImplCopyWithImpl<$Res>
    extends _$ResultsSummaryCopyWithImpl<$Res, _$ResultsSummaryImpl>
    implements _$$ResultsSummaryImplCopyWith<$Res> {
  __$$ResultsSummaryImplCopyWithImpl(
      _$ResultsSummaryImpl _value, $Res Function(_$ResultsSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalGoalsCompleted = null,
    Object? totalAssessmentsCompleted = null,
    Object? averageGoalCompletionTime = null,
    Object? averageAssessmentScore = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? overallProgress = null,
    Object? goalsByCategory = null,
    Object? skillsProgress = null,
    Object? lastActivity = freezed,
    Object? activeDays = null,
  }) {
    return _then(_$ResultsSummaryImpl(
      totalGoalsCompleted: null == totalGoalsCompleted
          ? _value.totalGoalsCompleted
          : totalGoalsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssessmentsCompleted: null == totalAssessmentsCompleted
          ? _value.totalAssessmentsCompleted
          : totalAssessmentsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      averageGoalCompletionTime: null == averageGoalCompletionTime
          ? _value.averageGoalCompletionTime
          : averageGoalCompletionTime // ignore: cast_nullable_to_non_nullable
              as double,
      averageAssessmentScore: null == averageAssessmentScore
          ? _value.averageAssessmentScore
          : averageAssessmentScore // ignore: cast_nullable_to_non_nullable
              as double,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      overallProgress: null == overallProgress
          ? _value.overallProgress
          : overallProgress // ignore: cast_nullable_to_non_nullable
              as double,
      goalsByCategory: null == goalsByCategory
          ? _value._goalsByCategory
          : goalsByCategory // ignore: cast_nullable_to_non_nullable
              as Map<GoalCategory, int>,
      skillsProgress: null == skillsProgress
          ? _value._skillsProgress
          : skillsProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeDays: null == activeDays
          ? _value.activeDays
          : activeDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultsSummaryImpl implements _ResultsSummary {
  const _$ResultsSummaryImpl(
      {this.totalGoalsCompleted = 0,
      this.totalAssessmentsCompleted = 0,
      this.averageGoalCompletionTime = 0.0,
      this.averageAssessmentScore = 0.0,
      this.currentStreak = 0,
      this.longestStreak = 0,
      this.overallProgress = 0.0,
      final Map<GoalCategory, int> goalsByCategory = const {},
      final Map<String, double> skillsProgress = const {},
      this.lastActivity,
      this.activeDays = 0})
      : _goalsByCategory = goalsByCategory,
        _skillsProgress = skillsProgress;

  factory _$ResultsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultsSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalGoalsCompleted;
  @override
  @JsonKey()
  final int totalAssessmentsCompleted;
  @override
  @JsonKey()
  final double averageGoalCompletionTime;
  @override
  @JsonKey()
  final double averageAssessmentScore;
  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final int longestStreak;
  @override
  @JsonKey()
  final double overallProgress;
  final Map<GoalCategory, int> _goalsByCategory;
  @override
  @JsonKey()
  Map<GoalCategory, int> get goalsByCategory {
    if (_goalsByCategory is EqualUnmodifiableMapView) return _goalsByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_goalsByCategory);
  }

  final Map<String, double> _skillsProgress;
  @override
  @JsonKey()
  Map<String, double> get skillsProgress {
    if (_skillsProgress is EqualUnmodifiableMapView) return _skillsProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_skillsProgress);
  }

  @override
  final DateTime? lastActivity;
  @override
  @JsonKey()
  final int activeDays;

  @override
  String toString() {
    return 'ResultsSummary(totalGoalsCompleted: $totalGoalsCompleted, totalAssessmentsCompleted: $totalAssessmentsCompleted, averageGoalCompletionTime: $averageGoalCompletionTime, averageAssessmentScore: $averageAssessmentScore, currentStreak: $currentStreak, longestStreak: $longestStreak, overallProgress: $overallProgress, goalsByCategory: $goalsByCategory, skillsProgress: $skillsProgress, lastActivity: $lastActivity, activeDays: $activeDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsSummaryImpl &&
            (identical(other.totalGoalsCompleted, totalGoalsCompleted) ||
                other.totalGoalsCompleted == totalGoalsCompleted) &&
            (identical(other.totalAssessmentsCompleted,
                    totalAssessmentsCompleted) ||
                other.totalAssessmentsCompleted == totalAssessmentsCompleted) &&
            (identical(other.averageGoalCompletionTime,
                    averageGoalCompletionTime) ||
                other.averageGoalCompletionTime == averageGoalCompletionTime) &&
            (identical(other.averageAssessmentScore, averageAssessmentScore) ||
                other.averageAssessmentScore == averageAssessmentScore) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.overallProgress, overallProgress) ||
                other.overallProgress == overallProgress) &&
            const DeepCollectionEquality()
                .equals(other._goalsByCategory, _goalsByCategory) &&
            const DeepCollectionEquality()
                .equals(other._skillsProgress, _skillsProgress) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity) &&
            (identical(other.activeDays, activeDays) ||
                other.activeDays == activeDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalGoalsCompleted,
      totalAssessmentsCompleted,
      averageGoalCompletionTime,
      averageAssessmentScore,
      currentStreak,
      longestStreak,
      overallProgress,
      const DeepCollectionEquality().hash(_goalsByCategory),
      const DeepCollectionEquality().hash(_skillsProgress),
      lastActivity,
      activeDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsSummaryImplCopyWith<_$ResultsSummaryImpl> get copyWith =>
      __$$ResultsSummaryImplCopyWithImpl<_$ResultsSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultsSummaryImplToJson(
      this,
    );
  }
}

abstract class _ResultsSummary implements ResultsSummary {
  const factory _ResultsSummary(
      {final int totalGoalsCompleted,
      final int totalAssessmentsCompleted,
      final double averageGoalCompletionTime,
      final double averageAssessmentScore,
      final int currentStreak,
      final int longestStreak,
      final double overallProgress,
      final Map<GoalCategory, int> goalsByCategory,
      final Map<String, double> skillsProgress,
      final DateTime? lastActivity,
      final int activeDays}) = _$ResultsSummaryImpl;

  factory _ResultsSummary.fromJson(Map<String, dynamic> json) =
      _$ResultsSummaryImpl.fromJson;

  @override
  int get totalGoalsCompleted;
  @override
  int get totalAssessmentsCompleted;
  @override
  double get averageGoalCompletionTime;
  @override
  double get averageAssessmentScore;
  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  double get overallProgress;
  @override
  Map<GoalCategory, int> get goalsByCategory;
  @override
  Map<String, double> get skillsProgress;
  @override
  DateTime? get lastActivity;
  @override
  int get activeDays;
  @override
  @JsonKey(ignore: true)
  _$$ResultsSummaryImplCopyWith<_$ResultsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProgressTrends _$ProgressTrendsFromJson(Map<String, dynamic> json) {
  return _ProgressTrends.fromJson(json);
}

/// @nodoc
mixin _$ProgressTrends {
  TrendDirection get goalCompletionTrend => throw _privateConstructorUsedError;
  TrendDirection get assessmentScoreTrend => throw _privateConstructorUsedError;
  TrendDirection get activityTrend => throw _privateConstructorUsedError;
  double get goalCompletionChange => throw _privateConstructorUsedError;
  double get assessmentScoreChange => throw _privateConstructorUsedError;
  double get activityChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'trend_period_days')
  int get trendPeriodDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressTrendsCopyWith<ProgressTrends> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressTrendsCopyWith<$Res> {
  factory $ProgressTrendsCopyWith(
          ProgressTrends value, $Res Function(ProgressTrends) then) =
      _$ProgressTrendsCopyWithImpl<$Res, ProgressTrends>;
  @useResult
  $Res call(
      {TrendDirection goalCompletionTrend,
      TrendDirection assessmentScoreTrend,
      TrendDirection activityTrend,
      double goalCompletionChange,
      double assessmentScoreChange,
      double activityChange,
      @JsonKey(name: 'trend_period_days') int trendPeriodDays});
}

/// @nodoc
class _$ProgressTrendsCopyWithImpl<$Res, $Val extends ProgressTrends>
    implements $ProgressTrendsCopyWith<$Res> {
  _$ProgressTrendsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalCompletionTrend = null,
    Object? assessmentScoreTrend = null,
    Object? activityTrend = null,
    Object? goalCompletionChange = null,
    Object? assessmentScoreChange = null,
    Object? activityChange = null,
    Object? trendPeriodDays = null,
  }) {
    return _then(_value.copyWith(
      goalCompletionTrend: null == goalCompletionTrend
          ? _value.goalCompletionTrend
          : goalCompletionTrend // ignore: cast_nullable_to_non_nullable
              as TrendDirection,
      assessmentScoreTrend: null == assessmentScoreTrend
          ? _value.assessmentScoreTrend
          : assessmentScoreTrend // ignore: cast_nullable_to_non_nullable
              as TrendDirection,
      activityTrend: null == activityTrend
          ? _value.activityTrend
          : activityTrend // ignore: cast_nullable_to_non_nullable
              as TrendDirection,
      goalCompletionChange: null == goalCompletionChange
          ? _value.goalCompletionChange
          : goalCompletionChange // ignore: cast_nullable_to_non_nullable
              as double,
      assessmentScoreChange: null == assessmentScoreChange
          ? _value.assessmentScoreChange
          : assessmentScoreChange // ignore: cast_nullable_to_non_nullable
              as double,
      activityChange: null == activityChange
          ? _value.activityChange
          : activityChange // ignore: cast_nullable_to_non_nullable
              as double,
      trendPeriodDays: null == trendPeriodDays
          ? _value.trendPeriodDays
          : trendPeriodDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressTrendsImplCopyWith<$Res>
    implements $ProgressTrendsCopyWith<$Res> {
  factory _$$ProgressTrendsImplCopyWith(_$ProgressTrendsImpl value,
          $Res Function(_$ProgressTrendsImpl) then) =
      __$$ProgressTrendsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TrendDirection goalCompletionTrend,
      TrendDirection assessmentScoreTrend,
      TrendDirection activityTrend,
      double goalCompletionChange,
      double assessmentScoreChange,
      double activityChange,
      @JsonKey(name: 'trend_period_days') int trendPeriodDays});
}

/// @nodoc
class __$$ProgressTrendsImplCopyWithImpl<$Res>
    extends _$ProgressTrendsCopyWithImpl<$Res, _$ProgressTrendsImpl>
    implements _$$ProgressTrendsImplCopyWith<$Res> {
  __$$ProgressTrendsImplCopyWithImpl(
      _$ProgressTrendsImpl _value, $Res Function(_$ProgressTrendsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalCompletionTrend = null,
    Object? assessmentScoreTrend = null,
    Object? activityTrend = null,
    Object? goalCompletionChange = null,
    Object? assessmentScoreChange = null,
    Object? activityChange = null,
    Object? trendPeriodDays = null,
  }) {
    return _then(_$ProgressTrendsImpl(
      goalCompletionTrend: null == goalCompletionTrend
          ? _value.goalCompletionTrend
          : goalCompletionTrend // ignore: cast_nullable_to_non_nullable
              as TrendDirection,
      assessmentScoreTrend: null == assessmentScoreTrend
          ? _value.assessmentScoreTrend
          : assessmentScoreTrend // ignore: cast_nullable_to_non_nullable
              as TrendDirection,
      activityTrend: null == activityTrend
          ? _value.activityTrend
          : activityTrend // ignore: cast_nullable_to_non_nullable
              as TrendDirection,
      goalCompletionChange: null == goalCompletionChange
          ? _value.goalCompletionChange
          : goalCompletionChange // ignore: cast_nullable_to_non_nullable
              as double,
      assessmentScoreChange: null == assessmentScoreChange
          ? _value.assessmentScoreChange
          : assessmentScoreChange // ignore: cast_nullable_to_non_nullable
              as double,
      activityChange: null == activityChange
          ? _value.activityChange
          : activityChange // ignore: cast_nullable_to_non_nullable
              as double,
      trendPeriodDays: null == trendPeriodDays
          ? _value.trendPeriodDays
          : trendPeriodDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressTrendsImpl implements _ProgressTrends {
  const _$ProgressTrendsImpl(
      {this.goalCompletionTrend = TrendDirection.stable,
      this.assessmentScoreTrend = TrendDirection.stable,
      this.activityTrend = TrendDirection.stable,
      this.goalCompletionChange = 0.0,
      this.assessmentScoreChange = 0.0,
      this.activityChange = 0.0,
      @JsonKey(name: 'trend_period_days') this.trendPeriodDays = 30});

  factory _$ProgressTrendsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressTrendsImplFromJson(json);

  @override
  @JsonKey()
  final TrendDirection goalCompletionTrend;
  @override
  @JsonKey()
  final TrendDirection assessmentScoreTrend;
  @override
  @JsonKey()
  final TrendDirection activityTrend;
  @override
  @JsonKey()
  final double goalCompletionChange;
  @override
  @JsonKey()
  final double assessmentScoreChange;
  @override
  @JsonKey()
  final double activityChange;
  @override
  @JsonKey(name: 'trend_period_days')
  final int trendPeriodDays;

  @override
  String toString() {
    return 'ProgressTrends(goalCompletionTrend: $goalCompletionTrend, assessmentScoreTrend: $assessmentScoreTrend, activityTrend: $activityTrend, goalCompletionChange: $goalCompletionChange, assessmentScoreChange: $assessmentScoreChange, activityChange: $activityChange, trendPeriodDays: $trendPeriodDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressTrendsImpl &&
            (identical(other.goalCompletionTrend, goalCompletionTrend) ||
                other.goalCompletionTrend == goalCompletionTrend) &&
            (identical(other.assessmentScoreTrend, assessmentScoreTrend) ||
                other.assessmentScoreTrend == assessmentScoreTrend) &&
            (identical(other.activityTrend, activityTrend) ||
                other.activityTrend == activityTrend) &&
            (identical(other.goalCompletionChange, goalCompletionChange) ||
                other.goalCompletionChange == goalCompletionChange) &&
            (identical(other.assessmentScoreChange, assessmentScoreChange) ||
                other.assessmentScoreChange == assessmentScoreChange) &&
            (identical(other.activityChange, activityChange) ||
                other.activityChange == activityChange) &&
            (identical(other.trendPeriodDays, trendPeriodDays) ||
                other.trendPeriodDays == trendPeriodDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      goalCompletionTrend,
      assessmentScoreTrend,
      activityTrend,
      goalCompletionChange,
      assessmentScoreChange,
      activityChange,
      trendPeriodDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressTrendsImplCopyWith<_$ProgressTrendsImpl> get copyWith =>
      __$$ProgressTrendsImplCopyWithImpl<_$ProgressTrendsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressTrendsImplToJson(
      this,
    );
  }
}

abstract class _ProgressTrends implements ProgressTrends {
  const factory _ProgressTrends(
          {final TrendDirection goalCompletionTrend,
          final TrendDirection assessmentScoreTrend,
          final TrendDirection activityTrend,
          final double goalCompletionChange,
          final double assessmentScoreChange,
          final double activityChange,
          @JsonKey(name: 'trend_period_days') final int trendPeriodDays}) =
      _$ProgressTrendsImpl;

  factory _ProgressTrends.fromJson(Map<String, dynamic> json) =
      _$ProgressTrendsImpl.fromJson;

  @override
  TrendDirection get goalCompletionTrend;
  @override
  TrendDirection get assessmentScoreTrend;
  @override
  TrendDirection get activityTrend;
  @override
  double get goalCompletionChange;
  @override
  double get assessmentScoreChange;
  @override
  double get activityChange;
  @override
  @JsonKey(name: 'trend_period_days')
  int get trendPeriodDays;
  @override
  @JsonKey(ignore: true)
  _$$ProgressTrendsImplCopyWith<_$ProgressTrendsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
