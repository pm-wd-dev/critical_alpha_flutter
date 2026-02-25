import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_models.freezed.dart';
part 'audio_models.g.dart';

@freezed
class AudioCategory with _$AudioCategory {
  const factory AudioCategory({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'title') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'icon') String? imageUrl,
    @JsonKey(name: 'audio_count') int? audioCount,
    @JsonKey(name: 'is_locked') @Default(false) bool isLocked,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _AudioCategory;

  factory AudioCategory.fromJson(Map<String, dynamic> json) =>
      _$AudioCategoryFromJson(json);
}

@freezed
class AudioTrack with _$AudioTrack {
  const factory AudioTrack({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'audio_file') required String audioUrl,
    @JsonKey(name: 'thumbnail', defaultValue: null) String? thumbnailUrl,
    @JsonKey(name: 'icon', defaultValue: null) String? iconUrl,
    @JsonKey(name: 'audio_duration', fromJson: _parseDuration) int? durationSeconds,
    @JsonKey(name: 'author_name') String? authorName,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
    @JsonKey(name: 'play_count') @Default(0) int playCount,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
    @JsonKey(name: 'last_played_position') @Default(0) int lastPlayedPosition,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _AudioTrack;

  factory AudioTrack.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackFromJson(json);

  const AudioTrack._();

  String get formattedDuration {
    if (durationSeconds == null) return '00:00';
    final minutes = durationSeconds! ~/ 60;
    final seconds = durationSeconds! % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get progressPercentage {
    if (durationSeconds == null || durationSeconds == 0) return 0.0;
    return lastPlayedPosition / durationSeconds!;
  }
}

// Helper function to parse duration string (e.g., "11:34") to seconds
int? _parseDuration(dynamic value) {
  if (value == null) return null;

  // If it's already an int, return it
  if (value is int) return value;

  // If it's a string in format "mm:ss" or "hh:mm:ss"
  if (value is String) {
    final parts = value.split(':');
    if (parts.length == 2) {
      // mm:ss format
      final minutes = int.tryParse(parts[0]) ?? 0;
      final seconds = int.tryParse(parts[1]) ?? 0;
      return (minutes * 60) + seconds;
    } else if (parts.length == 3) {
      // hh:mm:ss format
      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;
      final seconds = int.tryParse(parts[2]) ?? 0;
      return (hours * 3600) + (minutes * 60) + seconds;
    }
  }

  return null;
}

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    AudioTrack? currentTrack,
    @Default(false) bool isPlaying,
    @Default(false) bool isLoading,
    @Default(false) bool isBuffering,
    @Default(0) int currentPosition,
    @Default(0) int duration,
    @Default(1.0) double playbackSpeed,
    @Default(1.0) double volume,
    @Default([]) List<AudioTrack> playlist,
    @Default(0) int currentIndex,
    String? error,
  }) = _AudioPlayerState;

  const AudioPlayerState._();

  bool get hasTrack => currentTrack != null;
  bool get canPlayNext => currentIndex < playlist.length - 1;
  bool get canPlayPrevious => currentIndex > 0;

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