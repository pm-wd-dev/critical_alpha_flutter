import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_fonts.dart';
import '../../../core/widgets/speedometer_gauge.dart';
import '../controllers/dashboard_controller.dart';

class AlphaPerformanceCard extends ConsumerWidget {
  const AlphaPerformanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);

    // Extract meter data from dashboard
    final meterData = dashboardState.meterAssessmentData;
    double mostRecentRating = 0.0;
    double mostRecentTotal = 80.0;
    double overallRating = 0.0;
    double overallTotal = 80.0;

    // Parse meter data
    for (var item in meterData) {
      if (item is Map) {
        if (item['type'] == 'mostRecent') {
          mostRecentRating = (item['rating'] ?? item['score'] ?? 0).toDouble();
          mostRecentTotal = (item['total'] ?? 80).toDouble();
        } else if (item['type'] == 'average') {
          overallRating = (item['rating'] ?? item['score'] ?? 0).toDouble();
          overallTotal = (item['total'] ?? 80).toDouble();
        }
      }
    }

    // Extract progress data from assessment
    final assessment = dashboardState.assessment;
    List<Map<String, dynamic>> progressData = [];

    if (assessment != null && assessment['data'] is List) {
      for (var item in assessment['data']) {
        if (item is Map) {
          progressData.add({
            'label': item['small_text'] ?? '',
            'value': (item['rate'] ?? 0).toDouble(),
            'total': 5.0,
          });
        }
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Center(
            child: Text(
              'ALPHA PERFORMANCE',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.poppins,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Speedometers Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SpeedometerGauge(
                  value: mostRecentRating,
                  maxValue: mostRecentTotal,
                  label: 'Most Recent',
                  size: MediaQuery.of(context).size.width * 0.35,
                  gaugeColor: const Color(0xFF0147D9), // Blue color like React Native
                ),
              ),
              Expanded(
                child: SpeedometerGauge(
                  value: overallRating,
                  maxValue: overallTotal,
                  label: 'Overall',
                  size: MediaQuery.of(context).size.width * 0.35,
                  gaugeColor: const Color(0xFF0147D9), // Blue color like React Native
                ),
              ),
            ],
          ),

          // Only show progress bars if data is available and speedometers have values
          if ((mostRecentRating > 0 || overallRating > 0) && progressData.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Category Progress Bars
            ...progressData.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CategoryProgressBar(
                  category: item['label'] ?? '',
                  value: (item['value'] ?? 0).toDouble(),
                  maxValue: (item['total'] ?? 5).toDouble(),
                  icon: _getIconForCategory(item['label'] ?? ''),
                ),
              );
            }).toList(),
          ],
        ],
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'awareness':
        return Icons.visibility;
      case 'learning':
        return Icons.school;
      case 'performance':
        return Icons.trending_up;
      case 'harnessing':
        return Icons.psychology;
      case 'adaptability':
        return Icons.change_circle;
      default:
        return Icons.circle;
    }
  }
}

