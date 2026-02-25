import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/custom_floating_bottom_nav.dart';
import '../models/plan_model.dart';
import '../providers/plan_providers.dart';
import '../services/plan_service.dart';
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
  bool _isLoadingChart = false;
  PlanModel? _plan;
  List<dynamic> _assessments = [];
  Map<String, dynamic>? _chartData;
  String? _selectedAssessmentId;

  // 5.6: Validation banner state
  bool _showValidationBanner = false;
  String _validationHeading = '';
  String _validationMessage = '';

  @override
  void initState() {
    super.initState();
    _loadPlanDetails();
  }

  // 5.6: Show top-of-screen validation banner (matches plans_page pattern)
  void _showBanner({required String heading, required String message}) {
    setState(() {
      _showValidationBanner = true;
      _validationHeading = heading;
      _validationMessage = message;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showValidationBanner = false);
    });
  }

  Future<void> _loadPlanDetails() async {
    setState(() => _isLoading = true);
    try {
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

      final assessments = await _planService.getUserAssessments(widget.planId);
      setState(() {
        _assessments = assessments;
        if (assessments.isNotEmpty) {
          _selectedAssessmentId = assessments.last['_id'] as String?;
          _showResults = true;
        }
      });

      if (assessments.isNotEmpty) {
        await _loadChartData();
      }
    } catch (e) {
      // ignore: avoid_print
      debugPrint('Error loading plan: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadChartData({String? assessmentId}) async {
    final id = assessmentId ?? _selectedAssessmentId ?? '12122122';
    setState(() => _isLoadingChart = true);
    try {
      final chartData = await _resultsApiService.getLineChartData(
        assessmentId: id,
        type: 'all',
        planId: widget.planId,
      );

      if (mounted) {
        setState(() => _chartData = chartData);
      }
    } catch (e) {
      // ignore: avoid_print
      debugPrint('Error loading chart data: $e');
    } finally {
      if (mounted) setState(() => _isLoadingChart = false);
    }
  }

  Future<void> _updatePlan() async {
    final title = _titleController.text.trim();
    final aim = _aimController.text.trim();
    final navigate = _navigateController.text.trim();
    final elevate = _elevateController.text.trim();

    // Validation — all use the banner with heading "Invalid values"
    if (title.isEmpty) {
      _showBanner(
        heading: 'Invalid values',
        message: "Plan name shouldn't be empty",
      );
      return;
    }

    if (aim.isEmpty) {
      _showBanner(
        heading: 'Invalid values',
        message: "AIM shouldn't be empty",
      );
      return;
    }

    if (navigate.isEmpty || navigate.length < 5) {
      _showBanner(
        heading: 'Invalid values',
        message: 'NAVIGATE should have a minimum of 5 characters',
      );
      return;
    }

    // 5.6: ELEVATE validation
    if (_assessments.isNotEmpty) {
      if (elevate.isEmpty) {
        _showBanner(
          heading: 'Invalid values',
          message: "ELEVATE shouldn't empty",
        );
        return;
      }
      if (elevate.length < 5) {
        _showBanner(
          heading: 'Invalid values',
          message: 'ELEVATE should have a minimum of 5 characters',
        );
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      final success = await _planService.updatePlan(
        planId: widget.planId,
        title: title,
        description: aim,
        contingency: navigate,
        improve: _assessments.isNotEmpty ? elevate : (_plan?.improve ?? ''),
      );

      if (!mounted) return;
      if (success) {
        // 5.7: Exact success message format
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title plan edited successfully.'),
            backgroundColor: Colors.green,
          ),
        );
        // 5.7: Navigate back to plans screen
        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/goals');
        }
      }
    } catch (e) {
      if (!mounted) return;
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
        child: const Icon(
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
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.30),
                blurRadius: 2.32,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            maxLength: maxLines > 1 ? maxLength : null,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF0147D9),
                  width: 1.5,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: maxLines > 1 ? 12 : 14,
              ),
              counterText: maxLines > 1 ? null : '',
            ),
            buildCounter: maxLines > 1
                ? (context,
                    {required currentLength,
                    required isFocused,
                    maxLength}) {
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 5.8: Gray background — iOS-standard form background
      backgroundColor: const Color(0xFFF5F5F5),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomFloatingBottomNav(),
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
      body: Column(
        children: [
          // 5.6: Validation banner (red, heading + message)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: _showValidationBanner
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _validationHeading,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            _validationMessage,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),

          // Main content
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 5.8: White card wrapping all form fields (iOS grouped form style)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xFFE8E8E8),
                              width: 0.8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _buildTextField(
                                label: 'PLAN NAME:',
                                controller: _titleController,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                label: 'AIM:',
                                controller: _aimController,
                                info: 'Align your goals with your mission. Innovate your strategies to achieve your goals. Measureable indicators of success to track & improve.',
                                maxLines: 6,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                label: 'NAVIGATE:',
                                controller: _navigateController,
                                info: 'Write down the possible challenges that you will face and visualise effective tactics to overcome these adversities so that you are well prepared.',
                                maxLines: 6,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ALPHA PERFORMANCE section — no card wrapper
                        const Text(
                          'ALPHA PERFORMANCE:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Assessment Taken row with 5 circles
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Assessment Taken',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                final isFilled = index < _assessments.length;
                                return Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isFilled
                                        ? const Color(0xFF0147D9)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: const Color(0xFF0147D9),
                                      width: 2,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _assessments.isEmpty
                              ? 'You have not assessed your plan yet'
                              : 'You have completed ${_assessments.length} assessment${_assessments.length > 1 ? 's' : ''}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Buttons row: Start Assessment + View/Hide Results
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                ref.read(currentPlanProvider.notifier).state = _plan;
                                context.push('/assessment/${widget.planId}');
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF0147D9)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Start Assessment',
                                style: TextStyle(
                                  color: Color(0xFF0147D9),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (_assessments.isNotEmpty) ...[
                              const SizedBox(width: 10),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() => _showResults = !_showResults);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFF0147D9)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  _showResults ? 'Hide Results' : 'View Results',
                                  style: const TextStyle(
                                    color: Color(0xFF0147D9),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),

                        // Result + ELEVATE — shown when _showResults is true
                        if (_showResults) ...[
                          const SizedBox(height: 20),

                          // Result header
                          const Text(
                            'Result',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Assessment dropdown
                          if (_assessments.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xFFDDDDDD)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.22),
                                    blurRadius: 2.22,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedAssessmentId,
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFF0147D9),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    fontFamily: 'Poppins',
                                  ),
                                  items: _assessments.map((a) {
                                    final id = a['_id'] as String? ?? '';
                                    final raw = a['createdAt']?.toString() ?? '';
                                    final date = raw.length >= 10
                                        ? raw.substring(0, 10)
                                        : 'Unknown';
                                    return DropdownMenuItem<String>(
                                      value: id,
                                      child: Text('Assessment — $date'),
                                    );
                                  }).toList(),
                                  onChanged: (id) {
                                    if (id != null &&
                                        id != _selectedAssessmentId) {
                                      setState(
                                          () => _selectedAssessmentId = id);
                                      _loadChartData(assessmentId: id);
                                    }
                                  },
                                ),
                              ),
                            ),
                          const SizedBox(height: 10),

                          // Chart or no-data box
                          _isLoadingChart
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : _chartData != null && _chartData!.isNotEmpty
                                  ? AssessmentLineChart(
                                      chartData: _chartData!,
                                      type: 'all',
                                    )
                                  : Container(
                                      height: 120,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF0F0F0),
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'No Data Available For This User',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                          const SizedBox(height: 20),

                          // ELEVATE field
                          _buildTextField(
                            label: 'ELEVATE:',
                            controller: _elevateController,
                            info: 'Focus on implementing actions to enhance your performance and continually improve your results for next time. Through regular self-assessment, seeking feedback, and adjusting your strategies, you can achieve ongoing improvement.',
                            maxLines: 6,
                          ),
                        ],

                        const SizedBox(height: 24),

                        // 5.9: Cancel (left, text) + Update (right, expanded primary button)
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                    if (context.canPop()) {
                                      context.pop();
                                    } else {
                                      context.go('/goals');
                                    }
                                  },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                disabledBackgroundColor: const Color(0xFF0147D9),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          
                            const Spacer(),
                            // 6.5: Show spinner when creating; button stays blue (no grey-out)
                            ElevatedButton(
                               onPressed: _isLoading ? null : _updatePlan,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0147D9),
                                disabledBackgroundColor: const Color(0xFF0147D9),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child:_isLoading
                                  ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : const Text(
                                      'Update',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                           
                          ],
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
          ),
        ],
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
