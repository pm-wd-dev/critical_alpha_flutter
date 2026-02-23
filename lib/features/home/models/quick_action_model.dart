import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_action_model.freezed.dart';
part 'quick_action_model.g.dart';

@freezed
class QuickActionModel with _$QuickActionModel {
  const factory QuickActionModel({
    required String id,
    required String title,
    required String description,
    required String icon,
    required String route,
    required QuickActionType type,
    Map<String, dynamic>? metadata,
    String? apiEndpoint,
  }) = _QuickActionModel;

  factory QuickActionModel.fromJson(Map<String, dynamic> json) =>
      _$QuickActionModelFromJson(json);
}

enum QuickActionType {
  navigation,
  action,
  api,
}

@freezed
class InsightModel with _$InsightModel {
  const factory InsightModel({
    required String id,
    required String title,
    required String description,
    required String type,
    String? actionRoute,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) = _InsightModel;

  factory InsightModel.fromJson(Map<String, dynamic> json) =>
      _$InsightModelFromJson(json);
}

@freezed
class WeeklyProgressData with _$WeeklyProgressData {
  const factory WeeklyProgressData({
    @Default([]) List<DayData> days,
    @Default(0.0) double totalProgress,
    @Default(0.0) double averageDaily,
    @Default(0.0) double weeklyGoal,
  }) = _WeeklyProgressData;

  factory WeeklyProgressData.fromJson(Map<String, dynamic> json) =>
      _$WeeklyProgressDataFromJson(json);

  const WeeklyProgressData._();

  double get weeklyGoalPercentage => weeklyGoal > 0 ? (totalProgress / weeklyGoal).clamp(0.0, 1.0) : 0.0;
}

@freezed
class DayData with _$DayData {
  const factory DayData({
    required DateTime date,
    @Default(0.0) double progress,
    @Default(0) int activitiesCompleted,
  }) = _DayData;

  factory DayData.fromJson(Map<String, dynamic> json) =>
      _$DayDataFromJson(json);

  const DayData._();

  String get dayName => ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][date.weekday - 1];
}