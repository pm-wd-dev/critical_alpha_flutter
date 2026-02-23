import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? logo;
  final double? spacing;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.logo,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (logo != null) ...[
          logo!,
          SizedBox(height: spacing ?? 24),
        ] else ...[
          _buildDefaultLogo(),
          SizedBox(height: spacing ?? 24),
        ],
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDefaultLogo() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
        boxShadow: const [AppShadows.medium],
      ),
      child: const Icon(
        Icons.track_changes,
        size: 40,
        color: AppColors.white,
      ),
    );
  }
}