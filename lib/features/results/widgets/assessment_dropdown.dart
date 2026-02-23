import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/assessment_model.dart';
import '../providers/results_provider.dart';

class AssessmentDropdown extends ConsumerStatefulWidget {
  final List<Assessment> assessments;

  const AssessmentDropdown({
    super.key,
    required this.assessments,
  });

  @override
  ConsumerState<AssessmentDropdown> createState() => _AssessmentDropdownState();
}

class _AssessmentDropdownState extends ConsumerState<AssessmentDropdown> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final selectedAssessment = ref.watch(selectedAssessmentProvider);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedAssessment?.name ?? 'Select Assessment',
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedAssessment != null ? Colors.black : Colors.grey,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.35,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.assessments.length,
              itemBuilder: (context, index) {
                final assessment = widget.assessments[index];
                return InkWell(
                  onTap: () {
                    ref.read(selectedAssessmentProvider.notifier).state = assessment;
                    ref.read(showAllChartsProvider.notifier).state = false;
                    setState(() {
                      isExpanded = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index < widget.assessments.length - 1
                              ? Colors.grey.shade300
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assessment ${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Created At : ${assessment.createdAt.toString().substring(0, 10)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}