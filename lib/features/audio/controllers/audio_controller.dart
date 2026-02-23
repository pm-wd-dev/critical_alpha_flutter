import 'package:flutter/material.dart' hide RepeatMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/errors/failures.dart';
import '../../auth/controllers/auth_controller.dart';
import '../models/audio_model.dart';

part 'audio_controller.freezed.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState({
    @Default(true) bool isLoading,
    @Default([]) List<AudioTrackModel> tracks,
    @Default([]) List<PlaylistModel> playlists,
    @Default(AudioCategory.all) AudioCategory selectedCategory,
    String? searchQuery,
    AudioTrackModel? currentTrack,
    AudioPlayerState? playerState,
    @Default([]) List<AudioTrackModel> queue,
    @Default(0) int currentIndex,
    @Default(false) bool isShuffling,
    RepeatMode? repeatMode,
    String? error,
    @Default(false) bool isDownloading,
    String? downloadError,
  }) = _AudioState;

  const AudioState._();

  bool get hasError => error != null;
  bool get hasDownloadError => downloadError != null;
  bool get hasData => tracks.isNotEmpty;
  bool get isEmpty => tracks.isEmpty && !isLoading;

  List<AudioTrackModel> get filteredTracks {
    var filtered = tracks;

    // Apply category filter
    if (selectedCategory != AudioCategory.all) {
      filtered = filtered.where((track) => track.category == selectedCategory).toList();
    }

    // Apply search filter
    if (searchQuery != null && searchQuery!.trim().isNotEmpty) {
      final query = searchQuery!.toLowerCase();
      filtered = filtered.where((track) {
        return track.title.toLowerCase().contains(query) ||
               track.artist.toLowerCase().contains(query) ||
               track.description?.toLowerCase().contains(query) == true ||
               track.tags?.any((tag) => tag.toLowerCase().contains(query)) == true;
      }).toList();
    }

    return filtered;
  }

  // Get tracks by type
  List<AudioTrackModel> get musicTracks =>
      filteredTracks.where((track) => track.isMusic).toList();

  List<AudioTrackModel> get podcastTracks =>
      filteredTracks.where((track) => track.isPodcast).toList();

  List<AudioTrackModel> get audiobookTracks =>
      filteredTracks.where((track) => track.isAudiobook).toList();

  List<AudioTrackModel> get meditationTracks =>
      filteredTracks.where((track) => track.isMeditation).toList();

  List<AudioTrackModel> get favoriteTracks =>
      filteredTracks.where((track) => track.isFavorite).toList();

  List<AudioTrackModel> get downloadedTracks =>
      filteredTracks.where((track) => track.isDownloaded).toList();

  bool get isPlaying => playerState?.isPlaying ?? false;
  bool get isPaused => playerState?.isPaused ?? false;
  bool get isBuffering => playerState?.isBuffering ?? false;
  bool get hasCurrentTrack => currentTrack != null;
}

class AudioController extends StateNotifier<AudioState> {
  final ApiClient _apiClient;
  final Ref _ref;
  final AudioPlayer _audioPlayer;

  AudioController(this._apiClient, this._ref)
      : _audioPlayer = AudioPlayer(),
        super(const AudioState()) {
    _initialize();
    _setupPlayerListeners();
  }

  Future<void> _initialize() async {
    await loadTracks();
    await loadPlaylists();
  }

