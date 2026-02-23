// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioTrackModelImpl _$$AudioTrackModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AudioTrackModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      largeImageUrl: json['largeImageUrl'] as String?,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      category: $enumDecode(_$AudioCategoryEnumMap, json['category']),
      type: $enumDecode(_$AudioTypeEnumMap, json['type']),
      quality: $enumDecodeNullable(_$AudioQualityEnumMap, json['quality']) ??
          AudioQuality.medium,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      playCount: (json['playCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      isDownloaded: json['isDownloaded'] as bool? ?? false,
      isPremium: json['isPremium'] as bool? ?? false,
      language: json['language'] as String?,
      narrator: json['narrator'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      metadata: json['metadata'] == null
          ? null
          : AudioMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => AudioChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      customProperties: json['customProperties'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AudioTrackModelImplToJson(
        _$AudioTrackModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'album': instance.album,
      'description': instance.description,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'largeImageUrl': instance.largeImageUrl,
      'duration': instance.duration.inMicroseconds,
      'category': _$AudioCategoryEnumMap[instance.category]!,
      'type': _$AudioTypeEnumMap[instance.type]!,
      'quality': _$AudioQualityEnumMap[instance.quality]!,
      'tags': instance.tags,
      'playCount': instance.playCount,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'isFavorite': instance.isFavorite,
      'isDownloaded': instance.isDownloaded,
      'isPremium': instance.isPremium,
      'language': instance.language,
      'narrator': instance.narrator,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'published_at': instance.publishedAt?.toIso8601String(),
      'metadata': instance.metadata,
      'chapters': instance.chapters,
      'customProperties': instance.customProperties,
    };

const _$AudioCategoryEnumMap = {
  AudioCategory.music: 'music',
  AudioCategory.podcast: 'podcast',
  AudioCategory.audiobook: 'audiobook',
  AudioCategory.meditation: 'meditation',
  AudioCategory.education: 'education',
  AudioCategory.news: 'news',
  AudioCategory.comedy: 'comedy',
  AudioCategory.business: 'business',
  AudioCategory.health: 'health',
  AudioCategory.technology: 'technology',
  AudioCategory.other: 'other',
};

const _$AudioTypeEnumMap = {
  AudioType.music: 'music',
  AudioType.podcast: 'podcast',
  AudioType.audiobook: 'audiobook',
  AudioType.meditation: 'meditation',
  AudioType.soundEffect: 'sound_effect',
  AudioType.voiceMemo: 'voice_memo',
};

const _$AudioQualityEnumMap = {
  AudioQuality.low: 'low',
  AudioQuality.medium: 'medium',
  AudioQuality.high: 'high',
  AudioQuality.premium: 'premium',
};

_$AudioChapterImpl _$$AudioChapterImplFromJson(Map<String, dynamic> json) =>
    _$AudioChapterImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      startTime: Duration(microseconds: (json['startTime'] as num).toInt()),
      endTime: Duration(microseconds: (json['endTime'] as num).toInt()),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AudioChapterImplToJson(_$AudioChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime.inMicroseconds,
      'endTime': instance.endTime.inMicroseconds,
      'thumbnailUrl': instance.thumbnailUrl,
      'metadata': instance.metadata,
    };

_$AudioMetadataImpl _$$AudioMetadataImplFromJson(Map<String, dynamic> json) =>
    _$AudioMetadataImpl(
      bitRate: (json['bit_rate'] as num?)?.toInt(),
      sampleRate: (json['sample_rate'] as num?)?.toInt(),
      codec: json['codec'] as String?,
      fileSizeBytes: (json['file_size'] as num?)?.toInt(),
      genre: json['genre'] as String?,
      mood: json['mood'] as String?,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      publisher: json['publisher'] as String?,
      copyright: json['copyright'] as String?,
      contributors: (json['contributors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lyrics: (json['lyrics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      technicalInfo: json['technicalInfo'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AudioMetadataImplToJson(_$AudioMetadataImpl instance) =>
    <String, dynamic>{
      'bit_rate': instance.bitRate,
      'sample_rate': instance.sampleRate,
      'codec': instance.codec,
      'file_size': instance.fileSizeBytes,
      'genre': instance.genre,
      'mood': instance.mood,
      'release_date': instance.releaseDate?.toIso8601String(),
      'publisher': instance.publisher,
      'copyright': instance.copyright,
      'contributors': instance.contributors,
      'lyrics': instance.lyrics,
      'technicalInfo': instance.technicalInfo,
    };

_$PlaylistModelImpl _$$PlaylistModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      createdBy: json['createdBy'] as String,
      trackIds:
          (json['trackIds'] as List<dynamic>).map((e) => e as String).toList(),
      isPublic: json['isPublic'] as bool? ?? false,
      isSystem: json['isSystem'] as bool? ?? false,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      lastPlayed: json['last_played'] == null
          ? null
          : DateTime.parse(json['last_played'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PlaylistModelImplToJson(_$PlaylistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'createdBy': instance.createdBy,
      'trackIds': instance.trackIds,
      'isPublic': instance.isPublic,
      'isSystem': instance.isSystem,
      'tags': instance.tags,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'last_played': instance.lastPlayed?.toIso8601String(),
      'metadata': instance.metadata,
    };

_$AudioPlayerStateImpl _$$AudioPlayerStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AudioPlayerStateImpl(
      currentTrack: json['currentTrack'] == null
          ? null
          : AudioTrackModel.fromJson(
              json['currentTrack'] as Map<String, dynamic>),
      currentPlaylist: json['currentPlaylist'] == null
          ? null
          : PlaylistModel.fromJson(
              json['currentPlaylist'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$PlayerStatusEnumMap, json['status']) ??
          PlayerStatus.stopped,
      position: json['position'] == null
          ? Duration.zero
          : Duration(microseconds: (json['position'] as num).toInt()),
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['duration'] as num).toInt()),
      speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
      volume: (json['volume'] as num?)?.toDouble() ?? 1.0,
      isMuted: json['isMuted'] as bool? ?? false,
      isShuffling: json['isShuffling'] as bool? ?? false,
      repeatMode:
          $enumDecodeNullable(_$RepeatModeEnumMap, json['repeatMode']) ??
              RepeatMode.none,
      queue: (json['queue'] as List<dynamic>?)
          ?.map((e) => AudioTrackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentIndex: (json['currentIndex'] as num?)?.toInt() ?? 0,
      error: json['error'] as String?,
      isLoading: json['isLoading'] as bool? ?? false,
      isBuffering: json['isBuffering'] as bool? ?? false,
      playerMetadata: json['playerMetadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AudioPlayerStateImplToJson(
        _$AudioPlayerStateImpl instance) =>
    <String, dynamic>{
      'currentTrack': instance.currentTrack,
      'currentPlaylist': instance.currentPlaylist,
      'status': _$PlayerStatusEnumMap[instance.status]!,
      'position': instance.position.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'speed': instance.speed,
      'volume': instance.volume,
      'isMuted': instance.isMuted,
      'isShuffling': instance.isShuffling,
      'repeatMode': _$RepeatModeEnumMap[instance.repeatMode]!,
      'queue': instance.queue,
      'currentIndex': instance.currentIndex,
      'error': instance.error,
      'isLoading': instance.isLoading,
      'isBuffering': instance.isBuffering,
      'playerMetadata': instance.playerMetadata,
    };

const _$PlayerStatusEnumMap = {
  PlayerStatus.stopped: 'stopped',
  PlayerStatus.playing: 'playing',
  PlayerStatus.paused: 'paused',
  PlayerStatus.completed: 'completed',
  PlayerStatus.error: 'error',
};

const _$RepeatModeEnumMap = {
  RepeatMode.none: 'none',
  RepeatMode.one: 'one',
  RepeatMode.all: 'all',
};
