import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_model.freezed.dart';
part 'assessment_model.g.dart';

@freezed
class AssessmentModel with _$AssessmentModel {
  const factory AssessmentModel({
    required String id,
    required String title,
    required String description,
    required String category,
    required AssessmentType type,
    required AssessmentStatus status,
    required List<QuestionModel> questions,
    @JsonKey(name: 'total_questions') required int totalQuestions,
    @JsonKey(name: 'completed_questions') @Default(0) int completedQuestions,
    @JsonKey(name: 'time_limit_minutes') int? timeLimitMinutes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    AssessmentResult? result,
    Map<String, dynamic>? metadata,
  }) = _AssessmentModel;

  factory AssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentModelFromJson(json);

  const AssessmentModel._();

  /// Progress as percentage (0.0 to 1.0)
  double get progress => totalQuestions > 0 ? completedQuestions / totalQuestions : 0.0;

  /// Progress as percentage (0 to 100)
  int get progressPercentage => (progress * 100).round();

  /// Whether the assessment is completed
  bool get isCompleted => status == AssessmentStatus.completed;

  /// Whether the assessment is in progress
  bool get isInProgress => status == AssessmentStatus.inProgress;

  /// Whether the assessment has not been started
  bool get isNotStarted => status == AssessmentStatus.notStarted;

  /// Time remaining in minutes (null if no time limit or not started)
  int? get timeRemainingMinutes {
    if (timeLimitMinutes == null || startedAt == null || isCompleted) return null;

    final elapsed = DateTime.now().difference(startedAt!).inMinutes;
    final remaining = timeLimitMinutes! - elapsed;
    return remaining > 0 ? remaining : 0;
  }

  /// Whether the assessment has a time limit
  bool get hasTimeLimit => timeLimitMinutes != null && timeLimitMinutes! > 0;

  /// Whether the time has expired
  bool get isTimeExpired => timeRemainingMinutes == 0;

  /// Duration taken to complete (if completed)
  Duration? get completionDuration {
    if (startedAt == null || completedAt == null) return null;
    return completedAt!.difference(startedAt!);
  }

  /// Assessment score (if completed)
  double? get score => result?.score;

  /// Next unanswered question
  QuestionModel? get nextQuestion {
    final unanswered = questions.where((q) => q.answer == null);
    return unanswered.isEmpty ? null : unanswered.first;
  }

  /// Current question index (0-based)
  int get currentQuestionIndex {
    final answered = questions.where((q) => q.answer != null).length;
    return answered < questions.length ? answered : questions.length - 1;
  }

  /// Whether can be restarted
  bool get canRestart => isCompleted || isTimeExpired;

  /// Estimated time to complete in minutes
  int get estimatedTimeMinutes {
    if (hasTimeLimit) return timeLimitMinutes!;
    return (totalQuestions * 2).clamp(5, 60); // 2 minutes per question, min 5, max 60
  }
}

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required String question,
    required QuestionType type,
    required List<AnswerOptionModel> options,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    @JsonKey(name: 'max_score') @Default(1.0) double maxScore,
    @Default(1) int order,
    String? explanation,
    String? hint,
    String? category,
    List<String>? tags,
    @JsonKey(name: 'is_required') @Default(true) bool isRequired,
    AnswerModel? answer,
    Map<String, dynamic>? metadata,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  const QuestionModel._();

  /// Whether the question has been answered
  bool get isAnswered => answer != null;

  /// Whether the answer is correct (for scored questions)
  bool get isCorrect => correctAnswer != null && answer?.value == correctAnswer;

  /// Score achieved for this question
  double get score {
    if (!isAnswered) return 0.0;
    if (correctAnswer == null) return maxScore; // Subjective question
    return isCorrect ? maxScore : 0.0;
  }

  /// Whether this is a multiple choice question
  bool get isMultipleChoice => type == QuestionType.multipleChoice;

  /// Whether this is a single choice question
  bool get isSingleChoice => type == QuestionType.singleChoice;

  /// Whether this is a text input question
  bool get isTextInput => type == QuestionType.textInput;

  /// Whether this is a rating question
  bool get isRating => type == QuestionType.rating;

  /// Whether this is a boolean (yes/no) question
  bool get isBoolean => type == QuestionType.boolean;
}

@freezed
class AnswerOptionModel with _$AnswerOptionModel {
  const factory AnswerOptionModel({
    required String id,
    required String text,
    String? value,
    @Default(false) bool isCorrect,
    @Default(1) int order,
    String? description,
    Map<String, dynamic>? metadata,
  }) = _AnswerOptionModel;

  factory AnswerOptionModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerOptionModelFromJson(json);
}

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required String questionId,
    required String value,
    List<String>? selectedOptions,
    @JsonKey(name: 'answered_at') required DateTime answeredAt,
    @JsonKey(name: 'time_taken_seconds') int? timeTakenSeconds,
    String? textValue,
    double? numericValue,
    bool? booleanValue,
    Map<String, dynamic>? metadata,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  const AnswerModel._();

  /// Time taken to answer in minutes
  double? get timeTakenMinutes => timeTakenSeconds != null ? timeTakenSeconds! / 60.0 : null;
}

