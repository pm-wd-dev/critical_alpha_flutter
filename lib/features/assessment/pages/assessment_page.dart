import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/custom_floating_bottom_nav.dart';
import '../../plans/services/plan_service.dart';
import '../widgets/rating_card.dart';
import '../models/assessment_model.dart';

class AssessmentPage extends ConsumerStatefulWidget {
  final String planId;

  const AssessmentPage({
    super.key,
    required this.planId,
  });

  @override
  ConsumerState<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends ConsumerState<AssessmentPage> {
  final PlanService _planService = PlanService();

  int _currentCategoryIndex = 0;
  List<AssessmentCategory> _categories = [];
  final Map<String, int> _ratings = {};
  final List<Map<String, dynamic>> _submittedAssessments = [];
  bool _isLoading = true;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadAssessmentQuestions();
  }

  Future<void> _loadAssessmentQuestions() async {
    try {
      final response = await _planService.getAssessmentQuestions();
      if (response != null && response['data'] != null) {
        final data = response['data'] as List;
        setState(() {
          _categories =
              data.map((item) => AssessmentCategory.fromJson(item)).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _handleRating(String questionId, int rating) {
    setState(() {
      _ratings[questionId] = rating;
      _updateProgress();
    });
  }

  void _updateProgress() {
    final currentCategory = _categories[_currentCategoryIndex];
    final totalQuestions = currentCategory.questions.length;
    final maxScore = totalQuestions * 5;
    int currentScore = 0;

    for (var question in currentCategory.questions) {
      currentScore += _ratings[question.id] ?? 0;
    }

    setState(() {
      _progress = currentScore / maxScore;
    });
  }

  bool _validateCurrentCategory() {
    final currentCategory = _categories[_currentCategoryIndex];
    for (var question in currentCategory.questions) {
      if (!_ratings.containsKey(question.id)) {
        return false;
      }
    }
    return true;
  }

  void _nextCategory() {
    if (!_validateCurrentCategory()) {
      // 7.6: Clearer validation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please rate all questions before proceeding'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final currentCategory = _categories[_currentCategoryIndex];
    List<int> categoryRatings = [];
    int totalScore = 0;

    for (var question in currentCategory.questions) {
      final rating = _ratings[question.id] ?? 0;
      categoryRatings.add(rating);
      totalScore += rating;
    }

    _submittedAssessments.add({
      'type': currentCategory.type,
      'total': currentCategory.questions.length * 5,
      'rating': totalScore,
      'data': categoryRatings,
    });

    if (_currentCategoryIndex < _categories.length - 1) {
      setState(() {
        _currentCategoryIndex++;
        _progress = 0.0;
      });
    } else {
      context.push(
        '/assessment-complete/${widget.planId}',
        extra: _submittedAssessments,
      );
    }
  }

  String _getQuestionIcon(String questionText) {
    if (questionText.contains('Awareness') ||
        questionText.contains('Strengths')) {
      return AppAssets.awareness;
    } else if (questionText.contains('Learning') ||
        questionText.contains('Growth')) {
      return AppAssets.learning;
    } else if (questionText.contains('Performance')) {
      return AppAssets.performance;
    } else if (questionText.contains('Harnessing') ||
        questionText.contains('Abilities')) {
      return AppAssets.harnessing;
    } else {
      return AppAssets.adaptability;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Assessment')),
        body: const Center(child: Text('No assessment questions available')),
      );
    }

    final currentCategory = _categories[_currentCategoryIndex];

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
      body: Column(
        children: [
          // Category Title
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                currentCategory.type,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          // Questions List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: currentCategory.questions.length,
              itemBuilder: (context, index) {
                final question = currentCategory.questions[index];
                final currentRating = _ratings[question.id] ?? 0;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RatingCard(
                    questionText: question.text,
                    iconPath: _getQuestionIcon(question.text),
                    rating: currentRating,
                    onRatingChanged: (rating) =>
                        _handleRating(question.id, rating),
                  ),
                );
              },
            ),
          ),

          // Progress Bar (7.5: removed "Category X of Y" text)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 8,
            ),
          ),

          // Next Button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: _nextCategory,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
