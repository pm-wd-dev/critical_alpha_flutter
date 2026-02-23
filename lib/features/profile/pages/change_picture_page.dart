import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ChangePicturePage extends StatelessWidget {
  const ChangePicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Change Picture')),
      body: const Center(
        child: Text('Change Picture - Coming Soon'),
      ),
    );
  }
}