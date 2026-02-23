// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get username =>
      throw _privateConstructorUsedError; // Added username field to match React Native
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  bool? get isPremium => throw _privateConstructorUsedError;
  bool? get isSubscribed =>
      throw _privateConstructorUsedError; // Added for subscription status
  DateTime? get premiumExpiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  UserPreferences? get preferences => throw _privateConstructorUsedError;
  UserStats? get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? username,
      String? profilePicture,
      String? phoneNumber,
      DateTime? dateOfBirth,
      String? gender,
      bool? isEmailVerified,
      bool? isPhoneVerified,
      bool? isPremium,
      bool? isSubscribed,
      DateTime? premiumExpiryDate,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      UserPreferences? preferences,
      UserStats? stats});

  $UserPreferencesCopyWith<$Res>? get preferences;
  $UserStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? username = freezed,
    Object? profilePicture = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isEmailVerified = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPremium = freezed,
    Object? isSubscribed = freezed,
    Object? premiumExpiryDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? preferences = freezed,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPremium: freezed == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSubscribed: freezed == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
      premiumExpiryDate: freezed == premiumExpiryDate
          ? _value.premiumExpiryDate
          : premiumExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStats?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $UserPreferencesCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $UserStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? username,
      String? profilePicture,
      String? phoneNumber,
      DateTime? dateOfBirth,
      String? gender,
      bool? isEmailVerified,
      bool? isPhoneVerified,
      bool? isPremium,
      bool? isSubscribed,
      DateTime? premiumExpiryDate,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      UserPreferences? preferences,
      UserStats? stats});

  @override
  $UserPreferencesCopyWith<$Res>? get preferences;
  @override
  $UserStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? username = freezed,
    Object? profilePicture = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? isEmailVerified = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPremium = freezed,
    Object? isSubscribed = freezed,
    Object? premiumExpiryDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? preferences = freezed,
    Object? stats = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPremium: freezed == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSubscribed: freezed == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
      premiumExpiryDate: freezed == premiumExpiryDate
          ? _value.premiumExpiryDate
          : premiumExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStats?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.username,
      this.profilePicture,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.isEmailVerified,
      this.isPhoneVerified,
      this.isPremium,
      this.isSubscribed,
      this.premiumExpiryDate,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.preferences,
      this.stats})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? username;
// Added username field to match React Native
  @override
  final String? profilePicture;
  @override
  final String? phoneNumber;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? gender;
  @override
  final bool? isEmailVerified;
  @override
  final bool? isPhoneVerified;
  @override
  final bool? isPremium;
  @override
  final bool? isSubscribed;
