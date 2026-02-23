import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fl_chart/fl_chart.dart';

part 'chart_data_model.freezed.dart';
part 'chart_data_model.g.dart';

@freezed
class ChartDataModel with _$ChartDataModel {
  const factory ChartDataModel({
    required String id,
    required String title,
    required ChartType type,
    required List<DataPoint> dataPoints,
    ChartMetadata? metadata,
    ChartStyle? style,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ChartDataModel;

  factory ChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChartDataModelFromJson(json);

  const ChartDataModel._();

  /// Get data points sorted by date
  List<DataPoint> get sortedDataPoints {
    final points = List<DataPoint>.from(dataPoints);
    points.sort((a, b) => a.date.compareTo(b.date));
    return points;
  }

  /// Get the latest data point
  DataPoint? get latestDataPoint {
    if (dataPoints.isEmpty) return null;
    return dataPoints.reduce((a, b) => a.date.isAfter(b.date) ? a : b);
  }

  /// Get the earliest data point
  DataPoint? get earliestDataPoint {
    if (dataPoints.isEmpty) return null;
    return dataPoints.reduce((a, b) => a.date.isBefore(b.date) ? a : b);
  }

  /// Get maximum value in the dataset
  double get maxValue {
    if (dataPoints.isEmpty) return 0.0;
    return dataPoints.map((p) => p.value).reduce((a, b) => a > b ? a : b);
  }

  /// Get minimum value in the dataset
  double get minValue {
    if (dataPoints.isEmpty) return 0.0;
    return dataPoints.map((p) => p.value).reduce((a, b) => a < b ? a : b);
  }

  /// Get average value
  double get averageValue {
    if (dataPoints.isEmpty) return 0.0;
    final sum = dataPoints.fold(0.0, (sum, point) => sum + point.value);
    return sum / dataPoints.length;
  }

  /// Get data range
  double get valueRange => maxValue - minValue;

  /// Get data points for a specific time period
  List<DataPoint> getDataPointsForPeriod(DateTime start, DateTime end) {
    return dataPoints.where((point) =>
        point.date.isAfter(start.subtract(const Duration(days: 1))) &&
        point.date.isBefore(end.add(const Duration(days: 1)))).toList();
  }

  /// Get data points for the last N days
  List<DataPoint> getLastNDaysData(int days) {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    return getDataPointsForPeriod(startDate, endDate);
  }

  /// Get trend direction (1 for up, -1 for down, 0 for stable)
  int get trendDirection {
    if (dataPoints.length < 2) return 0;
    final sorted = sortedDataPoints;
    final recent = sorted.last.value;
    final previous = sorted[sorted.length - 2].value;

    if (recent > previous) return 1;
    if (recent < previous) return -1;
    return 0;
  }

  /// Get growth rate percentage
  double get growthRate {
    if (dataPoints.length < 2) return 0.0;
    final sorted = sortedDataPoints;
    final recent = sorted.last.value;
    final previous = sorted.first.value;

    if (previous == 0) return 0.0;
    return ((recent - previous) / previous) * 100;
  }

  /// Convert to FlSpot list for FL Chart
  List<FlSpot> toFlSpots() {
    return dataPoints.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value);
    }).toList();
  }

  /// Convert to BarChartGroupData for FL Chart
  List<BarChartGroupData> toBarChartGroups() {
    return dataPoints.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value.value,
            color: entry.value.color,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }

  /// Convert to PieChartSectionData for FL Chart
  List<PieChartSectionData> toPieChartSections() {
    final total = dataPoints.fold(0.0, (sum, point) => sum + point.value);

    return dataPoints.asMap().entries.map((entry) {
      final percentage = total > 0 ? (entry.value.value / total) * 100 : 0.0;
      return PieChartSectionData(
        value: entry.value.value,
        title: '${percentage.toStringAsFixed(1)}%',
        color: entry.value.color,
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      );
    }).toList();
  }

  /// Group data points by time period
  Map<String, List<DataPoint>> groupByPeriod(TimePeriod period) {
    final Map<String, List<DataPoint>> grouped = {};

    for (final point in dataPoints) {
      String key;
      switch (period) {
        case TimePeriod.day:
          key = '${point.date.year}-${point.date.month.toString().padLeft(2, '0')}-${point.date.day.toString().padLeft(2, '0')}';
          break;
        case TimePeriod.week:
          final weekStart = point.date.subtract(Duration(days: point.date.weekday - 1));
          key = '${weekStart.year}-W${((weekStart.difference(DateTime(weekStart.year, 1, 1)).inDays) / 7).ceil()}';
          break;
        case TimePeriod.month:
          key = '${point.date.year}-${point.date.month.toString().padLeft(2, '0')}';
          break;
        case TimePeriod.year:
          key = point.date.year.toString();
          break;
      }

      (grouped[key] ??= <DataPoint>[]).add(point);
    }

    return grouped;
  }
}