  void _setupPlayerListeners() {
    // Listen to player state changes
    _audioPlayer.playerStateStream.listen((playerState) {
      final audioPlayerState = AudioPlayerState(
        status: _mapPlayerState(playerState),
        position: _audioPlayer.position,
        duration: _audioPlayer.duration ?? Duration.zero,
        isBuffering: playerState.processingState == ProcessingState.buffering,
        isLoading: playerState.processingState == ProcessingState.loading,
      );

      state = state.copyWith(playerState: audioPlayerState);
    });

    // Listen to position changes
    _audioPlayer.positionStream.listen((position) {
      if (state.playerState != null) {
        final updatedPlayerState = state.playerState!.copyWith(position: position);
        state = state.copyWith(playerState: updatedPlayerState);
      }
    });

    // Listen to duration changes
    _audioPlayer.durationStream.listen((duration) {
      if (state.playerState != null && duration != null) {
        final updatedPlayerState = state.playerState!.copyWith(duration: duration);
        state = state.copyWith(playerState: updatedPlayerState);
      }
    });

    // Listen for track completion
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        _handleTrackCompleted();
      }
    });
  }

  PlayerStatus _mapPlayerState(PlayerState playerState) {
    switch (playerState.processingState) {
      case ProcessingState.idle:
        return PlayerStatus.stopped;
      case ProcessingState.loading:
      case ProcessingState.buffering:
        return playerState.playing ? PlayerStatus.playing : PlayerStatus.paused;
      case ProcessingState.ready:
        return playerState.playing ? PlayerStatus.playing : PlayerStatus.paused;
      case ProcessingState.completed:
        return PlayerStatus.completed;
    }
  }

  Future<void> loadTracks() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'User not authenticated',
        );
        return;
      }

      final response = await _apiClient.get('/audio/tracks');
      final tracks = (response.data['data'] as List)
          .map((json) => AudioTrackModel.fromJson(json))
          .toList();

      state = state.copyWith(
        isLoading: false,
        tracks: tracks,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> loadPlaylists() async {
    try {
      final response = await _apiClient.get('/audio/playlists');
      final playlists = (response.data['data'] as List)
          .map((json) => PlaylistModel.fromJson(json))
          .toList();

      state = state.copyWith(playlists: playlists);
    } catch (e) {
      print('Failed to load playlists: $e');
    }
  }

  Future<void> playTrack(AudioTrackModel track) async {
    try {
      state = state.copyWith(currentTrack: track);

      // Stop current playback
      await _audioPlayer.stop();

      // Load and play new track
      await _audioPlayer.setUrl(track.url);
      await _audioPlayer.play();

      // Update play count
      await _updatePlayCount(track.id);

      // Add to recently played
      await _addToRecentlyPlayed(track.id);

    } catch (e) {
      throw AudioPlaybackException('Failed to play track: ${_getErrorMessage(e)}');
    }
  }

  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      throw AudioPlaybackException('Failed to pause: ${_getErrorMessage(e)}');
    }
  }

  Future<void> resume() async {
    try {
      await _audioPlayer.play();
    } catch (e) {
      throw AudioPlaybackException('Failed to resume: ${_getErrorMessage(e)}');
    }
  }

  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
      state = state.copyWith(currentTrack: null);
    } catch (e) {
      throw AudioPlaybackException('Failed to stop: ${_getErrorMessage(e)}');
    }
  }

  Future<void> seekTo(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      throw AudioPlaybackException('Failed to seek: ${_getErrorMessage(e)}');
    }
  }

  Future<void> setSpeed(double speed) async {
    try {
      await _audioPlayer.setSpeed(speed);
      if (state.playerState != null) {
        final updatedPlayerState = state.playerState!.copyWith(speed: speed);
        state = state.copyWith(playerState: updatedPlayerState);
      }
    } catch (e) {
      throw AudioPlaybackException('Failed to set speed: ${_getErrorMessage(e)}');
    }
  }

  Future<void> setVolume(double volume) async {
    try {
      await _audioPlayer.setVolume(volume.clamp(0.0, 1.0));
      if (state.playerState != null) {
        final updatedPlayerState = state.playerState!.copyWith(volume: volume);
        state = state.copyWith(playerState: updatedPlayerState);
      }
    } catch (e) {
      throw AudioPlaybackException('Failed to set volume: ${_getErrorMessage(e)}');
    }
  }

  void toggleMute() {
    final currentVolume = state.playerState?.volume ?? 1.0;
    final isMuted = state.playerState?.isMuted ?? false;

    if (isMuted) {
      setVolume(currentVolume);
    } else {
      setVolume(0.0);
    }

    if (state.playerState != null) {
      final updatedPlayerState = state.playerState!.copyWith(isMuted: !isMuted);
      state = state.copyWith(playerState: updatedPlayerState);
    }
  }

  void setRepeatMode(RepeatMode mode) {
    state = state.copyWith(repeatMode: mode);
  }

  void toggleShuffle() {
    state = state.copyWith(isShuffling: !state.isShuffling);
    if (state.isShuffling) {
      _shuffleQueue();
    } else {
      _restoreOriginalQueue();
    }
  }

  Future<void> playNext() async {
    if (state.queue.isEmpty) return;

    final nextIndex = state.currentIndex + 1;
    if (nextIndex < state.queue.length) {
      state = state.copyWith(currentIndex: nextIndex);
      await playTrack(state.queue[nextIndex]);
    } else if (state.repeatMode == RepeatMode.all) {
      state = state.copyWith(currentIndex: 0);
      await playTrack(state.queue[0]);
    }
  }

  Future<void> playPrevious() async {
    if (state.queue.isEmpty) return;

    final previousIndex = state.currentIndex - 1;
    if (previousIndex >= 0) {
      state = state.copyWith(currentIndex: previousIndex);
      await playTrack(state.queue[previousIndex]);
    } else if (state.repeatMode == RepeatMode.all) {
      final lastIndex = state.queue.length - 1;
      state = state.copyWith(currentIndex: lastIndex);
      await playTrack(state.queue[lastIndex]);
    }
  }

  Future<void> _handleTrackCompleted() async {
    final mode = state.repeatMode ?? RepeatMode.none;
    switch (mode) {
      case RepeatMode.one:
        if (state.currentTrack != null) {
          await playTrack(state.currentTrack!);
        }
        break;
      case RepeatMode.all:
      case RepeatMode.none:
        await playNext();
        break;
    }
  }

  void _shuffleQueue() {
    if (state.queue.isEmpty) return;

    final shuffledQueue = List<AudioTrackModel>.from(state.queue)..shuffle();

    // Keep current track at the beginning of shuffled queue
    if (state.currentTrack != null) {
      shuffledQueue.remove(state.currentTrack!);
      shuffledQueue.insert(0, state.currentTrack!);
    }

    state = state.copyWith(queue: shuffledQueue, currentIndex: 0);
  }

  void _restoreOriginalQueue() {
    // This would need to store the original queue order
    // For now, just reload the current tracks as queue
    state = state.copyWith(queue: state.tracks);

    // Find current track index in original queue
    if (state.currentTrack != null) {
      final index = state.tracks.indexWhere((track) => track.id == state.currentTrack!.id);
      state = state.copyWith(currentIndex: index >= 0 ? index : 0);
    }
  }

  Future<void> addToQueue(List<AudioTrackModel> tracks) async {
    final updatedQueue = [...state.queue, ...tracks];
    state = state.copyWith(queue: updatedQueue);
  }

  Future<void> setQueue(List<AudioTrackModel> tracks, {int startIndex = 0}) async {
    state = state.copyWith(
      queue: tracks,
      currentIndex: startIndex,
    );

    if (tracks.isNotEmpty && startIndex < tracks.length) {
      await playTrack(tracks[startIndex]);
    }
  }

  Future<void> removeFromQueue(int index) async {
    if (index < 0 || index >= state.queue.length) return;

    final updatedQueue = List<AudioTrackModel>.from(state.queue)..removeAt(index);

    // Adjust current index if necessary
    int newCurrentIndex = state.currentIndex;
    if (index < state.currentIndex) {
      newCurrentIndex--;
    } else if (index == state.currentIndex && index == updatedQueue.length) {
      newCurrentIndex = updatedQueue.length - 1;
    }

    state = state.copyWith(
      queue: updatedQueue,
      currentIndex: newCurrentIndex.clamp(0, updatedQueue.length - 1),
    );
  }

  Future<void> toggleFavorite(String trackId) async {
    try {
      final track = state.tracks.firstWhere((t) => t.id == trackId);
      final updatedTrack = track.copyWith(isFavorite: !track.isFavorite);

      // Update locally first
      final updatedTracks = state.tracks
          .map((t) => t.id == trackId ? updatedTrack : t)
          .toList();
      state = state.copyWith(tracks: updatedTracks);

      // Update on server
      await _apiClient.post('/audio/tracks/$trackId/favorite', data: {
        'is_favorite': updatedTrack.isFavorite,
      });

    } catch (e) {
      // Revert local changes if server update fails
      await loadTracks();
      throw NetworkException('Failed to update favorite: ${_getErrorMessage(e)}');
    }
  }

  Future<void> downloadTrack(String trackId) async {
    state = state.copyWith(isDownloading: true, downloadError: null);

    try {
      await _apiClient.post('/audio/tracks/$trackId/download');

      // Update track as downloaded
      final updatedTracks = state.tracks.map((track) {
        if (track.id == trackId) {
          return track.copyWith(isDownloaded: true);
        }
        return track;
      }).toList();

      state = state.copyWith(
        tracks: updatedTracks,
        isDownloading: false,
      );

    } catch (e) {
      state = state.copyWith(
        isDownloading: false,
        downloadError: _getErrorMessage(e),
      );
      rethrow;
    }
  }

  Future<void> createPlaylist(String name, {String? description, List<String>? trackIds}) async {
    try {
      final response = await _apiClient.post('/audio/playlists', data: {
        'name': name,
        'description': description,
        'track_ids': trackIds ?? [],
      });

      await loadPlaylists();
    } catch (e) {
      throw NetworkException('Failed to create playlist: ${_getErrorMessage(e)}');
    }
  }

  Future<void> addToPlaylist(String playlistId, List<String> trackIds) async {
    try {
      await _apiClient.post('/audio/playlists/$playlistId/tracks', data: {
        'track_ids': trackIds,
      });

      await loadPlaylists();
    } catch (e) {
      throw NetworkException('Failed to add to playlist: ${_getErrorMessage(e)}');
    }
  }

  Future<void> removeFromPlaylist(String playlistId, String trackId) async {
    try {
      await _apiClient.delete('/audio/playlists/$playlistId/tracks/$trackId');
      await loadPlaylists();
    } catch (e) {
      throw NetworkException('Failed to remove from playlist: ${_getErrorMessage(e)}');
    }
  }

  Future<void> deletePlaylist(String playlistId) async {
    try {
      await _apiClient.delete('/audio/playlists/$playlistId');
      await loadPlaylists();
    } catch (e) {
      throw NetworkException('Failed to delete playlist: ${_getErrorMessage(e)}');
    }
  }

  Future<void> _updatePlayCount(String trackId) async {
    try {
      await _apiClient.post('/audio/tracks/$trackId/play');
    } catch (e) {
      // Don't throw error for play count update failures
      print('Failed to update play count: $e');
    }
  }

  Future<void> _addToRecentlyPlayed(String trackId) async {
    try {
      await _apiClient.post('/audio/recently-played', data: {
        'track_id': trackId,
        'played_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      // Don't throw error for recently played update failures
      print('Failed to add to recently played: $e');
    }
  }

  // Filter and search methods
  void setCategory(AudioCategory category) {
    state = state.copyWith(selectedCategory: category);
  }

  void setSearchQuery(String? query) {
    state = state.copyWith(searchQuery: query);
  }

  void clearSearch() {
    state = state.copyWith(searchQuery: null);
  }

  Future<void> refreshTracks() async {
    await loadTracks();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearDownloadError() {
    state = state.copyWith(downloadError: null);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _getErrorMessage(dynamic error) {
    if (error is AppException) {
      return error.message;
    } else if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    } else {
      return error.toString();
    }
  }
}

// Enums
enum AudioCategory {
  all,
  music,
  podcast,
  audiobook,
  meditation,
  education,
  news,
  comedy,
  business,
  health,
  technology,
}

// Providers
final audioControllerProvider = StateNotifierProvider<AudioController, AudioState>((ref) {
  final apiClient = ApiClient();
  return AudioController(apiClient, ref);
});

// State providers
final audioTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).filteredTracks;
});

