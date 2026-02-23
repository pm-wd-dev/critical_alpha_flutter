// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return _PlanModel.fromJson(json);
}

/// @nodoc
mixin _$PlanModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'discription')
  String? get description =>
      throw _privateConstructorUsedError; // Note: API has typo
  String? get contingency => throw _privateConstructorUsedError;
  String? get improve => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  DateTime? get reminderDate => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res, PlanModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      @JsonKey(name: 'discription') String? description,
      String? contingency,
      String? improve,
      String status,
      String? type,
      DateTime? reminderDate,
      DateTime? deadline,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res, $Val extends PlanModel>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? contingency = freezed,
    Object? improve = freezed,
    Object? status = null,
    Object? type = freezed,
    Object? reminderDate = freezed,
    Object? deadline = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contingency: freezed == contingency
          ? _value.contingency
          : contingency // ignore: cast_nullable_to_non_nullable
              as String?,
      improve: freezed == improve
          ? _value.improve
          : improve // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderDate: freezed == reminderDate
          ? _value.reminderDate
          : reminderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanModelImplCopyWith<$Res>
    implements $PlanModelCopyWith<$Res> {
  factory _$$PlanModelImplCopyWith(
          _$PlanModelImpl value, $Res Function(_$PlanModelImpl) then) =
      __$$PlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      @JsonKey(name: 'discription') String? description,
      String? contingency,
      String? improve,
      String status,
      String? type,
      DateTime? reminderDate,
      DateTime? deadline,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PlanModelImplCopyWithImpl<$Res>
    extends _$PlanModelCopyWithImpl<$Res, _$PlanModelImpl>
    implements _$$PlanModelImplCopyWith<$Res> {
  __$$PlanModelImplCopyWithImpl(
      _$PlanModelImpl _value, $Res Function(_$PlanModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? contingency = freezed,
    Object? improve = freezed,
    Object? status = null,
    Object? type = freezed,
    Object? reminderDate = freezed,
    Object? deadline = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PlanModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contingency: freezed == contingency
          ? _value.contingency
          : contingency // ignore: cast_nullable_to_non_nullable
              as String?,
      improve: freezed == improve
          ? _value.improve
          : improve // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderDate: freezed == reminderDate
          ? _value.reminderDate
          : reminderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanModelImpl implements _PlanModel {
  const _$PlanModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      @JsonKey(name: 'discription') this.description,
      this.contingency,
      this.improve,
      this.status = 'false',
      this.type,
      this.reminderDate,
      this.deadline,
      this.createdAt,
      this.updatedAt});

  factory _$PlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  @JsonKey(name: 'discription')
  final String? description;
// Note: API has typo
  @override
  final String? contingency;
  @override
  final String? improve;
  @override
  @JsonKey()
  final String status;
  @override
  final String? type;
  @override
  final DateTime? reminderDate;
  @override
  final DateTime? deadline;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PlanModel(id: $id, title: $title, description: $description, contingency: $contingency, improve: $improve, status: $status, type: $type, reminderDate: $reminderDate, deadline: $deadline, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.contingency, contingency) ||
                other.contingency == contingency) &&
            (identical(other.improve, improve) || other.improve == improve) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reminderDate, reminderDate) ||
                other.reminderDate == reminderDate) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      contingency,
      improve,
      status,
      type,
      reminderDate,
      deadline,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanModelImplCopyWith<_$PlanModelImpl> get copyWith =>
      __$$PlanModelImplCopyWithImpl<_$PlanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanModelImplToJson(
      this,
    );
  }
}

abstract class _PlanModel implements PlanModel {
  const factory _PlanModel(
      {@JsonKey(name: '_id') required final String id,
      required final String title,
      @JsonKey(name: 'discription') final String? description,
      final String? contingency,
      final String? improve,
      final String status,
      final String? type,
      final DateTime? reminderDate,
      final DateTime? deadline,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PlanModelImpl;

  factory _PlanModel.fromJson(Map<String, dynamic> json) =
      _$PlanModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'discription')
  String? get description;
  @override // Note: API has typo
  String? get contingency;
  @override
  String? get improve;
  @override
  String get status;
  @override
  String? get type;
  @override
  DateTime? get reminderDate;
  @override
  DateTime? get deadline;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PlanModelImplCopyWith<_$PlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
