import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../models/plan_model.dart';

part 'plans_controller.freezed.dart';

@freezed
class PlansState with _$PlansState {
  const factory PlansState({
    @Default(false) bool isLoading,
    @Default([]) List<PlanModel> plans,
    @Default(null) String? error,
    @Default(false) bool isDeleting,
    @Default(false) bool isCreating,
  }) = _PlansState;
}

class PlansController extends StateNotifier<PlansState> {
  final Ref _ref;
  final ApiClient _apiClient = ApiClient();

  PlansController(this._ref) : super(const PlansState()) {
    loadPlans();
  }

  Future<void> loadPlans() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _apiClient.get('/user/plans');

      print('📱 Plans API Response: ${response.data}');

      List<PlanModel> plansList = [];

      if (response.data is Map && response.data['data'] != null) {
        final data = response.data['data'];
        if (data is List) {
          plansList = data.map((json) => PlanModel.fromJson(json)).toList();
        }
      } else if (response.data is List) {
        plansList = response.data.map((json) => PlanModel.fromJson(json)).toList();
      }

      state = state.copyWith(
        isLoading: false,
        plans: plansList,
      );
    } catch (e) {
      print('❌ Error loading plans: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> createPlan(CreatePlanRequest request) async {
    state = state.copyWith(isCreating: true, error: null);

    try {
      // Create payload without type field as per React Native implementation
      final data = {
        'title': request.title,
        'discription': request.description, // Note: API has typo
        'contingency': request.contingency,
      };

      final response = await _apiClient.post(
        '/user/plans/create',
        data: data,
      );

      print('✅ Plan created: ${response.data}');

      // Reload plans to get the updated list
      await loadPlans();

      state = state.copyWith(isCreating: false);
    } catch (e) {
      print('❌ Error creating plan: $e');
      state = state.copyWith(
        isCreating: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> updatePlan(UpdatePlanRequest request) async {
    try {
      // Create payload as per React Native implementation
      final data = {
        'plan_id': request.id,
        'title': request.title,
        'discription': request.description, // Note: API has typo
        'contingency': request.contingency,
        if (request.improve != null) 'improve': request.improve,
      };

      await _apiClient.post(
        '/user/plans/update',
        data: data,
      );

      // Reload plans to get the updated list
      await loadPlans();
    } catch (e) {
      print('❌ Error updating plan: $e');
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> deletePlan(String planId) async {
    print('🗑️ Attempting to delete plan with ID: $planId');

    try {
      // Use correct payload structure matching React Native
      final payload = {'plan_id': planId};
      print('📤 Delete payload: $payload');

      final response = await _apiClient.delete(
        '/user/plans/delete',
        data: payload,
      );

      print('✅ Delete response: ${response.data}');

      // Remove the plan from the list
      state = state.copyWith(
        plans: state.plans.where((p) => p.id != planId).toList(),
      );

      print('✅ Plan deleted successfully from local state');
    } catch (e) {
      print('❌ Error deleting plan: $e');
      print('❌ Error type: ${e.runtimeType}');
      if (e is DioException) {
        print('❌ DioError response: ${e.response?.data}');
        print('❌ DioError status code: ${e.response?.statusCode}');
      }
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> deleteAllPlans() async {
    state = state.copyWith(isDeleting: true, error: null);

    try {
      await _apiClient.delete('/user/plans/delete-all');

      state = state.copyWith(
        isDeleting: false,
        plans: [],
      );
    } catch (e) {
      print('❌ Error deleting all plans: $e');
      state = state.copyWith(
        isDeleting: false,
        error: e.toString(),
      );
    }
  }

  Future<void> updatePlanStatus(String planId, bool isComplete) async {
    try {
      // Use correct payload structure as per React Native
      final data = {
        'plan_id': planId,  // Changed from 'id' to 'plan_id'
        'status': isComplete ? 'true' : 'false',
      };

      await _apiClient.post(
        '/user/plans/change-status',
        data: data,
      );

      // Update the plan in the list
      state = state.copyWith(
        plans: state.plans.map((p) {
          if (p.id == planId) {
            return p.copyWith(status: isComplete ? 'true' : 'false');
          }
          return p;
        }).toList(),
      );
    } catch (e) {
      print('❌ Error updating plan status: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void refreshPlans() {
    loadPlans();
  }
}

final plansControllerProvider = StateNotifierProvider<PlansController, PlansState>((ref) {
  return PlansController(ref);
});