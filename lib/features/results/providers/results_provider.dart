import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/assessment_model.dart';
import '../services/results_api_service.dart';

final resultsApiServiceProvider = Provider((ref) => ResultsApiService());

final currentPlanIdProvider = StateProvider<String?>((ref) => null);

final assessmentsProvider = FutureProvider.family<List<Assessment>, String?>((ref, planId) async {
  final apiService = ref.read(resultsApiServiceProvider);
  return await apiService.getUserAssessments(planId);
});

// Provider to fetch ALL assessments regardless of plan
final allAssessmentsProvider = FutureProvider<List<Assessment>>((ref) async {
  final apiService = ref.read(resultsApiServiceProvider);
  // Pass null to get all assessments without filtering by plan
  return await apiService.getUserAssessments(null);
});

final selectedAssessmentProvider = StateProvider<Assessment?>((ref) => null);

final chartDataProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final selectedAssessment = ref.watch(selectedAssessmentProvider);
  final apiService = ref.read(resultsApiServiceProvider);

  if (selectedAssessment == null) return null;

  return await apiService.getLineChartData(
    assessmentId: selectedAssessment.id,
    type: 'single',
    planId: selectedAssessment.planId,
  );
});

final showAllChartsProvider = StateProvider<bool>((ref) => false);

final allChartsDataProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final showAll = ref.watch(showAllChartsProvider);
  if (!showAll) return null;

  final apiService = ref.read(resultsApiServiceProvider);
  return await apiService.getAllAssessmentsLineChart();
});