// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) {
  return _GoalModel.fromJson(json);
}

/// @nodoc
mixin _$GoalModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  GoalCategory get category => throw _privateConstructorUsedError;
  GoalStatus get status => throw _privateConstructorUsedError;
  GoalPriority get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_value')
  double? get targetValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_value')
  double get currentValue => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<MilestoneModel>? get milestones => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'reminder_frequency')
  ReminderFrequency? get reminderFrequency =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_public')
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  GoalMetrics? get metrics => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalModelCopyWith<GoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalModelCopyWith<$Res> {
  factory $GoalModelCopyWith(GoalModel value, $Res Function(GoalModel) then) =
      _$GoalModelCopyWithImpl<$Res, GoalModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      GoalCategory category,
      GoalStatus status,
      GoalPriority priority,
      @JsonKey(name: 'target_value') double? targetValue,
      @JsonKey(name: 'current_value') double currentValue,
      String? unit,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'completed_date') DateTime? completedDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<MilestoneModel>? milestones,
      List<TaskModel>? tasks,
      List<String>? tags,
      String? notes,
      @JsonKey(name: 'reminder_frequency') ReminderFrequency? reminderFrequency,
      @JsonKey(name: 'is_public') bool isPublic,
      @JsonKey(name: 'is_archived') bool isArchived,
      GoalMetrics? metrics,
      Map<String, dynamic>? metadata});

  $GoalMetricsCopyWith<$Res>? get metrics;
}

/// @nodoc
class _$GoalModelCopyWithImpl<$Res, $Val extends GoalModel>
    implements $GoalModelCopyWith<$Res> {
  _$GoalModelCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? priority = null,
    Object? targetValue = freezed,
    Object? currentValue = null,
    Object? unit = freezed,
    Object? dueDate = freezed,
    Object? startDate = freezed,
    Object? completedDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? milestones = freezed,
    Object? tasks = freezed,
    Object? tags = freezed,
    Object? notes = freezed,
    Object? reminderFrequency = freezed,
    Object? isPublic = null,
    Object? isArchived = null,
    Object? metrics = freezed,
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
              as GoalCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GoalStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as GoalPriority,
      targetValue: freezed == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      milestones: freezed == milestones
          ? _value.milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<MilestoneModel>?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderFrequency: freezed == reminderFrequency
          ? _value.reminderFrequency
          : reminderFrequency // ignore: cast_nullable_to_non_nullable
              as ReminderFrequency?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as GoalMetrics?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GoalMetricsCopyWith<$Res>? get metrics {
    if (_value.metrics == null) {
      return null;
    }

    return $GoalMetricsCopyWith<$Res>(_value.metrics!, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GoalModelImplCopyWith<$Res>
    implements $GoalModelCopyWith<$Res> {
  factory _$$GoalModelImplCopyWith(
          _$GoalModelImpl value, $Res Function(_$GoalModelImpl) then) =
      __$$GoalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      GoalCategory category,
      GoalStatus status,
      GoalPriority priority,
      @JsonKey(name: 'target_value') double? targetValue,
      @JsonKey(name: 'current_value') double currentValue,
      String? unit,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'completed_date') DateTime? completedDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<MilestoneModel>? milestones,
      List<TaskModel>? tasks,
      List<String>? tags,
      String? notes,
      @JsonKey(name: 'reminder_frequency') ReminderFrequency? reminderFrequency,
      @JsonKey(name: 'is_public') bool isPublic,
      @JsonKey(name: 'is_archived') bool isArchived,
      GoalMetrics? metrics,
      Map<String, dynamic>? metadata});

  @override
  $GoalMetricsCopyWith<$Res>? get metrics;
}

