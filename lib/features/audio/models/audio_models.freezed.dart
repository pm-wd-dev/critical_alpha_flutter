// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioCategory _$AudioCategoryFromJson(Map<String, dynamic> json) {
  return _AudioCategory.fromJson(json);
}

/// @nodoc
mixin _$AudioCategory {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_count')
  int? get audioCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_locked')
  bool get isLocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioCategoryCopyWith<AudioCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCategoryCopyWith<$Res> {
  factory $AudioCategoryCopyWith(
          AudioCategory value, $Res Function(AudioCategory) then) =
      _$AudioCategoryCopyWithImpl<$Res, AudioCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'title') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'icon') String? imageUrl,
      @JsonKey(name: 'audio_count') int? audioCount,
      @JsonKey(name: 'is_locked') bool isLocked,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class _$AudioCategoryCopyWithImpl<$Res, $Val extends AudioCategory>
    implements $AudioCategoryCopyWith<$Res> {
  _$AudioCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? audioCount = freezed,
    Object? isLocked = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioCount: freezed == audioCount
          ? _value.audioCount
          : audioCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioCategoryImplCopyWith<$Res>
    implements $AudioCategoryCopyWith<$Res> {
  factory _$$AudioCategoryImplCopyWith(
          _$AudioCategoryImpl value, $Res Function(_$AudioCategoryImpl) then) =
      __$$AudioCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'title') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'icon') String? imageUrl,
      @JsonKey(name: 'audio_count') int? audioCount,
      @JsonKey(name: 'is_locked') bool isLocked,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class __$$AudioCategoryImplCopyWithImpl<$Res>
    extends _$AudioCategoryCopyWithImpl<$Res, _$AudioCategoryImpl>
    implements _$$AudioCategoryImplCopyWith<$Res> {
  __$$AudioCategoryImplCopyWithImpl(
      _$AudioCategoryImpl _value, $Res Function(_$AudioCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? audioCount = freezed,
    Object? isLocked = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AudioCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioCount: freezed == audioCount
          ? _value.audioCount
          : audioCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioCategoryImpl implements _AudioCategory {
  const _$AudioCategoryImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'title') required this.name,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'icon') this.imageUrl,
      @JsonKey(name: 'audio_count') this.audioCount,
      @JsonKey(name: 'is_locked') this.isLocked = false,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt});

  factory _$AudioCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioCategoryImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'icon')
  final String? imageUrl;
  @override
  @JsonKey(name: 'audio_count')
  final int? audioCount;
  @override
  @JsonKey(name: 'is_locked')
  final bool isLocked;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AudioCategory(id: $id, name: $name, description: $description, imageUrl: $imageUrl, audioCount: $audioCount, isLocked: $isLocked, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.audioCount, audioCount) ||
                other.audioCount == audioCount) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imageUrl,
      audioCount, isLocked, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioCategoryImplCopyWith<_$AudioCategoryImpl> get copyWith =>
      __$$AudioCategoryImplCopyWithImpl<_$AudioCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioCategoryImplToJson(
      this,
    );
  }
}

abstract class _AudioCategory implements AudioCategory {
  const factory _AudioCategory(
          {@JsonKey(name: '_id') required final String id,
          @JsonKey(name: 'title') required final String name,
          @JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'icon') final String? imageUrl,
          @JsonKey(name: 'audio_count') final int? audioCount,
          @JsonKey(name: 'is_locked') final bool isLocked,
          @JsonKey(name: 'createdAt') final DateTime? createdAt,
          @JsonKey(name: 'updatedAt') final DateTime? updatedAt}) =
      _$AudioCategoryImpl;

  factory _AudioCategory.fromJson(Map<String, dynamic> json) =
      _$AudioCategoryImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get name;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'icon')
  String? get imageUrl;
  @override
  @JsonKey(name: 'audio_count')
  int? get audioCount;
  @override
  @JsonKey(name: 'is_locked')
  bool get isLocked;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AudioCategoryImplCopyWith<_$AudioCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioTrack _$AudioTrackFromJson(Map<String, dynamic> json) {
  return _AudioTrack.fromJson(json);
}

