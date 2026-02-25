import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_assets.dart';
import '../../../routes/route_constants.dart';
import '../controllers/auth_controller.dart';
import '../models/auth_request_models.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    form = FormGroup({
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
    });
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    ref.listen(authControllerProvider, (previous, next) {
      if (next.error != null) {
        // Clear any loading state
        ref.read(authControllerProvider.notifier).clearError();

        // Show error message
        _showErrorSnackBar(
          title: 'Login Failed',
          message: next.error!.message,
        );

        // Do NOT navigate anywhere on error - stay on login page
        return;
      }

      // Only navigate to home if actually authenticated without errors
      if (next.isAuthenticated && !next.isLoading && next.error == null) {
        _showSuccessSnackBar(
          title: 'Login Successful',
          message: 'Welcome back!',
        );
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) context.go(RouteConstants.home);
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                const SizedBox(height: 60),
                // Logo
                _buildLogo(),
                const SizedBox(height: 50),
                // Login Title
                _buildLoginTitle(),
                const SizedBox(height: 8),
                // Subtitle
                _buildSubtitle(),
                const SizedBox(height: 40),
                // Login Form
                _buildLoginForm(),
                const SizedBox(height: 12),
                // Forgot Password
                _buildForgotPassword(),
                const SizedBox(height: 40),
                // Login Button
                _buildLoginButton(authState.isLoading),
                // Spacer
                const SizedBox(height: 80),
                // Sign up link
                _buildSignupLink(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Image.asset(
        AppAssets.logo,
        height: 120,
        width: 160,
        fit: BoxFit.contain,
        alignment: Alignment.centerLeft,
      ),
    );
  }


  Widget _buildLoginTitle() {
    return const Text(
      'Log in',
      style: TextStyle(
        fontSize: 36,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Color(0xFF1F1F1F),
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Log in to your Account.',
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F1F1F),
      ),
    );
  }

  Widget _buildLoginForm() {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F1F1F),
                ),
              ),
              const SizedBox(height: 8),
              ReactiveTextField(
                formControlName: 'email',
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400],
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F8F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF0147D9),
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validationMessages: {
                  ValidationMessage.required: (_) => 'Please enter your email',
                  ValidationMessage.email: (_) => 'Please enter a valid email',
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Password Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F1F1F),
                ),
              ),
              const SizedBox(height: 8),
              ReactiveTextField(
                formControlName: 'password',
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400],
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F8F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF0147D9),
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (control) => _handleLogin(),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Please enter your password',
                  ValidationMessage.minLength: (_) => 'Password must be at least 8 characters',
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Forgot password? ',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color(0xFF1F1F1F),
          ),
        ),
        GestureDetector(
          onTap: () => context.push(RouteConstants.forgotPassword),
          child: const Text(
            'Click here.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color(0xFF0147D9),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0147D9),
          disabledBackgroundColor: const Color(0xFF0147D9).withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildSignupLink() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Don't have a account? ",
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color(0xFF1F1F1F),
          ),
        ),
        GestureDetector(
          onTap: () => context.push(RouteConstants.signup),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color(0xFF0147D9),
            ),
          ),
        ),
      ],
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    final email = form.control('email').value as String;
    final password = form.control('password').value as String;

    final request = LoginRequest(
      email: email.trim().toLowerCase(),
      password: password,
    );

    await ref.read(authControllerProvider.notifier).login(request);
  }

  void _showErrorSnackBar({required String title, required String message}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 2),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE74C3C),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 20,
          right: 20,
        ),
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _showSuccessSnackBar({required String title, required String message}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 2),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF4CAF50),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 20,
          right: 20,
        ),
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

}