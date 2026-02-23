import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_button.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  int currentQuestionIndex = 0;
  List<int?> answers = List.filled(10, null);

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'How confident are you in setting and achieving your goals?',
      'options': ['Very confident', 'Somewhat confident', 'Neutral', 'Not very confident', 'Not confident at all'],
    },
    {
      'question': 'How often do you review and update your goals?',
      'options': ['Daily', 'Weekly', 'Monthly', 'Rarely', 'Never'],
    },
    {
      'question': 'What is your biggest challenge when working towards goals?',
      'options': ['Lack of motivation', 'Poor time management', 'Unclear objectives', 'External distractions', 'Self-doubt'],
    },
    {
      'question': 'How do you typically track your progress?',
      'options': ['Digital apps', 'Written journal', 'Mental notes', 'Ask others', 'I don\'t track progress'],
    },
    {
      'question': 'When facing setbacks, how do you typically respond?',
      'options': ['Adjust strategy and continue', 'Take a break then return', 'Seek help from others', 'Feel discouraged but push through', 'Give up on the goal'],
    },
    {
      'question': 'How important is having a deadline for your goals?',
      'options': ['Very important', 'Somewhat important', 'Neutral', 'Not very important', 'Not important at all'],
    },
    {
      'question': 'What motivates you most when working towards a goal?',
      'options': ['Personal satisfaction', 'Recognition from others', 'Financial rewards', 'Fear of failure', 'Helping others'],
    },
    {
      'question': 'How do you prefer to learn new skills?',
      'options': ['Hands-on practice', 'Reading/studying', 'Video tutorials', 'Mentoring/coaching', 'Trial and error'],
    },
    {
      'question': 'How comfortable are you with sharing your goals with others?',
      'options': ['Very comfortable', 'Somewhat comfortable', 'Neutral', 'Uncomfortable', 'Very uncomfortable'],
    },
    {
      'question': 'What type of goals do you find most challenging?',
      'options': ['Long-term goals', 'Short-term goals', 'Career-related goals', 'Personal development goals', 'Health and fitness goals'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Goal Assessment'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                '${currentQuestionIndex + 1}/${questions.length}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress indicator
          Container(
            padding: AppPadding.medium,
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / questions.length,
                  backgroundColor: AppColors.grey200,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 6,
                ),
                const SizedBox(height: 8),
                Text(
                  'Question ${currentQuestionIndex + 1} of ${questions.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Question content
          Expanded(
            child: Padding(
              padding: AppPadding.large,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: AppPadding.large,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questions[currentQuestionIndex]['question'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ...List.generate(
                            questions[currentQuestionIndex]['options'].length,
                            (index) => _buildOption(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Navigation buttons
          Container(
            padding: AppPadding.large,
            child: Row(
              children: [
                if (currentQuestionIndex > 0) ...[
                  Expanded(
                    child: OutlineButton(
                      text: 'Previous',
                      onPressed: _previousQuestion,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  flex: currentQuestionIndex == 0 ? 1 : 1,
                  child: PrimaryButton(
                    text: currentQuestionIndex == questions.length - 1
                        ? 'Complete Assessment'
                        : 'Next',
                    onPressed: answers[currentQuestionIndex] != null
                        ? _nextQuestion
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(int optionIndex) {
    final isSelected = answers[currentQuestionIndex] == optionIndex;
    final option = questions[currentQuestionIndex]['options'][optionIndex];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _selectOption(optionIndex),
        borderRadius: BorderRadius.circular(AppBorderRadius.medium),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.grey50,
            borderRadius: BorderRadius.circular(AppBorderRadius.medium),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.grey400,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 12,
                        color: AppColors.white,
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.textPrimary,
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectOption(int optionIndex) {
    setState(() {
      answers[currentQuestionIndex] = optionIndex;
    });
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _completeAssessment();
    }
  }

  void _completeAssessment() {
    // TODO: Process assessment results
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Assessment completed! Check your results.'),
        backgroundColor: AppColors.success,
      ),
    );
  }
}