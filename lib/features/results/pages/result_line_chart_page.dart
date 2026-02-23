import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ResultLineChartPage extends StatelessWidget {
  const ResultLineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Line Chart Analysis')),
      body: const Center(
        child: Text('Line Chart Page - Coming Soon'),
      ),
    );
  }
}