/// @nodoc
class __$$GoalModelImplCopyWithImpl<$Res>
    extends _$GoalModelCopyWithImpl<$Res, _$GoalModelImpl>
    implements _$$GoalModelImplCopyWith<$Res> {
  __$$GoalModelImplCopyWithImpl(
      _$GoalModelImpl _value, $Res Function(_$GoalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? status = null,
    Object? priority = null,
    Object? targetValue = freezed,
    Object? currentValue = null,
    Object? unit = freezed,
    Object? dueDate = freezed,
    Object? startDate = freezed,
    Object? completedDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? milestones = freezed,
    Object? tasks = freezed,
    Object? tags = freezed,
    Object? notes = freezed,
    Object? reminderFrequency = freezed,
    Object? isPublic = null,
    Object? isArchived = null,
    Object? metrics = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$GoalModelImpl(
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
              as GoalCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GoalStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as GoalPriority,
      targetValue: freezed == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      milestones: freezed == milestones
          ? _value._milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<MilestoneModel>?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderFrequency: freezed == reminderFrequency
          ? _value.reminderFrequency
          : reminderFrequency // ignore: cast_nullable_to_non_nullable
              as ReminderFrequency?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as GoalMetrics?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalModelImpl extends _GoalModel {
  const _$GoalModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.status,
      required this.priority,
      @JsonKey(name: 'target_value') this.targetValue,
      @JsonKey(name: 'current_value') this.currentValue = 0.0,
      this.unit,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'completed_date') this.completedDate,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final List<MilestoneModel>? milestones,
      final List<TaskModel>? tasks,
      final List<String>? tags,
      this.notes,
      @JsonKey(name: 'reminder_frequency') this.reminderFrequency,
      @JsonKey(name: 'is_public') this.isPublic = false,
      @JsonKey(name: 'is_archived') this.isArchived = false,
      this.metrics,
      final Map<String, dynamic>? metadata})
      : _milestones = milestones,
        _tasks = tasks,
        _tags = tags,
        _metadata = metadata,
        super._();

  factory _$GoalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final GoalCategory category;
  @override
  final GoalStatus status;
  @override
  final GoalPriority priority;
  @override
  @JsonKey(name: 'target_value')
  final double? targetValue;
  @override
  @JsonKey(name: 'current_value')
  final double currentValue;
  @override
  final String? unit;
  @override
  @JsonKey(name: 'due_date')
  final DateTime? dueDate;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'completed_date')
  final DateTime? completedDate;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final List<MilestoneModel>? _milestones;
  @override
  List<MilestoneModel>? get milestones {
    final value = _milestones;
    if (value == null) return null;
    if (_milestones is EqualUnmodifiableListView) return _milestones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  final String? notes;
  @override
  @JsonKey(name: 'reminder_frequency')
  final ReminderFrequency? reminderFrequency;
  @override
  @JsonKey(name: 'is_public')
  final bool isPublic;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  @override
  final GoalMetrics? metrics;
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
    return 'GoalModel(id: $id, title: $title, description: $description, category: $category, status: $status, priority: $priority, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, dueDate: $dueDate, startDate: $startDate, completedDate: $completedDate, createdAt: $createdAt, updatedAt: $updatedAt, milestones: $milestones, tasks: $tasks, tags: $tags, notes: $notes, reminderFrequency: $reminderFrequency, isPublic: $isPublic, isArchived: $isArchived, metrics: $metrics, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._milestones, _milestones) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.reminderFrequency, reminderFrequency) ||
                other.reminderFrequency == reminderFrequency) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        category,
        status,
        priority,
        targetValue,
        currentValue,
        unit,
        dueDate,
        startDate,
        completedDate,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_milestones),
        const DeepCollectionEquality().hash(_tasks),
        const DeepCollectionEquality().hash(_tags),
        notes,
        reminderFrequency,
        isPublic,
        isArchived,
        metrics,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalModelImplCopyWith<_$GoalModelImpl> get copyWith =>
      __$$GoalModelImplCopyWithImpl<_$GoalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalModelImplToJson(
      this,
    );
  }
}

