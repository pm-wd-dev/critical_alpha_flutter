import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/errors/failures.dart';
import '../../auth/controllers/auth_controller.dart';
import '../models/chart_data_model.dart';
import '../../goals/models/goal_model.dart';
import '../../home/models/assessment_model.dart';

part 'results_controller.freezed.dart';
part 'results_controller.g.dart';

@freezed
class ResultsState with _$ResultsState {
  const factory ResultsState({
    @Default(true) bool isLoading,
    @Default([]) List<ChartDataModel> charts,
    @Default(ResultsTimeRange.month) ResultsTimeRange timeRange,
    @Default(ResultsCategory.all) ResultsCategory category,
    ResultsSummary? summary,
    @Default([]) List<GoalModel> completedGoals,
    @Default([]) List<AssessmentModel> completedAssessments,
    ProgressTrends? trends,
    @Default({}) Map<String, dynamic> analytics,
    String? error,
    @Default(false) bool isExporting,
    String? exportError,
  }) = _ResultsState;

  const ResultsState._();

  bool get hasError => error != null;
  bool get hasExportError => exportError != null;
  bool get hasData => charts.isNotEmpty || summary != null;
  bool get isEmpty => charts.isEmpty && !isLoading;

  List<ChartDataModel> get filteredCharts {
    var filtered = charts;

    // Apply category filter
    if (category != ResultsCategory.all) {
      filtered = filtered.where((chart) {
        return chart.metadata?.customProperties?['category'] == category.name;
      }).toList();
    }

    return filtered;
  }

  // Get charts by type
  List<ChartDataModel> get lineCharts =>
      filteredCharts.where((chart) => chart.type == ChartType.line).toList();

  List<ChartDataModel> get barCharts =>
      filteredCharts.where((chart) => chart.type == ChartType.bar).toList();

  List<ChartDataModel> get pieCharts =>
      filteredCharts.where((chart) => chart.type == ChartType.pie).toList();

  List<ChartDataModel> get radarCharts =>
      filteredCharts.where((chart) => chart.type == ChartType.radar).toList();
}

@freezed
class ResultsSummary with _$ResultsSummary {
  const factory ResultsSummary({
    @Default(0) int totalGoalsCompleted,
    @Default(0) int totalAssessmentsCompleted,
    @Default(0.0) double averageGoalCompletionTime,
    @Default(0.0) double averageAssessmentScore,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0.0) double overallProgress,
    @Default({}) Map<GoalCategory, int> goalsByCategory,
    @Default({}) Map<String, double> skillsProgress,
    DateTime? lastActivity,
    @Default(0) int activeDays,
  }) = _ResultsSummary;

  factory ResultsSummary.fromJson(Map<String, dynamic> json) =>
      _$ResultsSummaryFromJson(json);
}

@freezed
class ProgressTrends with _$ProgressTrends {
  const factory ProgressTrends({
    @Default(TrendDirection.stable) TrendDirection goalCompletionTrend,
    @Default(TrendDirection.stable) TrendDirection assessmentScoreTrend,
    @Default(TrendDirection.stable) TrendDirection activityTrend,
    @Default(0.0) double goalCompletionChange,
    @Default(0.0) double assessmentScoreChange,
    @Default(0.0) double activityChange,
    @JsonKey(name: 'trend_period_days') @Default(30) int trendPeriodDays,
  }) = _ProgressTrends;

  factory ProgressTrends.fromJson(Map<String, dynamic> json) =>
      _$ProgressTrendsFromJson(json);
}

class ResultsController extends StateNotifier<ResultsState> {
  final ApiClient _apiClient;
  final Ref _ref;

  ResultsController(this._apiClient, this._ref) : super(const ResultsState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadResults();
  }

