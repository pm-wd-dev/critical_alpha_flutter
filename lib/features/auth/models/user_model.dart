import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    String? username,  // Added username field to match React Native
    String? profilePicture,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? isPremium,
    bool? isSubscribed,  // Added for subscription status
    DateTime? premiumExpiryDate,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    UserPreferences? preferences,
    UserStats? stats,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  String get fullName => '$firstName $lastName';

  String get initials =>
      '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}'.toUpperCase();

  bool get hasProfilePicture =>
      profilePicture != null && profilePicture!.isNotEmpty;

  bool get isProfileComplete {
    return firstName.isNotEmpty &&
           lastName.isNotEmpty &&
           email.isNotEmpty &&
           phoneNumber != null &&
           phoneNumber!.isNotEmpty &&
           dateOfBirth != null;
  }

  int get age {
    if (dateOfBirth == null) return 0;
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month ||
        (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }

  bool get isPremiumActive {
    if (!isPremium!) return false;
    if (premiumExpiryDate == null) return true; // Lifetime premium
    return premiumExpiryDate!.isAfter(DateTime.now());
  }
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default(true) bool pushNotifications,
    @Default(true) bool emailNotifications,
    @Default(true) bool goalReminders,
    @Default(true) bool assessmentReminders,
    @Default('en') String language,
    @Default('light') String theme,
    @Default('metric') String units,
    @Default(true) bool dataCollection,
    @Default(true) bool analyticsTracking,
    Map<String, dynamic>? customSettings,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    @Default(0) int totalGoals,
    @Default(0) int completedGoals,
    @Default(0) int activeGoals,
    @Default(0) int totalAssessments,
    @Default(0) int completedAssessments,
    @Default(0) int streakDays,
    @Default(0) int maxStreakDays,
    @Default(0.0) double averageScore,
    @Default(0.0) double completionRate,
    @Default(0) int audioHoursListened,
    @Default(0) int coursesCompleted,
    DateTime? lastActivity,
    DateTime? joinedDate,
    Map<String, dynamic>? achievements,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);

  const UserStats._();

  int get totalHours => (audioHoursListened / 60).round();

  String get experienceLevel {
    if (completedGoals < 5) return 'Beginner';
    if (completedGoals < 20) return 'Intermediate';
    if (completedGoals < 50) return 'Advanced';
    return 'Expert';
  }

  bool get isActive {
    if (lastActivity == null) return false;
    final daysSinceLastActivity = DateTime.now().difference(lastActivity!).inDays;
    return daysSinceLastActivity <= 7;
  }
}