@freezed
class AssessmentResult with _$AssessmentResult {
  const factory AssessmentResult({
    required String assessmentId,
    required double score,
    @JsonKey(name: 'max_score') required double maxScore,
    @JsonKey(name: 'passed') @Default(false) bool passed,
    @JsonKey(name: 'completion_time_minutes') int? completionTimeMinutes,
    @JsonKey(name: 'completed_at') required DateTime completedAt,
    String? feedback,
    String? grade,
    List<CategoryScore>? categoryScores,
    List<String>? strengths,
    List<String>? improvements,
    Map<String, dynamic>? detailed,
  }) = _AssessmentResult;

  factory AssessmentResult.fromJson(Map<String, dynamic> json) =>
      _$AssessmentResultFromJson(json);

  const AssessmentResult._();

  /// Score as percentage (0 to 100)
  double get percentage => maxScore > 0 ? (score / maxScore) * 100 : 0.0;

  /// Letter grade based on percentage
  String get letterGrade {
    if (grade != null) return grade!;

    final pct = percentage;
    if (pct >= 90) return 'A';
    if (pct >= 80) return 'B';
    if (pct >= 70) return 'C';
    if (pct >= 60) return 'D';
    return 'F';
  }

  /// Performance level
  String get performanceLevel {
    final pct = percentage;
    if (pct >= 90) return 'Excellent';
    if (pct >= 80) return 'Good';
    if (pct >= 70) return 'Average';
    if (pct >= 60) return 'Below Average';
    return 'Poor';
  }

  /// Completion time formatted
  String? get formattedCompletionTime {
    if (completionTimeMinutes == null) return null;
    final hours = completionTimeMinutes! ~/ 60;
    final minutes = completionTimeMinutes! % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

@freezed
class CategoryScore with _$CategoryScore {
  const factory CategoryScore({
    required String category,
    required double score,
    @JsonKey(name: 'max_score') required double maxScore,
    @JsonKey(name: 'question_count') @Default(0) int questionCount,
  }) = _CategoryScore;

  factory CategoryScore.fromJson(Map<String, dynamic> json) =>
      _$CategoryScoreFromJson(json);

  const CategoryScore._();

  /// Score as percentage (0 to 100)
  double get percentage => maxScore > 0 ? (score / maxScore) * 100 : 0.0;
}

// Enums
enum AssessmentType {
  @JsonValue('skill')
  skill,
  @JsonValue('knowledge')
  knowledge,
  @JsonValue('personality')
  personality,
  @JsonValue('aptitude')
  aptitude,
  @JsonValue('survey')
  survey,
  @JsonValue('quiz')
  quiz,
}

enum AssessmentStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('expired')
  expired,
  @JsonValue('paused')
  paused,
}

enum QuestionType {
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('single_choice')
  singleChoice,
  @JsonValue('text_input')
  textInput,
  @JsonValue('rating')
  rating,
  @JsonValue('boolean')
  boolean,
  @JsonValue('scale')
  scale,
  @JsonValue('ranking')
  ranking,
}

// Extensions for List<QuestionModel>
extension QuestionListExtensions on List<QuestionModel> {
  /// Get all answered questions
  List<QuestionModel> get answered => where((q) => q.isAnswered).toList();

  /// Get all unanswered questions
  List<QuestionModel> get unanswered => where((q) => !q.isAnswered).toList();

  /// Get total score
  double get totalScore => fold(0.0, (sum, question) => sum + question.score);

  /// Get maximum possible score
  double get maxScore => fold(0.0, (sum, question) => sum + question.maxScore);

  /// Get average score percentage
  double get averageScore => maxScore > 0 ? (totalScore / maxScore) * 100 : 0.0;

  /// Group questions by category
  Map<String, List<QuestionModel>> get byCategory {
    final map = <String, List<QuestionModel>>{};
    for (final question in this) {
      final category = question.category ?? 'General';
      (map[category] ??= <QuestionModel>[]).add(question);
    }
    return map;
  }
}

// Extension for List<AssessmentModel>
extension AssessmentListExtensions on List<AssessmentModel> {
  /// Get completed assessments
  List<AssessmentModel> get completed => where((a) => a.isCompleted).toList();

  /// Get in-progress assessments
  List<AssessmentModel> get inProgress => where((a) => a.isInProgress).toList();

  /// Get not started assessments
  List<AssessmentModel> get notStarted => where((a) => a.isNotStarted).toList();

  /// Group by category
  Map<String, List<AssessmentModel>> get byCategory {
    final map = <String, List<AssessmentModel>>{};
    for (final assessment in this) {
      (map[assessment.category] ??= <AssessmentModel>[]).add(assessment);
    }
    return map;
  }

  /// Get average score for completed assessments
  double get averageScore {
    final completedWithScores = completed.where((a) => a.score != null).toList();
    if (completedWithScores.isEmpty) return 0.0;

    final total = completedWithScores.fold(0.0, (sum, a) => sum + a.score!);
    return total / completedWithScores.length;
  }
}