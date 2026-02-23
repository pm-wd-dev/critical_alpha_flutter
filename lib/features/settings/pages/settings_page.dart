import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../routes/route_constants.dart';
import '../../auth/controllers/auth_controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: AppPadding.medium,
        children: [
          _buildSection('Account', [
            _buildSettingTile(
              context,
              'Profile',
              'Manage your personal information',
              Icons.person_outline,
              () => context.push(RouteConstants.profile),
            ),
            _buildSettingTile(
              context,
              'Premium Subscription',
              'Upgrade for advanced features',
              Icons.star_outline,
              () => context.push(RouteConstants.purchase),
            ),
          ]),
          _buildSection('Preferences', [
            _buildSwitchTile(
              'Push Notifications',
              'Receive goal reminders and updates',
              Icons.notifications_outlined,
              true,
              (value) {},
            ),
            _buildSwitchTile(
              'Dark Mode',
              'Use dark theme',
              Icons.dark_mode_outlined,
              false,
              (value) {},
            ),
          ]),
          _buildSection('Support', [
            _buildSettingTile(
              context,
              'Help & Support',
              'Get help and contact support',
              Icons.help_outline,
              () {},
            ),
            _buildSettingTile(
              context,
              'Privacy Policy',
              'Read our privacy policy',
              Icons.privacy_tip_outlined,
              () {},
            ),
            _buildSettingTile(
              context,
              'Terms of Service',
              'Read our terms of service',
              Icons.description_outlined,
              () {},
            ),
          ]),
          _buildSection('Account Actions', [
            _buildSettingTile(
              context,
              'Sign Out',
              'Sign out of your account',
              Icons.logout,
              () => _showSignOutDialog(context, ref),
              isDestructive: true,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? AppColors.error : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? AppColors.error : AppColors.textPrimary,
          fontWeight: FontWeight.w500,
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
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  void _showSignOutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authControllerProvider.notifier).logout();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}