import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../models/assessment_model.dart';

class ResultsApiService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Assessment>> getUserAssessments(String? planId) async {
    try {
      final queryParams = planId != null ? {'plan_id': planId} : null;

      final response = await _apiClient.get(
        ApiEndpoints.assessments,
        queryParameters: queryParams,
      );

      final data = response.data;
      if (data['data'] != null && data['data'] is List) {
        return (data['data'] as List)
            .map((item) => Assessment(
                  id: item['_id'] ?? '',
                  name: 'Assessment ${(data['data'] as List).indexOf(item) + 1}',
                  createdAt: item['createdAt'] != null
                      ? DateTime.parse(item['createdAt'])
                      : DateTime.now(),
                  planId: item['plan_id'],
                  data: item,
                ))
            .toList();
      }
      return [];
    } catch (e) {
      // Error: $e
      return [];
    }
  }

  Future<Map<String, dynamic>?> getLineChartData({
    required String assessmentId,
    required String type,
    String? planId,
  }) async {
    try {
      final data = {
        'assessmentId': assessmentId,
        'type': type,
      };

      if (planId != null) {
        data['plan_id'] = planId;
      }

      final response = await _apiClient.post(
        '/user/assessment/v2/line_graph',
        data: data,
      );

      if (response.data != null && response.data['data'] != null) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      // Error: $e
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAllAssessmentsLineChart() async {
    try {
      final response = await _apiClient.post(
        '/user/assessment/v2/line_graph',
        data: {
          'type': 'all',
          'assessmentId': '12122122', // This ID is from React Native code
        },
      );

      if (response.data != null && response.data['data'] != null) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      // Error: $e
      return null;
    }
  }
}