@freezed
class DataPoint with _$DataPoint {
  const factory DataPoint({
    required DateTime date,
    required double value,
    String? label,
    String? category,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
    Map<String, dynamic>? metadata,
  }) = _DataPoint;

  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);

  const DataPoint._();

  /// Formatted value string
  String get formattedValue => value.toStringAsFixed(2);

  /// Date formatted as string
  String get formattedDate => '${date.day}/${date.month}/${date.year}';

  /// Short date format
  String get shortDate => '${date.day}/${date.month}';

  /// Time format
  String get timeFormat => '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';

  /// Full datetime format
  String get fullDateTime => '$formattedDate $timeFormat';
}

@freezed
class ChartMetadata with _$ChartMetadata {
  const factory ChartMetadata({
    String? xAxisLabel,
    String? yAxisLabel,
    String? description,
    String? dataSource,
    String? unit,
    @JsonKey(name: 'show_legend') @Default(true) bool showLegend,
    @JsonKey(name: 'show_grid') @Default(true) bool showGrid,
    @JsonKey(name: 'show_values') @Default(false) bool showValues,
    @JsonKey(name: 'animate') @Default(true) bool animate,
    double? minY,
    double? maxY,
    Map<String, dynamic>? customProperties,
  }) = _ChartMetadata;

  factory ChartMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChartMetadataFromJson(json);
}

@freezed
class ChartStyle with _$ChartStyle {
  const factory ChartStyle({
    @JsonKey(includeFromJson: false, includeToJson: false) Color? primaryColor,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? secondaryColor,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? backgroundColor,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? gridColor,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? textColor,
    @Default(2.0) double strokeWidth,
    @Default(12.0) double fontSize,
    String? fontFamily,
    @JsonKey(name: 'border_radius') @Default(8.0) double borderRadius,
    @Default(16.0) double padding,
    Map<String, dynamic>? customStyles,
  }) = _ChartStyle;

  factory ChartStyle.fromJson(Map<String, dynamic> json) =>
      _$ChartStyleFromJson(json);
}

