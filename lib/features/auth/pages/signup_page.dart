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

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  late final FormGroup form;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    form = FormGroup({
      'username': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(3)],
      ),
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
      'phoneNumber': FormControl<String>(
        value: '',
        validators: [],
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'confirmPassword': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'agreeToTerms': FormControl<bool>(
        value: false,
        validators: [Validators.requiredTrue],
      ),
    });
  }

  // Validate password match before submission
  bool _validatePasswordMatch() {
    final password = form.control('password').value as String?;
    final confirmPassword = form.control('confirmPassword').value as String?;

    if (password != null && confirmPassword != null && password != confirmPassword) {
      form.control('confirmPassword').setErrors({'passwordMismatch': true});
      form.control('confirmPassword').markAsTouched();
      return false;
    }
    return true;
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
        _showError(next.error!.message);
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
                const SizedBox(height: 40),
                // Logo
                _buildLogo(),
              
                const SizedBox(height: 40),
                // Signup Title
                _buildSignupTitle(),
                const SizedBox(height: 8),
                // Subtitle
                _buildSubtitle(),
                const SizedBox(height: 30),
                // Signup Form
                _buildSignupForm(),
                const SizedBox(height: 30),
                // Signup Button
                _buildSignupButton(authState.isLoading),
                const SizedBox(height: 40),
                // Login link
                _buildLoginLink(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AppAssets.logo,
      height: 100,
      width: 140,
      fit: BoxFit.contain,
    );
  }

 

  Widget _buildSignupTitle() {
    return const Text(
      'Sign Up',
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
      'Create your account',
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F1F1F),
      ),
    );
  }

  Widget _buildSignupForm() {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Username Field
          _buildTextField(
            label: 'Username',
            formControlName: 'username',
            hintText: 'Enter Your Username',
            validators: {
              ValidationMessage.required: (_) => 'Please enter your username',
              ValidationMessage.minLength: (_) => 'Username must be at least 3 characters',
            },
          ),
          const SizedBox(height: 20),
          // Email Field
          _buildTextField(
            label: 'Email',
            formControlName: 'email',
            hintText: 'Enter Your Email',
            keyboardType: TextInputType.emailAddress,
            validators: {
              ValidationMessage.required: (_) => 'Please enter your email',
              ValidationMessage.email: (_) => 'Please enter a valid email',
            },
          ),
          const SizedBox(height: 20),
          // Mobile Number Field (Optional)
          _buildTextField(
            label: 'Mobile No. (Optional)',
            formControlName: 'phoneNumber',
            hintText: 'Enter Your Mobile Number',
            keyboardType: TextInputType.phone,
            validators: {},
          ),
          const SizedBox(height: 20),
          // Password Field
          _buildPasswordField(
            label: 'Password',
            formControlName: 'password',
            hintText: 'Enter Your Password',
            obscureText: _obscurePassword,
            onToggle: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            validators: {
              ValidationMessage.required: (_) => 'Please enter your password',
              ValidationMessage.minLength: (_) => 'Password must be at least 8 characters',
            },
          ),
          const SizedBox(height: 20),
          // Confirm Password Field
          _buildPasswordField(
            label: 'Confirm Password',
            formControlName: 'confirmPassword',
            hintText: 'Enter Your Confirm Password',
            obscureText: _obscureConfirmPassword,
            onToggle: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
            validators: {
              ValidationMessage.required: (_) => 'Please confirm your password',
              'passwordMismatch': (_) => 'Passwords do not match',
            },
          ),
          const SizedBox(height: 20),
          // Terms and Conditions Checkbox
          _buildTermsCheckbox(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String formControlName,
    required String hintText,
    TextInputType? keyboardType,
    required Map<String, String Function(Object)> validators,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F1F1F),
          ),
        ),
        const SizedBox(height: 8),
        ReactiveTextField(
          formControlName: formControlName,
          decoration: InputDecoration(
            hintText: hintText,
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
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          validationMessages: validators,
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String formControlName,
    required String hintText,
    required bool obscureText,
    required VoidCallback onToggle,
    required Map<String, String Function(Object)> validators,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F1F1F),
          ),
        ),
        const SizedBox(height: 8),
        ReactiveTextField(
          formControlName: formControlName,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
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
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
                size: 20,
              ),
              onPressed: onToggle,
            ),
          ),
          textInputAction: formControlName == 'confirmPassword'
              ? TextInputAction.done
              : TextInputAction.next,
          onSubmitted: formControlName == 'confirmPassword'
              ? (control) => _handleSignup()
              : null,
          validationMessages: validators,
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: ReactiveCheckbox(
                formControlName: 'agreeToTerms',
                activeColor: const Color(0xFF0147D9),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  final current = form.control('agreeToTerms').value as bool;
                  form.control('agreeToTerms').updateValue(!current);
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1F1F1F),
                    ),
                    children: [
                      TextSpan(text: 'I agree to the '),
                      TextSpan(
                        text: 'Term & Conditions.',
                        style: TextStyle(
                          color: Color(0xFF0147D9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSignupButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading ? null : _handleSignup,
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
                'Sign Up',
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

  Widget _buildLoginLink() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Already have an account? ',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color(0xFF1F1F1F),
          ),
        ),
        GestureDetector(
          onTap: () => context.go(RouteConstants.login),
          child: const Text(
            'Log in',
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

  Future<void> _handleSignup() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    // Check password match
    if (!_validatePasswordMatch()) {
      return;
    }

    final username = form.control('username').value as String;
    final email = form.control('email').value as String;
    final password = form.control('password').value as String;

    final request = SignupRequest(
      username: username.trim(),
      email: email.trim().toLowerCase(),
      password: password,
    );

    final success = await ref.read(authControllerProvider.notifier).signup(request);

    if (success) {
      if (mounted) {
        // Clear form first
        form.reset();

        // Show success message
        _showSuccess('Account created successfully! Please check your email for OTP.');

        // Navigate to code verification page using pushReplacement
        final encodedEmail = Uri.encodeQueryComponent(email.trim().toLowerCase());
        await Future.delayed(const Duration(milliseconds: 100));
        if (mounted) {
          context.pushReplacement('${RouteConstants.codeVerification}?email=$encodedEmail&type=email_verification');
        }
      }
    }
  }

  void _showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE53935),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _showSuccess(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF4CAF50),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}