// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, dynamic>? get dashboardData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get user => throw _privateConstructorUsedError;
  Map<String, dynamic>? get assessment => throw _privateConstructorUsedError;
  List<dynamic> get meterAssessmentData => throw _privateConstructorUsedError;
  bool get isPurchased => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<String, dynamic>? dashboardData,
      Map<String, dynamic>? user,
      Map<String, dynamic>? assessment,
      List<dynamic> meterAssessmentData,
      bool isPurchased,
      String? error});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? dashboardData = freezed,
    Object? user = freezed,
    Object? assessment = freezed,
    Object? meterAssessmentData = null,
    Object? isPurchased = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dashboardData: freezed == dashboardData
          ? _value.dashboardData
          : dashboardData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      assessment: freezed == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      meterAssessmentData: null == meterAssessmentData
          ? _value.meterAssessmentData
          : meterAssessmentData // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isPurchased: null == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<String, dynamic>? dashboardData,
      Map<String, dynamic>? user,
      Map<String, dynamic>? assessment,
      List<dynamic> meterAssessmentData,
      bool isPurchased,
      String? error});
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? dashboardData = freezed,
    Object? user = freezed,
    Object? assessment = freezed,
    Object? meterAssessmentData = null,
    Object? isPurchased = null,
    Object? error = freezed,
  }) {
    return _then(_$DashboardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dashboardData: freezed == dashboardData
          ? _value._dashboardData
          : dashboardData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      assessment: freezed == assessment
          ? _value._assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      meterAssessmentData: null == meterAssessmentData
          ? _value._meterAssessmentData
          : meterAssessmentData // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isPurchased: null == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {this.isLoading = false,
      final Map<String, dynamic>? dashboardData = null,
      final Map<String, dynamic>? user = null,
      final Map<String, dynamic>? assessment = null,
      final List<dynamic> meterAssessmentData = const [],
      this.isPurchased = false,
      this.error = null})
      : _dashboardData = dashboardData,
        _user = user,
        _assessment = assessment,
        _meterAssessmentData = meterAssessmentData;

  @override
  @JsonKey()
  final bool isLoading;
  final Map<String, dynamic>? _dashboardData;
  @override
  @JsonKey()
  Map<String, dynamic>? get dashboardData {
    final value = _dashboardData;
    if (value == null) return null;
    if (_dashboardData is EqualUnmodifiableMapView) return _dashboardData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _user;
  @override
  @JsonKey()
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _assessment;
  @override
  @JsonKey()
  Map<String, dynamic>? get assessment {
    final value = _assessment;
    if (value == null) return null;
    if (_assessment is EqualUnmodifiableMapView) return _assessment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<dynamic> _meterAssessmentData;
  @override
  @JsonKey()
  List<dynamic> get meterAssessmentData {
    if (_meterAssessmentData is EqualUnmodifiableListView)
      return _meterAssessmentData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meterAssessmentData);
  }

  @override
  @JsonKey()
  final bool isPurchased;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'DashboardState(isLoading: $isLoading, dashboardData: $dashboardData, user: $user, assessment: $assessment, meterAssessmentData: $meterAssessmentData, isPurchased: $isPurchased, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._dashboardData, _dashboardData) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            const DeepCollectionEquality()
                .equals(other._assessment, _assessment) &&
            const DeepCollectionEquality()
                .equals(other._meterAssessmentData, _meterAssessmentData) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_dashboardData),
      const DeepCollectionEquality().hash(_user),
      const DeepCollectionEquality().hash(_assessment),
      const DeepCollectionEquality().hash(_meterAssessmentData),
      isPurchased,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {final bool isLoading,
      final Map<String, dynamic>? dashboardData,
      final Map<String, dynamic>? user,
      final Map<String, dynamic>? assessment,
      final List<dynamic> meterAssessmentData,
      final bool isPurchased,
      final String? error}) = _$DashboardStateImpl;

  @override
  bool get isLoading;
  @override
  Map<String, dynamic>? get dashboardData;
  @override
  Map<String, dynamic>? get user;
  @override
  Map<String, dynamic>? get assessment;
  @override
  List<dynamic> get meterAssessmentData;
  @override
  bool get isPurchased;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
