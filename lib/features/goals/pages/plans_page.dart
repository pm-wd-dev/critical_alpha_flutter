import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/bottom_navigation.dart';
import '../controllers/plans_controller.dart';
import '../models/plan_model.dart';

class PlansPage extends ConsumerStatefulWidget {
  const PlansPage({super.key});

  @override
  ConsumerState<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends ConsumerState<PlansPage> {
  bool _showPlanStatus = false;
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    // Refresh plans when page loads
    Future.microtask(() {
      ref.read(plansControllerProvider.notifier).refreshPlans();
    });
  }

  void _showSuccessStatus(String message) {
    setState(() {
      _showPlanStatus = true;
      _statusMessage = message;
    });

    // Hide after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showPlanStatus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final plansState = ref.watch(plansControllerProvider);

    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Green status header (shown when plan is completed)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              color: const Color(0xFF4CAF50),
              child: _showPlanStatus
                  ? SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Plan Status',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _statusMessage,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),

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
                      'Plans',
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

          // Plans content
          Expanded(
            child: plansState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      // Plans list or empty state
                      if (plansState.plans.isEmpty)
                        _buildEmptyState()
                      else
                        SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                          child: Column(
                            children: [
                              // All plan cards
                              ...plansState.plans.map((plan) => _buildPlanCard(plan)),
                              // Clear All button below the last item
                              if (plansState.plans.isNotEmpty) ...[
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: _showClearAllDialog,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 36,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0147D9),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Text(
                                      'Clear All',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                      // Floating Action Button - positioned above bottom nav
                      Positioned(
                        bottom: 16,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => context.push('/goals/create'),
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0147D9),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3D0147D9),
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open_rounded,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Plans Yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap + to create your first plan',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(PlanModel plan) {
    final isComplete = plan.status == 'true';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            // Navigate to plan detail page
            context.push('/plan/${plan.id}');
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                // Plan title
                Expanded(
                  child: Text(
                    plan.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: isComplete ? Colors.grey : Colors.black87,
                      decoration: isComplete ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),

                // Checkmark button
                GestureDetector(
                  onTap: () async {
                    await ref.read(plansControllerProvider.notifier)
                        .updatePlanStatus(plan.id, !isComplete);

                    if (!isComplete) {
                      _showSuccessStatus('Plan Completed Successfully');
                    }
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isComplete
                          ? const Color(0xFF0147D9)
                          : const Color(0xFF0147D9).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.check,
                      color: isComplete ? Colors.white : const Color(0xFF0147D9),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showClearAllDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Clear All Plans',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        content: const Text(
          'Are you sure you want to delete all plans? This action cannot be undone.',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(plansControllerProvider.notifier).deleteAllPlans();
              _showSuccessStatus('All Plans Cleared');
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text(
              'Clear All',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}