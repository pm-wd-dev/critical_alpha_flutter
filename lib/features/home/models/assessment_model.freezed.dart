// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentModel _$AssessmentModelFromJson(Map<String, dynamic> json) {
  return _AssessmentModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  AssessmentType get type => throw _privateConstructorUsedError;
  AssessmentStatus get status => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int get totalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_questions')
  int get completedQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_limit_minutes')
  int? get timeLimitMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  DateTime? get startedAt => throw _privateConstructorUsedError;
  AssessmentResult? get result => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentModelCopyWith<AssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentModelCopyWith<$Res> {
  factory $AssessmentModelCopyWith(
          AssessmentModel value, $Res Function(AssessmentModel) then) =
      _$AssessmentModelCopyWithImpl<$Res, AssessmentModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      AssessmentType type,
      AssessmentStatus status,
      List<QuestionModel> questions,
      @JsonKey(name: 'total_questions') int totalQuestions,
      @JsonKey(name: 'completed_questions') int completedQuestions,
      @JsonKey(name: 'time_limit_minutes') int? timeLimitMinutes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'started_at') DateTime? startedAt,
      AssessmentResult? result,
      Map<String, dynamic>? metadata});

  $AssessmentResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$AssessmentModelCopyWithImpl<$Res, $Val extends AssessmentModel>
    implements $AssessmentModelCopyWith<$Res> {
  _$AssessmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? type = null,
    Object? status = null,
    Object? questions = null,
    Object? totalQuestions = null,
    Object? completedQuestions = null,
    Object? timeLimitMinutes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? completedAt = freezed,
    Object? startedAt = freezed,
    Object? result = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AssessmentType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssessmentStatus,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      completedQuestions: null == completedQuestions
          ? _value.completedQuestions
          : completedQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimitMinutes: freezed == timeLimitMinutes
          ? _value.timeLimitMinutes
          : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AssessmentResult?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssessmentResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $AssessmentResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentModelImplCopyWith<$Res>
    implements $AssessmentModelCopyWith<$Res> {
  factory _$$AssessmentModelImplCopyWith(_$AssessmentModelImpl value,
          $Res Function(_$AssessmentModelImpl) then) =
      __$$AssessmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      AssessmentType type,
      AssessmentStatus status,
      List<QuestionModel> questions,
      @JsonKey(name: 'total_questions') int totalQuestions,
      @JsonKey(name: 'completed_questions') int completedQuestions,
      @JsonKey(name: 'time_limit_minutes') int? timeLimitMinutes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'started_at') DateTime? startedAt,
      AssessmentResult? result,
      Map<String, dynamic>? metadata});

  @override
  $AssessmentResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$AssessmentModelImplCopyWithImpl<$Res>
    extends _$AssessmentModelCopyWithImpl<$Res, _$AssessmentModelImpl>
    implements _$$AssessmentModelImplCopyWith<$Res> {
  __$$AssessmentModelImplCopyWithImpl(
      _$AssessmentModelImpl _value, $Res Function(_$AssessmentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? type = null,
    Object? status = null,
    Object? questions = null,
    Object? totalQuestions = null,
    Object? completedQuestions = null,
    Object? timeLimitMinutes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? completedAt = freezed,
    Object? startedAt = freezed,
    Object? result = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$AssessmentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AssessmentType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssessmentStatus,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      completedQuestions: null == completedQuestions
          ? _value.completedQuestions
          : completedQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimitMinutes: freezed == timeLimitMinutes
          ? _value.timeLimitMinutes
          : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AssessmentResult?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentModelImpl extends _AssessmentModel {
  const _$AssessmentModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.type,
      required this.status,
      required final List<QuestionModel> questions,
      @JsonKey(name: 'total_questions') required this.totalQuestions,
      @JsonKey(name: 'completed_questions') this.completedQuestions = 0,
      @JsonKey(name: 'time_limit_minutes') this.timeLimitMinutes,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'started_at') this.startedAt,
      this.result,
      final Map<String, dynamic>? metadata})
      : _questions = questions,
        _metadata = metadata,
        super._();

  factory _$AssessmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final AssessmentType type;
  @override
  final AssessmentStatus status;
  final List<QuestionModel> _questions;
  @override
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey(name: 'total_questions')
  final int totalQuestions;
  @override
  @JsonKey(name: 'completed_questions')
  final int completedQuestions;
  @override
  @JsonKey(name: 'time_limit_minutes')
  final int? timeLimitMinutes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;
  @override
  final AssessmentResult? result;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AssessmentModel(id: $id, title: $title, description: $description, category: $category, type: $type, status: $status, questions: $questions, totalQuestions: $totalQuestions, completedQuestions: $completedQuestions, timeLimitMinutes: $timeLimitMinutes, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt, startedAt: $startedAt, result: $result, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.completedQuestions, completedQuestions) ||
                other.completedQuestions == completedQuestions) &&
            (identical(other.timeLimitMinutes, timeLimitMinutes) ||
                other.timeLimitMinutes == timeLimitMinutes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      type,
      status,
      const DeepCollectionEquality().hash(_questions),
      totalQuestions,
      completedQuestions,
      timeLimitMinutes,
      createdAt,
      updatedAt,
      completedAt,
      startedAt,
      result,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentModelImplCopyWith<_$AssessmentModelImpl> get copyWith =>
      __$$AssessmentModelImplCopyWithImpl<_$AssessmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentModelImplToJson(
      this,
    );
  }
}

