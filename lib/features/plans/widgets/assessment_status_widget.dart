import 'package:flutter/material.dart';

class AssessmentStatusWidget extends StatelessWidget {
  final int assessmentCount;
  final String? lastAssessmentDate;

  const AssessmentStatusWidget({
    super.key,
    required this.assessmentCount,
    this.lastAssessmentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Assessment Taken',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              // Star rating indicators
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < assessmentCount ? Icons.star : Icons.star_border,
                    size: 20,
                    color: index < assessmentCount
                        ? Colors.amber
                        : Colors.grey.shade400,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            assessmentCount == 0
                ? 'You have not assessed your plan yet'
                : 'Last assessment: ${lastAssessmentDate ?? 'Unknown'}',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}