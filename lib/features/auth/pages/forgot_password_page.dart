import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes/route_constants.dart';
import '../controllers/auth_controller.dart';
import '../models/auth_simple_models.dart';
import '../models/auth_request_models.dart';
import '../widgets/auth_header.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
    });
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
        // Navigate to verification page
        context.push('${RouteConstants.codeVerification}?email=${form.control('email').value}&type=password_reset');
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
                title: 'Forgot Password?',
                subtitle: 'Enter your email address and we\'ll send you a reset code',
              ),
              const SizedBox(height: 48),
              _buildEmailForm(),
              const SizedBox(height: 32),
              _buildSendButton(authState.isLoading),
              const SizedBox(height: 24),
              _buildBackToLoginLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return ReactiveForm(
      formGroup: form,
      child: ReactiveTextField(
        formControlName: 'email',
        decoration: const InputDecoration(
          labelText: AppStrings.email,
          hintText: 'Enter your email address',
          prefixIcon: Icon(Icons.email_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        onSubmitted: (control) => _handleSendReset(),
        validationMessages: {
          ValidationMessage.required: (_) => AppStrings.errorRequiredField,
          ValidationMessage.email: (_) => AppStrings.errorInvalidEmail,
        },
      ),
    );
  }

  Widget _buildSendButton(bool isLoading) {
    return PrimaryButton(
      text: 'Send Reset Code',
      isLoading: isLoading,
      isFullWidth: true,
      onPressed: isLoading ? null : _handleSendReset,
    );
  }

  Widget _buildBackToLoginLink() {
    return TextButton(
      onPressed: () => context.pop(),
      child: const Text('Back to Login'),
    );
  }

  Future<void> _handleSendReset() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    final email = form.control('email').value as String;
    final request = ForgotPasswordRequest(email: email.trim());

    await ref.read(authControllerProvider.notifier).forgotPassword(request);
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