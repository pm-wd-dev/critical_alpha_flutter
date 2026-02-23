import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../routes/route_constants.dart';

class AudioSectionPage extends StatelessWidget {
  const AudioSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Audio Learning')),
      body: ListView(
        padding: AppPadding.medium,
        children: [
          _buildCategoryCard(
            context,
            'Soft Skills',
            'Leadership, Communication, Teamwork',
            Icons.psychology,
            AppColors.primary,
            () => context.push(RouteConstants.softSkills),
          ),
          _buildCategoryCard(
            context,
            'Focus Music',
            'Concentration and productivity sounds',
            Icons.music_note,
            AppColors.secondary,
            () {},
          ),
          _buildCategoryCard(
            context,
            'Meditation',
            'Mindfulness and relaxation guides',
            Icons.self_improvement,
            AppColors.accent,
            () {},
          ),
          _buildCategoryCard(
            context,
            'Podcasts',
            'Educational and motivational content',
            Icons.podcasts,
            AppColors.info,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: AppPadding.medium,
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppBorderRadius.small),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}