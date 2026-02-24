import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_assets.dart';
import '../../../routes/route_constants.dart';
import '../controllers/auth_controller.dart';
import '../models/auth_simple_models.dart';
import '../models/auth_request_models.dart';

class CodeVerificationPage extends ConsumerStatefulWidget {
  final String email;
  final String type;

  const CodeVerificationPage({
    super.key,
    required this.email,
    required this.type,
  });

  @override
  ConsumerState<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends ConsumerState<CodeVerificationPage> {
  final TextEditingController _codeController = TextEditingController();
  Timer? _timer;
  int _secondsRemaining = 55;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 55;
    _canResend = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        setState(() => _canResend = true);
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _codeController.dispose();
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

      if (next.message != null && next.message!.contains('verified')) {
        _showSuccess(next.message!);
        // Navigate based on verification type
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            if (widget.type == 'email_verification') {
              context.go(RouteConstants.login);
            } else if (widget.type == 'password_reset') {
              // Navigate to new password page with email parameter
              context.go('${RouteConstants.newPassword}?email=${Uri.encodeComponent(widget.email)}');
            } else {
              context.go(RouteConstants.home);
            }
          }
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Logo
                _buildLogo(),
                const SizedBox(height: 80),
                // Title
                _buildTitle(),
                const SizedBox(height: 16),
                // Subtitle
                _buildSubtitle(),
                const SizedBox(height: 50),
                // Pin Code Field
                _buildPinCodeField(),
                const SizedBox(height: 20),
                // Timer
                _buildTimer(),
                const SizedBox(height: 50),
                // Done Button
                _buildDoneButton(authState.isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        AppAssets.logo,
        height: 150,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'CODE VERIFICATION',
      style: TextStyle(
        fontSize: 22,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: Colors.black,
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Enter OTP(One-time password) sent\nto ${widget.email}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: Color(0xFF484848),
        height: 1.4,
      ),
    );
  }

  Widget _buildPinCodeField() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            controller: _codeController,
            keyboardType: TextInputType.number,
            animationType: AnimationType.none,
            textStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(0),
              fieldHeight: 48,
              fieldWidth: 48,
              activeBorderWidth: 2,
              selectedBorderWidth: 2,
              inactiveBorderWidth: 1,
              activeColor: const Color(0xFF0147D9),
              selectedColor: const Color(0xFF0147D9),
              inactiveColor: const Color(0xFFE0E0E0),
              activeFillColor: Colors.white,
              selectedFillColor: Colors.white,
              inactiveFillColor: const Color(0xFFF5F5F5),
            ),
            animationDuration: const Duration(milliseconds: 0),
            backgroundColor: Colors.transparent,
            enableActiveFill: true,
            showCursor: false,
            enablePinAutofill: false,
            onCompleted: (code) {
              // Auto-submit when all digits are entered
              if (code.length == 6) {
                _handleVerifyCode(code);
              }
            },
            onChanged: (value) {},
            beforeTextPaste: (text) {
              // Allow paste if it's 6 digits
              return text != null && text.length == 6 && int.tryParse(text) != null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    if (!_canResend) {
      return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '0:${_secondsRemaining.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color(0xFF666666),
            ),
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            onPressed: _handleResendCode,
            child: const Text(
              'Resend Code',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Color(0xFF0147D9),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildDoneButton(bool isLoading) {
    // Determine button text based on type
    final buttonText = widget.type == 'password_reset' ? 'Reset' : 'Done';

    return SizedBox(
      width: 200,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _handleVerifyCode(_codeController.text),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0147D9),
          disabledBackgroundColor: const Color(0xFF0147D9).withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          elevation: 2,
          shadowColor: const Color(0xFF0147D9).withValues(alpha: 0.3),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }

  Future<void> _handleVerifyCode(String code) async {
    if (code.length != 6) {
      _showError('Please enter a 6-digit code');
      return;
    }

    final request = VerifyCodeRequest(
      email: widget.email,
      code: code,
      type: widget.type,
    );

    await ref.read(authControllerProvider.notifier).verifyCode(request);
  }

  Future<void> _handleResendCode() async {
    final success = await ref.read(authControllerProvider.notifier)
        .resendVerificationCode(widget.email, widget.type);

    if (success) {
      _startTimer();
      _showSuccess('Verification code resent');
      _codeController.clear();
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