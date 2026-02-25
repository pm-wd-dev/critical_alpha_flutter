// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioCategoryImpl _$$AudioCategoryImplFromJson(Map<String, dynamic> json) =>
    _$AudioCategoryImpl(
      id: json['_id'] as String,
      name: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['icon'] as String?,
      audioCount: (json['audio_count'] as num?)?.toInt(),
      isLocked: json['is_locked'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AudioCategoryImplToJson(_$AudioCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.name,
      'description': instance.description,
      'icon': instance.imageUrl,
      'audio_count': instance.audioCount,
      'is_locked': instance.isLocked,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$AudioTrackImpl _$$AudioTrackImplFromJson(Map<String, dynamic> json) =>
    _$AudioTrackImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      categoryId: json['category_id'] as String,
      description: json['description'] as String?,
      audioUrl: json['audio_file'] as String,
      thumbnailUrl: json['thumbnail'] as String?,
      iconUrl: json['icon'] as String?,
      durationSeconds: _parseDuration(json['audio_duration']),
      authorName: json['author_name'] as String?,
      isFeatured: json['is_featured'] as bool? ?? false,
      playCount: (json['play_count'] as num?)?.toInt() ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
      lastPlayedPosition: (json['last_played_position'] as num?)?.toInt() ?? 0,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AudioTrackImplToJson(_$AudioTrackImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category_id': instance.categoryId,
      'description': instance.description,
      'audio_file': instance.audioUrl,
      'thumbnail': instance.thumbnailUrl,
      'icon': instance.iconUrl,
      'audio_duration': instance.durationSeconds,
      'author_name': instance.authorName,
      'is_featured': instance.isFeatured,
      'play_count': instance.playCount,
      'is_favorite': instance.isFavorite,
      'last_played_position': instance.lastPlayedPosition,
      'sort_order': instance.sortOrder,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
