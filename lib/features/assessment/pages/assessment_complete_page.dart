import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/custom_floating_bottom_nav.dart';
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
  ConsumerState<AssessmentCompletePage> createState() =>
      _AssessmentCompletePageState();
}

class _AssessmentCompletePageState
    extends ConsumerState<AssessmentCompletePage> {
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
        // Add a small delay to ensure data is saved on server before navigating
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) {
          // Navigate directly to results screen with planId
          context.go('/results?planId=${widget.planId}');
        }
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
      // 7.4: Drawer and bottom nav
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomFloatingBottomNav(),
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
          // 7.1: App logo at top-right
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF0147D9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      AppAssets.drawerIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // 7.7: Body text at top, heading centered
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 7.7: Center-aligned heading at top
            const Text(
              'Congrats. Your plan assessment is completed.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // 7.7: No background color, larger image
            Image.asset(
              AppAssets.assessmentComplete,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 120,
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

            const SizedBox(height: 48),

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
    );
  }
}
