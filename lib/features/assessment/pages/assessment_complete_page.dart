import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_assets.dart';
import '../../plans/services/plan_service.dart';

class AssessmentCompletePage extends ConsumerStatefulWidget {
  final String planId;
  final List<Map<String, dynamic>>? assessments;

  const AssessmentCompletePage({
    super.key,
    required this.planId,
    this.assessments,
  });

  @override
  ConsumerState<AssessmentCompletePage> createState() => _AssessmentCompletePageState();
}

class _AssessmentCompletePageState extends ConsumerState<AssessmentCompletePage> {
  final PlanService _planService = PlanService();
  bool _isSubmitting = false;

  Future<void> _submitAssessment() async {
    if (widget.assessments == null) return;

    setState(() => _isSubmitting = true);

    try {
      final success = await _planService.submitAssessment(
        planId: widget.planId,
        assessments: widget.assessments!,
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Assessments Created Successfully'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate back to plan detail (it will reload data automatically)
        context.go('/plan/${widget.planId}');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to submit assessment'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Assessment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Congratulations Text
              const Text(
                'Congrats. Your plan assessment is',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'completed.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // Success Image
              Container(
                width: 280,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.assessmentComplete,
                    width: 240,
                    height: 200,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to icon if image not found
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 100,
                            color: Colors.green.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Assessment Complete',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // See Results Button
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitAssessment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'See Results',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}