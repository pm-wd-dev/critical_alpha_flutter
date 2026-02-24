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
        validators: [
          Validators.required,
          Validators.minLength(8),
          Validators.pattern(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]'),
        ],
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
        _showErrorSnackBar(
          title: 'Email Already Exist',
          message: 'Account Creation Failed',
        );
      }

      // IMPORTANT: Prevent navigation to home if user becomes authenticated during signup
      // This can happen if backend returns tokens immediately
      if (next.isAuthenticated && !previous!.isAuthenticated) {
        // This shouldn't happen during signup, but if it does, prevent default navigation
        // The _handleSignup method will handle the correct navigation to code verification
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
      'Create your account.',
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
            keyboardType: TextInputType.text,
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
            validators: {
              ValidationMessage.required: (_) => 'Please enter your password',
              ValidationMessage.minLength: (_) => 'Password must contain at least 8 characters &\none special character, the first letter should be\ncapitalized, and at least one numeric character.',
              'format': (_) => 'Password must contain at least 8 characters &\none special character, the first letter should be\ncapitalized, and at least one numeric character.',
            },
          ),
          const SizedBox(height: 20),
          // Confirm Password Field
          _buildPasswordField(
            label: 'Confirm Password',
            formControlName: 'confirmPassword',
            hintText: 'Enter Your Confirm Password',
            validators: {
              ValidationMessage.required: (_) => 'Please confirm your password',
              'passwordMismatch': (_) => 'Passwords do not match',
            },
          ),
          const SizedBox(height: 20),
          // Terms Checkbox
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
          obscureText: true,
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
            errorMaxLines: 3,
            errorStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: Colors.red,
              height: 1.3,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          textInputAction: TextInputAction.next,
          validationMessages: validators,
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        final isChecked = form.control('agreeToTerms').value as bool? ?? false;

        return InkWell(
          onTap: () {
            form.control('agreeToTerms').value = !isChecked;
          },
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: isChecked ? null : Border.all(
                    color: const Color(0xFF1F1F1F),
                    width: 1.5,
                  ),
                ),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.black,
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'I agree to the ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1F1F1F),
                    ),
                    children: [
                      TextSpan(
                        text: 'Term & Conditions.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0147D9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
            onTap: () => context.push(RouteConstants.login),
            child: const Text(
              'Log In',
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

    // Validate password format
    final password = form.control('password').value as String;
    if (!_validatePasswordFormat(password)) {
      form.control('password').setErrors({'format': true});
      form.control('password').markAsTouched();
      return;
    }

    final username = form.control('username').value as String;
    final email = form.control('email').value as String;

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

        // Show success snackbar
        _showSuccessSnackBar(
          title: 'Sign_up',
          message: 'Account Created Successfully Kindly Check Your Email For One Time Password.',
        );

        // Navigate to code verification page after delay
        final encodedEmail = Uri.encodeQueryComponent(email.trim().toLowerCase());
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          // Use go instead of pushReplacement to ensure immediate navigation
          // and prevent any router redirect interference
          context.go('${RouteConstants.codeVerification}?email=$encodedEmail&type=email_verification');
        }
      }
    }
  }

  bool _validatePasswordFormat(String password) {
    // Check for at least 8 characters
    if (password.length < 8) return false;

    // Check if first letter is capital
    if (password.isEmpty || !password[0].contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Check for at least one number
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Check for at least one special character
    if (!password.contains(RegExp(r'[@$!%*?&#]'))) {
      return false;
    }

    return true;
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