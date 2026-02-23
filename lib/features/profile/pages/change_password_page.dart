import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Change Password')),
      body: const Center(
        child: Text('Change Password - Coming Soon'),
      ),
    );
  }
}