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
    // Set the plan ID if provided
    if (widget.planId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(currentPlanIdProvider.notifier).state = widget.planId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final planId = widget.planId ?? ref.watch(currentPlanIdProvider);
    final assessmentsAsync = ref.watch(assessmentsProvider(planId));
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
                  // Auto-select first assessment if available and none selected
                  if (assessments.isNotEmpty && selectedAssessment == null && !showAll) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(selectedAssessmentProvider.notifier).state = assessments.first;
                    });
                  }

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

                      // 7.9d: Show All / Show Individual button always visible above chart
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Consumer(
                          builder: (context, ref, _) =>
                              _buildShowAllButton(context, ref),
                        ),
                      ),

                      // Main Content Area
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (!showAll && selectedAssessment == null)
                                const Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Text(
                                    'Select Any Assessment From Dropdown To View Graph',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                              // Chart Display
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

                                        return AssessmentLineChart(
                                          chartData: chartData,
                                          type: 'single',
                                          selectedAssessmentName:
                                              selectedAssessment.name,
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

                                        return AssessmentLineChart(
                                          chartData: chartData,
                                          type: 'all',
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

    return ElevatedButton(
      onPressed: () {
        ref.read(showAllChartsProvider.notifier).state = !showAll;
        if (!showAll) {
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