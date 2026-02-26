import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/bottom_navigation.dart';
import '../providers/results_provider.dart';
import '../widgets/assessment_dropdown.dart';
import '../widgets/assessment_line_chart.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  final String? planId;

  const ResultsScreen({super.key, this.planId});

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  @override
  void initState() {
    super.initState();
    _refreshAssessments();
  }

  @override
  void didUpdateWidget(ResultsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if planId changed
    if (widget.planId != oldWidget.planId) {
      _refreshAssessments();
    }
  }

  void _refreshAssessments() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Set the plan ID if provided
      if (widget.planId != null) {
        ref.read(currentPlanIdProvider.notifier).state = widget.planId;
      }

      // Force refresh all assessments (for dropdown)
      ref.invalidate(allAssessmentsProvider);

      // Also refresh plan-specific assessments if needed
      final planId = widget.planId ?? ref.read(currentPlanIdProvider);
      if (planId != null) {
        ref.invalidate(assessmentsProvider(planId));
      }

      // Clear the selected assessment first
      ref.read(selectedAssessmentProvider.notifier).state = null;

      // Wait for assessments to load and select the latest one if coming from assessment
      if (widget.planId != null) {
        Future.delayed(const Duration(milliseconds: 500), () {
          // Use all assessments but filter for the specific plan to find the latest
          final allAssessmentsAsync = ref.read(allAssessmentsProvider);
          allAssessmentsAsync.whenData((assessments) {
            // Find the latest assessment for this specific plan
            final planAssessments = assessments.where((a) => a.planId == widget.planId).toList();
            if (planAssessments.isNotEmpty) {
              // Select the most recent assessment for this plan
              ref.read(selectedAssessmentProvider.notifier).state = planAssessments.first;
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use all assessments for the dropdown to show assessments from all plans
    final assessmentsAsync = ref.watch(allAssessmentsProvider);
    final selectedAssessment = ref.watch(selectedAssessmentProvider);
    final showAll = ref.watch(showAllChartsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Main header
          Container(
            color: Colors.white,
            child: SafeArea(
              bottom: false,
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => context.go('/home'),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0147D9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),

                    // Title
                    const Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.black87,
                      ),
                    ),

                    // CriticalAlpha icon - Opens Drawer
                    GestureDetector(
                      onTap: () => openDrawer(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0147D9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              AppAssets.drawerIcon,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
            // Body Content
            Expanded(
              child: assessmentsAsync.when(
                data: (assessments) {
                  if (assessments.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Data Available For This User',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      // Assessment Dropdown
                      AssessmentDropdown(assessments: assessments),

                      // Main Content Area
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (!showAll && selectedAssessment == null)
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 100),
                                  child: Text(
                                    'Select Any Assessment From Dropdown To View Graph',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF999999),
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                              // Chart Display for single assessment
                              if (!showAll && selectedAssessment != null)
                                Consumer(
                                  builder: (context, ref, child) {
                                    final chartDataAsync =
                                        ref.watch(chartDataProvider);

                                    return chartDataAsync.when(
                                      data: (chartData) {
                                        if (chartData == null ||
                                            chartData.isEmpty) {
                                          return const Padding(
                                            padding: EdgeInsets.all(32.0),
                                            child: Text(
                                              'No chart data available',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        }

                                        return Column(
                                          children: [
                                            AssessmentLineChart(
                                              chartData: chartData,
                                              type: 'single',
                                              selectedAssessmentName:
                                                  selectedAssessment.name,
                                            ),
                                            // Show All button below the chart
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 20),
                                              child: _buildShowAllButton(context, ref),
                                            ),
                                          ],
                                        );
                                      },
                                      loading: () => const Padding(
                                        padding: EdgeInsets.all(32.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                      error: (error, stack) => Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Text(
                                          'Error loading chart: $error',
                                          style: const TextStyle(
                                              color: Colors.red),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              // Show All Charts
                              if (showAll)
                                Consumer(
                                  builder: (context, ref, child) {
                                    final allChartsAsync =
                                        ref.watch(allChartsDataProvider);

                                    return allChartsAsync.when(
                                      data: (chartData) {
                                        if (chartData == null ||
                                            chartData.isEmpty) {
                                          return const Padding(
                                            padding: EdgeInsets.all(32.0),
                                            child: Text(
                                              'No chart data available',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        }

                                        return Column(
                                          children: [
                                            AssessmentLineChart(
                                              chartData: chartData,
                                              type: 'all',
                                            ),
                                            // Show Individual button below the chart
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 20),
                                              child: _buildShowAllButton(context, ref),
                                            ),
                                          ],
                                        );
                                      },
                                      loading: () => const Padding(
                                        padding: EdgeInsets.all(32.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                      error: (error, stack) => Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Text(
                                          'Error loading charts: $error',
                                          style: const TextStyle(
                                              color: Colors.red),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Text(
                    'Error loading assessments: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildShowAllButton(BuildContext context, WidgetRef ref) {
    final showAll = ref.watch(showAllChartsProvider);
    final planId = widget.planId ?? ref.watch(currentPlanIdProvider);
    final assessmentsAsync = ref.watch(assessmentsProvider(planId));

    return ElevatedButton(
      onPressed: () {
        ref.read(showAllChartsProvider.notifier).state = !showAll;
        if (showAll) {
          // When switching from "Show All" to "Show Individual", auto-select first assessment
          assessmentsAsync.whenData((assessments) {
            if (assessments.isNotEmpty) {
              ref.read(selectedAssessmentProvider.notifier).state = assessments.first;
            }
          });
        } else {
          // When switching from "Show Individual" to "Show All", clear selection
          ref.read(selectedAssessmentProvider.notifier).state = null;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        showAll ? 'Show Individual' : 'Show all',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}