  Future<void> loadResults() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'User not authenticated',
        );
        return;
      }

      await Future.wait([
        _loadCharts(),
        _loadSummary(),
        _loadCompletedGoals(),
        _loadCompletedAssessments(),
        _loadTrends(),
        _loadAnalytics(),
      ]);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> _loadCharts() async {
    try {
      final response = await _apiClient.get('/results/charts', queryParameters: {
        'time_range': state.timeRange.name,
        'category': state.category.name,
      });

      final charts = (response.data['data'] as List)
          .map((json) => ChartDataModel.fromJson(json))
          .toList();

      state = state.copyWith(charts: charts);
    } catch (e) {
      print('Failed to load charts: $e');
    }
  }

  Future<void> _loadSummary() async {
    try {
      final response = await _apiClient.get('/results/summary', queryParameters: {
        'time_range': state.timeRange.name,
      });

      final summary = ResultsSummary.fromJson(response.data['data']);
      state = state.copyWith(summary: summary);
    } catch (e) {
      print('Failed to load summary: $e');
    }
  }

  Future<void> _loadCompletedGoals() async {
    try {
      final response = await _apiClient.get('/goals', queryParameters: {
        'status': 'completed',
        'time_range': state.timeRange.name,
        'limit': 50,
      });

      final goals = (response.data['data'] as List)
          .map((json) => GoalModel.fromJson(json))
          .toList();

      state = state.copyWith(completedGoals: goals);
    } catch (e) {
      print('Failed to load completed goals: $e');
    }
  }

  Future<void> _loadCompletedAssessments() async {
    try {
      final response = await _apiClient.get('/assessments', queryParameters: {
        'status': 'completed',
        'time_range': state.timeRange.name,
        'limit': 50,
      });

      final assessments = (response.data['data'] as List)
          .map((json) => AssessmentModel.fromJson(json))
          .toList();

      state = state.copyWith(completedAssessments: assessments);
    } catch (e) {
      print('Failed to load completed assessments: $e');
    }
  }

  Future<void> _loadTrends() async {
    try {
      final response = await _apiClient.get('/results/trends', queryParameters: {
        'time_range': state.timeRange.name,
      });

      final trends = ProgressTrends.fromJson(response.data['data']);
      state = state.copyWith(trends: trends);
    } catch (e) {
      print('Failed to load trends: $e');
    }
  }

  Future<void> _loadAnalytics() async {
    try {
      final response = await _apiClient.get('/results/analytics', queryParameters: {
        'time_range': state.timeRange.name,
      });

      final analytics = response.data['data'] as Map<String, dynamic>;
      state = state.copyWith(analytics: analytics);
    } catch (e) {
      print('Failed to load analytics: $e');
    }
  }

  Future<void> setTimeRange(ResultsTimeRange timeRange) async {
    if (state.timeRange == timeRange) return;

    state = state.copyWith(timeRange: timeRange);
    await loadResults();
  }

  Future<void> setCategory(ResultsCategory category) async {
    if (state.category == category) return;

    state = state.copyWith(category: category);
    await loadResults();
  }

  Future<ChartDataModel> getChartById(String chartId) async {
    try {
      final response = await _apiClient.get('/results/charts/$chartId');
      return ChartDataModel.fromJson(response.data['data']);
    } catch (e) {
      throw NetworkException('Failed to load chart: ${_getErrorMessage(e)}');
    }
  }

  Future<LineChartDataModel> getLineChartData(String chartId) async {
    try {
      final response = await _apiClient.get('/results/charts/$chartId/line-data');
      return LineChartDataModel.fromJson(response.data['data']);
    } catch (e) {
      throw NetworkException('Failed to load line chart data: ${_getErrorMessage(e)}');
    }
  }

  Future<BarChartDataModel> getBarChartData(String chartId) async {
    try {
      final response = await _apiClient.get('/results/charts/$chartId/bar-data');
      return BarChartDataModel.fromJson(response.data['data']);
    } catch (e) {
      throw NetworkException('Failed to load bar chart data: ${_getErrorMessage(e)}');
    }
  }

  Future<PieChartDataModel> getPieChartData(String chartId) async {
    try {
      final response = await _apiClient.get('/results/charts/$chartId/pie-data');
      return PieChartDataModel.fromJson(response.data['data']);
    } catch (e) {
      throw NetworkException('Failed to load pie chart data: ${_getErrorMessage(e)}');
    }
  }

  Future<RadarChartDataModel> getRadarChartData(String chartId) async {
    try {
      final response = await _apiClient.get('/results/charts/$chartId/radar-data');
      return RadarChartDataModel.fromJson(response.data['data']);
    } catch (e) {
      throw NetworkException('Failed to load radar chart data: ${_getErrorMessage(e)}');
    }
  }

  Future<Map<String, dynamic>> getDetailedAnalytics({
    required String metric,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'metric': metric,
        'time_range': state.timeRange.name,
      };

      if (startDate != null) {
        queryParameters['start_date'] = startDate.toIso8601String();
      }
      if (endDate != null) {
        queryParameters['end_date'] = endDate.toIso8601String();
      }

      final response = await _apiClient.get('/results/analytics/detailed',
          queryParameters: queryParameters);

      return response.data['data'] as Map<String, dynamic>;
    } catch (e) {
      throw NetworkException('Failed to load detailed analytics: ${_getErrorMessage(e)}');
    }
  }

  Future<String> exportResults({
    required ExportFormat format,
    List<String>? chartIds,
    bool includeRawData = false,
  }) async {
    state = state.copyWith(isExporting: true, exportError: null);

    try {
      final response = await _apiClient.post('/results/export', data: {
        'format': format.name,
        'time_range': state.timeRange.name,
        'category': state.category.name,
        'chart_ids': chartIds,
        'include_raw_data': includeRawData,
      });

      final exportUrl = response.data['data']['export_url'] as String;

      state = state.copyWith(isExporting: false);
      return exportUrl;
    } catch (e) {
      state = state.copyWith(
        isExporting: false,
        exportError: _getErrorMessage(e),
      );
      rethrow;
    }
  }

  Future<void> generateCustomChart({
    required String title,
    required ChartType type,
    required Map<String, dynamic> config,
  }) async {
    try {
      await _apiClient.post('/results/charts/custom', data: {
        'title': title,
        'type': type.name,
        'config': config,
        'time_range': state.timeRange.name,
      });

      // Refresh charts to include the new custom chart
      await _loadCharts();
    } catch (e) {
      throw BusinessLogicException('Failed to generate custom chart: ${_getErrorMessage(e)}');
    }
  }

  Future<void> shareResults(String chartId, List<String> shareWith) async {
    try {
      await _apiClient.post('/results/charts/$chartId/share', data: {
        'share_with': shareWith,
      });
    } catch (e) {
      throw PlatformException('Failed to share results: ${_getErrorMessage(e)}');
    }
  }

  Future<List<DataPoint>> getGoalProgressHistory(String goalId) async {
    try {
      final response = await _apiClient.get('/goals/$goalId/progress-history');
      return (response.data['data'] as List)
          .map((json) => DataPoint.fromJson(json))
          .toList();
    } catch (e) {
      throw NetworkException('Failed to load goal progress history: ${_getErrorMessage(e)}');
    }
  }

  Future<List<DataPoint>> getAssessmentScoreHistory() async {
    try {
      final response = await _apiClient.get('/assessments/score-history', queryParameters: {
        'time_range': state.timeRange.name,
      });
      return (response.data['data'] as List)
          .map((json) => DataPoint.fromJson(json))
          .toList();
    } catch (e) {
      throw NetworkException('Failed to load assessment score history: ${_getErrorMessage(e)}');
    }
  }

  Future<Map<String, List<DataPoint>>> getCategoryBreakdown() async {
    try {
      final response = await _apiClient.get('/results/category-breakdown', queryParameters: {
        'time_range': state.timeRange.name,
      });

      final data = response.data['data'] as Map<String, dynamic>;
      return data.map((key, value) => MapEntry(
        key,
        (value as List).map((json) => DataPoint.fromJson(json)).toList(),
      ));
    } catch (e) {
      throw NetworkException('Failed to load category breakdown: ${_getErrorMessage(e)}');
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearExportError() {
    state = state.copyWith(exportError: null);
  }

  Future<void> refreshResults() async {
    await loadResults();
  }

  String _getErrorMessage(dynamic error) {
    if (error is AppException) {
      return error.message;
    } else if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    } else {
      return error.toString();
    }
  }
}