@freezed
class LineChartDataModel with _$LineChartDataModel {
  const factory LineChartDataModel({
    required String id,
    required String title,
    required List<LineSeriesData> series,
    ChartMetadata? metadata,
    ChartStyle? style,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _LineChartDataModel;

  factory LineChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$LineChartDataModelFromJson(json);

  const LineChartDataModel._();

  /// Get all data points from all series
  List<DataPoint> get allDataPoints {
    return series.expand((s) => s.dataPoints).toList();
  }

  /// Get maximum value across all series
  double get maxValue {
    final allPoints = allDataPoints;
    if (allPoints.isEmpty) return 0.0;
    return allPoints.map((p) => p.value).reduce((a, b) => a > b ? a : b);
  }

  /// Get minimum value across all series
  double get minValue {
    final allPoints = allDataPoints;
    if (allPoints.isEmpty) return 0.0;
    return allPoints.map((p) => p.value).reduce((a, b) => a < b ? a : b);
  }

  /// Convert to LineChartData for FL Chart
  LineChartData toLineChartData() {
    return LineChartData(
      lineBarsData: series.map((s) => s.toLineChartBarData()).toList(),
      minY: metadata?.minY ?? minValue,
      maxY: metadata?.maxY ?? maxValue,
      backgroundColor: style?.backgroundColor,
      gridData: FlGridData(show: metadata?.showGrid ?? true),
      borderData: FlBorderData(show: true),
    );
  }
}

@freezed
class LineSeriesData with _$LineSeriesData {
  const factory LineSeriesData({
    required String name,
    required List<DataPoint> dataPoints,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
    @Default(2.0) double strokeWidth,
    @Default(true) bool showDots,
    @Default(true) bool isCurved,
  }) = _LineSeriesData;

  factory LineSeriesData.fromJson(Map<String, dynamic> json) =>
      _$LineSeriesDataFromJson(json);

  const LineSeriesData._();

  /// Convert to LineChartBarData for FL Chart
  LineChartBarData toLineChartBarData() {
    return LineChartBarData(
      spots: dataPoints.asMap().entries.map((entry) {
        return FlSpot(entry.key.toDouble(), entry.value.value);
      }).toList(),
      color: color,
      barWidth: strokeWidth,
      dotData: FlDotData(show: showDots),
      isCurved: isCurved,
    );
  }
}

@freezed
class BarChartDataModel with _$BarChartDataModel {
  const factory BarChartDataModel({
    required String id,
    required String title,
    required List<BarSeriesData> series,
    ChartMetadata? metadata,
    ChartStyle? style,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _BarChartDataModel;

  factory BarChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$BarChartDataModelFromJson(json);

  const BarChartDataModel._();

  /// Convert to BarChartData for FL Chart
  BarChartData toBarChartData() {
    final groups = <BarChartGroupData>[];

    for (int i = 0; i < (series.isEmpty ? 0 : series.first.dataPoints.length); i++) {
      final rods = <BarChartRodData>[];

      for (int j = 0; j < series.length; j++) {
        if (i < series[j].dataPoints.length) {
          rods.add(BarChartRodData(
            toY: series[j].dataPoints[i].value,
            color: series[j].color,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ));
        }
      }

      groups.add(BarChartGroupData(x: i, barRods: rods));
    }

    return BarChartData(barGroups: groups);
  }
}

@freezed
class BarSeriesData with _$BarSeriesData {
  const factory BarSeriesData({
    required String name,
    required List<DataPoint> dataPoints,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
  }) = _BarSeriesData;

  factory BarSeriesData.fromJson(Map<String, dynamic> json) =>
      _$BarSeriesDataFromJson(json);
}

@freezed
class PieChartDataModel with _$PieChartDataModel {
  const factory PieChartDataModel({
    required String id,
    required String title,
    required List<PieSliceData> slices,
    ChartMetadata? metadata,
    ChartStyle? style,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _PieChartDataModel;

  factory PieChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$PieChartDataModelFromJson(json);

  const PieChartDataModel._();

  /// Total value of all slices
  double get totalValue => slices.fold(0.0, (sum, slice) => sum + slice.value);

  /// Convert to PieChartData for FL Chart
  PieChartData toPieChartData() {
    return PieChartData(
      sections: slices.map((slice) {
        final percentage = totalValue > 0 ? (slice.value / totalValue) * 100 : 0.0;
        return PieChartSectionData(
          value: slice.value,
          title: '${percentage.toStringAsFixed(1)}%',
          color: slice.color,
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        );
      }).toList(),
    );
  }
}

@freezed
class PieSliceData with _$PieSliceData {
  const factory PieSliceData({
    required String label,
    required double value,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
    String? description,
  }) = _PieSliceData;

  factory PieSliceData.fromJson(Map<String, dynamic> json) =>
      _$PieSliceDataFromJson(json);

  const PieSliceData._();

  /// Percentage of total (requires total value from parent)
  double getPercentage(double total) => total > 0 ? (value / total) * 100 : 0.0;
}

@freezed
class RadarChartDataModel with _$RadarChartDataModel {
  const factory RadarChartDataModel({
    required String id,
    required String title,
    required List<String> categories,
    required List<RadarSeriesData> series,
    ChartMetadata? metadata,
    ChartStyle? style,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _RadarChartDataModel;

  factory RadarChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$RadarChartDataModelFromJson(json);

  const RadarChartDataModel._();

  /// Maximum value across all series
  double get maxValue {
    final allValues = series.expand((s) => s.values).toList();
    if (allValues.isEmpty) return 0.0;
    return allValues.reduce((a, b) => a > b ? a : b);
  }
}

@freezed
class RadarSeriesData with _$RadarSeriesData {
  const factory RadarSeriesData({
    required String name,
    required List<double> values,
    @JsonKey(includeFromJson: false, includeToJson: false) Color? color,
    @Default(2.0) double strokeWidth,
    @Default(0.3) double fillOpacity,
  }) = _RadarSeriesData;

  factory RadarSeriesData.fromJson(Map<String, dynamic> json) =>
      _$RadarSeriesDataFromJson(json);
}

// Enums
enum ChartType {
  @JsonValue('line')
  line,
  @JsonValue('bar')
  bar,
  @JsonValue('pie')
  pie,
  @JsonValue('radar')
  radar,
  @JsonValue('area')
  area,
  @JsonValue('scatter')
  scatter,
}

enum TimePeriod {
  day,
  week,
  month,
  year,
}

// Extensions
extension ChartDataListExtensions on List<ChartDataModel> {
  /// Group charts by type
  Map<ChartType, List<ChartDataModel>> get byType {
    final map = <ChartType, List<ChartDataModel>>{};
    for (final chart in this) {
      (map[chart.type] ??= <ChartDataModel>[]).add(chart);
    }
    return map;
  }

  /// Get charts updated in the last N days
  List<ChartDataModel> getRecentlyUpdated(int days) {
    final cutoff = DateTime.now().subtract(Duration(days: days));
    return where((chart) => chart.updatedAt.isAfter(cutoff)).toList();
  }
}

extension DataPointListExtensions on List<DataPoint> {
  /// Group by date (day level)
  Map<DateTime, List<DataPoint>> get byDate {
    final map = <DateTime, List<DataPoint>>{};
    for (final point in this) {
      final dateKey = DateTime(point.date.year, point.date.month, point.date.day);
      (map[dateKey] ??= <DataPoint>[]).add(point);
    }
    return map;
  }

  /// Get points within a date range
  List<DataPoint> getInRange(DateTime start, DateTime end) {
    return where((point) =>
        point.date.isAfter(start.subtract(const Duration(days: 1))) &&
        point.date.isBefore(end.add(const Duration(days: 1)))).toList();
  }

  /// Get moving average with specified window size
  List<DataPoint> getMovingAverage(int windowSize) {
    if (length < windowSize) return [];

    final result = <DataPoint>[];
    for (int i = windowSize - 1; i < length; i++) {
      final window = sublist(i - windowSize + 1, i + 1);
      final average = window.fold(0.0, (sum, point) => sum + point.value) / windowSize;
      result.add(DataPoint(
        date: this[i].date,
        value: average,
        label: 'MA($windowSize)',
      ));
    }
    return result;
  }
}