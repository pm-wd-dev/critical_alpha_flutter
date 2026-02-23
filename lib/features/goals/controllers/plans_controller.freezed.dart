// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlansState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PlanModel> get plans => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  bool get isCreating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlansStateCopyWith<PlansState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansStateCopyWith<$Res> {
  factory $PlansStateCopyWith(
          PlansState value, $Res Function(PlansState) then) =
      _$PlansStateCopyWithImpl<$Res, PlansState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<PlanModel> plans,
      String? error,
      bool isDeleting,
      bool isCreating});
}

/// @nodoc
class _$PlansStateCopyWithImpl<$Res, $Val extends PlansState>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? plans = null,
    Object? error = freezed,
    Object? isDeleting = null,
    Object? isCreating = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      plans: null == plans
          ? _value.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlansStateImplCopyWith<$Res>
    implements $PlansStateCopyWith<$Res> {
  factory _$$PlansStateImplCopyWith(
          _$PlansStateImpl value, $Res Function(_$PlansStateImpl) then) =
      __$$PlansStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<PlanModel> plans,
      String? error,
      bool isDeleting,
      bool isCreating});
}

/// @nodoc
class __$$PlansStateImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$PlansStateImpl>
    implements _$$PlansStateImplCopyWith<$Res> {
  __$$PlansStateImplCopyWithImpl(
      _$PlansStateImpl _value, $Res Function(_$PlansStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? plans = null,
    Object? error = freezed,
    Object? isDeleting = null,
    Object? isCreating = null,
  }) {
    return _then(_$PlansStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      plans: null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlansStateImpl implements _PlansState {
  const _$PlansStateImpl(
      {this.isLoading = false,
      final List<PlanModel> plans = const [],
      this.error = null,
      this.isDeleting = false,
      this.isCreating = false})
      : _plans = plans;

  @override
  @JsonKey()
  final bool isLoading;
  final List<PlanModel> _plans;
  @override
  @JsonKey()
  List<PlanModel> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  @JsonKey()
  final String? error;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isCreating;

  @override
  String toString() {
    return 'PlansState(isLoading: $isLoading, plans: $plans, error: $error, isDeleting: $isDeleting, isCreating: $isCreating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._plans, _plans) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_plans),
      error,
      isDeleting,
      isCreating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansStateImplCopyWith<_$PlansStateImpl> get copyWith =>
      __$$PlansStateImplCopyWithImpl<_$PlansStateImpl>(this, _$identity);
}

abstract class _PlansState implements PlansState {
  const factory _PlansState(
      {final bool isLoading,
      final List<PlanModel> plans,
      final String? error,
      final bool isDeleting,
      final bool isCreating}) = _$PlansStateImpl;

  @override
  bool get isLoading;
  @override
  List<PlanModel> get plans;
  @override
  String? get error;
  @override
  bool get isDeleting;
  @override
  bool get isCreating;
  @override
  @JsonKey(ignore: true)
  _$$PlansStateImplCopyWith<_$PlansStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