// Enums
enum ResultsTimeRange {
  week,
  month,
  quarter,
  year,
  all,
}

enum ResultsCategory {
  all,
  goals,
  assessments,
  skills,
  activity,
}

enum TrendDirection {
  up,
  down,
  stable,
}

enum ExportFormat {
  pdf,
  excel,
  csv,
  json,
}

// Extensions
extension ResultsTimeRangeExtension on ResultsTimeRange {
  String get displayName {
    switch (this) {
      case ResultsTimeRange.week:
        return 'This Week';
      case ResultsTimeRange.month:
        return 'This Month';
      case ResultsTimeRange.quarter:
        return 'This Quarter';
      case ResultsTimeRange.year:
        return 'This Year';
      case ResultsTimeRange.all:
        return 'All Time';
    }
  }

  DateTime get startDate {
    final now = DateTime.now();
    switch (this) {
      case ResultsTimeRange.week:
        return now.subtract(Duration(days: now.weekday - 1));
      case ResultsTimeRange.month:
        return DateTime(now.year, now.month, 1);
      case ResultsTimeRange.quarter:
        final quarterStartMonth = ((now.month - 1) ~/ 3) * 3 + 1;
        return DateTime(now.year, quarterStartMonth, 1);
      case ResultsTimeRange.year:
        return DateTime(now.year, 1, 1);
      case ResultsTimeRange.all:
        return DateTime(2020, 1, 1); // Arbitrary start date
    }
  }
}

