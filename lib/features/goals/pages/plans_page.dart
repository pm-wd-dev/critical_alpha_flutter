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
  // 5.5: dynamic color — green for complete, red for uncomplete
  Color _statusColor = const Color(0xFF4CAF50);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(plansControllerProvider.notifier).refreshPlans();
    });
  }

  void _showStatusBanner(String message, {Color color = const Color(0xFF4CAF50)}) {
    setState(() {
      _showPlanStatus = true;
      _statusMessage = message;
      _statusColor = color;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showPlanStatus = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final plansState = ref.watch(plansControllerProvider);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      body: Column(
        children: [
          // 5.5: Status banner — color driven by action (green/red)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              color: _statusColor,
              child: _showPlanStatus
                  ? SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Plan Status',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              _statusMessage,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
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

          // Header
          Container(
            color: const Color(0xFFEEF2FF),
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

                    const Text(
                      'Plans',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.black87,
                      ),
                    ),

                    // 5.1: App logo — 40×40 circle, 7px padding for visible icon
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
                            padding: const EdgeInsets.all(7),
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
                : Container(
                    margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 12,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        if (plansState.plans.isEmpty)
                          Positioned.fill(
                            child: _buildEmptyState(),
                          )
                        else
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                                child: Column(
                                  children: [
                                    // Hint for delete functionality
                                    if (plansState.plans.isNotEmpty)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        margin: const EdgeInsets.only(bottom: 12),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.info_outline,
                                              size: 16,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                'Swipe left or long press on a plan to delete it',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ...plansState.plans.map((plan) => _buildPlanCard(plan)),
                                    const SizedBox(height: 24),
                                    GestureDetector(
                                      onTap: _showClearAllDialog,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF0147D9),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: const Text(
                                          'Clear All',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        // FAB — positioned above bottom nav
                        Positioned(
                          bottom: 24,
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
          ),
        ],
      ),
    );
  }

  // 5.2: iOS-matched empty state with image asset
  Widget _buildEmptyState() {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 220,
                height: 220,
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppAssets.goalsImage,
                    width: 220,
                    height: 220,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.assignment_outlined,
                      size: 100,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8,),
            const Text(
              'Add Your First Plan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
          ],
        ),
    );
  }

  // Plan card — two-tile layout matching design
  Widget _buildPlanCard(PlanModel plan) {
    final isComplete = plan.status == 'true';
    const tileColor = Color(0xFFDDE6F5);

    return Dismissible(
      key: Key(plan.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        // Show confirmation dialog
        return await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              'Delete Plan',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            content: Text(
              'Are you sure you want to delete "${plan.title}"? This action cannot be undone.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) async {
        // Delete the plan
        try {
          print('🔥 Deleting plan via swipe: ${plan.id}');
          await ref.read(plansControllerProvider.notifier).deletePlan(plan.id);
          _showStatusBanner(
            'Plan deleted successfully',
            color: const Color(0xFF4CAF50),
          );
        } catch (e) {
          print('❌ Failed to delete plan via swipe: $e');
          _showStatusBanner(
            'Failed to delete plan: ${e.toString()}',
            color: Colors.red,
          );
          // Rebuild the list to restore the item since deletion failed
          ref.read(plansControllerProvider.notifier).refreshPlans();
        }
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 28,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left: title tile (tappable → detail, long press → delete)
            Expanded(
              child: GestureDetector(
                onTap: () => context.push('/plan/${plan.id}'),
                onLongPress: () {
                  // Show delete confirmation dialog on long press
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text(
                        'Delete Plan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      content: Text(
                        'Are you sure you want to delete "${plan.title}"? This action cannot be undone.',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            try {
                              print('🔥 Deleting plan from UI: ${plan.id}');
                              await ref.read(plansControllerProvider.notifier).deletePlan(plan.id);
                              _showStatusBanner(
                                'Plan deleted successfully',
                                color: const Color(0xFF4CAF50),
                              );
                            } catch (e) {
                              print('❌ Failed to delete plan from UI: $e');
                              _showStatusBanner(
                                'Failed to delete plan: ${e.toString()}',
                                color: Colors.red,
                              );
                            }
                          },
                          style: TextButton.styleFrom(foregroundColor: Colors.red),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    plan.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: isComplete ? Colors.grey : Colors.black87,
                      decoration: isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Right: checkbox tile
            GestureDetector(
              onTap: () async {
                final wasComplete = isComplete;
                await ref
                    .read(plansControllerProvider.notifier)
                    .updatePlanStatus(plan.id, !isComplete);
                if (!wasComplete) {
                  _showStatusBanner(
                    'Plan Completed Successfully',
                    color: const Color(0xFF4CAF50),
                  );
                } else {
                  _showStatusBanner(
                    'Plan set to uncomplete successfully',
                    color: Colors.red,
                  );
                }
              },
              child: Container(
                width: 64,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: isComplete ? const Color(0xFF0147D9) : tileColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.check,
                  size: 24,
                  color: Colors.white
                ),
              ),
            ),
          ],
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
              _showStatusBanner(
                'All Plans Cleared',
                color: const Color(0xFF4CAF50),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
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
