import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.freezed.dart';
part 'plan_model.g.dart';

@freezed
class PlanModel with _$PlanModel {
  const factory PlanModel({
    @JsonKey(name: '_id') required String id,
    required String title,
    @JsonKey(name: 'discription') String? description, // Note: API has typo
    String? contingency,
    String? improve,
    @Default('false') String status,
    String? type,
    DateTime? reminderDate,
    DateTime? deadline,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);
}

@freezed
class CreatePlanRequest with _$CreatePlanRequest {
  const factory CreatePlanRequest({
    required String title,
    @JsonKey(name: 'discription') required String description,
    required String contingency,
    // type field removed as it's not used in the API
  }) = _CreatePlanRequest;

  factory CreatePlanRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePlanRequestFromJson(json);
}

@freezed
class UpdatePlanRequest with _$UpdatePlanRequest {
  const factory UpdatePlanRequest({
    required String id,
    required String title,
    @JsonKey(name: 'discription') required String description,
    required String contingency,
    String? improve,
    String? type,
    String? status,
  }) = _UpdatePlanRequest;

  factory UpdatePlanRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlanRequestFromJson(json);
}