import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/network/api_client.dart';
import '../models/audio_models.dart';
import '../services/audio_service.dart';

part 'critical_alpha_audio_controller.freezed.dart';

@freezed
class CriticalAlphaAudioState with _$CriticalAlphaAudioState {
  const factory CriticalAlphaAudioState({
    @Default(true) bool isLoading,
    @Default([]) List<AudioCategory> categories,
    @Default({}) Map<String, List<AudioTrack>> tracksByCategory,
    AudioCategory? selectedCategory,
    AudioTrack? currentTrack,
    @Default(false) bool isPlaying,
    @Default(false) bool isBuffering,
    @Default(0) int currentPosition,
    @Default(0) int duration,
    @Default(1.0) double playbackSpeed,
    String? error,
  }) = _CriticalAlphaAudioState;

  const CriticalAlphaAudioState._();

  List<AudioTrack> get currentCategoryTracks =>
      selectedCategory != null ? tracksByCategory[selectedCategory!.id] ?? [] : [];

  String get formattedPosition {
    final minutes = currentPosition ~/ 60;
    final seconds = currentPosition % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get progress {
    if (duration == 0) return 0.0;
    return currentPosition / duration;
  }
}

class CriticalAlphaAudioController extends StateNotifier<CriticalAlphaAudioState> {
  final AudioApiService _audioService;
  final AudioPlayer _audioPlayer;
  final Ref _ref;

  CriticalAlphaAudioController(this._audioService, this._ref)
      : _audioPlayer = AudioPlayer(),
        super(const CriticalAlphaAudioState()) {
    _setupAudioPlayer();
    loadCategories();
  }

  void _setupAudioPlayer() {
    // Listen to player state changes
    _audioPlayer.playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });

    // Listen to position changes
    _audioPlayer.positionStream.listen((position) {
      state = state.copyWith(currentPosition: position.inSeconds);
    });

    // Listen to duration changes
    _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        state = state.copyWith(duration: duration.inSeconds);
      }
    });

    // Listen to buffering state
    _audioPlayer.processingStateStream.listen((processingState) {
      switch (processingState) {
        case ProcessingState.loading:
        case ProcessingState.buffering:
          state = state.copyWith(isBuffering: true);
          break;
        case ProcessingState.ready:
          state = state.copyWith(isBuffering: false);
          break;
        case ProcessingState.completed:
          // Track completed - could auto-play next or stop
          pause();
          seekTo(0);
          break;
        default:
          state = state.copyWith(isBuffering: false);
      }
    });
  }

  Future<void> loadCategories() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final categories = await _audioService.getAudioCategories();
      state = state.copyWith(
        isLoading: false,
        categories: categories,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> selectCategory(AudioCategory category) async {
    state = state.copyWith(selectedCategory: category, error: null);

    // Check if we already have tracks for this category
    if (state.tracksByCategory.containsKey(category.id)) {
      return;
    }

    // Load tracks for this category
    await loadTracksForCategory(category.id);
  }

  Future<void> loadTracksForCategory(String categoryId) async {
    try {
      final tracks = await _audioService.getAudioTracks(categoryId);

      final updatedTracks = Map<String, List<AudioTrack>>.from(state.tracksByCategory);
      updatedTracks[categoryId] = tracks;

      state = state.copyWith(tracksByCategory: updatedTracks);
    } catch (e) {
      state = state.copyWith(error: 'Failed to load tracks: $e');
    }
  }

  Future<void> playTrack(AudioTrack track) async {
    state = state.copyWith(currentTrack: track, isBuffering: true);

    try {
      await _audioPlayer.setUrl(track.audioUrl);
      await _audioPlayer.play();

      // Update track progress on server
      _audioService.updateTrackProgress(
        trackId: track.id,
        position: 0,
        playCount: track.playCount + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isBuffering: false,
        error: 'Failed to play track: $e',
      );
    }
  }

  Future<void> play() async {
    await _audioPlayer.play();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> seekTo(int seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds));
  }

  Future<void> skipForward() async {
    final newPosition = state.currentPosition + 15;
    final maxPosition = state.duration;

    if (newPosition < maxPosition) {
      await seekTo(newPosition);
    } else {
      await seekTo(maxPosition);
    }
  }

  Future<void> skipBackward() async {
    final newPosition = state.currentPosition - 15;

    if (newPosition > 0) {
      await seekTo(newPosition);
    } else {
      await seekTo(0);
    }
  }

  Future<void> setPlaybackSpeed(double speed) async {
    await _audioPlayer.setSpeed(speed);
    state = state.copyWith(playbackSpeed: speed);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    state = state.copyWith(
      isPlaying: false,
      currentPosition: 0,
      currentTrack: null,
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

// Providers
final criticalAlphaAudioServiceProvider = Provider<AudioApiService>((ref) {
  final apiClient = ApiClient();
  return AudioApiService(apiClient);
});

final criticalAlphaAudioControllerProvider =
    StateNotifierProvider<CriticalAlphaAudioController, CriticalAlphaAudioState>((ref) {
  final audioService = ref.watch(criticalAlphaAudioServiceProvider);
  return CriticalAlphaAudioController(audioService, ref);
});

// Helper providers
final audioCategoriesProvider = Provider<List<AudioCategory>>((ref) {
  return ref.watch(criticalAlphaAudioControllerProvider).categories;
});

final selectedAudioCategoryProvider = Provider<AudioCategory?>((ref) {
  return ref.watch(criticalAlphaAudioControllerProvider).selectedCategory;
});

final currentCategoryAudioTracksProvider = Provider<List<AudioTrack>>((ref) {
  return ref.watch(criticalAlphaAudioControllerProvider).currentCategoryTracks;
});

final currentAudioTrackProvider = Provider<AudioTrack?>((ref) {
  return ref.watch(criticalAlphaAudioControllerProvider).currentTrack;
});

final isAudioPlayingProvider = Provider<bool>((ref) {
  return ref.watch(criticalAlphaAudioControllerProvider).isPlaying;
});

final audioPlaybackSpeedProvider = Provider<double>((ref) {
  return ref.watch(criticalAlphaAudioControllerProvider).playbackSpeed;
});