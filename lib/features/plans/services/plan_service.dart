import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../models/plan_model.dart';

class PlanService {
  final ApiClient _apiClient = ApiClient();

  Future<PlanModel?> getPlanById(String planId) async {
    try {
      // First try to get all plans and find the specific one
      final response = await _apiClient.get('/user/plans');
      final data = response?.data;
      if (data != null && data['data'] != null) {
        final plans = data['data'] as List;
        final plan = plans.firstWhere(
          (p) => p['_id'] == planId,
          orElse: () => null,
        );
        if (plan != null) {
          return PlanModel.fromJson(plan);
        }
      }
      return null;
    } catch (e) {
      print('Error getting plan: $e');
      return null;
    }
  }

  Future<List<dynamic>> getUserAssessments(String planId) async {
    try {
      final response = await _apiClient.get(
        '/user/assessment/v2/user_assessments?plan_id=$planId',
      );
      final data = response?.data;
      if (data != null && data['data'] != null) {
        return data['data'] as List<dynamic>;
      }
      return [];
    } catch (e) {
      print('Error getting assessments: $e');
      return [];
    }
  }

  Future<bool> updatePlan({
    required String planId,
    required String title,
    required String description,
    required String contingency,
    required String improve,
  }) async {
    try {
      final data = {
        'plan_id': planId,
        'title': title,
        'discription': description, // Note: API uses 'discription' spelling
        'contingency': contingency,
        'improve': improve,
      };

      final response = await _apiClient.put('/user/plans/update', data: data);
      final responseData = response?.data;
      return response?.statusCode == 200 || (responseData != null && responseData['status'] == 200);
    } catch (e) {
      print('Error updating plan: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> getAssessmentQuestions() async {
    try {
      final response = await _apiClient.get('/user/assessment/v2/request_assessment');
      return response?.data as Map<String, dynamic>?;
    } catch (e) {
      print('Error getting assessment questions: $e');
      return null;
    }
  }

  Future<bool> submitAssessment({
    required String planId,
    required List<Map<String, dynamic>> assessments,
  }) async {
    try {
      final data = {
        'plan_id': planId,
        'assessments': assessments,
      };

      final response = await _apiClient.post(
        '/user/assessment/add_assessment',
        data: data,
      );
      final responseData = response?.data;
      return responseData != null && responseData['success'] == true;
    } catch (e) {
      print('Error submitting assessment: $e');
      return false;
    }
  }
}