abstract class _GoalModel extends GoalModel {
  const factory _GoalModel(
      {required final String id,
      required final String title,
      required final String description,
      required final GoalCategory category,
      required final GoalStatus status,
      required final GoalPriority priority,
      @JsonKey(name: 'target_value') final double? targetValue,
      @JsonKey(name: 'current_value') final double currentValue,
      final String? unit,
      @JsonKey(name: 'due_date') final DateTime? dueDate,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'completed_date') final DateTime? completedDate,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final List<MilestoneModel>? milestones,
      final List<TaskModel>? tasks,
      final List<String>? tags,
      final String? notes,
      @JsonKey(name: 'reminder_frequency')
      final ReminderFrequency? reminderFrequency,
      @JsonKey(name: 'is_public') final bool isPublic,
      @JsonKey(name: 'is_archived') final bool isArchived,
      final GoalMetrics? metrics,
      final Map<String, dynamic>? metadata}) = _$GoalModelImpl;
  const _GoalModel._() : super._();

  factory _GoalModel.fromJson(Map<String, dynamic> json) =
      _$GoalModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  GoalCategory get category;
  @override
  GoalStatus get status;
  @override
  GoalPriority get priority;
  @override
  @JsonKey(name: 'target_value')
  double? get targetValue;
  @override
  @JsonKey(name: 'current_value')
  double get currentValue;
  @override
  String? get unit;
  @override
  @JsonKey(name: 'due_date')
  DateTime? get dueDate;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  List<MilestoneModel>? get milestones;
  @override
  List<TaskModel>? get tasks;
  @override
  List<String>? get tags;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'reminder_frequency')
  ReminderFrequency? get reminderFrequency;
  @override
  @JsonKey(name: 'is_public')
  bool get isPublic;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
  @override
  GoalMetrics? get metrics;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$GoalModelImplCopyWith<_$GoalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MilestoneModel _$MilestoneModelFromJson(Map<String, dynamic> json) {
  return _MilestoneModel.fromJson(json);
}

