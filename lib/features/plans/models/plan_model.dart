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