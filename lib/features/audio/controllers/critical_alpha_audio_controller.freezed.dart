// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'critical_alpha_audio_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CriticalAlphaAudioState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<AudioCategory> get categories => throw _privateConstructorUsedError;
  Map<String, List<AudioTrack>> get tracksByCategory =>
      throw _privateConstructorUsedError;
  AudioCategory? get selectedCategory => throw _privateConstructorUsedError;
  AudioTrack? get currentTrack => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isBuffering => throw _privateConstructorUsedError;
  int get currentPosition => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  double get playbackSpeed => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CriticalAlphaAudioStateCopyWith<CriticalAlphaAudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CriticalAlphaAudioStateCopyWith<$Res> {
  factory $CriticalAlphaAudioStateCopyWith(CriticalAlphaAudioState value,
          $Res Function(CriticalAlphaAudioState) then) =
      _$CriticalAlphaAudioStateCopyWithImpl<$Res, CriticalAlphaAudioState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<AudioCategory> categories,
      Map<String, List<AudioTrack>> tracksByCategory,
      AudioCategory? selectedCategory,
      AudioTrack? currentTrack,
      bool isPlaying,
      bool isBuffering,
      int currentPosition,
      int duration,
      double playbackSpeed,
      String? error});

  $AudioCategoryCopyWith<$Res>? get selectedCategory;
  $AudioTrackCopyWith<$Res>? get currentTrack;
}

