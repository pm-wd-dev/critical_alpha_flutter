import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../routes/route_constants.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Goals'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push(RouteConstants.addGoal),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Completed'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGoalsList('active'),
          _buildGoalsList('completed'),
          _buildGoalsList('all'),
        ],
      ),
    );
  }

  Widget _buildGoalsList(String type) {
    return ListView(
      padding: AppPadding.medium,
      children: [
        if (type == 'active' || type == 'all') ...[
          _buildGoalCard(
            'Learn Flutter Development',
            'Master Flutter framework and build mobile apps',
            'Mobile Development',
            0.75,
            DateTime.now().add(const Duration(days: 14)),
            AppColors.primary,
          ),
          _buildGoalCard(
            'Complete React Course',
            'Finish the advanced React.js online course',
            'Web Development',
            0.45,
            DateTime.now().add(const Duration(days: 21)),
            AppColors.secondary,
          ),
          _buildGoalCard(
            'Read 5 Tech Books',
            'Read books about software architecture and design patterns',
            'Learning',
            0.60,
            DateTime.now().add(const Duration(days: 30)),
            AppColors.accent,
          ),
        ],
        if (type == 'completed' || type == 'all') ...[
          _buildGoalCard(
            'Learn Dart Fundamentals',
            'Complete understanding of Dart programming language',
            'Programming',
            1.0,
            DateTime.now().subtract(const Duration(days: 5)),
            AppColors.success,
            isCompleted: true,
          ),
          _buildGoalCard(
            'Build Portfolio Website',
            'Create a professional portfolio showcasing projects',
            'Web Development',
            1.0,
            DateTime.now().subtract(const Duration(days: 12)),
            AppColors.success,
            isCompleted: true,
          ),
        ],
      ],
    );
  }

  Widget _buildGoalCard(
    String title,
    String description,
    String category,
    double progress,
    DateTime deadline,
    Color color, {
    bool isCompleted = false,
  }) {
    final daysRemaining = deadline.difference(DateTime.now()).inDays;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: AppPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppBorderRadius.small),
                  ),
                  child: Icon(
                    isCompleted ? Icons.check_circle : Icons.track_changes,
                    color: color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 12,
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isCompleted) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      Text(
                        daysRemaining > 0
                            ? '$daysRemaining days left'
                            : daysRemaining == 0
                                ? 'Due today'
                                : '${-daysRemaining} days overdue',
                        style: TextStyle(
                          fontSize: 11,
                          color: daysRemaining < 0
                              ? AppColors.error
                              : daysRemaining <= 3
                                  ? AppColors.warning
                                  : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 24,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            if (!isCompleted) ...[
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.grey200,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 6,
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}