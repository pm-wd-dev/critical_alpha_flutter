import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_model.freezed.dart';
part 'assessment_model.g.dart';

@freezed
class Assessment with _$Assessment {
  const factory Assessment({
    required String id,
    required String name,
    required DateTime createdAt,
    String? planId,
    Map<String, dynamic>? data,
  }) = _Assessment;

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
}

@freezed
class AssessmentLineGraphData with _$AssessmentLineGraphData {
  const factory AssessmentLineGraphData({
    required List<String> labels,
    required AssessmentDataset dataset,
    List<String>? legend,
  }) = _AssessmentLineGraphData;

  factory AssessmentLineGraphData.fromJson(Map<String, dynamic> json) =>
      _$AssessmentLineGraphDataFromJson(json);
}

@freezed
class AssessmentDataset with _$AssessmentDataset {
  const factory AssessmentDataset({
    required List<double> data,
    required String color,
  }) = _AssessmentDataset;

  const factory AssessmentDataset.multiple({
    required List<AssessmentDatasetItem> items,
  }) = _AssessmentDatasetMultiple;

  factory AssessmentDataset.fromJson(Map<String, dynamic> json) =>
      _$AssessmentDatasetFromJson(json);
}

@freezed
class AssessmentDatasetItem with _$AssessmentDatasetItem {
  const factory AssessmentDatasetItem({
    required List<double> data,
    required String color,
    String? label,
  }) = _AssessmentDatasetItem;

  factory AssessmentDatasetItem.fromJson(Map<String, dynamic> json) =>
      _$AssessmentDatasetItemFromJson(json);
}