/// @nodoc
class _$CriticalAlphaAudioStateCopyWithImpl<$Res,
        $Val extends CriticalAlphaAudioState>
    implements $CriticalAlphaAudioStateCopyWith<$Res> {
  _$CriticalAlphaAudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? tracksByCategory = null,
    Object? selectedCategory = freezed,
    Object? currentTrack = freezed,
    Object? isPlaying = null,
    Object? isBuffering = null,
    Object? currentPosition = null,
    Object? duration = null,
    Object? playbackSpeed = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<AudioCategory>,
      tracksByCategory: null == tracksByCategory
          ? _value.tracksByCategory
          : tracksByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, List<AudioTrack>>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as AudioCategory?,
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrack?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuffering: null == isBuffering
          ? _value.isBuffering
          : isBuffering // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      playbackSpeed: null == playbackSpeed
          ? _value.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioCategoryCopyWith<$Res>? get selectedCategory {
    if (_value.selectedCategory == null) {
      return null;
    }

    return $AudioCategoryCopyWith<$Res>(_value.selectedCategory!, (value) {
      return _then(_value.copyWith(selectedCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioTrackCopyWith<$Res>? get currentTrack {
    if (_value.currentTrack == null) {
      return null;
    }

    return $AudioTrackCopyWith<$Res>(_value.currentTrack!, (value) {
      return _then(_value.copyWith(currentTrack: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CriticalAlphaAudioStateImplCopyWith<$Res>
    implements $CriticalAlphaAudioStateCopyWith<$Res> {
  factory _$$CriticalAlphaAudioStateImplCopyWith(
          _$CriticalAlphaAudioStateImpl value,
          $Res Function(_$CriticalAlphaAudioStateImpl) then) =
      __$$CriticalAlphaAudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<AudioCategory> categories,
      Map<String, List<AudioTrack>> tracksByCategory,
      AudioCategory? selectedCategory,
      AudioTrack? currentTrack,
      bool isPlaying,
      bool isBuffering,
      int currentPosition,
      int duration,
      double playbackSpeed,
      String? error});

  @override
  $AudioCategoryCopyWith<$Res>? get selectedCategory;
  @override
  $AudioTrackCopyWith<$Res>? get currentTrack;
}

/// @nodoc
class __$$CriticalAlphaAudioStateImplCopyWithImpl<$Res>
    extends _$CriticalAlphaAudioStateCopyWithImpl<$Res,
        _$CriticalAlphaAudioStateImpl>
    implements _$$CriticalAlphaAudioStateImplCopyWith<$Res> {
  __$$CriticalAlphaAudioStateImplCopyWithImpl(
      _$CriticalAlphaAudioStateImpl _value,
      $Res Function(_$CriticalAlphaAudioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? tracksByCategory = null,
    Object? selectedCategory = freezed,
    Object? currentTrack = freezed,
    Object? isPlaying = null,
    Object? isBuffering = null,
    Object? currentPosition = null,
    Object? duration = null,
    Object? playbackSpeed = null,
    Object? error = freezed,
  }) {
    return _then(_$CriticalAlphaAudioStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<AudioCategory>,
      tracksByCategory: null == tracksByCategory
          ? _value._tracksByCategory
          : tracksByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, List<AudioTrack>>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as AudioCategory?,
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrack?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuffering: null == isBuffering
          ? _value.isBuffering
          : isBuffering // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      playbackSpeed: null == playbackSpeed
          ? _value.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CriticalAlphaAudioStateImpl extends _CriticalAlphaAudioState {
  const _$CriticalAlphaAudioStateImpl(
      {this.isLoading = true,
      final List<AudioCategory> categories = const [],
      final Map<String, List<AudioTrack>> tracksByCategory = const {},
      this.selectedCategory,
      this.currentTrack,
      this.isPlaying = false,
      this.isBuffering = false,
      this.currentPosition = 0,
      this.duration = 0,
      this.playbackSpeed = 1.0,
      this.error})
      : _categories = categories,
        _tracksByCategory = tracksByCategory,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<AudioCategory> _categories;
  @override
  @JsonKey()
  List<AudioCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final Map<String, List<AudioTrack>> _tracksByCategory;
  @override
  @JsonKey()
  Map<String, List<AudioTrack>> get tracksByCategory {
    if (_tracksByCategory is EqualUnmodifiableMapView) return _tracksByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tracksByCategory);
  }

  @override
  final AudioCategory? selectedCategory;
  @override
  final AudioTrack? currentTrack;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final bool isBuffering;
  @override
  @JsonKey()
  final int currentPosition;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final double playbackSpeed;
  @override
  final String? error;

  @override
  String toString() {
    return 'CriticalAlphaAudioState(isLoading: $isLoading, categories: $categories, tracksByCategory: $tracksByCategory, selectedCategory: $selectedCategory, currentTrack: $currentTrack, isPlaying: $isPlaying, isBuffering: $isBuffering, currentPosition: $currentPosition, duration: $duration, playbackSpeed: $playbackSpeed, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CriticalAlphaAudioStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._tracksByCategory, _tracksByCategory) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.currentTrack, currentTrack) ||
                other.currentTrack == currentTrack) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isBuffering, isBuffering) ||
                other.isBuffering == isBuffering) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.playbackSpeed, playbackSpeed) ||
                other.playbackSpeed == playbackSpeed) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tracksByCategory),
      selectedCategory,
      currentTrack,
      isPlaying,
      isBuffering,
      currentPosition,
      duration,
      playbackSpeed,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CriticalAlphaAudioStateImplCopyWith<_$CriticalAlphaAudioStateImpl>
      get copyWith => __$$CriticalAlphaAudioStateImplCopyWithImpl<
          _$CriticalAlphaAudioStateImpl>(this, _$identity);
}

abstract class _CriticalAlphaAudioState extends CriticalAlphaAudioState {
  const factory _CriticalAlphaAudioState(
      {final bool isLoading,
      final List<AudioCategory> categories,
      final Map<String, List<AudioTrack>> tracksByCategory,
      final AudioCategory? selectedCategory,
      final AudioTrack? currentTrack,
      final bool isPlaying,
      final bool isBuffering,
      final int currentPosition,
      final int duration,
      final double playbackSpeed,
      final String? error}) = _$CriticalAlphaAudioStateImpl;
  const _CriticalAlphaAudioState._() : super._();

  @override
  bool get isLoading;
  @override
  List<AudioCategory> get categories;
  @override
  Map<String, List<AudioTrack>> get tracksByCategory;
  @override
  AudioCategory? get selectedCategory;
  @override
  AudioTrack? get currentTrack;
  @override
  bool get isPlaying;
  @override
  bool get isBuffering;
  @override
  int get currentPosition;
  @override
  int get duration;
  @override
  double get playbackSpeed;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$CriticalAlphaAudioStateImplCopyWith<_$CriticalAlphaAudioStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
