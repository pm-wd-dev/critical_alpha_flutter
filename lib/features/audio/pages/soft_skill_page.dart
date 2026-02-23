import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class SoftSkillPage extends StatelessWidget {
  const SoftSkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Soft Skills')),
      body: const Center(
        child: Text('Soft Skills Audio Content - Coming Soon'),
      ),
    );
  }
}