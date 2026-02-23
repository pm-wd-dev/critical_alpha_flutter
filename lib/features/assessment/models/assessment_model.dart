class AssessmentCategory {
  final String id;
  final String type;
  final List<AssessmentQuestion> questions;

  AssessmentCategory({
    required this.id,
    required this.type,
    required this.questions,
  });

  factory AssessmentCategory.fromJson(Map<String, dynamic> json) {
    return AssessmentCategory(
      id: json['_id'] ?? '',
      type: json['type'] ?? '',
      questions: (json['questions'] as List? ?? [])
          .map((q) => AssessmentQuestion.fromJson(q))
          .toList(),
    );
  }
}

class AssessmentQuestion {
  final String id;
  final String text;

  AssessmentQuestion({
    required this.id,
    required this.text,
  });

  factory AssessmentQuestion.fromJson(Map<String, dynamic> json) {
    return AssessmentQuestion(
      id: json['_id'] ?? '',
      text: json['text'] ?? '',
    );
  }
}