// Providers
final resultsControllerProvider = StateNotifierProvider<ResultsController, ResultsState>((ref) {
  final apiClient = ApiClient();
  return ResultsController(apiClient, ref);
});

// State providers
final resultsChartsProvider = Provider<List<ChartDataModel>>((ref) {
  return ref.watch(resultsControllerProvider).filteredCharts;
});

final resultsSummaryProvider = Provider<ResultsSummary?>((ref) {
  return ref.watch(resultsControllerProvider).summary;
});

final resultsTimeRangeProvider = Provider<ResultsTimeRange>((ref) {
  return ref.watch(resultsControllerProvider).timeRange;
});

final resultsCategoryProvider = Provider<ResultsCategory>((ref) {
  return ref.watch(resultsControllerProvider).category;
});

final isLoadingResultsProvider = Provider<bool>((ref) {
  return ref.watch(resultsControllerProvider).isLoading;
});

final resultsErrorProvider = Provider<String?>((ref) {
  return ref.watch(resultsControllerProvider).error;
});

// Chart type providers
final lineChartsProvider = Provider<List<ChartDataModel>>((ref) {
  return ref.watch(resultsControllerProvider).lineCharts;
});

final barChartsProvider = Provider<List<ChartDataModel>>((ref) {
  return ref.watch(resultsControllerProvider).barCharts;
});

final pieChartsProvider = Provider<List<ChartDataModel>>((ref) {
  return ref.watch(resultsControllerProvider).pieCharts;
});

final radarChartsProvider = Provider<List<ChartDataModel>>((ref) {
  return ref.watch(resultsControllerProvider).radarCharts;
});

// Trends provider
final progressTrendsProvider = Provider<ProgressTrends?>((ref) {
  return ref.watch(resultsControllerProvider).trends;
});

// Action providers
final refreshResultsProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    await ref.read(resultsControllerProvider.notifier).refreshResults();
  };
});

final exportResultsProvider = Provider<Future<String> Function(ExportFormat, List<String>?, bool)>((ref) {
  return (format, chartIds, includeRawData) async {
    return await ref.read(resultsControllerProvider.notifier).exportResults(
      format: format,
      chartIds: chartIds,
      includeRawData: includeRawData,
    );
  };
});

// UI state providers
final hasResultsDataProvider = Provider<bool>((ref) {
  return ref.watch(resultsControllerProvider).hasData;
});

final isResultsEmptyProvider = Provider<bool>((ref) {
  return ref.watch(resultsControllerProvider).isEmpty;
});

final completedGoalsProvider = Provider<List<GoalModel>>((ref) {
  return ref.watch(resultsControllerProvider).completedGoals;
});

final completedAssessmentsProvider = Provider<List<AssessmentModel>>((ref) {
  return ref.watch(resultsControllerProvider).completedAssessments;
});