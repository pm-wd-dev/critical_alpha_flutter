import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ChangeEmailPage extends StatelessWidget {
  const ChangeEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Change Email')),
      body: const Center(
        child: Text('Change Email - Coming Soon'),
      ),
    );
  }
}