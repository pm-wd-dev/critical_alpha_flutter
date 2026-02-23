import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/validators.dart' as AppValidators;
import '../../../core/widgets/custom_button.dart';
import '../../../routes/route_constants.dart';
import '../controllers/auth_controller.dart';
import '../models/auth_simple_models.dart';
import '../models/auth_request_models.dart';
import '../widgets/auth_header.dart';

class NewPasswordPage extends ConsumerStatefulWidget {
  final String resetToken;

  const NewPasswordPage({
    super.key,
    required this.resetToken,
  });

  @override
  ConsumerState<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends ConsumerState<NewPasswordPage> {
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
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'confirmPassword': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    });
  }

  Map<String, dynamic>? _passwordMatchValidator(AbstractControl<dynamic> control) {
    final password = control.value['password'];
    final confirmPassword = control.value['confirmPassword'];

    if (password != null && confirmPassword != null && password != confirmPassword) {
      return {'passwordMismatch': true};
    }

    return null;
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (next.error != null) {
        _showError(next.error!.message);
      }

      if (next.message != null && next.message!.isNotEmpty) {
        _showSuccess(next.message!);
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            context.go(RouteConstants.login);
          }
        });
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPadding.large,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const AuthHeader(
                title: 'New Password',
                subtitle: 'Enter your new password',
              ),
              const SizedBox(height: 48),
              _buildPasswordForm(),
              const SizedBox(height: 32),
              _buildResetButton(authState.isLoading),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordForm() {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'password',
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'New Password',
              hintText: 'Enter your new password',
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              helperText: 'At least 8 characters with uppercase, lowercase, number, and special character',
              helperMaxLines: 2,
            ),
            textInputAction: TextInputAction.next,
            validationMessages: {
              ValidationMessage.required: (_) => AppStrings.errorRequiredField,
              ValidationMessage.minLength: (_) => 'Password must be at least 8 characters',
            },
          ),
          const SizedBox(height: 16),
          ReactiveTextField(
            formControlName: 'confirmPassword',
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirm New Password',
              hintText: 'Confirm your new password',
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (control) => _handleResetPassword(),
            validationMessages: {
              ValidationMessage.required: (_) => AppStrings.errorRequiredField,
            },
          ),
          const SizedBox(height: 16),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              if (form.hasError('passwordMismatch')) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      AppStrings.errorPasswordMismatch,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton(bool isLoading) {
    return PrimaryButton(
      text: 'Reset Password',
      isLoading: isLoading,
      isFullWidth: true,
      onPressed: isLoading ? null : _handleResetPassword,
    );
  }

  Future<void> _handleResetPassword() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    final password = form.control('password').value as String;
    final confirmPassword = form.control('confirmPassword').value as String;

    final request = ResetPasswordRequest(
      token: widget.resetToken,
      newPassword: password,
      confirmPassword: confirmPassword,
    );

    await ref.read(authControllerProvider.notifier).resetPassword(request);
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  void _showSuccess(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.success),
    );
  }
}