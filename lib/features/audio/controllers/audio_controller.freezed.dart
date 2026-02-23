// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<AudioTrackModel> get tracks => throw _privateConstructorUsedError;
  List<PlaylistModel> get playlists => throw _privateConstructorUsedError;
  AudioCategory get selectedCategory => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  AudioTrackModel? get currentTrack => throw _privateConstructorUsedError;
  AudioPlayerState? get playerState => throw _privateConstructorUsedError;
  List<AudioTrackModel> get queue => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  bool get isShuffling => throw _privateConstructorUsedError;
  RepeatMode? get repeatMode => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;
  String? get downloadError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res, AudioState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<AudioTrackModel> tracks,
      List<PlaylistModel> playlists,
      AudioCategory selectedCategory,
      String? searchQuery,
      AudioTrackModel? currentTrack,
      AudioPlayerState? playerState,
      List<AudioTrackModel> queue,
      int currentIndex,
      bool isShuffling,
      RepeatMode? repeatMode,
      String? error,
      bool isDownloading,
      String? downloadError});

  $AudioTrackModelCopyWith<$Res>? get currentTrack;
  $AudioPlayerStateCopyWith<$Res>? get playerState;
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res, $Val extends AudioState>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tracks = null,
    Object? playlists = null,
    Object? selectedCategory = null,
    Object? searchQuery = freezed,
    Object? currentTrack = freezed,
    Object? playerState = freezed,
    Object? queue = null,
    Object? currentIndex = null,
    Object? isShuffling = null,
    Object? repeatMode = freezed,
    Object? error = freezed,
    Object? isDownloading = null,
    Object? downloadError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<AudioTrackModel>,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistModel>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as AudioCategory,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrackModel?,
      playerState: freezed == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as AudioPlayerState?,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<AudioTrackModel>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isShuffling: null == isShuffling
          ? _value.isShuffling
          : isShuffling // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: freezed == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as RepeatMode?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadError: freezed == downloadError
          ? _value.downloadError
          : downloadError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioTrackModelCopyWith<$Res>? get currentTrack {
    if (_value.currentTrack == null) {
      return null;
    }

    return $AudioTrackModelCopyWith<$Res>(_value.currentTrack!, (value) {
      return _then(_value.copyWith(currentTrack: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioPlayerStateCopyWith<$Res>? get playerState {
    if (_value.playerState == null) {
      return null;
    }

    return $AudioPlayerStateCopyWith<$Res>(_value.playerState!, (value) {
      return _then(_value.copyWith(playerState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioStateImplCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$AudioStateImplCopyWith(
          _$AudioStateImpl value, $Res Function(_$AudioStateImpl) then) =
      __$$AudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<AudioTrackModel> tracks,
      List<PlaylistModel> playlists,
      AudioCategory selectedCategory,
      String? searchQuery,
      AudioTrackModel? currentTrack,
      AudioPlayerState? playerState,
      List<AudioTrackModel> queue,
      int currentIndex,
      bool isShuffling,
      RepeatMode? repeatMode,
      String? error,
      bool isDownloading,
      String? downloadError});

  @override
  $AudioTrackModelCopyWith<$Res>? get currentTrack;
  @override
  $AudioPlayerStateCopyWith<$Res>? get playerState;
}

/// @nodoc
class __$$AudioStateImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$AudioStateImpl>
    implements _$$AudioStateImplCopyWith<$Res> {
  __$$AudioStateImplCopyWithImpl(
      _$AudioStateImpl _value, $Res Function(_$AudioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tracks = null,
    Object? playlists = null,
    Object? selectedCategory = null,
    Object? searchQuery = freezed,
    Object? currentTrack = freezed,
    Object? playerState = freezed,
    Object? queue = null,
    Object? currentIndex = null,
    Object? isShuffling = null,
    Object? repeatMode = freezed,
    Object? error = freezed,
    Object? isDownloading = null,
    Object? downloadError = freezed,
  }) {
    return _then(_$AudioStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<AudioTrackModel>,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistModel>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as AudioCategory,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrackModel?,
      playerState: freezed == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as AudioPlayerState?,
      queue: null == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<AudioTrackModel>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isShuffling: null == isShuffling
          ? _value.isShuffling
          : isShuffling // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: freezed == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as RepeatMode?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadError: freezed == downloadError
          ? _value.downloadError
          : downloadError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AudioStateImpl extends _AudioState {
  const _$AudioStateImpl(
      {this.isLoading = true,
      final List<AudioTrackModel> tracks = const [],
      final List<PlaylistModel> playlists = const [],
      this.selectedCategory = AudioCategory.all,
      this.searchQuery,
      this.currentTrack,
      this.playerState,
      final List<AudioTrackModel> queue = const [],
      this.currentIndex = 0,
      this.isShuffling = false,
      this.repeatMode,
      this.error,
      this.isDownloading = false,
      this.downloadError})
      : _tracks = tracks,
        _playlists = playlists,
        _queue = queue,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<AudioTrackModel> _tracks;
  @override
  @JsonKey()
  List<AudioTrackModel> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  final List<PlaylistModel> _playlists;
  @override
  @JsonKey()
  List<PlaylistModel> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  @JsonKey()
  final AudioCategory selectedCategory;
  @override
  final String? searchQuery;
  @override
  final AudioTrackModel? currentTrack;
  @override
  final AudioPlayerState? playerState;
  final List<AudioTrackModel> _queue;
  @override
  @JsonKey()
  List<AudioTrackModel> get queue {
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final bool isShuffling;
  @override
  final RepeatMode? repeatMode;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isDownloading;
  @override
  final String? downloadError;

  @override
  String toString() {
    return 'AudioState(isLoading: $isLoading, tracks: $tracks, playlists: $playlists, selectedCategory: $selectedCategory, searchQuery: $searchQuery, currentTrack: $currentTrack, playerState: $playerState, queue: $queue, currentIndex: $currentIndex, isShuffling: $isShuffling, repeatMode: $repeatMode, error: $error, isDownloading: $isDownloading, downloadError: $downloadError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.currentTrack, currentTrack) ||
                other.currentTrack == currentTrack) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState) &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.isShuffling, isShuffling) ||
                other.isShuffling == isShuffling) &&
            (identical(other.repeatMode, repeatMode) ||
                other.repeatMode == repeatMode) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading) &&
            (identical(other.downloadError, downloadError) ||
                other.downloadError == downloadError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_tracks),
      const DeepCollectionEquality().hash(_playlists),
      selectedCategory,
      searchQuery,
      currentTrack,
      playerState,
      const DeepCollectionEquality().hash(_queue),
      currentIndex,
      isShuffling,
      repeatMode,
      error,
      isDownloading,
      downloadError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioStateImplCopyWith<_$AudioStateImpl> get copyWith =>
      __$$AudioStateImplCopyWithImpl<_$AudioStateImpl>(this, _$identity);
}

abstract class _AudioState extends AudioState {
  const factory _AudioState(
      {final bool isLoading,
      final List<AudioTrackModel> tracks,
      final List<PlaylistModel> playlists,
      final AudioCategory selectedCategory,
      final String? searchQuery,
      final AudioTrackModel? currentTrack,
      final AudioPlayerState? playerState,
      final List<AudioTrackModel> queue,
      final int currentIndex,
      final bool isShuffling,
      final RepeatMode? repeatMode,
      final String? error,
      final bool isDownloading,
      final String? downloadError}) = _$AudioStateImpl;
  const _AudioState._() : super._();

  @override
  bool get isLoading;
  @override
  List<AudioTrackModel> get tracks;
  @override
  List<PlaylistModel> get playlists;
  @override
  AudioCategory get selectedCategory;
  @override
  String? get searchQuery;
  @override
  AudioTrackModel? get currentTrack;
  @override
  AudioPlayerState? get playerState;
  @override
  List<AudioTrackModel> get queue;
  @override
  int get currentIndex;
  @override
  bool get isShuffling;
  @override
  RepeatMode? get repeatMode;
  @override
  String? get error;
  @override
  bool get isDownloading;
  @override
  String? get downloadError;
  @override
  @JsonKey(ignore: true)
  _$$AudioStateImplCopyWith<_$AudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
