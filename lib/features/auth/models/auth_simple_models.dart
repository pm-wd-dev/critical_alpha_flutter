// Simple auth models without code generation

import 'user_model.dart';

// Token Response
class TokenResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final String? scope;

  const TokenResponse({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType = 'Bearer',
    required this.expiresIn,
    this.scope,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    accessToken: json['access_token'] ?? json['accessToken'] ?? '',
    refreshToken: json['refresh_token'] ?? json['refreshToken'] ?? '',
    tokenType: json['token_type'] ?? json['tokenType'] ?? 'Bearer',
    expiresIn: json['expires_in'] ?? json['expiresIn'] ?? 86400,
    scope: json['scope'],
  );

  DateTime get expiryDate => DateTime.now().add(Duration(seconds: expiresIn));
  bool get isExpired => DateTime.now().isAfter(expiryDate);
  bool get isExpiringSoon => DateTime.now().add(const Duration(minutes: 5)).isAfter(expiryDate);
}

// Auth Response
class AuthResponse {
  final TokenResponse tokens;
  final UserModel user;
  final String? message;
  final Map<String, dynamic>? metadata;

  const AuthResponse({
    required this.tokens,
    required this.user,
    this.message,
    this.metadata,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    tokens: TokenResponse.fromJson(json['tokens'] ?? {}),
    user: UserModel.fromJson(json['user'] ?? {}),
    message: json['message'],
    metadata: json['metadata'],
  );
}

// Other request models
class ForgotPasswordRequest {
  final String email;
  final String? redirectUrl;

  const ForgotPasswordRequest({
    required this.email,
    this.redirectUrl,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    if (redirectUrl != null) 'redirectUrl': redirectUrl,
  };
}

class VerifyCodeRequest {
  final String email;
  final String code;
  final String type;

  const VerifyCodeRequest({
    required this.email,
    required this.code,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'OTP': code,  // React Native uses 'OTP' instead of 'code'
  };
}

class ResetPasswordRequest {
  final String? token;
  final String? email;
  final String newPassword;
  final String confirmPassword;

  const ResetPasswordRequest({
    this.token,
    this.email,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    // For forgot password flow, use email and password like React Native
    if (email != null) {
      return {
        'email': email,
        'password': newPassword,  // React Native uses 'password' field
      };
    }
    // For other password reset flows
    return {
      'token': token,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}

class ChangePasswordRequest {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'currentPassword': currentPassword,
    'newPassword': newPassword,
    'confirmPassword': confirmPassword,
  };
}

class SocialLoginRequest {
  final String provider;
  final String token;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profilePicture;
  final String? deviceId;
  final String? deviceName;
  final String? fcmToken;

  const SocialLoginRequest({
    required this.provider,
    required this.token,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePicture,
    this.deviceId,
    this.deviceName,
    this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
    'provider': provider,
    'token': token,
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (email != null) 'email': email,
    if (profilePicture != null) 'profilePicture': profilePicture,
    if (deviceId != null) 'deviceId': deviceId,
    if (deviceName != null) 'deviceName': deviceName,
    if (fcmToken != null) 'fcmToken': fcmToken,
  };

  SocialLoginRequest copyWith({
    String? provider,
    String? token,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePicture,
    String? deviceId,
    String? deviceName,
    String? fcmToken,
  }) {
    return SocialLoginRequest(
      provider: provider ?? this.provider,
      token: token ?? this.token,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}

class RefreshTokenRequest {
  final String refreshToken;
  final String? deviceId;

  const RefreshTokenRequest({
    required this.refreshToken,
    this.deviceId,
  });

  Map<String, dynamic> toJson() => {
    'refresh_token': refreshToken,
    if (deviceId != null) 'deviceId': deviceId,
  };
}

class LogoutRequest {
  final String? deviceId;
  final bool logoutFromAllDevices;

  const LogoutRequest({
    this.deviceId,
    this.logoutFromAllDevices = false,
  });

  Map<String, dynamic> toJson() => {
    if (deviceId != null) 'deviceId': deviceId,
    'logoutFromAllDevices': logoutFromAllDevices,
  };
}

enum AuthState {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

enum VerificationType {
  passwordReset('password_reset'),
  emailVerification('email_verification'),
  phoneVerification('phone_verification'),
  twoFactorAuth('two_factor_auth');

  final String value;
  const VerificationType(this.value);
}