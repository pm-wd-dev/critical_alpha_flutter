// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentModelImpl _$$AssessmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      type: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
      status: $enumDecode(_$AssessmentStatusEnumMap, json['status']),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQuestions: (json['total_questions'] as num).toInt(),
      completedQuestions: (json['completed_questions'] as num?)?.toInt() ?? 0,
      timeLimitMinutes: (json['time_limit_minutes'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      result: json['result'] == null
          ? null
          : AssessmentResult.fromJson(json['result'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AssessmentModelImplToJson(
        _$AssessmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'type': _$AssessmentTypeEnumMap[instance.type]!,
      'status': _$AssessmentStatusEnumMap[instance.status]!,
      'questions': instance.questions,
      'total_questions': instance.totalQuestions,
      'completed_questions': instance.completedQuestions,
      'time_limit_minutes': instance.timeLimitMinutes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'started_at': instance.startedAt?.toIso8601String(),
      'result': instance.result,
      'metadata': instance.metadata,
    };

const _$AssessmentTypeEnumMap = {
  AssessmentType.skill: 'skill',
  AssessmentType.knowledge: 'knowledge',
  AssessmentType.personality: 'personality',
  AssessmentType.aptitude: 'aptitude',
  AssessmentType.survey: 'survey',
  AssessmentType.quiz: 'quiz',
};

const _$AssessmentStatusEnumMap = {
  AssessmentStatus.notStarted: 'not_started',
  AssessmentStatus.inProgress: 'in_progress',
  AssessmentStatus.completed: 'completed',
  AssessmentStatus.expired: 'expired',
  AssessmentStatus.paused: 'paused',
};

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      options: (json['options'] as List<dynamic>)
          .map((e) => AnswerOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswer: json['correct_answer'] as String?,
      maxScore: (json['max_score'] as num?)?.toDouble() ?? 1.0,
      order: (json['order'] as num?)?.toInt() ?? 1,
      explanation: json['explanation'] as String?,
      hint: json['hint'] as String?,
      category: json['category'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isRequired: json['is_required'] as bool? ?? true,
      answer: json['answer'] == null
          ? null
          : AnswerModel.fromJson(json['answer'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'options': instance.options,
      'correct_answer': instance.correctAnswer,
      'max_score': instance.maxScore,
      'order': instance.order,
      'explanation': instance.explanation,
      'hint': instance.hint,
      'category': instance.category,
      'tags': instance.tags,
      'is_required': instance.isRequired,
      'answer': instance.answer,
      'metadata': instance.metadata,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'multiple_choice',
  QuestionType.singleChoice: 'single_choice',
  QuestionType.textInput: 'text_input',
  QuestionType.rating: 'rating',
  QuestionType.boolean: 'boolean',
  QuestionType.scale: 'scale',
  QuestionType.ranking: 'ranking',
};

_$AnswerOptionModelImpl _$$AnswerOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnswerOptionModelImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      value: json['value'] as String?,
      isCorrect: json['isCorrect'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 1,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AnswerOptionModelImplToJson(
        _$AnswerOptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'value': instance.value,
      'isCorrect': instance.isCorrect,
      'order': instance.order,
      'description': instance.description,
      'metadata': instance.metadata,
    };

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      questionId: json['questionId'] as String,
      value: json['value'] as String,
      selectedOptions: (json['selectedOptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      answeredAt: DateTime.parse(json['answered_at'] as String),
      timeTakenSeconds: (json['time_taken_seconds'] as num?)?.toInt(),
      textValue: json['textValue'] as String?,
      numericValue: (json['numericValue'] as num?)?.toDouble(),
      booleanValue: json['booleanValue'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'value': instance.value,
      'selectedOptions': instance.selectedOptions,
      'answered_at': instance.answeredAt.toIso8601String(),
      'time_taken_seconds': instance.timeTakenSeconds,
      'textValue': instance.textValue,
      'numericValue': instance.numericValue,
      'booleanValue': instance.booleanValue,
      'metadata': instance.metadata,
    };

_$AssessmentResultImpl _$$AssessmentResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentResultImpl(
      assessmentId: json['assessmentId'] as String,
      score: (json['score'] as num).toDouble(),
      maxScore: (json['max_score'] as num).toDouble(),
      passed: json['passed'] as bool? ?? false,
      completionTimeMinutes: (json['completion_time_minutes'] as num?)?.toInt(),
      completedAt: DateTime.parse(json['completed_at'] as String),
      feedback: json['feedback'] as String?,
      grade: json['grade'] as String?,
      categoryScores: (json['categoryScores'] as List<dynamic>?)
          ?.map((e) => CategoryScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      strengths: (json['strengths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      improvements: (json['improvements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      detailed: json['detailed'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AssessmentResultImplToJson(
        _$AssessmentResultImpl instance) =>
    <String, dynamic>{
      'assessmentId': instance.assessmentId,
      'score': instance.score,
      'max_score': instance.maxScore,
      'passed': instance.passed,
      'completion_time_minutes': instance.completionTimeMinutes,
      'completed_at': instance.completedAt.toIso8601String(),
      'feedback': instance.feedback,
      'grade': instance.grade,
      'categoryScores': instance.categoryScores,
      'strengths': instance.strengths,
      'improvements': instance.improvements,
      'detailed': instance.detailed,
    };

_$CategoryScoreImpl _$$CategoryScoreImplFromJson(Map<String, dynamic> json) =>
    _$CategoryScoreImpl(
      category: json['category'] as String,
      score: (json['score'] as num).toDouble(),
      maxScore: (json['max_score'] as num).toDouble(),
      questionCount: (json['question_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CategoryScoreImplToJson(_$CategoryScoreImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'score': instance.score,
      'max_score': instance.maxScore,
      'question_count': instance.questionCount,
    };
