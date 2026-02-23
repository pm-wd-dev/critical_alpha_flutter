import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../models/plan_model.dart';
import '../providers/plan_providers.dart';
import '../services/plan_service.dart';
import '../widgets/assessment_status_widget.dart';
import '../../results/widgets/assessment_line_chart.dart';
import '../../results/services/results_api_service.dart';

class PlanDetailPage extends ConsumerStatefulWidget {
  final String planId;

  const PlanDetailPage({
    super.key,
    required this.planId,
  });

  @override
  ConsumerState<PlanDetailPage> createState() => _PlanDetailPageState();
}

class _PlanDetailPageState extends ConsumerState<PlanDetailPage> {
  final PlanService _planService = PlanService();
  final ResultsApiService _resultsApiService = ResultsApiService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aimController = TextEditingController();
  final TextEditingController _navigateController = TextEditingController();
  final TextEditingController _elevateController = TextEditingController();

  bool _isLoading = false;
  bool _showResults = false;
  PlanModel? _plan;
  List<dynamic> _assessments = [];
  Map<String, dynamic>? _chartData;

  @override
  void initState() {
    super.initState();
    _loadPlanDetails();
  }

  Future<void> _loadPlanDetails() async {
    setState(() => _isLoading = true);
    try {
      // Load plan details
      final plan = await _planService.getPlanById(widget.planId);
      if (plan != null) {
        setState(() {
          _plan = plan;
          _titleController.text = plan.title;
          _aimController.text = plan.description ?? '';
          _navigateController.text = plan.contingency ?? '';
          _elevateController.text = plan.improve ?? '';
        });
      }

      // Load assessments
      final assessments = await _planService.getUserAssessments(widget.planId);
      setState(() {
        _assessments = assessments;
        // Only show results if there are assessments
        _showResults = false;
      });

      // Load chart data if assessments exist
      if (assessments.isNotEmpty) {
        await _loadChartData();
      }
    } catch (e) {
      print('Error loading plan: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadChartData() async {
    try {
      // If we have assessments, use the latest one's ID for the chart
      String assessmentId = '12122122'; // Default ID for all assessments view
      if (_assessments.isNotEmpty && _assessments.last['_id'] != null) {
        // Get the latest assessment ID
        assessmentId = _assessments.last['_id'] as String;
      }

      // Get all assessments line chart data for this plan
      final chartData = await _resultsApiService.getLineChartData(
        assessmentId: assessmentId,
        type: 'all',
        planId: widget.planId,
      );

      if (mounted) {
        setState(() {
          _chartData = chartData;
        });
      }
    } catch (e) {
      print('Error loading chart data: $e');
    }
  }

  Future<void> _updatePlan() async {
    final title = _titleController.text.trim();
    final aim = _aimController.text.trim();
    final navigate = _navigateController.text.trim();
    final elevate = _elevateController.text.trim();

    // Validation
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Plan name shouldn't be empty"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (aim.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("AIM shouldn't be empty"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (navigate.isEmpty || navigate.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("NAVIGATE should have a minimum of 5 characters"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Only validate ELEVATE if assessments exist
    if (_assessments.isNotEmpty) {
      if (elevate.isEmpty || elevate.length < 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("ELEVATE should have a minimum of 5 characters"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      // Pass elevate even if empty for plans without assessments
      final success = await _planService.updatePlan(
        planId: widget.planId,
        title: title,
        description: aim,
        contingency: navigate,
        improve: _assessments.isNotEmpty ? elevate : (_plan?.improve ?? ''),
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title Plan Edited Successfully'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update plan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildInfoIcon(String info) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: Text(
              info,
              style: const TextStyle(fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.info_outline,
          size: 14,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? info,
    int maxLines = 1,
    int maxLength = 500,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            if (info != null) ...[
              const SizedBox(width: 8),
              _buildInfoIcon(info),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLines > 1 ? maxLength : null,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFE3F2FD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: maxLines > 1 ? 12 : 14,
            ),
            counterText: maxLines > 1 ? null : '',
          ),
          buildCounter: maxLines > 1
              ? (context, {required currentLength, required isFocused, maxLength}) {
                  return Text(
                    'Characters $currentLength/$maxLength',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  );
                }
              : null,
        ),
      ],
    );
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
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/goals');
            }
          },
        ),
        title: const Text(
          'Plans',
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plan Name
                  _buildTextField(
                    label: 'PLAN NAME:',
                    controller: _titleController,
                  ),

                  const SizedBox(height: 20),

                  // AIM
                  _buildTextField(
                    label: 'AIM:',
                    controller: _aimController,
                    info: 'Align your goals with your mission. Innovate your strategies to achieve your goals. Measureable indicators of success to track & improve.',
                    maxLines: 6,
                  ),

                  const SizedBox(height: 20),

                  // NAVIGATE
                  _buildTextField(
                    label: 'NAVIGATE:',
                    controller: _navigateController,
                    info: 'Write down the possible challenges that you will face and visualise effective tactics to overcome these adversities so that you are well prepared.',
                    maxLines: 6,
                  ),

                  const SizedBox(height: 20),

                  // ALPHA PERFORMANCE
                  const Text(
                    'ALPHA PERFORMANCE:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Assessment Status
                  AssessmentStatusWidget(
                    assessmentCount: _assessments.length,
                    lastAssessmentDate: _assessments.isNotEmpty
                        ? _assessments.last['createdAt']?.toString().substring(0, 10)
                        : null,
                  ),

                  const SizedBox(height: 16),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Save plan ID to be used in assessment
                            ref.read(currentPlanProvider.notifier).state = _plan;
                            context.push('/assessment/${widget.planId}');
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Start Assessment',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      if (_assessments.isNotEmpty) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () async {
                              if (!_showResults && _chartData == null) {
                                await _loadChartData();
                              }
                              setState(() {
                                _showResults = !_showResults;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primary),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              _showResults ? 'Hide Results' : 'View Results',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  // Results Section - Only show when assessments exist AND results are toggled on
                  if (_assessments.isNotEmpty && _showResults) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _chartData != null && _chartData!.isNotEmpty
                        ? AssessmentLineChart(
                            chartData: _chartData!,
                            type: 'all',
                          )
                        : Container(
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: const Text(
                              'No chart data available',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),

                    const SizedBox(height: 20),

                    // ELEVATE - Only show when assessments exist
                    _buildTextField(
                      label: 'ELEVATE:',
                      controller: _elevateController,
                      info: 'Focus on implementing actions to enhance your performance and continually improve your results for next time. Through regular self-assessment, seeking feedback, and adjusting your strategies, you can achieve ongoing improvement.',
                      maxLines: 6,
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Bottom Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextButton(
                          onPressed: () => context.pop(),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _updatePlan,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _aimController.dispose();
    _navigateController.dispose();
    _elevateController.dispose();
    super.dispose();
  }
}