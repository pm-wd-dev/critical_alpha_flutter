// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsSummaryImpl _$$ResultsSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ResultsSummaryImpl(
      totalGoalsCompleted: (json['totalGoalsCompleted'] as num?)?.toInt() ?? 0,
      totalAssessmentsCompleted:
          (json['totalAssessmentsCompleted'] as num?)?.toInt() ?? 0,
      averageGoalCompletionTime:
          (json['averageGoalCompletionTime'] as num?)?.toDouble() ?? 0.0,
      averageAssessmentScore:
          (json['averageAssessmentScore'] as num?)?.toDouble() ?? 0.0,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      overallProgress: (json['overallProgress'] as num?)?.toDouble() ?? 0.0,
      goalsByCategory: (json['goalsByCategory'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                $enumDecode(_$GoalCategoryEnumMap, k), (e as num).toInt()),
          ) ??
          const {},
      skillsProgress: (json['skillsProgress'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      lastActivity: json['lastActivity'] == null
          ? null
          : DateTime.parse(json['lastActivity'] as String),
      activeDays: (json['activeDays'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ResultsSummaryImplToJson(
        _$ResultsSummaryImpl instance) =>
    <String, dynamic>{
      'totalGoalsCompleted': instance.totalGoalsCompleted,
      'totalAssessmentsCompleted': instance.totalAssessmentsCompleted,
      'averageGoalCompletionTime': instance.averageGoalCompletionTime,
      'averageAssessmentScore': instance.averageAssessmentScore,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'overallProgress': instance.overallProgress,
      'goalsByCategory': instance.goalsByCategory
          .map((k, e) => MapEntry(_$GoalCategoryEnumMap[k]!, e)),
      'skillsProgress': instance.skillsProgress,
      'lastActivity': instance.lastActivity?.toIso8601String(),
      'activeDays': instance.activeDays,
    };

const _$GoalCategoryEnumMap = {
  GoalCategory.career: 'career',
  GoalCategory.education: 'education',
  GoalCategory.health: 'health',
  GoalCategory.finance: 'finance',
  GoalCategory.relationship: 'relationship',
  GoalCategory.personal: 'personal',
  GoalCategory.hobby: 'hobby',
  GoalCategory.travel: 'travel',
  GoalCategory.business: 'business',
  GoalCategory.other: 'other',
};

_$ProgressTrendsImpl _$$ProgressTrendsImplFromJson(Map<String, dynamic> json) =>
    _$ProgressTrendsImpl(
      goalCompletionTrend: $enumDecodeNullable(
              _$TrendDirectionEnumMap, json['goalCompletionTrend']) ??
          TrendDirection.stable,
      assessmentScoreTrend: $enumDecodeNullable(
              _$TrendDirectionEnumMap, json['assessmentScoreTrend']) ??
          TrendDirection.stable,
      activityTrend:
          $enumDecodeNullable(_$TrendDirectionEnumMap, json['activityTrend']) ??
              TrendDirection.stable,
      goalCompletionChange:
          (json['goalCompletionChange'] as num?)?.toDouble() ?? 0.0,
      assessmentScoreChange:
          (json['assessmentScoreChange'] as num?)?.toDouble() ?? 0.0,
      activityChange: (json['activityChange'] as num?)?.toDouble() ?? 0.0,
      trendPeriodDays: (json['trend_period_days'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$$ProgressTrendsImplToJson(
        _$ProgressTrendsImpl instance) =>
    <String, dynamic>{
      'goalCompletionTrend':
          _$TrendDirectionEnumMap[instance.goalCompletionTrend]!,
      'assessmentScoreTrend':
          _$TrendDirectionEnumMap[instance.assessmentScoreTrend]!,
      'activityTrend': _$TrendDirectionEnumMap[instance.activityTrend]!,
      'goalCompletionChange': instance.goalCompletionChange,
      'assessmentScoreChange': instance.assessmentScoreChange,
      'activityChange': instance.activityChange,
      'trend_period_days': instance.trendPeriodDays,
    };

const _$TrendDirectionEnumMap = {
  TrendDirection.up: 'up',
  TrendDirection.down: 'down',
  TrendDirection.stable: 'stable',
};
