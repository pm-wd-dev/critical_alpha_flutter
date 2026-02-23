import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../routes/route_constants.dart';
import '../../auth/controllers/auth_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: AppPadding.medium,
        children: [
          _buildProfileHeader(user),
          const SizedBox(height: 24),
          _buildPersonalInfo(context, user),
          const SizedBox(height: 16),
          _buildAccountSettings(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(user) {
    return Card(
      child: Padding(
        padding: AppPadding.large,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user?.hasProfilePicture == true
                  ? NetworkImage(user!.profilePicture!)
                  : null,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: user?.hasProfilePicture != true
                  ? Text(
                      user?.initials ?? 'U',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            Text(
              user?.fullName ?? 'User Name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              user?.email ?? 'user@example.com',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Goals', '24'),
                _buildStatColumn('Completed', '18'),
                _buildStatColumn('Streak', '7 days'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
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

  Widget _buildPersonalInfo(BuildContext context, user) {
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          _buildInfoTile(
            context,
            'Name',
            user?.fullName ?? 'Not set',
            Icons.person_outline,
            () => context.push(RouteConstants.changeName),
          ),
          _buildInfoTile(
            context,
            'Email',
            user?.email ?? 'Not set',
            Icons.email_outlined,
            () => context.push(RouteConstants.changeEmail),
          ),
          _buildInfoTile(
            context,
            'Phone',
            user?.phoneNumber ?? 'Not set',
            Icons.phone_outlined,
            () {},
          ),
          _buildInfoTile(
            context,
            'Date of Birth',
            user?.dateOfBirth?.toString().split(' ')[0] ?? 'Not set',
            Icons.cake_outlined,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          _buildInfoTile(
            context,
            'Change Password',
            'Update your password',
            Icons.lock_outline,
            () => context.push(RouteConstants.changePassword),
          ),
          _buildInfoTile(
            context,
            'Profile Picture',
            'Update your profile picture',
            Icons.camera_alt_outlined,
            () => context.push(RouteConstants.changePicture),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}