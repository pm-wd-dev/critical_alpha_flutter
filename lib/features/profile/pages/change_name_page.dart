import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Change Name')),
      body: const Center(
        child: Text('Change Name - Coming Soon'),
      ),
    );
  }
}