/// @nodoc
mixin _$AudioTrack {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_file')
  String get audioUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail', defaultValue: null)
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon', defaultValue: null)
  String? get iconUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
  int? get durationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: 'play_count')
  int get playCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_played_position')
  int get lastPlayedPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioTrackCopyWith<AudioTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioTrackCopyWith<$Res> {
  factory $AudioTrackCopyWith(
          AudioTrack value, $Res Function(AudioTrack) then) =
      _$AudioTrackCopyWithImpl<$Res, AudioTrack>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'audio_file') String audioUrl,
      @JsonKey(name: 'thumbnail', defaultValue: null) String? thumbnailUrl,
      @JsonKey(name: 'icon', defaultValue: null) String? iconUrl,
      @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
      int? durationSeconds,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'is_featured') bool isFeatured,
      @JsonKey(name: 'play_count') int playCount,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'last_played_position') int lastPlayedPosition,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class _$AudioTrackCopyWithImpl<$Res, $Val extends AudioTrack>
    implements $AudioTrackCopyWith<$Res> {
  _$AudioTrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? categoryId = null,
    Object? description = freezed,
    Object? audioUrl = null,
    Object? thumbnailUrl = freezed,
    Object? iconUrl = freezed,
    Object? durationSeconds = freezed,
    Object? authorName = freezed,
    Object? isFeatured = null,
    Object? playCount = null,
    Object? isFavorite = null,
    Object? lastPlayedPosition = null,
    Object? sortOrder = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPlayedPosition: null == lastPlayedPosition
          ? _value.lastPlayedPosition
          : lastPlayedPosition // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioTrackImplCopyWith<$Res>
    implements $AudioTrackCopyWith<$Res> {
  factory _$$AudioTrackImplCopyWith(
          _$AudioTrackImpl value, $Res Function(_$AudioTrackImpl) then) =
      __$$AudioTrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'audio_file') String audioUrl,
      @JsonKey(name: 'thumbnail', defaultValue: null) String? thumbnailUrl,
      @JsonKey(name: 'icon', defaultValue: null) String? iconUrl,
      @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
      int? durationSeconds,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'is_featured') bool isFeatured,
      @JsonKey(name: 'play_count') int playCount,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'last_played_position') int lastPlayedPosition,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class __$$AudioTrackImplCopyWithImpl<$Res>
    extends _$AudioTrackCopyWithImpl<$Res, _$AudioTrackImpl>
    implements _$$AudioTrackImplCopyWith<$Res> {
  __$$AudioTrackImplCopyWithImpl(
      _$AudioTrackImpl _value, $Res Function(_$AudioTrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? categoryId = null,
    Object? description = freezed,
    Object? audioUrl = null,
    Object? thumbnailUrl = freezed,
    Object? iconUrl = freezed,
    Object? durationSeconds = freezed,
    Object? authorName = freezed,
    Object? isFeatured = null,
    Object? playCount = null,
    Object? isFavorite = null,
    Object? lastPlayedPosition = null,
    Object? sortOrder = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AudioTrackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      playCount: null == playCount
          ? _value.playCount
          : playCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPlayedPosition: null == lastPlayedPosition
          ? _value.lastPlayedPosition
          : lastPlayedPosition // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioTrackImpl extends _AudioTrack {
  const _$AudioTrackImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'audio_file') required this.audioUrl,
      @JsonKey(name: 'thumbnail', defaultValue: null) this.thumbnailUrl,
      @JsonKey(name: 'icon', defaultValue: null) this.iconUrl,
      @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
      this.durationSeconds,
      @JsonKey(name: 'author_name') this.authorName,
      @JsonKey(name: 'is_featured') this.isFeatured = false,
      @JsonKey(name: 'play_count') this.playCount = 0,
      @JsonKey(name: 'is_favorite') this.isFavorite = false,
      @JsonKey(name: 'last_played_position') this.lastPlayedPosition = 0,
      @JsonKey(name: 'sort_order') this.sortOrder = 0,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt})
      : super._();

  factory _$AudioTrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioTrackImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'audio_file')
  final String audioUrl;
  @override
  @JsonKey(name: 'thumbnail', defaultValue: null)
  final String? thumbnailUrl;
  @override
  @JsonKey(name: 'icon', defaultValue: null)
  final String? iconUrl;
  @override
  @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
  final int? durationSeconds;
  @override
  @JsonKey(name: 'author_name')
  final String? authorName;
  @override
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  @override
  @JsonKey(name: 'play_count')
  final int playCount;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @override
  @JsonKey(name: 'last_played_position')
  final int lastPlayedPosition;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AudioTrack(id: $id, title: $title, categoryId: $categoryId, description: $description, audioUrl: $audioUrl, thumbnailUrl: $thumbnailUrl, iconUrl: $iconUrl, durationSeconds: $durationSeconds, authorName: $authorName, isFeatured: $isFeatured, playCount: $playCount, isFavorite: $isFavorite, lastPlayedPosition: $lastPlayedPosition, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioTrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.playCount, playCount) ||
                other.playCount == playCount) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.lastPlayedPosition, lastPlayedPosition) ||
                other.lastPlayedPosition == lastPlayedPosition) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      categoryId,
      description,
      audioUrl,
      thumbnailUrl,
      iconUrl,
      durationSeconds,
      authorName,
      isFeatured,
      playCount,
      isFavorite,
      lastPlayedPosition,
      sortOrder,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioTrackImplCopyWith<_$AudioTrackImpl> get copyWith =>
      __$$AudioTrackImplCopyWithImpl<_$AudioTrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioTrackImplToJson(
      this,
    );
  }
}

