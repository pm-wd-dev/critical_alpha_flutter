import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_model.freezed.dart';
part 'audio_model.g.dart';

@freezed
class AudioTrackModel with _$AudioTrackModel {
  const factory AudioTrackModel({
    required String id,
    required String title,
    required String artist,
    String? album,
    String? description,
    required String url,
    String? thumbnailUrl,
    String? largeImageUrl,
    required Duration duration,
    required AudioCategory category,
    required AudioType type,
    @Default(AudioQuality.medium) AudioQuality quality,
    List<String>? tags,
    @Default(0) int playCount,
    @Default(0.0) double rating,
    @Default(0) int ratingCount,
    @Default(false) bool isFavorite,
    @Default(false) bool isDownloaded,
    @Default(false) bool isPremium,
    String? language,
    String? narrator,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    AudioMetadata? metadata,
    List<AudioChapter>? chapters,
    Map<String, dynamic>? customProperties,
  }) = _AudioTrackModel;

  factory AudioTrackModel.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackModelFromJson(json);

  const AudioTrackModel._();

  /// Duration in minutes
  int get durationInMinutes => duration.inMinutes;

  /// Duration in hours
  double get durationInHours => duration.inMinutes / 60.0;

  /// Formatted duration string (e.g., "1:23:45" or "23:45")
  String get formattedDuration {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  /// Short duration format (e.g., "1h 23m" or "23m")
  String get shortDuration {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  /// Whether the track is a podcast episode
  bool get isPodcast => type == AudioType.podcast;

  /// Whether the track is an audiobook
  bool get isAudiobook => type == AudioType.audiobook;

  /// Whether the track is music
  bool get isMusic => type == AudioType.music;

  /// Whether the track is meditation content
  bool get isMeditation => type == AudioType.meditation;

  /// Whether the track has chapters
  bool get hasChapters => chapters != null && chapters!.isNotEmpty;

  /// Average rating
  double get averageRating => ratingCount > 0 ? rating / ratingCount : 0.0;

  /// Popularity score based on plays and rating
  double get popularityScore {
    final playScore = playCount * 0.7;
    final ratingScore = averageRating * 20; // Scale 0-5 to 0-100
    return (playScore + ratingScore).clamp(0.0, 100.0);
  }

  /// Whether the track is popular (high play count or rating)
  bool get isPopular => popularityScore > 50;

  /// Whether the track is new (published within last 30 days)
  bool get isNew {
    if (publishedAt == null) return false;
    return DateTime.now().difference(publishedAt!).inDays <= 30;
  }

  /// Whether the track is trending (high recent activity)
  bool get isTrending => isNew && isPopular;

  /// File extension from URL
  String? get fileExtension {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;
    final path = uri.path.toLowerCase();
    if (path.endsWith('.mp3')) return 'mp3';
    if (path.endsWith('.m4a')) return 'm4a';
    if (path.endsWith('.wav')) return 'wav';
    if (path.endsWith('.flac')) return 'flac';
    return null;
  }

  /// Estimated file size in MB (rough calculation)
  double get estimatedSizeInMB {
    final minutes = durationInMinutes;
    switch (quality) {
      case AudioQuality.low:
        return minutes * 0.9; // ~64 kbps
      case AudioQuality.medium:
        return minutes * 1.4; // ~128 kbps
      case AudioQuality.high:
        return minutes * 2.3; // ~256 kbps
      case AudioQuality.premium:
        return minutes * 4.6; // ~320 kbps
    }
  }

  /// Display subtitle (artist or narrator)
  String get subtitle {
    if (narrator != null && narrator!.isNotEmpty) return narrator!;
    return artist;
  }
}

@freezed
class AudioChapter with _$AudioChapter {
  const factory AudioChapter({
    required String id,
    required String title,
    String? description,
    required Duration startTime,
    required Duration endTime,
    String? thumbnailUrl,
    Map<String, dynamic>? metadata,
  }) = _AudioChapter;

  factory AudioChapter.fromJson(Map<String, dynamic> json) =>
      _$AudioChapterFromJson(json);

  const AudioChapter._();

  /// Chapter duration
  Duration get duration => endTime - startTime;

  /// Formatted start time
  String get formattedStartTime {
    final minutes = startTime.inMinutes;
    final seconds = startTime.inSeconds.remainder(60);
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Formatted duration
  String get formattedDuration {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }
}

@freezed
class AudioMetadata with _$AudioMetadata {
  const factory AudioMetadata({
    @JsonKey(name: 'bit_rate') int? bitRate,
    @JsonKey(name: 'sample_rate') int? sampleRate,
    String? codec,
    @JsonKey(name: 'file_size') int? fileSizeBytes,
    String? genre,
    String? mood,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    String? publisher,
    String? copyright,
    List<String>? contributors,
    Map<String, String>? lyrics,
    Map<String, dynamic>? technicalInfo,
  }) = _AudioMetadata;

  factory AudioMetadata.fromJson(Map<String, dynamic> json) =>
      _$AudioMetadataFromJson(json);

  const AudioMetadata._();

  /// File size in MB
  double? get fileSizeInMB =>
      fileSizeBytes != null ? fileSizeBytes! / (1024 * 1024) : null;

  /// Formatted file size
  String? get formattedFileSize {
    if (fileSizeBytes == null) return null;
    final mb = fileSizeInMB!;
    if (mb < 1) {
      return '${(fileSizeBytes! / 1024).toStringAsFixed(0)} KB';
    } else {
      return '${mb.toStringAsFixed(1)} MB';
    }
  }

  /// Quality description based on bit rate
  String get qualityDescription {
    if (bitRate == null) return 'Unknown';
    if (bitRate! >= 320) return 'Premium (320+ kbps)';
    if (bitRate! >= 256) return 'High (256 kbps)';
    if (bitRate! >= 128) return 'Medium (128 kbps)';
    return 'Low (< 128 kbps)';
  }
}

@freezed
class PlaylistModel with _$PlaylistModel {
  const factory PlaylistModel({
    required String id,
    required String name,
    String? description,
    String? imageUrl,
    required String createdBy,
    required List<String> trackIds,
    @Default(false) bool isPublic,
    @Default(false) bool isSystem,
    List<String>? tags,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'last_played') DateTime? lastPlayed,
    Map<String, dynamic>? metadata,
  }) = _PlaylistModel;

  factory PlaylistModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistModelFromJson(json);

  const PlaylistModel._();

  /// Number of tracks in playlist
  int get trackCount => trackIds.length;

  /// Whether the playlist is empty
  bool get isEmpty => trackIds.isEmpty;

  /// Whether the playlist has tracks
  bool get isNotEmpty => trackIds.isNotEmpty;

  /// Whether the playlist was recently played
  bool get isRecentlyPlayed {
    if (lastPlayed == null) return false;
    return DateTime.now().difference(lastPlayed!).inDays <= 7;
  }

  /// Whether the playlist was created by the current user
  bool isCreatedBy(String userId) => createdBy == userId;
}

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    AudioTrackModel? currentTrack,
    PlaylistModel? currentPlaylist,
    @Default(PlayerStatus.stopped) PlayerStatus status,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(1.0) double speed,
    @Default(1.0) double volume,
    @Default(false) bool isMuted,
    @Default(false) bool isShuffling,
    @Default(RepeatMode.none) RepeatMode repeatMode,
    List<AudioTrackModel>? queue,
    @Default(0) int currentIndex,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool isBuffering,
    Map<String, dynamic>? playerMetadata,
  }) = _AudioPlayerState;

  factory AudioPlayerState.fromJson(Map<String, dynamic> json) =>
      _$AudioPlayerStateFromJson(json);

  const AudioPlayerState._();

  /// Whether audio is currently playing
  bool get isPlaying => status == PlayerStatus.playing;

  /// Whether audio is paused
  bool get isPaused => status == PlayerStatus.paused;

  /// Whether audio is stopped
  bool get isStopped => status == PlayerStatus.stopped;

  /// Whether audio is completed
  bool get isCompleted => status == PlayerStatus.completed;

  /// Progress as percentage (0.0 to 1.0)
  double get progress {
    if (duration == Duration.zero) return 0.0;
    return position.inMilliseconds / duration.inMilliseconds;
  }

  /// Progress as percentage (0 to 100)
  int get progressPercentage => (progress * 100).round();

  /// Remaining time
  Duration get remaining => duration - position;

  /// Formatted position
  String get formattedPosition {
    final minutes = position.inMinutes;
    final seconds = position.inSeconds.remainder(60);
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Formatted duration
  String get formattedDuration {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Formatted remaining time
  String get formattedRemaining {
    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds.remainder(60);
    return '-${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Whether there's a next track in queue
  bool get hasNext {
    if (queue == null) return false;
    return currentIndex < queue!.length - 1;
  }

  /// Whether there's a previous track in queue
  bool get hasPrevious => currentIndex > 0;

  /// Next track in queue
  AudioTrackModel? get nextTrack {
    if (!hasNext || queue == null) return null;
    return queue![currentIndex + 1];
  }

  /// Previous track in queue
  AudioTrackModel? get previousTrack {
    if (!hasPrevious || queue == null) return null;
    return queue![currentIndex - 1];
  }

  /// Whether player has an error
  bool get hasError => error != null && error!.isNotEmpty;

  /// Queue size
  int get queueSize => queue?.length ?? 0;

  /// Tracks remaining in queue
  int get tracksRemaining => hasNext ? queueSize - currentIndex - 1 : 0;
}

// Enums
enum AudioCategory {
  @JsonValue('music')
  music,
  @JsonValue('podcast')
  podcast,
  @JsonValue('audiobook')
  audiobook,
  @JsonValue('meditation')
  meditation,
  @JsonValue('education')
  education,
  @JsonValue('news')
  news,
  @JsonValue('comedy')
  comedy,
  @JsonValue('business')
  business,
  @JsonValue('health')
  health,
  @JsonValue('technology')
  technology,
  @JsonValue('other')
  other,
}

enum AudioType {
  @JsonValue('music')
  music,
  @JsonValue('podcast')
  podcast,
  @JsonValue('audiobook')
  audiobook,
  @JsonValue('meditation')
  meditation,
  @JsonValue('sound_effect')
  soundEffect,
  @JsonValue('voice_memo')
  voiceMemo,
}

enum AudioQuality {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('premium')
  premium,
}

enum PlayerStatus {
  @JsonValue('stopped')
  stopped,
  @JsonValue('playing')
  playing,
  @JsonValue('paused')
  paused,
  @JsonValue('completed')
  completed,
  @JsonValue('error')
  error,
}

enum RepeatMode {
  @JsonValue('none')
  none,
  @JsonValue('one')
  one,
  @JsonValue('all')
  all,
}

// Extensions
extension AudioTrackListExtensions on List<AudioTrackModel> {
  /// Get tracks by category
  List<AudioTrackModel> byCategory(AudioCategory category) =>
      where((track) => track.category == category).toList();

  /// Get tracks by type
  List<AudioTrackModel> byType(AudioType type) =>
      where((track) => track.type == type).toList();

  /// Get favorite tracks
  List<AudioTrackModel> get favorites =>
      where((track) => track.isFavorite).toList();

  /// Get downloaded tracks
  List<AudioTrackModel> get downloaded =>
      where((track) => track.isDownloaded).toList();

  /// Get popular tracks
  List<AudioTrackModel> get popular =>
      where((track) => track.isPopular).toList();

  /// Get new tracks
  List<AudioTrackModel> get newTracks =>
      where((track) => track.isNew).toList();

  /// Get trending tracks
  List<AudioTrackModel> get trending =>
      where((track) => track.isTrending).toList();

  /// Get premium tracks
  List<AudioTrackModel> get premium =>
      where((track) => track.isPremium).toList();

  /// Get free tracks
  List<AudioTrackModel> get free =>
      where((track) => !track.isPremium).toList();

  /// Sort by popularity
  List<AudioTrackModel> get sortedByPopularity {
    final list = List<AudioTrackModel>.from(this);
    list.sort((a, b) => b.popularityScore.compareTo(a.popularityScore));
    return list;
  }

  /// Sort by rating
  List<AudioTrackModel> get sortedByRating {
    final list = List<AudioTrackModel>.from(this);
    list.sort((a, b) => b.averageRating.compareTo(a.averageRating));
    return list;
  }

  /// Sort by duration
  List<AudioTrackModel> get sortedByDuration {
    final list = List<AudioTrackModel>.from(this);
    list.sort((a, b) => a.duration.compareTo(b.duration));
    return list;
  }

  /// Sort by date (newest first)
  List<AudioTrackModel> get sortedByDate {
    final list = List<AudioTrackModel>.from(this);
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  /// Group by category
  Map<AudioCategory, List<AudioTrackModel>> get groupedByCategory {
    final map = <AudioCategory, List<AudioTrackModel>>{};
    for (final track in this) {
      (map[track.category] ??= <AudioTrackModel>[]).add(track);
    }
    return map;
  }

  /// Group by artist
  Map<String, List<AudioTrackModel>> get groupedByArtist {
    final map = <String, List<AudioTrackModel>>{};
    for (final track in this) {
      (map[track.artist] ??= <AudioTrackModel>[]).add(track);
    }
    return map;
  }

  /// Filter by tags
  List<AudioTrackModel> withTags(List<String> tags) {
    return where((track) {
      if (track.tags == null) return false;
      return tags.any((tag) => track.tags!.contains(tag));
    }).toList();
  }

  /// Search tracks by title, artist, or description
  List<AudioTrackModel> search(String query) {
    final lowercaseQuery = query.toLowerCase();
    return where((track) {
      return track.title.toLowerCase().contains(lowercaseQuery) ||
             track.artist.toLowerCase().contains(lowercaseQuery) ||
             track.description?.toLowerCase().contains(lowercaseQuery) == true;
    }).toList();
  }

  /// Get total duration
  Duration get totalDuration {
    return fold(Duration.zero, (total, track) => total + track.duration);
  }

  /// Get average rating
  double get averageRating {
    final tracksWithRating = where((track) => track.ratingCount > 0).toList();
    if (tracksWithRating.isEmpty) return 0.0;
    return tracksWithRating.fold(0.0, (sum, track) => sum + track.averageRating) /
           tracksWithRating.length;
  }

  /// Shuffle the list
  List<AudioTrackModel> get shuffled {
    final list = List<AudioTrackModel>.from(this);
    list.shuffle();
    return list;
  }

  /// Take random tracks
  List<AudioTrackModel> takeRandom(int count) {
    if (count >= length) return shuffled;
    return shuffled.take(count).toList();
  }
}