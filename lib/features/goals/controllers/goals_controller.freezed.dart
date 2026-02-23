// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoalsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<GoalModel> get goals => throw _privateConstructorUsedError;
  GoalFilter get currentFilter => throw _privateConstructorUsedError;
  GoalSortBy get sortBy => throw _privateConstructorUsedError;
  bool get sortDescending => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  GoalCategory? get selectedCategory => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // CRUD states
  bool get isCreating => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  String? get crudError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalsStateCopyWith<GoalsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsStateCopyWith<$Res> {
  factory $GoalsStateCopyWith(
          GoalsState value, $Res Function(GoalsState) then) =
      _$GoalsStateCopyWithImpl<$Res, GoalsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<GoalModel> goals,
      GoalFilter currentFilter,
      GoalSortBy sortBy,
      bool sortDescending,
      String? searchQuery,
      GoalCategory? selectedCategory,
      String? error,
      bool isCreating,
      bool isUpdating,
      bool isDeleting,
      String? crudError});
}

/// @nodoc
class _$GoalsStateCopyWithImpl<$Res, $Val extends GoalsState>
    implements $GoalsStateCopyWith<$Res> {
  _$GoalsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? goals = null,
    Object? currentFilter = null,
    Object? sortBy = null,
    Object? sortDescending = null,
    Object? searchQuery = freezed,
    Object? selectedCategory = freezed,
    Object? error = freezed,
    Object? isCreating = null,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? crudError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as GoalFilter,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as GoalSortBy,
      sortDescending: null == sortDescending
          ? _value.sortDescending
          : sortDescending // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as GoalCategory?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      crudError: freezed == crudError
          ? _value.crudError
          : crudError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalsStateImplCopyWith<$Res>
    implements $GoalsStateCopyWith<$Res> {
  factory _$$GoalsStateImplCopyWith(
          _$GoalsStateImpl value, $Res Function(_$GoalsStateImpl) then) =
      __$$GoalsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<GoalModel> goals,
      GoalFilter currentFilter,
      GoalSortBy sortBy,
      bool sortDescending,
      String? searchQuery,
      GoalCategory? selectedCategory,
      String? error,
      bool isCreating,
      bool isUpdating,
      bool isDeleting,
      String? crudError});
}

/// @nodoc
class __$$GoalsStateImplCopyWithImpl<$Res>
    extends _$GoalsStateCopyWithImpl<$Res, _$GoalsStateImpl>
    implements _$$GoalsStateImplCopyWith<$Res> {
  __$$GoalsStateImplCopyWithImpl(
      _$GoalsStateImpl _value, $Res Function(_$GoalsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? goals = null,
    Object? currentFilter = null,
    Object? sortBy = null,
    Object? sortDescending = null,
    Object? searchQuery = freezed,
    Object? selectedCategory = freezed,
    Object? error = freezed,
    Object? isCreating = null,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? crudError = freezed,
  }) {
    return _then(_$GoalsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<GoalModel>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as GoalFilter,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as GoalSortBy,
      sortDescending: null == sortDescending
          ? _value.sortDescending
          : sortDescending // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as GoalCategory?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      crudError: freezed == crudError
          ? _value.crudError
          : crudError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GoalsStateImpl extends _GoalsState {
  const _$GoalsStateImpl(
      {this.isLoading = true,
      final List<GoalModel> goals = const [],
      this.currentFilter = GoalFilter.all,
      this.sortBy = GoalSortBy.updatedAt,
      this.sortDescending = true,
      this.searchQuery,
      this.selectedCategory,
      this.error,
      this.isCreating = false,
      this.isUpdating = false,
      this.isDeleting = false,
      this.crudError})
      : _goals = goals,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<GoalModel> _goals;
  @override
  @JsonKey()
  List<GoalModel> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  @JsonKey()
  final GoalFilter currentFilter;
  @override
  @JsonKey()
  final GoalSortBy sortBy;
  @override
  @JsonKey()
  final bool sortDescending;
  @override
  final String? searchQuery;
  @override
  final GoalCategory? selectedCategory;
  @override
  final String? error;
// CRUD states
  @override
  @JsonKey()
  final bool isCreating;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  final String? crudError;

  @override
  String toString() {
    return 'GoalsState(isLoading: $isLoading, goals: $goals, currentFilter: $currentFilter, sortBy: $sortBy, sortDescending: $sortDescending, searchQuery: $searchQuery, selectedCategory: $selectedCategory, error: $error, isCreating: $isCreating, isUpdating: $isUpdating, isDeleting: $isDeleting, crudError: $crudError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortDescending, sortDescending) ||
                other.sortDescending == sortDescending) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.crudError, crudError) ||
                other.crudError == crudError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_goals),
      currentFilter,
      sortBy,
      sortDescending,
      searchQuery,
      selectedCategory,
      error,
      isCreating,
      isUpdating,
      isDeleting,
      crudError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalsStateImplCopyWith<_$GoalsStateImpl> get copyWith =>
      __$$GoalsStateImplCopyWithImpl<_$GoalsStateImpl>(this, _$identity);
}

abstract class _GoalsState extends GoalsState {
  const factory _GoalsState(
      {final bool isLoading,
      final List<GoalModel> goals,
      final GoalFilter currentFilter,
      final GoalSortBy sortBy,
      final bool sortDescending,
      final String? searchQuery,
      final GoalCategory? selectedCategory,
      final String? error,
      final bool isCreating,
      final bool isUpdating,
      final bool isDeleting,
      final String? crudError}) = _$GoalsStateImpl;
  const _GoalsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<GoalModel> get goals;
  @override
  GoalFilter get currentFilter;
  @override
  GoalSortBy get sortBy;
  @override
  bool get sortDescending;
  @override
  String? get searchQuery;
  @override
  GoalCategory? get selectedCategory;
  @override
  String? get error;
  @override // CRUD states
  bool get isCreating;
  @override
  bool get isUpdating;
  @override
  bool get isDeleting;
  @override
  String? get crudError;
  @override
  @JsonKey(ignore: true)
  _$$GoalsStateImplCopyWith<_$GoalsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
