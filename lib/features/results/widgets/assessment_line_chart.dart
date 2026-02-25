import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class AssessmentLineChart extends StatelessWidget {
  final Map<String, dynamic> chartData;
  final String type;
  final String? selectedAssessmentName;

  const AssessmentLineChart({
    super.key,
    required this.chartData,
    required this.type,
    this.selectedAssessmentName,
  });

  @override
  Widget build(BuildContext context) {
    final labels = List<String>.from(chartData['labels'] ?? []);
    final isMultiple = type == 'all';

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isMultiple && chartData['legend'] != null) ...[
            _buildLegend(),
            const SizedBox(height: 20),
          ],
          SizedBox(
            height: 250,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.blueGrey,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final label = labels.isNotEmpty && spot.x.toInt() < labels.length
                            ? labels[spot.x.toInt()]
                            : '';
                        return LineTooltipItem(
                          '$label\nScore: ${spot.y.toStringAsFixed(1)}',
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey[300]!,
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey[300]!,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= labels.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            labels[index],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                              fontSize: 9,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                minX: 0,
                maxX: labels.length.toDouble() - 1,
                minY: 0,
                maxY: 5,
                lineBarsData: _getLineBarsData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    final legend = List<String>.from(chartData['legend'] ?? []);
    final datasets = chartData['dataset'] as List? ?? [];

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: legend.asMap().entries.map((entry) {
        final index = entry.key;
        final label = entry.value;
        String color = '#0000FF';

        if (index < datasets.length && datasets[index]['color'] != null) {
          color = datasets[index]['color'];
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: _hexToColor(color),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }

  List<LineChartBarData> _getLineBarsData() {
    if (type == 'single') {
      final dataset = chartData['dataset'];
      final data = dataset != null && dataset['data'] != null
          ? List<double>.from((dataset['data'] as List).map((e) => e.toDouble()))
          : <double>[];

      // 7.9a: Use app theme blue as fallback colour
      final color = dataset?['color'] ?? '#0147D9';

      return [
        LineChartBarData(
          spots: data.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value);
          }).toList(),
          isCurved: false,
          color: _hexToColor(color),
          barWidth: 3,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 5,
                color: _hexToColor(color),
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
        ),
      ];
    } else {
      final datasets = chartData['dataset'] as List? ?? [];
      return datasets.map((dataset) {
        final data = List<double>.from(
            (dataset['data'] as List).map((e) => e.toDouble()));
        final color = dataset['color'] ?? '0147D9';

        return LineChartBarData(
          spots: data.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value);
          }).toList(),
          isCurved: false,
          color: _hexToColor(color),
          barWidth: 3,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 5,
                color: _hexToColor(color),
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
        );
      }).toList();
    }
  }

  Color _hexToColor(String colorString) {
    // Handle rgba format: rgba(r, g, b, a)
    if (colorString.startsWith('rgba')) {
      final values = colorString
          .replaceAll('rgba(', '')
          .replaceAll(')', '')
          .split(',')
          .map((v) => v.trim())
          .toList();

      if (values.length >= 3) {
        final r = int.tryParse(values[0]) ?? 0;
        final g = int.tryParse(values[1]) ?? 0;
        final b = int.tryParse(values[2]) ?? 0;
        final a = values.length > 3 ? double.tryParse(values[3]) ?? 1.0 : 1.0;
        return Color.fromRGBO(r, g, b, a);
      }
    }

    // Handle hex format
    String hexColor = colorString.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    try {
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      // 7.9a: Fallback to app theme blue
      return const Color(0xFF0147D9);
    }
  }
}