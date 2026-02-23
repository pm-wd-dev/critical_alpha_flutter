// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioTrackModel _$AudioTrackModelFromJson(Map<String, dynamic> json) {
  return _AudioTrackModel.fromJson(json);
}

/// @nodoc
mixin _$AudioTrackModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String? get album => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get largeImageUrl => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  AudioCategory get category => throw _privateConstructorUsedError;
  AudioType get type => throw _privateConstructorUsedError;
  AudioQuality get quality => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  int get playCount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get ratingCount => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isDownloaded => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get narrator => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  AudioMetadata? get metadata => throw _privateConstructorUsedError;
  List<AudioChapter>? get chapters => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customProperties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioTrackModelCopyWith<AudioTrackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioTrackModelCopyWith<$Res> {
  factory $AudioTrackModelCopyWith(
          AudioTrackModel value, $Res Function(AudioTrackModel) then) =
      _$AudioTrackModelCopyWithImpl<$Res, AudioTrackModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String? album,
      String? description,
      String url,
      String? thumbnailUrl,
      String? largeImageUrl,
      Duration duration,
      AudioCategory category,
      AudioType type,
      AudioQuality quality,
      List<String>? tags,
      int playCount,
      double rating,
      int ratingCount,
      bool isFavorite,
      bool isDownloaded,
      bool isPremium,
      String? language,
      String? narrator,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'published_at') DateTime? publishedAt,
      AudioMetadata? metadata,
      List<AudioChapter>? chapters,
      Map<String, dynamic>? customProperties});

  $AudioMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$AudioTrackModelCopyWithImpl<$Res, $Val extends AudioTrackModel>
    implements $AudioTrackModelCopyWith<$Res> {
  _$AudioTrackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? album = freezed,
    Object? description = freezed,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? largeImageUrl = freezed,
    Object? duration = null,
    Object? category = null,
    Object? type = null,
    Object? quality = null,
    Object? tags = freezed,
    Object? playCount = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? isFavorite = null,
    Object? isDownloaded = null,
    Object? isPremium = null,
    Object? language = freezed,
    Object? narrator = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
    Object? metadata = freezed,
    Object? chapters = freezed,
    Object? customProperties = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      largeImageUrl: freezed == largeImageUrl
          ? _value.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as AudioCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AudioType,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as AudioQuality,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloaded: null == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      narrator: freezed == narrator
          ? _value.narrator
          : narrator // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as AudioMetadata?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<AudioChapter>?,
      customProperties: freezed == customProperties
          ? _value.customProperties
          : customProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $AudioMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioTrackModelImplCopyWith<$Res>
    implements $AudioTrackModelCopyWith<$Res> {
  factory _$$AudioTrackModelImplCopyWith(_$AudioTrackModelImpl value,
          $Res Function(_$AudioTrackModelImpl) then) =
      __$$AudioTrackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String? album,
      String? description,
      String url,
      String? thumbnailUrl,
      String? largeImageUrl,
      Duration duration,
      AudioCategory category,
      AudioType type,
      AudioQuality quality,
      List<String>? tags,
      int playCount,
      double rating,
      int ratingCount,
      bool isFavorite,
      bool isDownloaded,
      bool isPremium,
      String? language,
      String? narrator,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'published_at') DateTime? publishedAt,
      AudioMetadata? metadata,
      List<AudioChapter>? chapters,
      Map<String, dynamic>? customProperties});

  @override
  $AudioMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$AudioTrackModelImplCopyWithImpl<$Res>
    extends _$AudioTrackModelCopyWithImpl<$Res, _$AudioTrackModelImpl>
    implements _$$AudioTrackModelImplCopyWith<$Res> {
  __$$AudioTrackModelImplCopyWithImpl(
      _$AudioTrackModelImpl _value, $Res Function(_$AudioTrackModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? album = freezed,
    Object? description = freezed,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? largeImageUrl = freezed,
    Object? duration = null,
    Object? category = null,
    Object? type = null,
    Object? quality = null,
    Object? tags = freezed,
    Object? playCount = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? isFavorite = null,
    Object? isDownloaded = null,
    Object? isPremium = null,
    Object? language = freezed,
    Object? narrator = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
    Object? metadata = freezed,
    Object? chapters = freezed,
    Object? customProperties = freezed,
  }) {
    return _then(_$AudioTrackModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      largeImageUrl: freezed == largeImageUrl
          ? _value.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as AudioCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AudioType,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as AudioQuality,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloaded: null == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      narrator: freezed == narrator
          ? _value.narrator
          : narrator // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as AudioMetadata?,
      chapters: freezed == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<AudioChapter>?,
      customProperties: freezed == customProperties
          ? _value._customProperties
          : customProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioTrackModelImpl extends _AudioTrackModel {
  const _$AudioTrackModelImpl(
      {required this.id,
      required this.title,
      required this.artist,
      this.album,
      this.description,
      required this.url,
      this.thumbnailUrl,
      this.largeImageUrl,
      required this.duration,
      required this.category,
      required this.type,
      this.quality = AudioQuality.medium,
      final List<String>? tags,
      this.playCount = 0,
      this.rating = 0.0,
      this.ratingCount = 0,
      this.isFavorite = false,
      this.isDownloaded = false,
      this.isPremium = false,
      this.language,
      this.narrator,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'published_at') this.publishedAt,
      this.metadata,
      final List<AudioChapter>? chapters,
      final Map<String, dynamic>? customProperties})
      : _tags = tags,
        _chapters = chapters,
        _customProperties = customProperties,
        super._();

  factory _$AudioTrackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioTrackModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String artist;
  @override
  final String? album;
  @override
  final String? description;
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final String? largeImageUrl;
  @override
  final Duration duration;
  @override
  final AudioCategory category;
  @override
  final AudioType type;
  @override
  @JsonKey()
  final AudioQuality quality;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int playCount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int ratingCount;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final bool isDownloaded;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  final String? language;
  @override
  final String? narrator;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  @override
  final AudioMetadata? metadata;
  final List<AudioChapter>? _chapters;
  @override
  List<AudioChapter>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _customProperties;
  @override
  Map<String, dynamic>? get customProperties {
    final value = _customProperties;
    if (value == null) return null;
    if (_customProperties is EqualUnmodifiableMapView) return _customProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AudioTrackModel(id: $id, title: $title, artist: $artist, album: $album, description: $description, url: $url, thumbnailUrl: $thumbnailUrl, largeImageUrl: $largeImageUrl, duration: $duration, category: $category, type: $type, quality: $quality, tags: $tags, playCount: $playCount, rating: $rating, ratingCount: $ratingCount, isFavorite: $isFavorite, isDownloaded: $isDownloaded, isPremium: $isPremium, language: $language, narrator: $narrator, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, metadata: $metadata, chapters: $chapters, customProperties: $customProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioTrackModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.largeImageUrl, largeImageUrl) ||
                other.largeImageUrl == largeImageUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.narrator, narrator) ||
                other.narrator == narrator) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            const DeepCollectionEquality()
                .equals(other._customProperties, _customProperties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        artist,
        album,
        description,
        url,
        thumbnailUrl,
        largeImageUrl,
        duration,
        category,
        type,
        quality,
        const DeepCollectionEquality().hash(_tags),
        playCount,
        rating,
        ratingCount,
        isFavorite,
        isDownloaded,
        isPremium,
        language,
        narrator,
        createdAt,
        updatedAt,
        publishedAt,
        metadata,
        const DeepCollectionEquality().hash(_chapters),
        const DeepCollectionEquality().hash(_customProperties)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioTrackModelImplCopyWith<_$AudioTrackModelImpl> get copyWith =>
      __$$AudioTrackModelImplCopyWithImpl<_$AudioTrackModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioTrackModelImplToJson(
      this,
    );
  }
}

abstract class _AudioTrackModel extends AudioTrackModel {
  const factory _AudioTrackModel(
      {required final String id,
      required final String title,
      required final String artist,
      final String? album,
      final String? description,
      required final String url,
      final String? thumbnailUrl,
      final String? largeImageUrl,
      required final Duration duration,
      required final AudioCategory category,
      required final AudioType type,
      final AudioQuality quality,
      final List<String>? tags,
      final int playCount,
      final double rating,
      final int ratingCount,
      final bool isFavorite,
      final bool isDownloaded,
      final bool isPremium,
      final String? language,
      final String? narrator,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'published_at') final DateTime? publishedAt,
      final AudioMetadata? metadata,
      final List<AudioChapter>? chapters,
      final Map<String, dynamic>? customProperties}) = _$AudioTrackModelImpl;
  const _AudioTrackModel._() : super._();

  factory _AudioTrackModel.fromJson(Map<String, dynamic> json) =
      _$AudioTrackModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get artist;
  @override
  String? get album;
  @override
  String? get description;
  @override
  String get url;
  @override
  String? get thumbnailUrl;
  @override
  String? get largeImageUrl;
  @override
  Duration get duration;
  @override
  AudioCategory get category;
  @override
  AudioType get type;
  @override
  AudioQuality get quality;
  @override
  List<String>? get tags;
  @override
  int get playCount;
  @override
  double get rating;
  @override
  int get ratingCount;
  @override
  bool get isFavorite;
  @override
  bool get isDownloaded;
  @override
  bool get isPremium;
  @override
  String? get language;
  @override
  String? get narrator;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  AudioMetadata? get metadata;
  @override
  List<AudioChapter>? get chapters;
  @override
  Map<String, dynamic>? get customProperties;
  @override
  @JsonKey(ignore: true)
  _$$AudioTrackModelImplCopyWith<_$AudioTrackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioChapter _$AudioChapterFromJson(Map<String, dynamic> json) {
  return _AudioChapter.fromJson(json);
}

/// @nodoc
mixin _$AudioChapter {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Duration get startTime => throw _privateConstructorUsedError;
  Duration get endTime => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioChapterCopyWith<AudioChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioChapterCopyWith<$Res> {
  factory $AudioChapterCopyWith(
          AudioChapter value, $Res Function(AudioChapter) then) =
      _$AudioChapterCopyWithImpl<$Res, AudioChapter>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      Duration startTime,
      Duration endTime,
      String? thumbnailUrl,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$AudioChapterCopyWithImpl<$Res, $Val extends AudioChapter>
    implements $AudioChapterCopyWith<$Res> {
  _$AudioChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? thumbnailUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioChapterImplCopyWith<$Res>
    implements $AudioChapterCopyWith<$Res> {
  factory _$$AudioChapterImplCopyWith(
          _$AudioChapterImpl value, $Res Function(_$AudioChapterImpl) then) =
      __$$AudioChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      Duration startTime,
      Duration endTime,
      String? thumbnailUrl,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$AudioChapterImplCopyWithImpl<$Res>
    extends _$AudioChapterCopyWithImpl<$Res, _$AudioChapterImpl>
    implements _$$AudioChapterImplCopyWith<$Res> {
  __$$AudioChapterImplCopyWithImpl(
      _$AudioChapterImpl _value, $Res Function(_$AudioChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? thumbnailUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$AudioChapterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioChapterImpl extends _AudioChapter {
  const _$AudioChapterImpl(
      {required this.id,
      required this.title,
      this.description,
      required this.startTime,
      required this.endTime,
      this.thumbnailUrl,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$AudioChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioChapterImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final Duration startTime;
  @override
  final Duration endTime;
  @override
  final String? thumbnailUrl;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AudioChapter(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, thumbnailUrl: $thumbnailUrl, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      startTime,
      endTime,
      thumbnailUrl,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioChapterImplCopyWith<_$AudioChapterImpl> get copyWith =>
      __$$AudioChapterImplCopyWithImpl<_$AudioChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioChapterImplToJson(
      this,
    );
  }
}

abstract class _AudioChapter extends AudioChapter {
  const factory _AudioChapter(
      {required final String id,
      required final String title,
      final String? description,
      required final Duration startTime,
      required final Duration endTime,
      final String? thumbnailUrl,
      final Map<String, dynamic>? metadata}) = _$AudioChapterImpl;
  const _AudioChapter._() : super._();

  factory _AudioChapter.fromJson(Map<String, dynamic> json) =
      _$AudioChapterImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  Duration get startTime;
  @override
  Duration get endTime;
  @override
  String? get thumbnailUrl;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AudioChapterImplCopyWith<_$AudioChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioMetadata _$AudioMetadataFromJson(Map<String, dynamic> json) {
  return _AudioMetadata.fromJson(json);
}

/// @nodoc
mixin _$AudioMetadata {
  @JsonKey(name: 'bit_rate')
  int? get bitRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sample_rate')
  int? get sampleRate => throw _privateConstructorUsedError;
  String? get codec => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_size')
  int? get fileSizeBytes => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;
  String? get mood => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  String? get copyright => throw _privateConstructorUsedError;
  List<String>? get contributors => throw _privateConstructorUsedError;
  Map<String, String>? get lyrics => throw _privateConstructorUsedError;
  Map<String, dynamic>? get technicalInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioMetadataCopyWith<AudioMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioMetadataCopyWith<$Res> {
  factory $AudioMetadataCopyWith(
          AudioMetadata value, $Res Function(AudioMetadata) then) =
      _$AudioMetadataCopyWithImpl<$Res, AudioMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bit_rate') int? bitRate,
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
      Map<String, dynamic>? technicalInfo});
}

/// @nodoc
class _$AudioMetadataCopyWithImpl<$Res, $Val extends AudioMetadata>
    implements $AudioMetadataCopyWith<$Res> {
  _$AudioMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitRate = freezed,
    Object? sampleRate = freezed,
    Object? codec = freezed,
    Object? fileSizeBytes = freezed,
    Object? genre = freezed,
    Object? mood = freezed,
    Object? releaseDate = freezed,
    Object? publisher = freezed,
    Object? copyright = freezed,
    Object? contributors = freezed,
    Object? lyrics = freezed,
    Object? technicalInfo = freezed,
  }) {
    return _then(_value.copyWith(
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleRate: freezed == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as int?,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSizeBytes: freezed == fileSizeBytes
          ? _value.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      contributors: freezed == contributors
          ? _value.contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lyrics: freezed == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      technicalInfo: freezed == technicalInfo
          ? _value.technicalInfo
          : technicalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioMetadataImplCopyWith<$Res>
    implements $AudioMetadataCopyWith<$Res> {
  factory _$$AudioMetadataImplCopyWith(
          _$AudioMetadataImpl value, $Res Function(_$AudioMetadataImpl) then) =
      __$$AudioMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bit_rate') int? bitRate,
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
      Map<String, dynamic>? technicalInfo});
}

/// @nodoc
class __$$AudioMetadataImplCopyWithImpl<$Res>
    extends _$AudioMetadataCopyWithImpl<$Res, _$AudioMetadataImpl>
    implements _$$AudioMetadataImplCopyWith<$Res> {
  __$$AudioMetadataImplCopyWithImpl(
      _$AudioMetadataImpl _value, $Res Function(_$AudioMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitRate = freezed,
    Object? sampleRate = freezed,
    Object? codec = freezed,
    Object? fileSizeBytes = freezed,
    Object? genre = freezed,
    Object? mood = freezed,
    Object? releaseDate = freezed,
    Object? publisher = freezed,
    Object? copyright = freezed,
    Object? contributors = freezed,
    Object? lyrics = freezed,
    Object? technicalInfo = freezed,
  }) {
    return _then(_$AudioMetadataImpl(
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleRate: freezed == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as int?,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSizeBytes: freezed == fileSizeBytes
          ? _value.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      contributors: freezed == contributors
          ? _value._contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lyrics: freezed == lyrics
          ? _value._lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      technicalInfo: freezed == technicalInfo
          ? _value._technicalInfo
          : technicalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioMetadataImpl extends _AudioMetadata {
  const _$AudioMetadataImpl(
      {@JsonKey(name: 'bit_rate') this.bitRate,
      @JsonKey(name: 'sample_rate') this.sampleRate,
      this.codec,
      @JsonKey(name: 'file_size') this.fileSizeBytes,
      this.genre,
      this.mood,
      @JsonKey(name: 'release_date') this.releaseDate,
      this.publisher,
      this.copyright,
      final List<String>? contributors,
      final Map<String, String>? lyrics,
      final Map<String, dynamic>? technicalInfo})
      : _contributors = contributors,
        _lyrics = lyrics,
        _technicalInfo = technicalInfo,
        super._();

  factory _$AudioMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioMetadataImplFromJson(json);

  @override
  @JsonKey(name: 'bit_rate')
  final int? bitRate;
  @override
  @JsonKey(name: 'sample_rate')
  final int? sampleRate;
  @override
  final String? codec;
  @override
  @JsonKey(name: 'file_size')
  final int? fileSizeBytes;
  @override
  final String? genre;
  @override
  final String? mood;
  @override
  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;
  @override
  final String? publisher;
  @override
  final String? copyright;
  final List<String>? _contributors;
  @override
  List<String>? get contributors {
    final value = _contributors;
    if (value == null) return null;
    if (_contributors is EqualUnmodifiableListView) return _contributors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, String>? _lyrics;
  @override
  Map<String, String>? get lyrics {
    final value = _lyrics;
    if (value == null) return null;
    if (_lyrics is EqualUnmodifiableMapView) return _lyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _technicalInfo;
  @override
  Map<String, dynamic>? get technicalInfo {
    final value = _technicalInfo;
    if (value == null) return null;
    if (_technicalInfo is EqualUnmodifiableMapView) return _technicalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AudioMetadata(bitRate: $bitRate, sampleRate: $sampleRate, codec: $codec, fileSizeBytes: $fileSizeBytes, genre: $genre, mood: $mood, releaseDate: $releaseDate, publisher: $publisher, copyright: $copyright, contributors: $contributors, lyrics: $lyrics, technicalInfo: $technicalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioMetadataImpl &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.sampleRate, sampleRate) ||
                other.sampleRate == sampleRate) &&
            (identical(other.codec, codec) || other.codec == codec) &&
            (identical(other.fileSizeBytes, fileSizeBytes) ||
                other.fileSizeBytes == fileSizeBytes) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            const DeepCollectionEquality()
                .equals(other._contributors, _contributors) &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics) &&
            const DeepCollectionEquality()
                .equals(other._technicalInfo, _technicalInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bitRate,
      sampleRate,
      codec,
      fileSizeBytes,
      genre,
      mood,
      releaseDate,
      publisher,
      copyright,
      const DeepCollectionEquality().hash(_contributors),
      const DeepCollectionEquality().hash(_lyrics),
      const DeepCollectionEquality().hash(_technicalInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioMetadataImplCopyWith<_$AudioMetadataImpl> get copyWith =>
      __$$AudioMetadataImplCopyWithImpl<_$AudioMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioMetadataImplToJson(
      this,
    );
  }
}

abstract class _AudioMetadata extends AudioMetadata {
  const factory _AudioMetadata(
      {@JsonKey(name: 'bit_rate') final int? bitRate,
      @JsonKey(name: 'sample_rate') final int? sampleRate,
      final String? codec,
      @JsonKey(name: 'file_size') final int? fileSizeBytes,
      final String? genre,
      final String? mood,
      @JsonKey(name: 'release_date') final DateTime? releaseDate,
      final String? publisher,
      final String? copyright,
      final List<String>? contributors,
      final Map<String, String>? lyrics,
      final Map<String, dynamic>? technicalInfo}) = _$AudioMetadataImpl;
  const _AudioMetadata._() : super._();

  factory _AudioMetadata.fromJson(Map<String, dynamic> json) =
      _$AudioMetadataImpl.fromJson;

  @override
  @JsonKey(name: 'bit_rate')
  int? get bitRate;
  @override
  @JsonKey(name: 'sample_rate')
  int? get sampleRate;
  @override
  String? get codec;
  @override
  @JsonKey(name: 'file_size')
  int? get fileSizeBytes;
  @override
  String? get genre;
  @override
  String? get mood;
  @override
  @JsonKey(name: 'release_date')
  DateTime? get releaseDate;
  @override
  String? get publisher;
  @override
  String? get copyright;
  @override
  List<String>? get contributors;
  @override
  Map<String, String>? get lyrics;
  @override
  Map<String, dynamic>? get technicalInfo;
  @override
  @JsonKey(ignore: true)
  _$$AudioMetadataImplCopyWith<_$AudioMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaylistModel _$PlaylistModelFromJson(Map<String, dynamic> json) {
  return _PlaylistModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  List<String> get trackIds => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  bool get isSystem => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_played')
  DateTime? get lastPlayed => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistModelCopyWith<PlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistModelCopyWith<$Res> {
  factory $PlaylistModelCopyWith(
          PlaylistModel value, $Res Function(PlaylistModel) then) =
      _$PlaylistModelCopyWithImpl<$Res, PlaylistModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? imageUrl,
      String createdBy,
      List<String> trackIds,
      bool isPublic,
      bool isSystem,
      List<String>? tags,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'last_played') DateTime? lastPlayed,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PlaylistModelCopyWithImpl<$Res, $Val extends PlaylistModel>
    implements $PlaylistModelCopyWith<$Res> {
  _$PlaylistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? createdBy = null,
    Object? trackIds = null,
    Object? isPublic = null,
    Object? isSystem = null,
    Object? tags = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastPlayed = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      trackIds: null == trackIds
          ? _value.trackIds
          : trackIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isSystem: null == isSystem
          ? _value.isSystem
          : isSystem // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastPlayed: freezed == lastPlayed
          ? _value.lastPlayed
          : lastPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistModelImplCopyWith<$Res>
    implements $PlaylistModelCopyWith<$Res> {
  factory _$$PlaylistModelImplCopyWith(
          _$PlaylistModelImpl value, $Res Function(_$PlaylistModelImpl) then) =
      __$$PlaylistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? imageUrl,
      String createdBy,
      List<String> trackIds,
      bool isPublic,
      bool isSystem,
      List<String>? tags,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'last_played') DateTime? lastPlayed,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PlaylistModelImplCopyWithImpl<$Res>
    extends _$PlaylistModelCopyWithImpl<$Res, _$PlaylistModelImpl>
    implements _$$PlaylistModelImplCopyWith<$Res> {
  __$$PlaylistModelImplCopyWithImpl(
      _$PlaylistModelImpl _value, $Res Function(_$PlaylistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? createdBy = null,
    Object? trackIds = null,
    Object? isPublic = null,
    Object? isSystem = null,
    Object? tags = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastPlayed = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$PlaylistModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      trackIds: null == trackIds
          ? _value._trackIds
          : trackIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isSystem: null == isSystem
          ? _value.isSystem
          : isSystem // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastPlayed: freezed == lastPlayed
          ? _value.lastPlayed
          : lastPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistModelImpl extends _PlaylistModel {
  const _$PlaylistModelImpl(
      {required this.id,
      required this.name,
      this.description,
      this.imageUrl,
      required this.createdBy,
      required final List<String> trackIds,
      this.isPublic = false,
      this.isSystem = false,
      final List<String>? tags,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'last_played') this.lastPlayed,
      final Map<String, dynamic>? metadata})
      : _trackIds = trackIds,
        _tags = tags,
        _metadata = metadata,
        super._();

  factory _$PlaylistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String createdBy;
  final List<String> _trackIds;
  @override
  List<String> get trackIds {
    if (_trackIds is EqualUnmodifiableListView) return _trackIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackIds);
  }

  @override
  @JsonKey()
  final bool isPublic;
  @override
  @JsonKey()
  final bool isSystem;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'last_played')
  final DateTime? lastPlayed;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PlaylistModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, createdBy: $createdBy, trackIds: $trackIds, isPublic: $isPublic, isSystem: $isSystem, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, lastPlayed: $lastPlayed, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other._trackIds, _trackIds) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isSystem, isSystem) ||
                other.isSystem == isSystem) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastPlayed, lastPlayed) ||
                other.lastPlayed == lastPlayed) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imageUrl,
      createdBy,
      const DeepCollectionEquality().hash(_trackIds),
      isPublic,
      isSystem,
      const DeepCollectionEquality().hash(_tags),
      createdAt,
      updatedAt,
      lastPlayed,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistModelImplCopyWith<_$PlaylistModelImpl> get copyWith =>
      __$$PlaylistModelImplCopyWithImpl<_$PlaylistModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistModelImplToJson(
      this,
    );
  }
}

abstract class _PlaylistModel extends PlaylistModel {
  const factory _PlaylistModel(
      {required final String id,
      required final String name,
      final String? description,
      final String? imageUrl,
      required final String createdBy,
      required final List<String> trackIds,
      final bool isPublic,
      final bool isSystem,
      final List<String>? tags,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'last_played') final DateTime? lastPlayed,
      final Map<String, dynamic>? metadata}) = _$PlaylistModelImpl;
  const _PlaylistModel._() : super._();

  factory _PlaylistModel.fromJson(Map<String, dynamic> json) =
      _$PlaylistModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String get createdBy;
  @override
  List<String> get trackIds;
  @override
  bool get isPublic;
  @override
  bool get isSystem;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'last_played')
  DateTime? get lastPlayed;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistModelImplCopyWith<_$PlaylistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioPlayerState _$AudioPlayerStateFromJson(Map<String, dynamic> json) {
  return _AudioPlayerState.fromJson(json);
}

/// @nodoc
mixin _$AudioPlayerState {
  AudioTrackModel? get currentTrack => throw _privateConstructorUsedError;
  PlaylistModel? get currentPlaylist => throw _privateConstructorUsedError;
  PlayerStatus get status => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  bool get isShuffling => throw _privateConstructorUsedError;
  RepeatMode get repeatMode => throw _privateConstructorUsedError;
  List<AudioTrackModel>? get queue => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBuffering => throw _privateConstructorUsedError;
  Map<String, dynamic>? get playerMetadata =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioPlayerStateCopyWith<AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) then) =
      _$AudioPlayerStateCopyWithImpl<$Res, AudioPlayerState>;
  @useResult
  $Res call(
      {AudioTrackModel? currentTrack,
      PlaylistModel? currentPlaylist,
      PlayerStatus status,
      Duration position,
      Duration duration,
      double speed,
      double volume,
      bool isMuted,
      bool isShuffling,
      RepeatMode repeatMode,
      List<AudioTrackModel>? queue,
      int currentIndex,
      String? error,
      bool isLoading,
      bool isBuffering,
      Map<String, dynamic>? playerMetadata});

  $AudioTrackModelCopyWith<$Res>? get currentTrack;
  $PlaylistModelCopyWith<$Res>? get currentPlaylist;
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res, $Val extends AudioPlayerState>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrack = freezed,
    Object? currentPlaylist = freezed,
    Object? status = null,
    Object? position = null,
    Object? duration = null,
    Object? speed = null,
    Object? volume = null,
    Object? isMuted = null,
    Object? isShuffling = null,
    Object? repeatMode = null,
    Object? queue = freezed,
    Object? currentIndex = null,
    Object? error = freezed,
    Object? isLoading = null,
    Object? isBuffering = null,
    Object? playerMetadata = freezed,
  }) {
    return _then(_value.copyWith(
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrackModel?,
      currentPlaylist: freezed == currentPlaylist
          ? _value.currentPlaylist
          : currentPlaylist // ignore: cast_nullable_to_non_nullable
              as PlaylistModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlayerStatus,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      isMuted: null == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool,
      isShuffling: null == isShuffling
          ? _value.isShuffling
          : isShuffling // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as RepeatMode,
      queue: freezed == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<AudioTrackModel>?,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuffering: null == isBuffering
          ? _value.isBuffering
          : isBuffering // ignore: cast_nullable_to_non_nullable
              as bool,
      playerMetadata: freezed == playerMetadata
          ? _value.playerMetadata
          : playerMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
  $PlaylistModelCopyWith<$Res>? get currentPlaylist {
    if (_value.currentPlaylist == null) {
      return null;
    }

    return $PlaylistModelCopyWith<$Res>(_value.currentPlaylist!, (value) {
      return _then(_value.copyWith(currentPlaylist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioPlayerStateImplCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$$AudioPlayerStateImplCopyWith(_$AudioPlayerStateImpl value,
          $Res Function(_$AudioPlayerStateImpl) then) =
      __$$AudioPlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AudioTrackModel? currentTrack,
      PlaylistModel? currentPlaylist,
      PlayerStatus status,
      Duration position,
      Duration duration,
      double speed,
      double volume,
      bool isMuted,
      bool isShuffling,
      RepeatMode repeatMode,
      List<AudioTrackModel>? queue,
      int currentIndex,
      String? error,
      bool isLoading,
      bool isBuffering,
      Map<String, dynamic>? playerMetadata});

  @override
  $AudioTrackModelCopyWith<$Res>? get currentTrack;
  @override
  $PlaylistModelCopyWith<$Res>? get currentPlaylist;
}

/// @nodoc
class __$$AudioPlayerStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$AudioPlayerStateImpl>
    implements _$$AudioPlayerStateImplCopyWith<$Res> {
  __$$AudioPlayerStateImplCopyWithImpl(_$AudioPlayerStateImpl _value,
      $Res Function(_$AudioPlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrack = freezed,
    Object? currentPlaylist = freezed,
    Object? status = null,
    Object? position = null,
    Object? duration = null,
    Object? speed = null,
    Object? volume = null,
    Object? isMuted = null,
    Object? isShuffling = null,
    Object? repeatMode = null,
    Object? queue = freezed,
    Object? currentIndex = null,
    Object? error = freezed,
    Object? isLoading = null,
    Object? isBuffering = null,
    Object? playerMetadata = freezed,
  }) {
    return _then(_$AudioPlayerStateImpl(
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrackModel?,
      currentPlaylist: freezed == currentPlaylist
          ? _value.currentPlaylist
          : currentPlaylist // ignore: cast_nullable_to_non_nullable
              as PlaylistModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlayerStatus,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      isMuted: null == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool,
      isShuffling: null == isShuffling
          ? _value.isShuffling
          : isShuffling // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as RepeatMode,
      queue: freezed == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<AudioTrackModel>?,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuffering: null == isBuffering
          ? _value.isBuffering
          : isBuffering // ignore: cast_nullable_to_non_nullable
              as bool,
      playerMetadata: freezed == playerMetadata
          ? _value._playerMetadata
          : playerMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioPlayerStateImpl extends _AudioPlayerState {
  const _$AudioPlayerStateImpl(
      {this.currentTrack,
      this.currentPlaylist,
      this.status = PlayerStatus.stopped,
      this.position = Duration.zero,
      this.duration = Duration.zero,
      this.speed = 1.0,
      this.volume = 1.0,
      this.isMuted = false,
      this.isShuffling = false,
      this.repeatMode = RepeatMode.none,
      final List<AudioTrackModel>? queue,
      this.currentIndex = 0,
      this.error,
      this.isLoading = false,
      this.isBuffering = false,
      final Map<String, dynamic>? playerMetadata})
      : _queue = queue,
        _playerMetadata = playerMetadata,
        super._();

  factory _$AudioPlayerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioPlayerStateImplFromJson(json);

  @override
  final AudioTrackModel? currentTrack;
  @override
  final PlaylistModel? currentPlaylist;
  @override
  @JsonKey()
  final PlayerStatus status;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final double speed;
  @override
  @JsonKey()
  final double volume;
  @override
  @JsonKey()
  final bool isMuted;
  @override
  @JsonKey()
  final bool isShuffling;
  @override
  @JsonKey()
  final RepeatMode repeatMode;
  final List<AudioTrackModel>? _queue;
  @override
  List<AudioTrackModel>? get queue {
    final value = _queue;
    if (value == null) return null;
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int currentIndex;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBuffering;
  final Map<String, dynamic>? _playerMetadata;
  @override
  Map<String, dynamic>? get playerMetadata {
    final value = _playerMetadata;
    if (value == null) return null;
    if (_playerMetadata is EqualUnmodifiableMapView) return _playerMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AudioPlayerState(currentTrack: $currentTrack, currentPlaylist: $currentPlaylist, status: $status, position: $position, duration: $duration, speed: $speed, volume: $volume, isMuted: $isMuted, isShuffling: $isShuffling, repeatMode: $repeatMode, queue: $queue, currentIndex: $currentIndex, error: $error, isLoading: $isLoading, isBuffering: $isBuffering, playerMetadata: $playerMetadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioPlayerStateImpl &&
            (identical(other.currentTrack, currentTrack) ||
                other.currentTrack == currentTrack) &&
            (identical(other.currentPlaylist, currentPlaylist) ||
                other.currentPlaylist == currentPlaylist) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.isShuffling, isShuffling) ||
                other.isShuffling == isShuffling) &&
            (identical(other.repeatMode, repeatMode) ||
                other.repeatMode == repeatMode) &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBuffering, isBuffering) ||
                other.isBuffering == isBuffering) &&
            const DeepCollectionEquality()
                .equals(other._playerMetadata, _playerMetadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTrack,
      currentPlaylist,
      status,
      position,
      duration,
      speed,
      volume,
      isMuted,
      isShuffling,
      repeatMode,
      const DeepCollectionEquality().hash(_queue),
      currentIndex,
      error,
      isLoading,
      isBuffering,
      const DeepCollectionEquality().hash(_playerMetadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioPlayerStateImplCopyWith<_$AudioPlayerStateImpl> get copyWith =>
      __$$AudioPlayerStateImplCopyWithImpl<_$AudioPlayerStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioPlayerStateImplToJson(
      this,
    );
  }
}

abstract class _AudioPlayerState extends AudioPlayerState {
  const factory _AudioPlayerState(
      {final AudioTrackModel? currentTrack,
      final PlaylistModel? currentPlaylist,
      final PlayerStatus status,
      final Duration position,
      final Duration duration,
      final double speed,
      final double volume,
      final bool isMuted,
      final bool isShuffling,
      final RepeatMode repeatMode,
      final List<AudioTrackModel>? queue,
      final int currentIndex,
      final String? error,
      final bool isLoading,
      final bool isBuffering,
      final Map<String, dynamic>? playerMetadata}) = _$AudioPlayerStateImpl;
  const _AudioPlayerState._() : super._();

  factory _AudioPlayerState.fromJson(Map<String, dynamic> json) =
      _$AudioPlayerStateImpl.fromJson;

  @override
  AudioTrackModel? get currentTrack;
  @override
  PlaylistModel? get currentPlaylist;
  @override
  PlayerStatus get status;
  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  double get speed;
  @override
  double get volume;
  @override
  bool get isMuted;
  @override
  bool get isShuffling;
  @override
  RepeatMode get repeatMode;
  @override
  List<AudioTrackModel>? get queue;
  @override
  int get currentIndex;
  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  bool get isBuffering;
  @override
  Map<String, dynamic>? get playerMetadata;
  @override
  @JsonKey(ignore: true)
  _$$AudioPlayerStateImplCopyWith<_$AudioPlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
