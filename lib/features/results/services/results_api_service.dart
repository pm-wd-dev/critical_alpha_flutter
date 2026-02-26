import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../models/assessment_model.dart';

class ResultsApiService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Assessment>> getUserAssessments(String? planId) async {
    try {
      // Don't pass plan_id in query params to get all assessments
      // We'll filter locally if needed
      final response = await _apiClient.get(
        ApiEndpoints.assessments,
        queryParameters: null, // Always fetch all assessments
      );

      final data = response.data;
      if (data['data'] != null && data['data'] is List) {
        final assessmentsList = data['data'] as List;

        // Filter only assessments that belong to the requested planId if specified
        final filteredList = planId != null
            ? assessmentsList.where((item) => item['plan_id'] == planId).toList()
            : assessmentsList;

        // For naming, use the full list index when showing all assessments
        return filteredList
            .map((item) {
              // Find the index in the full list for consistent naming
              final indexInFullList = assessmentsList.indexOf(item);
              return Assessment(
                id: item['_id'] ?? '',
                name: 'Assessment ${indexInFullList + 1}',
                createdAt: item['createdAt'] != null
                    ? DateTime.parse(item['createdAt'])
                    : DateTime.now(),
                planId: item['plan_id'],
                data: item,
              );
            })
            .toList();
      }
      return [];
    } catch (e) {
      // Error fetching assessments: $e
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