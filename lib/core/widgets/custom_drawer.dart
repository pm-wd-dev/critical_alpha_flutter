import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../constants/app_assets.dart';
import '../network/api_client.dart';
import '../network/api_endpoints.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.user;

    // Extract user info
    String userName = '';
    String userEmail = '';
    String? profilePicture;

    if (user != null) {
      // Try to get username first, then full name, then firstName
      if (user.username != null && user.username!.isNotEmpty) {
        userName = user.username!;
      } else if (user.firstName.isNotEmpty || user.lastName.isNotEmpty) {
        userName = user.fullName.trim();
        if (userName.isEmpty) {
          userName = user.firstName.isNotEmpty ? user.firstName : user.lastName;
        }
      }

      // Set email
      userEmail = user.email.isNotEmpty ? user.email : 'user@example.com';

      // Set profile picture
      profilePicture = user.profilePicture;
    }

    // Fallback values if still empty
    if (userName.isEmpty) {
      userName = userEmail.split('@').first; // Use email prefix as name
    }
    if (userName.isEmpty) {
      userName = 'User'; // Final fallback
    }

    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          // Header Section with User Info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 30),
            child: Column(
              children: [
                // Profile Picture - Clickable to change picture
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/profile/change-picture');
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: profilePicture != null && profilePicture.isNotEmpty
                          ? Image.network(
                              profilePicture,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                AppAssets.emptyProfile,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset(
                              AppAssets.emptyProfile,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // User Name
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F3333),
                  ),
                ),
                const SizedBox(height: 4),
                // User Email
                Text(
                  userEmail,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              children: [
                // Settings
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/settings');
                  },
                ),

                // Guidance
                _buildDrawerItem(
                  icon: Icons.book_outlined,
                  title: 'Guidance',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('https://www.criticalalpha.com/guidance');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                // Privacy Policy
                _buildDrawerItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy policy',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('https://www.criticalalpha.com/privacypolicy');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                // Info for User
                _buildDrawerItem(
                  icon: Icons.info_outline,
                  title: 'Info for User',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('https://www.criticalalpha.com/informationforusers');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                // Terms & Conditions
                _buildDrawerItem(
                  icon: Icons.description_outlined,
                  title: 'Terms & Conditions',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('https://www.criticalalpha.com/termsandconditions');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                // Visit Website
                _buildDrawerItem(
                  icon: Icons.language,
                  title: 'Visit Website',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('https://www.criticalalpha.com');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                // Feedback
                _buildDrawerItem(
                  icon: Icons.feedback_outlined,
                  title: 'Feedback',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('mailto:admin@criticalalpha.com?subject=Feedback');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                ),

                // Credits
                _buildDrawerItem(
                  icon: Icons.star_outline,
                  title: 'Credits',
                  onTap: () async {
                    Navigator.pop(context);
                    final url = Uri.parse('https://www.criticalalpha.com/credit');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),

                const SizedBox(height: 20),

                // Delete Account (Red)
                _buildDrawerItem(
                  icon: Icons.delete_outline,
                  title: 'Delete account',
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () {
                    Navigator.pop(context);
                    _showDeleteAccountDialog(context, ref);
                  },
                ),
              ],
            ),
          ),

          // Bottom Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Logout Button
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Color(0xFFE12B2B),
                    size: 24,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Color(0xFFE12B2B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showLogoutDialog(context, ref);
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black87,
    Color iconColor = Colors.grey,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Logout',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              try {
                // Clear API client tokens first
                await ApiClient().clearTokens();

                // Clear all user data and tokens
                await ref.read(authControllerProvider.notifier).logout();

                if (context.mounted) {
                  // Navigate to login and clear all previous routes
                  context.go('/login');
                }
              } catch (e) {
                // Even if logout fails, navigate to login
                if (context.mounted) {
                  context.go('/login');
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text(
              'Logout',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Delete Account',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete your account? '
          'This action cannot be undone and you will be permanently '
          'removed from Critical Alpha.',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              // Show loading dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );

              try {
                // Call delete account API
                final apiClient = ApiClient();
                await apiClient.delete(ApiEndpoints.deleteAccount);

                // Clear all user data
                await ref.read(authControllerProvider.notifier).logout();
                await ApiClient().clearTokens();

                if (context.mounted) {
                  Navigator.pop(context); // Close loading dialog

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account deleted successfully'),
                      backgroundColor: Colors.orange,
                      duration: Duration(seconds: 3),
                    ),
                  );

                  // Navigate to login
                  context.go('/login');
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.pop(context); // Close loading dialog

                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to delete account: ${e.toString()}'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text(
              'Delete',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}