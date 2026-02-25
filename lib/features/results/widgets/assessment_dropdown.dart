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
  // 7.9b: Expand by default so the list is visible immediately
  bool isExpanded = true;

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final selectedAssessment = ref.watch(selectedAssessmentProvider);
    final showAll = ref.watch(showAllChartsProvider);

    // 7.9c: Build trigger label with name + created date
    String triggerLabel;
    if (showAll) {
      triggerLabel = 'All Assessments';
    } else if (selectedAssessment != null) {
      triggerLabel =
          '${selectedAssessment.name}  •  ${_formatDate(selectedAssessment.createdAt)}';
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isExpanded
                    ? const Color(0xFF0147D9)
                    : Colors.grey.shade400,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    triggerLabel,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: selectedAssessment != null || showAll
                          ? FontWeight.w500
                          : FontWeight.normal,
                      color: selectedAssessment != null || showAll
                          ? Colors.black87
                          : Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: isExpanded
                      ? const Color(0xFF0147D9)
                      : Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),

        // Dropdown list
        if (isExpanded)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF0147D9)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.35,
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
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0147D9).withValues(alpha: 0.06)
                          : Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color: index < widget.assessments.length - 1
                              ? Colors.grey.shade200
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 7.9c: Assessment name
                              Text(
                                assessment.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? const Color(0xFF0147D9)
                                      : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 2),
                              // 7.9c: Created At date
                              Text(
                                'Created: ${_formatDate(assessment.createdAt)}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            size: 18,
                            color: Color(0xFF0147D9),
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