final audioPlaylistsProvider = Provider<List<PlaylistModel>>((ref) {
  return ref.watch(audioControllerProvider).playlists;
});

final currentTrackProvider = Provider<AudioTrackModel?>((ref) {
  return ref.watch(audioControllerProvider).currentTrack;
});

final audioPlayerStateProvider = Provider<AudioPlayerState?>((ref) {
  return ref.watch(audioControllerProvider).playerState;
});

final isLoadingAudioProvider = Provider<bool>((ref) {
  return ref.watch(audioControllerProvider).isLoading;
});

final audioErrorProvider = Provider<String?>((ref) {
  return ref.watch(audioControllerProvider).error;
});

// Category providers
final musicTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).musicTracks;
});

final podcastTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).podcastTracks;
});

final audiobookTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).audiobookTracks;
});

final meditationTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).meditationTracks;
});

final favoriteTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).favoriteTracks;
});

final downloadedTracksProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).downloadedTracks;
});

// Player state providers
final isPlayingProvider = Provider<bool>((ref) {
  return ref.watch(audioControllerProvider).isPlaying;
});

final isPausedProvider = Provider<bool>((ref) {
  return ref.watch(audioControllerProvider).isPaused;
});

final hasCurrentTrackProvider = Provider<bool>((ref) {
  return ref.watch(audioControllerProvider).hasCurrentTrack;
});

