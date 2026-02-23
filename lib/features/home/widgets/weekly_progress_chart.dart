import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class WeeklyProgressChart extends StatelessWidget {
  const WeeklyProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Progress',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildWeeklyBars(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProgressStat('This Week', '85%', AppColors.primary),
                _buildProgressStat('Last Week', '72%', AppColors.grey400),
                _buildProgressStat('Goal', '90%', AppColors.success),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWeeklyBars() {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final progress = [0.8, 0.6, 0.9, 0.7, 0.85, 0.4, 0.3];

    return List.generate(7, (index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 20,
            height: 80 * progress[index],
            decoration: BoxDecoration(
              color: progress[index] > 0.5
                  ? AppColors.primary
                  : AppColors.grey300,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            days[index],
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildProgressStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}