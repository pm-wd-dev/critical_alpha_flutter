// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String?,
      profilePicture: json['profilePicture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      isPremium: json['isPremium'] as bool?,
      isSubscribed: json['isSubscribed'] as bool?,
      premiumExpiryDate: json['premiumExpiryDate'] == null
          ? null
          : DateTime.parse(json['premiumExpiryDate'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      preferences: json['preferences'] == null
          ? null
          : UserPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : UserStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'isEmailVerified': instance.isEmailVerified,
      'isPhoneVerified': instance.isPhoneVerified,
      'isPremium': instance.isPremium,
      'isSubscribed': instance.isSubscribed,
      'premiumExpiryDate': instance.premiumExpiryDate?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'preferences': instance.preferences,
      'stats': instance.stats,
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      goalReminders: json['goalReminders'] as bool? ?? true,
      assessmentReminders: json['assessmentReminders'] as bool? ?? true,
      language: json['language'] as String? ?? 'en',
      theme: json['theme'] as String? ?? 'light',
      units: json['units'] as String? ?? 'metric',
      dataCollection: json['dataCollection'] as bool? ?? true,
      analyticsTracking: json['analyticsTracking'] as bool? ?? true,
      customSettings: json['customSettings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'pushNotifications': instance.pushNotifications,
      'emailNotifications': instance.emailNotifications,
      'goalReminders': instance.goalReminders,
      'assessmentReminders': instance.assessmentReminders,
      'language': instance.language,
      'theme': instance.theme,
      'units': instance.units,
      'dataCollection': instance.dataCollection,
      'analyticsTracking': instance.analyticsTracking,
      'customSettings': instance.customSettings,
    };

_$UserStatsImpl _$$UserStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatsImpl(
      totalGoals: (json['totalGoals'] as num?)?.toInt() ?? 0,
      completedGoals: (json['completedGoals'] as num?)?.toInt() ?? 0,
      activeGoals: (json['activeGoals'] as num?)?.toInt() ?? 0,
      totalAssessments: (json['totalAssessments'] as num?)?.toInt() ?? 0,
      completedAssessments:
          (json['completedAssessments'] as num?)?.toInt() ?? 0,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      maxStreakDays: (json['maxStreakDays'] as num?)?.toInt() ?? 0,
      averageScore: (json['averageScore'] as num?)?.toDouble() ?? 0.0,
      completionRate: (json['completionRate'] as num?)?.toDouble() ?? 0.0,
      audioHoursListened: (json['audioHoursListened'] as num?)?.toInt() ?? 0,
      coursesCompleted: (json['coursesCompleted'] as num?)?.toInt() ?? 0,
      lastActivity: json['lastActivity'] == null
          ? null
          : DateTime.parse(json['lastActivity'] as String),
      joinedDate: json['joinedDate'] == null
          ? null
          : DateTime.parse(json['joinedDate'] as String),
      achievements: json['achievements'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UserStatsImplToJson(_$UserStatsImpl instance) =>
    <String, dynamic>{
      'totalGoals': instance.totalGoals,
      'completedGoals': instance.completedGoals,
      'activeGoals': instance.activeGoals,
      'totalAssessments': instance.totalAssessments,
      'completedAssessments': instance.completedAssessments,
      'streakDays': instance.streakDays,
      'maxStreakDays': instance.maxStreakDays,
      'averageScore': instance.averageScore,
      'completionRate': instance.completionRate,
      'audioHoursListened': instance.audioHoursListened,
      'coursesCompleted': instance.coursesCompleted,
      'lastActivity': instance.lastActivity?.toIso8601String(),
      'joinedDate': instance.joinedDate?.toIso8601String(),
      'achievements': instance.achievements,
    };