abstract class _AudioTrack extends AudioTrack {
  const factory _AudioTrack(
          {@JsonKey(name: '_id') required final String id,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'category_id') required final String categoryId,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'audio_file') required final String audioUrl,
          @JsonKey(name: 'thumbnail', defaultValue: null)
          final String? thumbnailUrl,
          @JsonKey(name: 'icon', defaultValue: null) final String? iconUrl,
          @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
          final int? durationSeconds,
          @JsonKey(name: 'author_name') final String? authorName,
          @JsonKey(name: 'is_featured') final bool isFeatured,
          @JsonKey(name: 'play_count') final int playCount,
          @JsonKey(name: 'is_favorite') final bool isFavorite,
          @JsonKey(name: 'last_played_position') final int lastPlayedPosition,
          @JsonKey(name: 'sort_order') final int sortOrder,
          @JsonKey(name: 'createdAt') final DateTime? createdAt,
          @JsonKey(name: 'updatedAt') final DateTime? updatedAt}) =
      _$AudioTrackImpl;
  const _AudioTrack._() : super._();

  factory _AudioTrack.fromJson(Map<String, dynamic> json) =
      _$AudioTrackImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'audio_file')
  String get audioUrl;
  @override
  @JsonKey(name: 'thumbnail', defaultValue: null)
  String? get thumbnailUrl;
  @override
  @JsonKey(name: 'icon', defaultValue: null)
  String? get iconUrl;
  @override
  @JsonKey(name: 'audio_duration', fromJson: _parseDuration)
  int? get durationSeconds;
  @override
  @JsonKey(name: 'author_name')
  String? get authorName;
  @override
  @JsonKey(name: 'is_featured')
  bool get isFeatured;
  @override
  @JsonKey(name: 'play_count')
  int get playCount;
  @override
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;
  @override
  @JsonKey(name: 'last_played_position')
  int get lastPlayedPosition;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AudioTrackImplCopyWith<_$AudioTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioPlayerState {
  AudioTrack? get currentTrack => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBuffering => throw _privateConstructorUsedError;
  int get currentPosition => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  double get playbackSpeed => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  List<AudioTrack> get playlist => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

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
      {AudioTrack? currentTrack,
      bool isPlaying,
      bool isLoading,
      bool isBuffering,
      int currentPosition,
      int duration,
      double playbackSpeed,
      double volume,
      List<AudioTrack> playlist,
      int currentIndex,
      String? error});

  $AudioTrackCopyWith<$Res>? get currentTrack;
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
    Object? isPlaying = null,
    Object? isLoading = null,
    Object? isBuffering = null,
    Object? currentPosition = null,
    Object? duration = null,
    Object? playbackSpeed = null,
    Object? volume = null,
    Object? playlist = null,
    Object? currentIndex = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrack?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<AudioTrack>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