// Queue providers
final queueProvider = Provider<List<AudioTrackModel>>((ref) {
  return ref.watch(audioControllerProvider).queue;
});

final currentTrackIndexProvider = Provider<int>((ref) {
  return ref.watch(audioControllerProvider).currentIndex;
});

// Action providers
final playTrackProvider = Provider<Future<void> Function(AudioTrackModel)>((ref) {
  return (track) async {
    await ref.read(audioControllerProvider.notifier).playTrack(track);
  };
});

final pausePlayProvider = Provider<VoidCallback>((ref) {
  return () {
    final controller = ref.read(audioControllerProvider.notifier);
    final isPlaying = ref.read(isPlayingProvider);

    if (isPlaying) {
      controller.pause();
    } else {
      controller.resume();
    }
  };
});

final toggleFavoriteProvider = Provider<Future<void> Function(String)>((ref) {
  return (trackId) async {
    await ref.read(audioControllerProvider.notifier).toggleFavorite(trackId);
  };
});

// UI state providers
final hasAudioDataProvider = Provider<bool>((ref) {
  return ref.watch(audioControllerProvider).hasData;
});

final isAudioEmptyProvider = Provider<bool>((ref) {
  return ref.watch(audioControllerProvider).isEmpty;
});

final selectedAudioCategoryProvider = Provider<AudioCategory>((ref) {
  return ref.watch(audioControllerProvider).selectedCategory;
});

final audioSearchQueryProvider = Provider<String?>((ref) {
  return ref.watch(audioControllerProvider).searchQuery;
});