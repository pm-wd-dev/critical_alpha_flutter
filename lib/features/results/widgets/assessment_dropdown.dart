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
  ConsumerState<AssessmentDropdown> createState() =>
      _AssessmentDropdownState();
}

class _AssessmentDropdownState extends ConsumerState<AssessmentDropdown> {
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    final selectedAssessment = ref.watch(selectedAssessmentProvider);
    final showAll = ref.watch(showAllChartsProvider);

    String triggerLabel;
    if (showAll) {
      triggerLabel = 'All Assessments';
    } else if (selectedAssessment != null) {
      triggerLabel = selectedAssessment.name;
    } else {
      triggerLabel = 'Select Assessment';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Dropdown trigger
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    triggerLabel,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: selectedAssessment != null || showAll
                          ? Colors.black87
                          : const Color(0xFF999999),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color(0xFF999999),
                  size: 24,
                ),
              ],
            ),
          ),
        ),

        // Dropdown list
        if (isExpanded)
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.assessments.length,
              itemBuilder: (context, index) {
                final assessment = widget.assessments[index];
                final isSelected = selectedAssessment?.id == assessment.id &&
                    !showAll;

                return InkWell(
                  onTap: () {
                    ref.read(selectedAssessmentProvider.notifier).state =
                        assessment;
                    ref.read(showAllChartsProvider.notifier).state = false;
                    setState(() => isExpanded = false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFF0F4FF)
                          : Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assessment ${index + 1}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: isSelected
                                ? const Color(0xFF0147D9)
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Created At : ${assessment.createdAt.year}-${assessment.createdAt.month.toString().padLeft(2, '0')}-${assessment.createdAt.day.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.grey.shade600,
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
