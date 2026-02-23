import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/auth_controller.dart';
import '../models/auth_simple_models.dart';
import '../models/auth_request_models.dart';

// Social Provider enum
enum SocialProvider {
  google('google', 'Google'),
  apple('apple', 'Apple'),
  facebook('facebook', 'Facebook');

  final String value;
  final String displayName;
  const SocialProvider(this.value, this.displayName);
}

class SocialLoginButtons extends ConsumerWidget {
  final bool isSignup;

  const SocialLoginButtons({
    super.key,
    this.isSignup = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Column(
      children: [
        _buildGoogleButton(context, ref, authState.isLoading),
        const SizedBox(height: 12),
        _buildAppleButton(context, ref, authState.isLoading),
        const SizedBox(height: 12),
        _buildFacebookButton(context, ref, authState.isLoading),
      ],
    );
  }

  Widget _buildGoogleButton(BuildContext context, WidgetRef ref, bool isLoading) {
    return CustomButton(
      text: isSignup ? AppStrings.signInWithGoogle : 'Continue with Google',
      type: ButtonType.outline,
      isFullWidth: true,
      isLoading: isLoading,
      icon: const Icon(
        Icons.g_mobiledata,
        color: Colors.red,
        size: 24,
      ),
      onPressed: isLoading ? null : () => _handleSocialLogin(
        context,
        ref,
        SocialProvider.google,
      ),
    );
  }

  Widget _buildAppleButton(BuildContext context, WidgetRef ref, bool isLoading) {
    return CustomButton(
      text: isSignup ? AppStrings.signInWithApple : 'Continue with Apple',
      type: ButtonType.outline,
      isFullWidth: true,
      isLoading: isLoading,
      icon: const Icon(
        Icons.apple,
        color: Colors.black,
        size: 24,
      ),
      onPressed: isLoading ? null : () => _handleSocialLogin(
        context,
        ref,
        SocialProvider.apple,
      ),
    );
  }

  Widget _buildFacebookButton(BuildContext context, WidgetRef ref, bool isLoading) {
    return CustomButton(
      text: isSignup ? AppStrings.signInWithFacebook : 'Continue with Facebook',
      type: ButtonType.outline,
      isFullWidth: true,
      isLoading: isLoading,
      icon: const Icon(
        Icons.facebook,
        color: Colors.blue,
        size: 24,
      ),
      onPressed: isLoading ? null : () => _handleSocialLogin(
        context,
        ref,
        SocialProvider.facebook,
      ),
    );
  }

  Future<void> _handleSocialLogin(
    BuildContext context,
    WidgetRef ref,
    SocialProvider provider,
  ) async {
    try {
      // This would integrate with actual social login SDKs
      // For now, we'll show a placeholder
      _showNotImplemented(context, provider.displayName);

      // Example of how it would work:
      /*
      String? token;

      switch (provider) {
        case SocialProvider.google:
          token = await _googleSignIn();
          break;
        case SocialProvider.apple:
          token = await _appleSignIn();
          break;
        case SocialProvider.facebook:
          token = await _facebookSignIn();
          break;
      }

      if (token != null) {
        final request = SocialLoginRequest(
          provider: provider.value,
          token: token,
        );

        await ref.read(authControllerProvider.notifier).socialLogin(request);
      }
      */
    } catch (e) {
      if (context.mounted) {
        _showError(context, 'Social login failed: ${e.toString()}');
      }
    }
  }

  void _showNotImplemented(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider login will be implemented with actual SDK integration'),
        backgroundColor: AppColors.info,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // These would be implemented with actual social login SDKs
  // Future<String?> _googleSignIn() async {
  //   // Implement Google Sign-In
  //   return null;
  // }

  // Future<String?> _appleSignIn() async {
  //   // Implement Apple Sign-In
  //   return null;
  // }

  // Future<String?> _facebookSignIn() async {
  //   // Implement Facebook Login
  //   return null;
  // }
}