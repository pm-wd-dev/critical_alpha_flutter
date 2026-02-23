import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PlanResultsChart extends StatelessWidget {
  final List<dynamic> assessments;

  const PlanResultsChart({
    super.key,
    this.assessments = const [],
  });

  @override
  Widget build(BuildContext context) {
    if (assessments.isEmpty) {
      return const Center(
        child: Text(
          'No Data Available For This User',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      );
    }

    // Prepare data for chart - parse assessment data properly
    final spots = <FlSpot>[];
    final labels = <String>[];

    for (int i = 0; i < assessments.length; i++) {
      final assessment = assessments[i];

      // Calculate the total score from all assessments in this entry
      double totalScore = 0.0;
      int categoryCount = 0;

      // Check if this is the new format with nested assessments array
      if (assessment['assessments'] != null && assessment['assessments'] is List) {
        final assessmentsList = assessment['assessments'] as List;
        for (var category in assessmentsList) {
          // Parse rating and total, handling both int and double
          final ratingValue = category['rating'];
          final totalValue = category['total'];

          final rating = ratingValue != null ?
            (ratingValue is int ? ratingValue.toDouble() : ratingValue as double) : 0.0;
          final total = totalValue != null ?
            (totalValue is int ? totalValue.toDouble() : totalValue as double) : 25.0;

          if (total > 0) {
            final categoryScore = (rating / total) * 100;
            totalScore += categoryScore;
            categoryCount++;
          }
        }
      }
      // Check for totalRating field (results screen format)
      else if (assessment['totalRating'] != null) {
        final totalRating = assessment['totalRating'];
        // totalRating is already a percentage score
        totalScore = totalRating != null ?
          (totalRating is int ? totalRating.toDouble() : totalRating as double) : 0.0;
        categoryCount = 1;
      }
      // Check for direct rating/total fields (fallback)
      else if (assessment['rating'] != null || assessment['total'] != null) {
        final ratingValue = assessment['rating'];
        final totalValue = assessment['total'];

        final rating = ratingValue != null ?
          (ratingValue is int ? ratingValue.toDouble() : ratingValue as double) : 0.0;
        final total = totalValue != null ?
          (totalValue is int ? totalValue.toDouble() : totalValue as double) : 125.0; // 5 categories * 25 each

        totalScore = total > 0 ? (rating / total) * 100 : 0.0;
        categoryCount = 1;
      }

      // Average score across all categories
      final averageScore = categoryCount > 0 ? totalScore / categoryCount : 0.0;

      // Always add the data point to show the trend
      spots.add(FlSpot(spots.length.toDouble(), averageScore));
      labels.add('A${i + 1}');
    }

    // If no valid data points found, create default point
    if (spots.isEmpty) {
      // If we have assessments but couldn't parse scores, use default point
      if (assessments.isNotEmpty) {
        spots.add(const FlSpot(0, 50)); // Default middle value
        labels.add('A1');
      } else {
        return const Center(
          child: Text(
            'No assessment data available',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        );
      }
    }

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 20,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < labels.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}%',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        minX: 0,
        maxX: spots.length > 1 ? (spots.length - 1).toDouble() : 1,
        minY: 0,
        maxY: 100,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: spots.length > 2,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0147D9),
                Color(0xFF4A90E2),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: const Color(0xFF0147D9),
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF0147D9).withValues(alpha: 0.3),
                  const Color(0xFF4A90E2).withValues(alpha: 0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}