/// @nodoc
mixin _$MilestoneModel {
  String get id => throw _privateConstructorUsedError;
  String get goalId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_value')
  double? get targetValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_value')
  double get currentValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate => throw _privateConstructorUsedError;
  MilestoneStatus get status => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MilestoneModelCopyWith<MilestoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilestoneModelCopyWith<$Res> {
  factory $MilestoneModelCopyWith(
          MilestoneModel value, $Res Function(MilestoneModel) then) =
      _$MilestoneModelCopyWithImpl<$Res, MilestoneModel>;
  @useResult
  $Res call(
      {String id,
      String goalId,
      String title,
      String? description,
      @JsonKey(name: 'target_value') double? targetValue,
      @JsonKey(name: 'current_value') double currentValue,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'completed_date') DateTime? completedDate,
      MilestoneStatus status,
      int order,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? notes,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$MilestoneModelCopyWithImpl<$Res, $Val extends MilestoneModel>
    implements $MilestoneModelCopyWith<$Res> {
  _$MilestoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? title = null,
    Object? description = freezed,
    Object? targetValue = freezed,
    Object? currentValue = null,
    Object? dueDate = freezed,
    Object? completedDate = freezed,
    Object? status = null,
    Object? order = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? notes = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      targetValue: freezed == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MilestoneStatus,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MilestoneModelImplCopyWith<$Res>
    implements $MilestoneModelCopyWith<$Res> {
  factory _$$MilestoneModelImplCopyWith(_$MilestoneModelImpl value,
          $Res Function(_$MilestoneModelImpl) then) =
      __$$MilestoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String goalId,
      String title,
      String? description,
      @JsonKey(name: 'target_value') double? targetValue,
      @JsonKey(name: 'current_value') double currentValue,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'completed_date') DateTime? completedDate,
      MilestoneStatus status,
      int order,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? notes,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$MilestoneModelImplCopyWithImpl<$Res>
    extends _$MilestoneModelCopyWithImpl<$Res, _$MilestoneModelImpl>
    implements _$$MilestoneModelImplCopyWith<$Res> {
  __$$MilestoneModelImplCopyWithImpl(
      _$MilestoneModelImpl _value, $Res Function(_$MilestoneModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? title = null,
    Object? description = freezed,
    Object? targetValue = freezed,
    Object? currentValue = null,
    Object? dueDate = freezed,
    Object? completedDate = freezed,
    Object? status = null,
    Object? order = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? notes = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$MilestoneModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      targetValue: freezed == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MilestoneStatus,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$MilestoneModelImpl extends _MilestoneModel {
  const _$MilestoneModelImpl(
      {required this.id,
      required this.goalId,
      required this.title,
      this.description,
      @JsonKey(name: 'target_value') this.targetValue,
      @JsonKey(name: 'current_value') this.currentValue = 0.0,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'completed_date') this.completedDate,
      this.status = MilestoneStatus.notStarted,
      this.order = 1,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.notes,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$MilestoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MilestoneModelImplFromJson(json);

  @override
  final String id;
  @override
  final String goalId;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'target_value')
  final double? targetValue;
  @override
  @JsonKey(name: 'current_value')
  final double currentValue;
  @override
  @JsonKey(name: 'due_date')
  final DateTime? dueDate;
  @override
  @JsonKey(name: 'completed_date')
  final DateTime? completedDate;
  @override
  @JsonKey()
  final MilestoneStatus status;
  @override
  @JsonKey()
  final int order;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? notes;
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
    return 'MilestoneModel(id: $id, goalId: $goalId, title: $title, description: $description, targetValue: $targetValue, currentValue: $currentValue, dueDate: $dueDate, completedDate: $completedDate, status: $status, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MilestoneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      goalId,
      title,
      description,
      targetValue,
      currentValue,
      dueDate,
      completedDate,
      status,
      order,
      createdAt,
      updatedAt,
      notes,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MilestoneModelImplCopyWith<_$MilestoneModelImpl> get copyWith =>
      __$$MilestoneModelImplCopyWithImpl<_$MilestoneModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MilestoneModelImplToJson(
      this,
    );
  }
}

abstract class _MilestoneModel extends MilestoneModel {
  const factory _MilestoneModel(
      {required final String id,
      required final String goalId,
      required final String title,
      final String? description,
      @JsonKey(name: 'target_value') final double? targetValue,
      @JsonKey(name: 'current_value') final double currentValue,
      @JsonKey(name: 'due_date') final DateTime? dueDate,
      @JsonKey(name: 'completed_date') final DateTime? completedDate,
      final MilestoneStatus status,
      final int order,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final String? notes,
      final Map<String, dynamic>? metadata}) = _$MilestoneModelImpl;
  const _MilestoneModel._() : super._();

  factory _MilestoneModel.fromJson(Map<String, dynamic> json) =
      _$MilestoneModelImpl.fromJson;

  @override
  String get id;
  @override
  String get goalId;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'target_value')
  double? get targetValue;
  @override
  @JsonKey(name: 'current_value')
  double get currentValue;
  @override
  @JsonKey(name: 'due_date')
  DateTime? get dueDate;
  @override
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate;
  @override
  MilestoneStatus get status;
  @override
  int get order;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$MilestoneModelImplCopyWith<_$MilestoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get id => throw _privateConstructorUsedError;
  String get goalId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_hours')
  double? get estimatedHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_hours')
  double? get actualHours => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {String id,
      String goalId,
      String title,
      String? description,
      TaskStatus status,
      TaskPriority priority,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'completed_date') DateTime? completedDate,
      @JsonKey(name: 'estimated_hours') double? estimatedHours,
      @JsonKey(name: 'actual_hours') double? actualHours,
      int order,
      List<String>? tags,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? title = null,
    Object? description = freezed,
    Object? status = null,
    Object? priority = null,
    Object? dueDate = freezed,
    Object? completedDate = freezed,
    Object? estimatedHours = freezed,
    Object? actualHours = freezed,
    Object? order = null,
    Object? tags = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      estimatedHours: freezed == estimatedHours
          ? _value.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as double?,
      actualHours: freezed == actualHours
          ? _value.actualHours
          : actualHours // ignore: cast_nullable_to_non_nullable
              as double?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String goalId,
      String title,
      String? description,
      TaskStatus status,
      TaskPriority priority,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'completed_date') DateTime? completedDate,
      @JsonKey(name: 'estimated_hours') double? estimatedHours,
      @JsonKey(name: 'actual_hours') double? actualHours,
      int order,
      List<String>? tags,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? title = null,
    Object? description = freezed,
    Object? status = null,
    Object? priority = null,
    Object? dueDate = freezed,
    Object? completedDate = freezed,
    Object? estimatedHours = freezed,
    Object? actualHours = freezed,
    Object? order = null,
    Object? tags = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_$TaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      estimatedHours: freezed == estimatedHours
          ? _value.estimatedHours
          : estimatedHours // ignore: cast_nullable_to_non_nullable
              as double?,
      actualHours: freezed == actualHours
          ? _value.actualHours
          : actualHours // ignore: cast_nullable_to_non_nullable
              as double?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl extends _TaskModel {
  const _$TaskModelImpl(
      {required this.id,
      required this.goalId,
      required this.title,
      this.description,
      this.status = TaskStatus.todo,
      this.priority = TaskPriority.medium,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'completed_date') this.completedDate,
      @JsonKey(name: 'estimated_hours') this.estimatedHours,
      @JsonKey(name: 'actual_hours') this.actualHours,
      this.order = 1,
      final List<String>? tags,
      this.notes,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final Map<String, dynamic>? metadata})
      : _tags = tags,
        _metadata = metadata,
        super._();

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final String id;
  @override
  final String goalId;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  @JsonKey()
  final TaskPriority priority;
  @override
  @JsonKey(name: 'due_date')
  final DateTime? dueDate;
  @override
  @JsonKey(name: 'completed_date')
  final DateTime? completedDate;
  @override
  @JsonKey(name: 'estimated_hours')
  final double? estimatedHours;
  @override
  @JsonKey(name: 'actual_hours')
  final double? actualHours;
  @override
  @JsonKey()
  final int order;
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
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
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
    return 'TaskModel(id: $id, goalId: $goalId, title: $title, description: $description, status: $status, priority: $priority, dueDate: $dueDate, completedDate: $completedDate, estimatedHours: $estimatedHours, actualHours: $actualHours, order: $order, tags: $tags, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.estimatedHours, estimatedHours) ||
                other.estimatedHours == estimatedHours) &&
            (identical(other.actualHours, actualHours) ||
                other.actualHours == actualHours) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      goalId,
      title,
      description,
      status,
      priority,
      dueDate,
      completedDate,
      estimatedHours,
      actualHours,
      order,
      const DeepCollectionEquality().hash(_tags),
      notes,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel extends TaskModel {
  const factory _TaskModel(
      {required final String id,
      required final String goalId,
      required final String title,
      final String? description,
      final TaskStatus status,
      final TaskPriority priority,
      @JsonKey(name: 'due_date') final DateTime? dueDate,
      @JsonKey(name: 'completed_date') final DateTime? completedDate,
      @JsonKey(name: 'estimated_hours') final double? estimatedHours,
      @JsonKey(name: 'actual_hours') final double? actualHours,
      final int order,
      final List<String>? tags,
      final String? notes,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final Map<String, dynamic>? metadata}) = _$TaskModelImpl;
  const _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  String get id;
  @override
  String get goalId;
  @override
  String get title;
  @override
  String? get description;
  @override
  TaskStatus get status;
  @override
  TaskPriority get priority;
  @override
  @JsonKey(name: 'due_date')
  DateTime? get dueDate;
  @override
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate;
  @override
  @JsonKey(name: 'estimated_hours')
  double? get estimatedHours;
  @override
  @JsonKey(name: 'actual_hours')
  double? get actualHours;
  @override
  int get order;
  @override
  List<String>? get tags;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalMetrics _$GoalMetricsFromJson(Map<String, dynamic> json) {
  return _GoalMetrics.fromJson(json);
}

/// @nodoc
mixin _$GoalMetrics {
  @JsonKey(name: 'total_time_spent_hours')
  double get totalTimeSpentHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'sessions_count')
  int get sessionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_session_hours')
  double get averageSessionHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_days')
  int get streakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_streak_days')
  int get bestStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_rate')
  double get completionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_activity_date')
  DateTime? get lastActivityDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get weeklyData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get monthlyData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalMetricsCopyWith<GoalMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalMetricsCopyWith<$Res> {
  factory $GoalMetricsCopyWith(
          GoalMetrics value, $Res Function(GoalMetrics) then) =
      _$GoalMetricsCopyWithImpl<$Res, GoalMetrics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_time_spent_hours') double totalTimeSpentHours,
      @JsonKey(name: 'sessions_count') int sessionsCount,
      @JsonKey(name: 'average_session_hours') double averageSessionHours,
      @JsonKey(name: 'streak_days') int streakDays,
      @JsonKey(name: 'best_streak_days') int bestStreakDays,
      @JsonKey(name: 'completion_rate') double completionRate,
      @JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,
      Map<String, dynamic>? weeklyData,
      Map<String, dynamic>? monthlyData});
}

/// @nodoc
class _$GoalMetricsCopyWithImpl<$Res, $Val extends GoalMetrics>
    implements $GoalMetricsCopyWith<$Res> {
  _$GoalMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTimeSpentHours = null,
    Object? sessionsCount = null,
    Object? averageSessionHours = null,
    Object? streakDays = null,
    Object? bestStreakDays = null,
    Object? completionRate = null,
    Object? lastActivityDate = freezed,
    Object? weeklyData = freezed,
    Object? monthlyData = freezed,
  }) {
    return _then(_value.copyWith(
      totalTimeSpentHours: null == totalTimeSpentHours
          ? _value.totalTimeSpentHours
          : totalTimeSpentHours // ignore: cast_nullable_to_non_nullable
              as double,
      sessionsCount: null == sessionsCount
          ? _value.sessionsCount
          : sessionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageSessionHours: null == averageSessionHours
          ? _value.averageSessionHours
          : averageSessionHours // ignore: cast_nullable_to_non_nullable
              as double,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreakDays: null == bestStreakDays
          ? _value.bestStreakDays
          : bestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weeklyData: freezed == weeklyData
          ? _value.weeklyData
          : weeklyData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      monthlyData: freezed == monthlyData
          ? _value.monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalMetricsImplCopyWith<$Res>
    implements $GoalMetricsCopyWith<$Res> {
  factory _$$GoalMetricsImplCopyWith(
          _$GoalMetricsImpl value, $Res Function(_$GoalMetricsImpl) then) =
      __$$GoalMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_time_spent_hours') double totalTimeSpentHours,
      @JsonKey(name: 'sessions_count') int sessionsCount,
      @JsonKey(name: 'average_session_hours') double averageSessionHours,
      @JsonKey(name: 'streak_days') int streakDays,
      @JsonKey(name: 'best_streak_days') int bestStreakDays,
      @JsonKey(name: 'completion_rate') double completionRate,
      @JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,
      Map<String, dynamic>? weeklyData,
      Map<String, dynamic>? monthlyData});
}

/// @nodoc
class __$$GoalMetricsImplCopyWithImpl<$Res>
    extends _$GoalMetricsCopyWithImpl<$Res, _$GoalMetricsImpl>
    implements _$$GoalMetricsImplCopyWith<$Res> {
  __$$GoalMetricsImplCopyWithImpl(
      _$GoalMetricsImpl _value, $Res Function(_$GoalMetricsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTimeSpentHours = null,
    Object? sessionsCount = null,
    Object? averageSessionHours = null,
    Object? streakDays = null,
    Object? bestStreakDays = null,
    Object? completionRate = null,
    Object? lastActivityDate = freezed,
    Object? weeklyData = freezed,
    Object? monthlyData = freezed,
  }) {
    return _then(_$GoalMetricsImpl(
      totalTimeSpentHours: null == totalTimeSpentHours
          ? _value.totalTimeSpentHours
          : totalTimeSpentHours // ignore: cast_nullable_to_non_nullable
              as double,
      sessionsCount: null == sessionsCount
          ? _value.sessionsCount
          : sessionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageSessionHours: null == averageSessionHours
          ? _value.averageSessionHours
          : averageSessionHours // ignore: cast_nullable_to_non_nullable
              as double,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreakDays: null == bestStreakDays
          ? _value.bestStreakDays
          : bestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weeklyData: freezed == weeklyData
          ? _value._weeklyData
          : weeklyData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      monthlyData: freezed == monthlyData
          ? _value._monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalMetricsImpl extends _GoalMetrics {
  const _$GoalMetricsImpl(
      {@JsonKey(name: 'total_time_spent_hours') this.totalTimeSpentHours = 0.0,
      @JsonKey(name: 'sessions_count') this.sessionsCount = 0,
      @JsonKey(name: 'average_session_hours') this.averageSessionHours = 0.0,
      @JsonKey(name: 'streak_days') this.streakDays = 0,
      @JsonKey(name: 'best_streak_days') this.bestStreakDays = 0,
      @JsonKey(name: 'completion_rate') this.completionRate = 0.0,
      @JsonKey(name: 'last_activity_date') this.lastActivityDate,
      final Map<String, dynamic>? weeklyData,
      final Map<String, dynamic>? monthlyData})
      : _weeklyData = weeklyData,
        _monthlyData = monthlyData,
        super._();

  factory _$GoalMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalMetricsImplFromJson(json);

  @override
  @JsonKey(name: 'total_time_spent_hours')
  final double totalTimeSpentHours;
  @override
  @JsonKey(name: 'sessions_count')
  final int sessionsCount;
  @override
  @JsonKey(name: 'average_session_hours')
  final double averageSessionHours;
  @override
  @JsonKey(name: 'streak_days')
  final int streakDays;
  @override
  @JsonKey(name: 'best_streak_days')
  final int bestStreakDays;
  @override
  @JsonKey(name: 'completion_rate')
  final double completionRate;
  @override
  @JsonKey(name: 'last_activity_date')
  final DateTime? lastActivityDate;
  final Map<String, dynamic>? _weeklyData;
  @override
  Map<String, dynamic>? get weeklyData {
    final value = _weeklyData;
    if (value == null) return null;
    if (_weeklyData is EqualUnmodifiableMapView) return _weeklyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _monthlyData;
  @override
  Map<String, dynamic>? get monthlyData {
    final value = _monthlyData;
    if (value == null) return null;
    if (_monthlyData is EqualUnmodifiableMapView) return _monthlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GoalMetrics(totalTimeSpentHours: $totalTimeSpentHours, sessionsCount: $sessionsCount, averageSessionHours: $averageSessionHours, streakDays: $streakDays, bestStreakDays: $bestStreakDays, completionRate: $completionRate, lastActivityDate: $lastActivityDate, weeklyData: $weeklyData, monthlyData: $monthlyData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalMetricsImpl &&
            (identical(other.totalTimeSpentHours, totalTimeSpentHours) ||
                other.totalTimeSpentHours == totalTimeSpentHours) &&
            (identical(other.sessionsCount, sessionsCount) ||
                other.sessionsCount == sessionsCount) &&
            (identical(other.averageSessionHours, averageSessionHours) ||
                other.averageSessionHours == averageSessionHours) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.bestStreakDays, bestStreakDays) ||
                other.bestStreakDays == bestStreakDays) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.lastActivityDate, lastActivityDate) ||
                other.lastActivityDate == lastActivityDate) &&
            const DeepCollectionEquality()
                .equals(other._weeklyData, _weeklyData) &&
            const DeepCollectionEquality()
                .equals(other._monthlyData, _monthlyData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalTimeSpentHours,
      sessionsCount,
      averageSessionHours,
      streakDays,
      bestStreakDays,
      completionRate,
      lastActivityDate,
      const DeepCollectionEquality().hash(_weeklyData),
      const DeepCollectionEquality().hash(_monthlyData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalMetricsImplCopyWith<_$GoalMetricsImpl> get copyWith =>
      __$$GoalMetricsImplCopyWithImpl<_$GoalMetricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalMetricsImplToJson(
      this,
    );
  }
}

abstract class _GoalMetrics extends GoalMetrics {
  const factory _GoalMetrics(
      {@JsonKey(name: 'total_time_spent_hours')
      final double totalTimeSpentHours,
      @JsonKey(name: 'sessions_count') final int sessionsCount,
      @JsonKey(name: 'average_session_hours') final double averageSessionHours,
      @JsonKey(name: 'streak_days') final int streakDays,
      @JsonKey(name: 'best_streak_days') final int bestStreakDays,
      @JsonKey(name: 'completion_rate') final double completionRate,
      @JsonKey(name: 'last_activity_date') final DateTime? lastActivityDate,
      final Map<String, dynamic>? weeklyData,
      final Map<String, dynamic>? monthlyData}) = _$GoalMetricsImpl;
  const _GoalMetrics._() : super._();

  factory _GoalMetrics.fromJson(Map<String, dynamic> json) =
      _$GoalMetricsImpl.fromJson;

  @override
  @JsonKey(name: 'total_time_spent_hours')
  double get totalTimeSpentHours;
  @override
  @JsonKey(name: 'sessions_count')
  int get sessionsCount;
  @override
  @JsonKey(name: 'average_session_hours')
  double get averageSessionHours;
  @override
  @JsonKey(name: 'streak_days')
  int get streakDays;
  @override
  @JsonKey(name: 'best_streak_days')
  int get bestStreakDays;
  @override
  @JsonKey(name: 'completion_rate')
  double get completionRate;
  @override
  @JsonKey(name: 'last_activity_date')
  DateTime? get lastActivityDate;
  @override
  Map<String, dynamic>? get weeklyData;
  @override
  Map<String, dynamic>? get monthlyData;
  @override
  @JsonKey(ignore: true)
  _$$GoalMetricsImplCopyWith<_$GoalMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