abstract class _$$AudioPlayerStateImplCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$$AudioPlayerStateImplCopyWith(_$AudioPlayerStateImpl value,
          $Res Function(_$AudioPlayerStateImpl) then) =
      __$$AudioPlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AudioTrack? currentTrack,
      bool isPlaying,
      bool isLoading,
      bool isBuffering,
      int currentPosition,
      int duration,
      double playbackSpeed,
      double volume,
      List<AudioTrack> playlist,
      int currentIndex,
      String? error});

  @override
  $AudioTrackCopyWith<$Res>? get currentTrack;
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
    Object? isPlaying = null,
    Object? isLoading = null,
    Object? isBuffering = null,
    Object? currentPosition = null,
    Object? duration = null,
    Object? playbackSpeed = null,
    Object? volume = null,
    Object? playlist = null,
    Object? currentIndex = null,
    Object? error = freezed,
  }) {
    return _then(_$AudioPlayerStateImpl(
      currentTrack: freezed == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as AudioTrack?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      playlist: null == playlist
          ? _value._playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<AudioTrack>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AudioPlayerStateImpl extends _AudioPlayerState {
  const _$AudioPlayerStateImpl(
      {this.currentTrack,
      this.isPlaying = false,
      this.isLoading = false,
      this.isBuffering = false,
      this.currentPosition = 0,
      this.duration = 0,
      this.playbackSpeed = 1.0,
      this.volume = 1.0,
      final List<AudioTrack> playlist = const [],
      this.currentIndex = 0,
      this.error})
      : _playlist = playlist,
        super._();

  @override
  final AudioTrack? currentTrack;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final bool isLoading;
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
  @JsonKey()
  final double volume;
  final List<AudioTrack> _playlist;
  @override
  @JsonKey()
  List<AudioTrack> get playlist {
    if (_playlist is EqualUnmodifiableListView) return _playlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlist);
  }

  @override
  @JsonKey()
  final int currentIndex;
  @override
  final String? error;

  @override
  String toString() {
    return 'AudioPlayerState(currentTrack: $currentTrack, isPlaying: $isPlaying, isLoading: $isLoading, isBuffering: $isBuffering, currentPosition: $currentPosition, duration: $duration, playbackSpeed: $playbackSpeed, volume: $volume, playlist: $playlist, currentIndex: $currentIndex, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioPlayerStateImpl &&
            (identical(other.currentTrack, currentTrack) ||
                other.currentTrack == currentTrack) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBuffering, isBuffering) ||
                other.isBuffering == isBuffering) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.playbackSpeed, playbackSpeed) ||
                other.playbackSpeed == playbackSpeed) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            const DeepCollectionEquality().equals(other._playlist, _playlist) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTrack,
      isPlaying,
      isLoading,
      isBuffering,
      currentPosition,
      duration,
      playbackSpeed,
      volume,
      const DeepCollectionEquality().hash(_playlist),
      currentIndex,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioPlayerStateImplCopyWith<_$AudioPlayerStateImpl> get copyWith =>
      __$$AudioPlayerStateImplCopyWithImpl<_$AudioPlayerStateImpl>(
          this, _$identity);
}

abstract class _AudioPlayerState extends AudioPlayerState {
  const factory _AudioPlayerState(
      {final AudioTrack? currentTrack,
      final bool isPlaying,
      final bool isLoading,
      final bool isBuffering,
      final int currentPosition,
      final int duration,
      final double playbackSpeed,
      final double volume,
      final List<AudioTrack> playlist,
      final int currentIndex,
      final String? error}) = _$AudioPlayerStateImpl;
  const _AudioPlayerState._() : super._();

  @override
  AudioTrack? get currentTrack;
  @override
  bool get isPlaying;
  @override
  bool get isLoading;
  @override
  bool get isBuffering;
  @override
  int get currentPosition;
  @override
  int get duration;
  @override
  double get playbackSpeed;
  @override
  double get volume;
  @override
  List<AudioTrack> get playlist;
  @override
  int get currentIndex;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AudioPlayerStateImplCopyWith<_$AudioPlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