abstract class _AssessmentModel extends AssessmentModel {
  const factory _AssessmentModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String category,
      required final AssessmentType type,
      required final AssessmentStatus status,
      required final List<QuestionModel> questions,
      @JsonKey(name: 'total_questions') required final int totalQuestions,
      @JsonKey(name: 'completed_questions') final int completedQuestions,
      @JsonKey(name: 'time_limit_minutes') final int? timeLimitMinutes,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'completed_at') final DateTime? completedAt,
      @JsonKey(name: 'started_at') final DateTime? startedAt,
      final AssessmentResult? result,
      final Map<String, dynamic>? metadata}) = _$AssessmentModelImpl;
  const _AssessmentModel._() : super._();

  factory _AssessmentModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  AssessmentType get type;
  @override
  AssessmentStatus get status;
  @override
  List<QuestionModel> get questions;
  @override
  @JsonKey(name: 'total_questions')
  int get totalQuestions;
  @override
  @JsonKey(name: 'completed_questions')
  int get completedQuestions;
  @override
  @JsonKey(name: 'time_limit_minutes')
  int? get timeLimitMinutes;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'started_at')
  DateTime? get startedAt;
  @override
  AssessmentResult? get result;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentModelImplCopyWith<_$AssessmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  QuestionType get type => throw _privateConstructorUsedError;
  List<AnswerOptionModel> get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_score')
  double get maxScore => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_required')
  bool get isRequired => throw _privateConstructorUsedError;
  AnswerModel? get answer => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {String id,
      String question,
      QuestionType type,
      List<AnswerOptionModel> options,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      @JsonKey(name: 'max_score') double maxScore,
      int order,
      String? explanation,
      String? hint,
      String? category,
      List<String>? tags,
      @JsonKey(name: 'is_required') bool isRequired,
      AnswerModel? answer,
      Map<String, dynamic>? metadata});

  $AnswerModelCopyWith<$Res>? get answer;
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? type = null,
    Object? options = null,
    Object? correctAnswer = freezed,
    Object? maxScore = null,
    Object? order = null,
    Object? explanation = freezed,
    Object? hint = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? isRequired = null,
    Object? answer = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<AnswerOptionModel>,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as double,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerModel?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerModelCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $AnswerModelCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionModelImplCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$QuestionModelImplCopyWith(
          _$QuestionModelImpl value, $Res Function(_$QuestionModelImpl) then) =
      __$$QuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      QuestionType type,
      List<AnswerOptionModel> options,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      @JsonKey(name: 'max_score') double maxScore,
      int order,
      String? explanation,
      String? hint,
      String? category,
      List<String>? tags,
      @JsonKey(name: 'is_required') bool isRequired,
      AnswerModel? answer,
      Map<String, dynamic>? metadata});

  @override
  $AnswerModelCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$QuestionModelImplCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$QuestionModelImpl>
    implements _$$QuestionModelImplCopyWith<$Res> {
  __$$QuestionModelImplCopyWithImpl(
      _$QuestionModelImpl _value, $Res Function(_$QuestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? type = null,
    Object? options = null,
    Object? correctAnswer = freezed,
    Object? maxScore = null,
    Object? order = null,
    Object? explanation = freezed,
    Object? hint = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? isRequired = null,
    Object? answer = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$QuestionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<AnswerOptionModel>,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as double,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerModel?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionModelImpl extends _QuestionModel {
  const _$QuestionModelImpl(
      {required this.id,
      required this.question,
      required this.type,
      required final List<AnswerOptionModel> options,
      @JsonKey(name: 'correct_answer') this.correctAnswer,
      @JsonKey(name: 'max_score') this.maxScore = 1.0,
      this.order = 1,
      this.explanation,
      this.hint,
      this.category,
      final List<String>? tags,
      @JsonKey(name: 'is_required') this.isRequired = true,
      this.answer,
      final Map<String, dynamic>? metadata})
      : _options = options,
        _tags = tags,
        _metadata = metadata,
        super._();

  factory _$QuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  final QuestionType type;
  final List<AnswerOptionModel> _options;
  @override
  List<AnswerOptionModel> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  @JsonKey(name: 'correct_answer')
  final String? correctAnswer;
  @override
  @JsonKey(name: 'max_score')
  final double maxScore;
  @override
  @JsonKey()
  final int order;
  @override
  final String? explanation;
  @override
  final String? hint;
  @override
  final String? category;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_required')
  final bool isRequired;
  @override
  final AnswerModel? answer;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'QuestionModel(id: $id, question: $question, type: $type, options: $options, correctAnswer: $correctAnswer, maxScore: $maxScore, order: $order, explanation: $explanation, hint: $hint, category: $category, tags: $tags, isRequired: $isRequired, answer: $answer, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      type,
      const DeepCollectionEquality().hash(_options),
      correctAnswer,
      maxScore,
      order,
      explanation,
      hint,
      category,
      const DeepCollectionEquality().hash(_tags),
      isRequired,
      answer,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      __$$QuestionModelImplCopyWithImpl<_$QuestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionModel extends QuestionModel {
  const factory _QuestionModel(
      {required final String id,
      required final String question,
      required final QuestionType type,
      required final List<AnswerOptionModel> options,
      @JsonKey(name: 'correct_answer') final String? correctAnswer,
      @JsonKey(name: 'max_score') final double maxScore,
      final int order,
      final String? explanation,
      final String? hint,
      final String? category,
      final List<String>? tags,
      @JsonKey(name: 'is_required') final bool isRequired,
      final AnswerModel? answer,
      final Map<String, dynamic>? metadata}) = _$QuestionModelImpl;
  const _QuestionModel._() : super._();

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$QuestionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  QuestionType get type;
  @override
  List<AnswerOptionModel> get options;
  @override
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer;
  @override
  @JsonKey(name: 'max_score')
  double get maxScore;
  @override
  int get order;
  @override
  String? get explanation;
  @override
  String? get hint;
  @override
  String? get category;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'is_required')
  bool get isRequired;
  @override
  AnswerModel? get answer;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerOptionModel _$AnswerOptionModelFromJson(Map<String, dynamic> json) {
  return _AnswerOptionModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerOptionModel {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerOptionModelCopyWith<AnswerOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerOptionModelCopyWith<$Res> {
  factory $AnswerOptionModelCopyWith(
          AnswerOptionModel value, $Res Function(AnswerOptionModel) then) =
      _$AnswerOptionModelCopyWithImpl<$Res, AnswerOptionModel>;
  @useResult
  $Res call(
      {String id,
      String text,
      String? value,
      bool isCorrect,
      int order,
      String? description,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$AnswerOptionModelCopyWithImpl<$Res, $Val extends AnswerOptionModel>
    implements $AnswerOptionModelCopyWith<$Res> {
  _$AnswerOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? value = freezed,
    Object? isCorrect = null,
    Object? order = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerOptionModelImplCopyWith<$Res>
    implements $AnswerOptionModelCopyWith<$Res> {
  factory _$$AnswerOptionModelImplCopyWith(_$AnswerOptionModelImpl value,
          $Res Function(_$AnswerOptionModelImpl) then) =
      __$$AnswerOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      String? value,
      bool isCorrect,
      int order,
      String? description,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$AnswerOptionModelImplCopyWithImpl<$Res>
    extends _$AnswerOptionModelCopyWithImpl<$Res, _$AnswerOptionModelImpl>
    implements _$$AnswerOptionModelImplCopyWith<$Res> {
  __$$AnswerOptionModelImplCopyWithImpl(_$AnswerOptionModelImpl _value,
      $Res Function(_$AnswerOptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? value = freezed,
    Object? isCorrect = null,
    Object? order = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$AnswerOptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerOptionModelImpl implements _AnswerOptionModel {
  const _$AnswerOptionModelImpl(
      {required this.id,
      required this.text,
      this.value,
      this.isCorrect = false,
      this.order = 1,
      this.description,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$AnswerOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerOptionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String? value;
  @override
  @JsonKey()
  final bool isCorrect;
  @override
  @JsonKey()
  final int order;
  @override
  final String? description;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AnswerOptionModel(id: $id, text: $text, value: $value, isCorrect: $isCorrect, order: $order, description: $description, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerOptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, value, isCorrect,
      order, description, const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerOptionModelImplCopyWith<_$AnswerOptionModelImpl> get copyWith =>
      __$$AnswerOptionModelImplCopyWithImpl<_$AnswerOptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerOptionModelImplToJson(
      this,
    );
  }
}

abstract class _AnswerOptionModel implements AnswerOptionModel {
  const factory _AnswerOptionModel(
      {required final String id,
      required final String text,
      final String? value,
      final bool isCorrect,
      final int order,
      final String? description,
      final Map<String, dynamic>? metadata}) = _$AnswerOptionModelImpl;

  factory _AnswerOptionModel.fromJson(Map<String, dynamic> json) =
      _$AnswerOptionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String? get value;
  @override
  bool get isCorrect;
  @override
  int get order;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AnswerOptionModelImplCopyWith<_$AnswerOptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  String get questionId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  List<String>? get selectedOptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered_at')
  DateTime get answeredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_taken_seconds')
  int? get timeTakenSeconds => throw _privateConstructorUsedError;
  String? get textValue => throw _privateConstructorUsedError;
  double? get numericValue => throw _privateConstructorUsedError;
  bool? get booleanValue => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call(
      {String questionId,
      String value,
      List<String>? selectedOptions,
      @JsonKey(name: 'answered_at') DateTime answeredAt,
      @JsonKey(name: 'time_taken_seconds') int? timeTakenSeconds,
      String? textValue,
      double? numericValue,
      bool? booleanValue,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? value = null,
    Object? selectedOptions = freezed,
    Object? answeredAt = null,
    Object? timeTakenSeconds = freezed,
    Object? textValue = freezed,
    Object? numericValue = freezed,
    Object? booleanValue = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptions: freezed == selectedOptions
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeTakenSeconds: freezed == timeTakenSeconds
          ? _value.timeTakenSeconds
          : timeTakenSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      textValue: freezed == textValue
          ? _value.textValue
          : textValue // ignore: cast_nullable_to_non_nullable
              as String?,
      numericValue: freezed == numericValue
          ? _value.numericValue
          : numericValue // ignore: cast_nullable_to_non_nullable
              as double?,
      booleanValue: freezed == booleanValue
          ? _value.booleanValue
          : booleanValue // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerModelImplCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$AnswerModelImplCopyWith(
          _$AnswerModelImpl value, $Res Function(_$AnswerModelImpl) then) =
      __$$AnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String value,
      List<String>? selectedOptions,
      @JsonKey(name: 'answered_at') DateTime answeredAt,
      @JsonKey(name: 'time_taken_seconds') int? timeTakenSeconds,
      String? textValue,
      double? numericValue,
      bool? booleanValue,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$AnswerModelImplCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$AnswerModelImpl>
    implements _$$AnswerModelImplCopyWith<$Res> {
  __$$AnswerModelImplCopyWithImpl(
      _$AnswerModelImpl _value, $Res Function(_$AnswerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? value = null,
    Object? selectedOptions = freezed,
    Object? answeredAt = null,
    Object? timeTakenSeconds = freezed,
    Object? textValue = freezed,
    Object? numericValue = freezed,
    Object? booleanValue = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$AnswerModelImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptions: freezed == selectedOptions
          ? _value._selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeTakenSeconds: freezed == timeTakenSeconds
          ? _value.timeTakenSeconds
          : timeTakenSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      textValue: freezed == textValue
          ? _value.textValue
          : textValue // ignore: cast_nullable_to_non_nullable
              as String?,
      numericValue: freezed == numericValue
          ? _value.numericValue
          : numericValue // ignore: cast_nullable_to_non_nullable
              as double?,
      booleanValue: freezed == booleanValue
          ? _value.booleanValue
          : booleanValue // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerModelImpl extends _AnswerModel {
  const _$AnswerModelImpl(
      {required this.questionId,
      required this.value,
      final List<String>? selectedOptions,
      @JsonKey(name: 'answered_at') required this.answeredAt,
      @JsonKey(name: 'time_taken_seconds') this.timeTakenSeconds,
      this.textValue,
      this.numericValue,
      this.booleanValue,
      final Map<String, dynamic>? metadata})
      : _selectedOptions = selectedOptions,
        _metadata = metadata,
        super._();

  factory _$AnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerModelImplFromJson(json);

  @override
  final String questionId;
  @override
  final String value;
  final List<String>? _selectedOptions;
  @override
  List<String>? get selectedOptions {
    final value = _selectedOptions;
    if (value == null) return null;
    if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'answered_at')
  final DateTime answeredAt;
  @override
  @JsonKey(name: 'time_taken_seconds')
  final int? timeTakenSeconds;
  @override
  final String? textValue;
  @override
  final double? numericValue;
  @override
  final bool? booleanValue;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AnswerModel(questionId: $questionId, value: $value, selectedOptions: $selectedOptions, answeredAt: $answeredAt, timeTakenSeconds: $timeTakenSeconds, textValue: $textValue, numericValue: $numericValue, booleanValue: $booleanValue, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerModelImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality()
                .equals(other._selectedOptions, _selectedOptions) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeTakenSeconds, timeTakenSeconds) ||
                other.timeTakenSeconds == timeTakenSeconds) &&
            (identical(other.textValue, textValue) ||
                other.textValue == textValue) &&
            (identical(other.numericValue, numericValue) ||
                other.numericValue == numericValue) &&
            (identical(other.booleanValue, booleanValue) ||
                other.booleanValue == booleanValue) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      value,
      const DeepCollectionEquality().hash(_selectedOptions),
      answeredAt,
      timeTakenSeconds,
      textValue,
      numericValue,
      booleanValue,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      __$$AnswerModelImplCopyWithImpl<_$AnswerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerModelImplToJson(
      this,
    );
  }
}

abstract class _AnswerModel extends AnswerModel {
  const factory _AnswerModel(
      {required final String questionId,
      required final String value,
      final List<String>? selectedOptions,
      @JsonKey(name: 'answered_at') required final DateTime answeredAt,
      @JsonKey(name: 'time_taken_seconds') final int? timeTakenSeconds,
      final String? textValue,
      final double? numericValue,
      final bool? booleanValue,
      final Map<String, dynamic>? metadata}) = _$AnswerModelImpl;
  const _AnswerModel._() : super._();

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$AnswerModelImpl.fromJson;

  @override
  String get questionId;
  @override
  String get value;
  @override
  List<String>? get selectedOptions;
  @override
  @JsonKey(name: 'answered_at')
  DateTime get answeredAt;
  @override
  @JsonKey(name: 'time_taken_seconds')
  int? get timeTakenSeconds;
  @override
  String? get textValue;
  @override
  double? get numericValue;
  @override
  bool? get booleanValue;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentResult _$AssessmentResultFromJson(Map<String, dynamic> json) {
  return _AssessmentResult.fromJson(json);
}

/// @nodoc
mixin _$AssessmentResult {
  String get assessmentId => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_score')
  double get maxScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed')
  bool get passed => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_time_minutes')
  int? get completionTimeMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime get completedAt => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  List<CategoryScore>? get categoryScores => throw _privateConstructorUsedError;
  List<String>? get strengths => throw _privateConstructorUsedError;
  List<String>? get improvements => throw _privateConstructorUsedError;
  Map<String, dynamic>? get detailed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentResultCopyWith<AssessmentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentResultCopyWith<$Res> {
  factory $AssessmentResultCopyWith(
          AssessmentResult value, $Res Function(AssessmentResult) then) =
      _$AssessmentResultCopyWithImpl<$Res, AssessmentResult>;
  @useResult
  $Res call(
      {String assessmentId,
      double score,
      @JsonKey(name: 'max_score') double maxScore,
      @JsonKey(name: 'passed') bool passed,
      @JsonKey(name: 'completion_time_minutes') int? completionTimeMinutes,
      @JsonKey(name: 'completed_at') DateTime completedAt,
      String? feedback,
      String? grade,
      List<CategoryScore>? categoryScores,
      List<String>? strengths,
      List<String>? improvements,
      Map<String, dynamic>? detailed});
}

/// @nodoc
class _$AssessmentResultCopyWithImpl<$Res, $Val extends AssessmentResult>
    implements $AssessmentResultCopyWith<$Res> {
  _$AssessmentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = null,
    Object? score = null,
    Object? maxScore = null,
    Object? passed = null,
    Object? completionTimeMinutes = freezed,
    Object? completedAt = null,
    Object? feedback = freezed,
    Object? grade = freezed,
    Object? categoryScores = freezed,
    Object? strengths = freezed,
    Object? improvements = freezed,
    Object? detailed = freezed,
  }) {
    return _then(_value.copyWith(
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as double,
      passed: null == passed
          ? _value.passed
          : passed // ignore: cast_nullable_to_non_nullable
              as bool,
      completionTimeMinutes: freezed == completionTimeMinutes
          ? _value.completionTimeMinutes
          : completionTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryScores: freezed == categoryScores
          ? _value.categoryScores
          : categoryScores // ignore: cast_nullable_to_non_nullable
              as List<CategoryScore>?,
      strengths: freezed == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      improvements: freezed == improvements
          ? _value.improvements
          : improvements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      detailed: freezed == detailed
          ? _value.detailed
          : detailed // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentResultImplCopyWith<$Res>
    implements $AssessmentResultCopyWith<$Res> {
  factory _$$AssessmentResultImplCopyWith(_$AssessmentResultImpl value,
          $Res Function(_$AssessmentResultImpl) then) =
      __$$AssessmentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String assessmentId,
      double score,
      @JsonKey(name: 'max_score') double maxScore,
      @JsonKey(name: 'passed') bool passed,
      @JsonKey(name: 'completion_time_minutes') int? completionTimeMinutes,
      @JsonKey(name: 'completed_at') DateTime completedAt,
      String? feedback,
      String? grade,
      List<CategoryScore>? categoryScores,
      List<String>? strengths,
      List<String>? improvements,
      Map<String, dynamic>? detailed});
}

/// @nodoc
class __$$AssessmentResultImplCopyWithImpl<$Res>
    extends _$AssessmentResultCopyWithImpl<$Res, _$AssessmentResultImpl>
    implements _$$AssessmentResultImplCopyWith<$Res> {
  __$$AssessmentResultImplCopyWithImpl(_$AssessmentResultImpl _value,
      $Res Function(_$AssessmentResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = null,
    Object? score = null,
    Object? maxScore = null,
    Object? passed = null,
    Object? completionTimeMinutes = freezed,
    Object? completedAt = null,
    Object? feedback = freezed,
    Object? grade = freezed,
    Object? categoryScores = freezed,
    Object? strengths = freezed,
    Object? improvements = freezed,
    Object? detailed = freezed,
  }) {
    return _then(_$AssessmentResultImpl(
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as double,
      passed: null == passed
          ? _value.passed
          : passed // ignore: cast_nullable_to_non_nullable
              as bool,
      completionTimeMinutes: freezed == completionTimeMinutes
          ? _value.completionTimeMinutes
          : completionTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryScores: freezed == categoryScores
          ? _value._categoryScores
          : categoryScores // ignore: cast_nullable_to_non_nullable
              as List<CategoryScore>?,
      strengths: freezed == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      improvements: freezed == improvements
          ? _value._improvements
          : improvements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      detailed: freezed == detailed
          ? _value._detailed
          : detailed // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentResultImpl extends _AssessmentResult {
  const _$AssessmentResultImpl(
      {required this.assessmentId,
      required this.score,
      @JsonKey(name: 'max_score') required this.maxScore,
      @JsonKey(name: 'passed') this.passed = false,
      @JsonKey(name: 'completion_time_minutes') this.completionTimeMinutes,
      @JsonKey(name: 'completed_at') required this.completedAt,
      this.feedback,
      this.grade,
      final List<CategoryScore>? categoryScores,
      final List<String>? strengths,
      final List<String>? improvements,
      final Map<String, dynamic>? detailed})
      : _categoryScores = categoryScores,
        _strengths = strengths,
        _improvements = improvements,
        _detailed = detailed,
        super._();

  factory _$AssessmentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentResultImplFromJson(json);

  @override
  final String assessmentId;
  @override
  final double score;
  @override
  @JsonKey(name: 'max_score')
  final double maxScore;
  @override
  @JsonKey(name: 'passed')
  final bool passed;
  @override
  @JsonKey(name: 'completion_time_minutes')
  final int? completionTimeMinutes;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime completedAt;
  @override
  final String? feedback;
  @override
  final String? grade;
  final List<CategoryScore>? _categoryScores;
  @override
  List<CategoryScore>? get categoryScores {
    final value = _categoryScores;
    if (value == null) return null;
    if (_categoryScores is EqualUnmodifiableListView) return _categoryScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _strengths;
  @override
  List<String>? get strengths {
    final value = _strengths;
    if (value == null) return null;
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _improvements;
  @override
  List<String>? get improvements {
    final value = _improvements;
    if (value == null) return null;
    if (_improvements is EqualUnmodifiableListView) return _improvements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _detailed;
  @override
  Map<String, dynamic>? get detailed {
    final value = _detailed;
    if (value == null) return null;
    if (_detailed is EqualUnmodifiableMapView) return _detailed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AssessmentResult(assessmentId: $assessmentId, score: $score, maxScore: $maxScore, passed: $passed, completionTimeMinutes: $completionTimeMinutes, completedAt: $completedAt, feedback: $feedback, grade: $grade, categoryScores: $categoryScores, strengths: $strengths, improvements: $improvements, detailed: $detailed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentResultImpl &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.passed, passed) || other.passed == passed) &&
            (identical(other.completionTimeMinutes, completionTimeMinutes) ||
                other.completionTimeMinutes == completionTimeMinutes) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            const DeepCollectionEquality()
                .equals(other._categoryScores, _categoryScores) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._improvements, _improvements) &&
            const DeepCollectionEquality().equals(other._detailed, _detailed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assessmentId,
      score,
      maxScore,
      passed,
      completionTimeMinutes,
      completedAt,
      feedback,
      grade,
      const DeepCollectionEquality().hash(_categoryScores),
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_improvements),
      const DeepCollectionEquality().hash(_detailed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentResultImplCopyWith<_$AssessmentResultImpl> get copyWith =>
      __$$AssessmentResultImplCopyWithImpl<_$AssessmentResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentResultImplToJson(
      this,
    );
  }
}

abstract class _AssessmentResult extends AssessmentResult {
  const factory _AssessmentResult(
      {required final String assessmentId,
      required final double score,
      @JsonKey(name: 'max_score') required final double maxScore,
      @JsonKey(name: 'passed') final bool passed,
      @JsonKey(name: 'completion_time_minutes')
      final int? completionTimeMinutes,
      @JsonKey(name: 'completed_at') required final DateTime completedAt,
      final String? feedback,
      final String? grade,
      final List<CategoryScore>? categoryScores,
      final List<String>? strengths,
      final List<String>? improvements,
      final Map<String, dynamic>? detailed}) = _$AssessmentResultImpl;
  const _AssessmentResult._() : super._();

  factory _AssessmentResult.fromJson(Map<String, dynamic> json) =
      _$AssessmentResultImpl.fromJson;

  @override
  String get assessmentId;
  @override
  double get score;
  @override
  @JsonKey(name: 'max_score')
  double get maxScore;
  @override
  @JsonKey(name: 'passed')
  bool get passed;
  @override
  @JsonKey(name: 'completion_time_minutes')
  int? get completionTimeMinutes;
  @override
  @JsonKey(name: 'completed_at')
  DateTime get completedAt;
  @override
  String? get feedback;
  @override
  String? get grade;
  @override
  List<CategoryScore>? get categoryScores;
  @override
  List<String>? get strengths;
  @override
  List<String>? get improvements;
  @override
  Map<String, dynamic>? get detailed;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentResultImplCopyWith<_$AssessmentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryScore _$CategoryScoreFromJson(Map<String, dynamic> json) {
  return _CategoryScore.fromJson(json);
}

/// @nodoc
mixin _$CategoryScore {
  String get category => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_score')
  double get maxScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_count')
  int get questionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryScoreCopyWith<CategoryScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryScoreCopyWith<$Res> {
  factory $CategoryScoreCopyWith(
          CategoryScore value, $Res Function(CategoryScore) then) =
      _$CategoryScoreCopyWithImpl<$Res, CategoryScore>;
  @useResult
  $Res call(
      {String category,
      double score,
      @JsonKey(name: 'max_score') double maxScore,
      @JsonKey(name: 'question_count') int questionCount});
}

/// @nodoc
class _$CategoryScoreCopyWithImpl<$Res, $Val extends CategoryScore>
    implements $CategoryScoreCopyWith<$Res> {
  _$CategoryScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? score = null,
    Object? maxScore = null,
    Object? questionCount = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as double,
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryScoreImplCopyWith<$Res>
    implements $CategoryScoreCopyWith<$Res> {
  factory _$$CategoryScoreImplCopyWith(
          _$CategoryScoreImpl value, $Res Function(_$CategoryScoreImpl) then) =
      __$$CategoryScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      double score,
      @JsonKey(name: 'max_score') double maxScore,
      @JsonKey(name: 'question_count') int questionCount});
}

/// @nodoc
class __$$CategoryScoreImplCopyWithImpl<$Res>
    extends _$CategoryScoreCopyWithImpl<$Res, _$CategoryScoreImpl>
    implements _$$CategoryScoreImplCopyWith<$Res> {
  __$$CategoryScoreImplCopyWithImpl(
      _$CategoryScoreImpl _value, $Res Function(_$CategoryScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? score = null,
    Object? maxScore = null,
    Object? questionCount = null,
  }) {
    return _then(_$CategoryScoreImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as double,
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryScoreImpl extends _CategoryScore {
  const _$CategoryScoreImpl(
      {required this.category,
      required this.score,
      @JsonKey(name: 'max_score') required this.maxScore,
      @JsonKey(name: 'question_count') this.questionCount = 0})
      : super._();

  factory _$CategoryScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryScoreImplFromJson(json);

  @override
  final String category;
  @override
  final double score;
  @override
  @JsonKey(name: 'max_score')
  final double maxScore;
  @override
  @JsonKey(name: 'question_count')
  final int questionCount;

  @override
  String toString() {
    return 'CategoryScore(category: $category, score: $score, maxScore: $maxScore, questionCount: $questionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryScoreImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, score, maxScore, questionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryScoreImplCopyWith<_$CategoryScoreImpl> get copyWith =>
      __$$CategoryScoreImplCopyWithImpl<_$CategoryScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryScoreImplToJson(
      this,
    );
  }
}

abstract class _CategoryScore extends CategoryScore {
  const factory _CategoryScore(
          {required final String category,
          required final double score,
          @JsonKey(name: 'max_score') required final double maxScore,
          @JsonKey(name: 'question_count') final int questionCount}) =
      _$CategoryScoreImpl;
  const _CategoryScore._() : super._();

  factory _CategoryScore.fromJson(Map<String, dynamic> json) =
      _$CategoryScoreImpl.fromJson;

  @override
  String get category;
  @override
  double get score;
  @override
  @JsonKey(name: 'max_score')
  double get maxScore;
  @override
  @JsonKey(name: 'question_count')
  int get questionCount;
  @override
  @JsonKey(ignore: true)
  _$$CategoryScoreImplCopyWith<_$CategoryScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