// Added for subscription status
  @override
  final DateTime? premiumExpiryDate;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final UserPreferences? preferences;
  @override
  final UserStats? stats;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, username: $username, profilePicture: $profilePicture, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, isEmailVerified: $isEmailVerified, isPhoneVerified: $isPhoneVerified, isPremium: $isPremium, isSubscribed: $isSubscribed, premiumExpiryDate: $premiumExpiryDate, createdAt: $createdAt, updatedAt: $updatedAt, preferences: $preferences, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.premiumExpiryDate, premiumExpiryDate) ||
                other.premiumExpiryDate == premiumExpiryDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      username,
      profilePicture,
      phoneNumber,
      dateOfBirth,
      gender,
      isEmailVerified,
      isPhoneVerified,
      isPremium,
      isSubscribed,
      premiumExpiryDate,
      createdAt,
      updatedAt,
      preferences,
      stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      final String? username,
      final String? profilePicture,
      final String? phoneNumber,
      final DateTime? dateOfBirth,
      final String? gender,
      final bool? isEmailVerified,
      final bool? isPhoneVerified,
      final bool? isPremium,
      final bool? isSubscribed,
      final DateTime? premiumExpiryDate,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final UserPreferences? preferences,
      final UserStats? stats}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get username;
  @override // Added username field to match React Native
  String? get profilePicture;
  @override
  String? get phoneNumber;
  @override
  DateTime? get dateOfBirth;
  @override
  String? get gender;
  @override
  bool? get isEmailVerified;
  @override
  bool? get isPhoneVerified;
  @override
  bool? get isPremium;
  @override
  bool? get isSubscribed;
  @override // Added for subscription status
  DateTime? get premiumExpiryDate;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  UserPreferences? get preferences;
  @override
  UserStats? get stats;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get goalReminders => throw _privateConstructorUsedError;
  bool get assessmentReminders => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String get units => throw _privateConstructorUsedError;
  bool get dataCollection => throw _privateConstructorUsedError;
  bool get analyticsTracking => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customSettings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {bool pushNotifications,
      bool emailNotifications,
      bool goalReminders,
      bool assessmentReminders,
      String language,
      String theme,
      String units,
      bool dataCollection,
      bool analyticsTracking,
      Map<String, dynamic>? customSettings});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? goalReminders = null,
    Object? assessmentReminders = null,
    Object? language = null,
    Object? theme = null,
    Object? units = null,
    Object? dataCollection = null,
    Object? analyticsTracking = null,
    Object? customSettings = freezed,
  }) {
    return _then(_value.copyWith(
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      goalReminders: null == goalReminders
          ? _value.goalReminders
          : goalReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      assessmentReminders: null == assessmentReminders
          ? _value.assessmentReminders
          : assessmentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      dataCollection: null == dataCollection
          ? _value.dataCollection
          : dataCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsTracking: null == analyticsTracking
          ? _value.analyticsTracking
          : analyticsTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      customSettings: freezed == customSettings
          ? _value.customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool pushNotifications,
      bool emailNotifications,
      bool goalReminders,
      bool assessmentReminders,
      String language,
      String theme,
      String units,
      bool dataCollection,
      bool analyticsTracking,
      Map<String, dynamic>? customSettings});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? goalReminders = null,
    Object? assessmentReminders = null,
    Object? language = null,
    Object? theme = null,
    Object? units = null,
    Object? dataCollection = null,
    Object? analyticsTracking = null,
    Object? customSettings = freezed,
  }) {
    return _then(_$UserPreferencesImpl(
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      goalReminders: null == goalReminders
          ? _value.goalReminders
          : goalReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      assessmentReminders: null == assessmentReminders
          ? _value.assessmentReminders
          : assessmentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      dataCollection: null == dataCollection
          ? _value.dataCollection
          : dataCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsTracking: null == analyticsTracking
          ? _value.analyticsTracking
          : analyticsTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      customSettings: freezed == customSettings
          ? _value._customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {this.pushNotifications = true,
      this.emailNotifications = true,
      this.goalReminders = true,
      this.assessmentReminders = true,
      this.language = 'en',
      this.theme = 'light',
      this.units = 'metric',
      this.dataCollection = true,
      this.analyticsTracking = true,
      final Map<String, dynamic>? customSettings})
      : _customSettings = customSettings;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final bool pushNotifications;
  @override
  @JsonKey()
  final bool emailNotifications;
  @override
  @JsonKey()
  final bool goalReminders;
  @override
  @JsonKey()
  final bool assessmentReminders;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final String units;
  @override
  @JsonKey()
  final bool dataCollection;
  @override
  @JsonKey()
  final bool analyticsTracking;
  final Map<String, dynamic>? _customSettings;
  @override
  Map<String, dynamic>? get customSettings {
    final value = _customSettings;
    if (value == null) return null;
    if (_customSettings is EqualUnmodifiableMapView) return _customSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserPreferences(pushNotifications: $pushNotifications, emailNotifications: $emailNotifications, goalReminders: $goalReminders, assessmentReminders: $assessmentReminders, language: $language, theme: $theme, units: $units, dataCollection: $dataCollection, analyticsTracking: $analyticsTracking, customSettings: $customSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.goalReminders, goalReminders) ||
                other.goalReminders == goalReminders) &&
            (identical(other.assessmentReminders, assessmentReminders) ||
                other.assessmentReminders == assessmentReminders) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.dataCollection, dataCollection) ||
                other.dataCollection == dataCollection) &&
            (identical(other.analyticsTracking, analyticsTracking) ||
                other.analyticsTracking == analyticsTracking) &&
            const DeepCollectionEquality()
                .equals(other._customSettings, _customSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pushNotifications,
      emailNotifications,
      goalReminders,
      assessmentReminders,
      language,
      theme,
      units,
      dataCollection,
      analyticsTracking,
      const DeepCollectionEquality().hash(_customSettings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {final bool pushNotifications,
      final bool emailNotifications,
      final bool goalReminders,
      final bool assessmentReminders,
      final String language,
      final String theme,
      final String units,
      final bool dataCollection,
      final bool analyticsTracking,
      final Map<String, dynamic>? customSettings}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  bool get pushNotifications;
  @override
  bool get emailNotifications;
  @override
  bool get goalReminders;
  @override
  bool get assessmentReminders;
  @override
  String get language;
  @override
  String get theme;
  @override
  String get units;
  @override
  bool get dataCollection;
  @override
  bool get analyticsTracking;
  @override
  Map<String, dynamic>? get customSettings;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  int get totalGoals => throw _privateConstructorUsedError;
  int get completedGoals => throw _privateConstructorUsedError;
  int get activeGoals => throw _privateConstructorUsedError;
  int get totalAssessments => throw _privateConstructorUsedError;
  int get completedAssessments => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  int get maxStreakDays => throw _privateConstructorUsedError;
  double get averageScore => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get audioHoursListened => throw _privateConstructorUsedError;
  int get coursesCompleted => throw _privateConstructorUsedError;
  DateTime? get lastActivity => throw _privateConstructorUsedError;
  DateTime? get joinedDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get achievements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call(
      {int totalGoals,
      int completedGoals,
      int activeGoals,
      int totalAssessments,
      int completedAssessments,
      int streakDays,
      int maxStreakDays,
      double averageScore,
      double completionRate,
      int audioHoursListened,
      int coursesCompleted,
      DateTime? lastActivity,
      DateTime? joinedDate,
      Map<String, dynamic>? achievements});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalGoals = null,
    Object? completedGoals = null,
    Object? activeGoals = null,
    Object? totalAssessments = null,
    Object? completedAssessments = null,
    Object? streakDays = null,
    Object? maxStreakDays = null,
    Object? averageScore = null,
    Object? completionRate = null,
    Object? audioHoursListened = null,
    Object? coursesCompleted = null,
    Object? lastActivity = freezed,
    Object? joinedDate = freezed,
    Object? achievements = freezed,
  }) {
    return _then(_value.copyWith(
      totalGoals: null == totalGoals
          ? _value.totalGoals
          : totalGoals // ignore: cast_nullable_to_non_nullable
              as int,
      completedGoals: null == completedGoals
          ? _value.completedGoals
          : completedGoals // ignore: cast_nullable_to_non_nullable
              as int,
      activeGoals: null == activeGoals
          ? _value.activeGoals
          : activeGoals // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssessments: null == totalAssessments
          ? _value.totalAssessments
          : totalAssessments // ignore: cast_nullable_to_non_nullable
              as int,
      completedAssessments: null == completedAssessments
          ? _value.completedAssessments
          : completedAssessments // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxStreakDays: null == maxStreakDays
          ? _value.maxStreakDays
          : maxStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      audioHoursListened: null == audioHoursListened
          ? _value.audioHoursListened
          : audioHoursListened // ignore: cast_nullable_to_non_nullable
              as int,
      coursesCompleted: null == coursesCompleted
          ? _value.coursesCompleted
          : coursesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      joinedDate: freezed == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      achievements: freezed == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
          _$UserStatsImpl value, $Res Function(_$UserStatsImpl) then) =
      __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalGoals,
      int completedGoals,
      int activeGoals,
      int totalAssessments,
      int completedAssessments,
      int streakDays,
      int maxStreakDays,
      double averageScore,
      double completionRate,
      int audioHoursListened,
      int coursesCompleted,
      DateTime? lastActivity,
      DateTime? joinedDate,
      Map<String, dynamic>? achievements});
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
      _$UserStatsImpl _value, $Res Function(_$UserStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalGoals = null,
    Object? completedGoals = null,
    Object? activeGoals = null,
    Object? totalAssessments = null,
    Object? completedAssessments = null,
    Object? streakDays = null,
    Object? maxStreakDays = null,
    Object? averageScore = null,
    Object? completionRate = null,
    Object? audioHoursListened = null,
    Object? coursesCompleted = null,
    Object? lastActivity = freezed,
    Object? joinedDate = freezed,
    Object? achievements = freezed,
  }) {
    return _then(_$UserStatsImpl(
      totalGoals: null == totalGoals
          ? _value.totalGoals
          : totalGoals // ignore: cast_nullable_to_non_nullable
              as int,
      completedGoals: null == completedGoals
          ? _value.completedGoals
          : completedGoals // ignore: cast_nullable_to_non_nullable
              as int,
      activeGoals: null == activeGoals
          ? _value.activeGoals
          : activeGoals // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssessments: null == totalAssessments
          ? _value.totalAssessments
          : totalAssessments // ignore: cast_nullable_to_non_nullable
              as int,
      completedAssessments: null == completedAssessments
          ? _value.completedAssessments
          : completedAssessments // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxStreakDays: null == maxStreakDays
          ? _value.maxStreakDays
          : maxStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      audioHoursListened: null == audioHoursListened
          ? _value.audioHoursListened
          : audioHoursListened // ignore: cast_nullable_to_non_nullable
              as int,
      coursesCompleted: null == coursesCompleted
          ? _value.coursesCompleted
          : coursesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      joinedDate: freezed == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      achievements: freezed == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl extends _UserStats {
  const _$UserStatsImpl(
      {this.totalGoals = 0,
      this.completedGoals = 0,
      this.activeGoals = 0,
      this.totalAssessments = 0,
      this.completedAssessments = 0,
      this.streakDays = 0,
      this.maxStreakDays = 0,
      this.averageScore = 0.0,
      this.completionRate = 0.0,
      this.audioHoursListened = 0,
      this.coursesCompleted = 0,
      this.lastActivity,
      this.joinedDate,
      final Map<String, dynamic>? achievements})
      : _achievements = achievements,
        super._();

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalGoals;
  @override
  @JsonKey()
  final int completedGoals;
  @override
  @JsonKey()
  final int activeGoals;
  @override
  @JsonKey()
  final int totalAssessments;
  @override
  @JsonKey()
  final int completedAssessments;
  @override
  @JsonKey()
  final int streakDays;
  @override
  @JsonKey()
  final int maxStreakDays;
  @override
  @JsonKey()
  final double averageScore;
  @override
  @JsonKey()
  final double completionRate;
  @override
  @JsonKey()
  final int audioHoursListened;
  @override
  @JsonKey()
  final int coursesCompleted;
  @override
  final DateTime? lastActivity;
  @override
  final DateTime? joinedDate;
  final Map<String, dynamic>? _achievements;
  @override
  Map<String, dynamic>? get achievements {
    final value = _achievements;
    if (value == null) return null;
    if (_achievements is EqualUnmodifiableMapView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserStats(totalGoals: $totalGoals, completedGoals: $completedGoals, activeGoals: $activeGoals, totalAssessments: $totalAssessments, completedAssessments: $completedAssessments, streakDays: $streakDays, maxStreakDays: $maxStreakDays, averageScore: $averageScore, completionRate: $completionRate, audioHoursListened: $audioHoursListened, coursesCompleted: $coursesCompleted, lastActivity: $lastActivity, joinedDate: $joinedDate, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.totalGoals, totalGoals) ||
                other.totalGoals == totalGoals) &&
            (identical(other.completedGoals, completedGoals) ||
                other.completedGoals == completedGoals) &&
            (identical(other.activeGoals, activeGoals) ||
                other.activeGoals == activeGoals) &&
            (identical(other.totalAssessments, totalAssessments) ||
                other.totalAssessments == totalAssessments) &&
            (identical(other.completedAssessments, completedAssessments) ||
                other.completedAssessments == completedAssessments) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.maxStreakDays, maxStreakDays) ||
                other.maxStreakDays == maxStreakDays) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.audioHoursListened, audioHoursListened) ||
                other.audioHoursListened == audioHoursListened) &&
            (identical(other.coursesCompleted, coursesCompleted) ||
                other.coursesCompleted == coursesCompleted) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity) &&
            (identical(other.joinedDate, joinedDate) ||
                other.joinedDate == joinedDate) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalGoals,
      completedGoals,
      activeGoals,
      totalAssessments,
      completedAssessments,
      streakDays,
      maxStreakDays,
      averageScore,
      completionRate,
      audioHoursListened,
      coursesCompleted,
      lastActivity,
      joinedDate,
      const DeepCollectionEquality().hash(_achievements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(
      this,
    );
  }
}

abstract class _UserStats extends UserStats {
  const factory _UserStats(
      {final int totalGoals,
      final int completedGoals,
      final int activeGoals,
      final int totalAssessments,
      final int completedAssessments,
      final int streakDays,
      final int maxStreakDays,
      final double averageScore,
      final double completionRate,
      final int audioHoursListened,
      final int coursesCompleted,
      final DateTime? lastActivity,
      final DateTime? joinedDate,
      final Map<String, dynamic>? achievements}) = _$UserStatsImpl;
  const _UserStats._() : super._();

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  int get totalGoals;
  @override
  int get completedGoals;
  @override
  int get activeGoals;
  @override
  int get totalAssessments;
  @override
  int get completedAssessments;
  @override
  int get streakDays;
  @override
  int get maxStreakDays;
  @override
  double get averageScore;
  @override
  double get completionRate;
  @override
  int get audioHoursListened;
  @override
  int get coursesCompleted;
  @override
  DateTime? get lastActivity;
  @override
  DateTime? get joinedDate;
  @override
  Map<String, dynamic>? get achievements;
  @override
  @JsonKey(ignore: true)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
