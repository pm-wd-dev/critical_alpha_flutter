import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/shared_preferences_provider.dart';
import '../models/user_model.dart';
import '../models/auth_simple_models.dart';  // Contains AuthResponse, TokenResponse, etc.
import '../models/auth_request_models.dart';  // Contains LoginRequest and SignupRequest

abstract class AuthRepository {
  Future<Result<AuthResponse>> login(LoginRequest request);
  Future<Result<AuthResponse>> signup(SignupRequest request);
  Future<Result<void>> forgotPassword(ForgotPasswordRequest request);
  Future<Result<void>> verifyCode(VerifyCodeRequest request);
  Future<Result<void>> resetPassword(ResetPasswordRequest request);
  Future<Result<void>> changePassword(ChangePasswordRequest request);
  Future<Result<AuthResponse>> refreshToken(RefreshTokenRequest request);
  Future<Result<void>> logout(LogoutRequest request);
  Future<Result<AuthResponse>> socialLogin(SocialLoginRequest request);
  Future<Result<void>> resendVerificationCode(String email, String type);
  Future<Result<UserModel>> getCurrentUser();
  Future<UserModel?> getStoredUser();
  Future<void> storeUser(UserModel user);
  Future<void> clearStoredData();
  Future<String?> getStoredToken();
  Future<String?> getStoredRefreshToken();
  Future<void> storeTokens(String accessToken, String refreshToken);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final SharedPreferences _prefs;

  AuthRepositoryImpl(this._apiClient, this._prefs);

  @override
  Future<Result<AuthResponse>> login(LoginRequest request) async {
    try {
      // React Native API doesn't need device info for login
      final response = await _apiClient.post<Map<String, dynamic>>(
        ApiEndpoints.login,
        data: request.toJson(),
      );

      if (response.data == null) {
        return Result.failure(
          const NetworkException('Invalid response from server'),
        );
      }

      final responseData = response.data!;

      // Check for error status codes first
      final status = responseData['status'] as int?;
      final success = responseData['success'] as bool? ?? false;

      // Handle error responses (including 500 errors)
      if (status != null && status >= 400) {
        final message = responseData['message'] ?? 'Login failed';

        // Clear any stored credentials on server errors
        await clearStoredData();

        if (status == 401 || message.toLowerCase().contains('invalid')) {
          return Result.failure(
            const UnauthorizedException('Invalid email or password'),
          );
        } else if (status == 500 || message.toLowerCase().contains('token')) {
          return Result.failure(
            NetworkException('Server error: $message'),
          );
        }

        return Result.failure(
          NetworkException(message),
        );
      }

      // Handle React Native API response format
      if (success && responseData['data'] != null) {
        final token = responseData['data']['token'] as String?;
        final userData = responseData['data']['user'] as Map<String, dynamic>?;

        if (token == null) {
          return Result.failure(
            const NetworkException('No token received from server'),
          );
        }

        // Create auth response from RN format
        final authResponse = AuthResponse(
          tokens: TokenResponse(
            accessToken: token,
            refreshToken: token, // RN doesn't separate refresh token
            tokenType: 'Bearer',
            expiresIn: 86400, // Default to 24 hours
          ),
          user: userData != null
            ? UserModel.fromJson(userData)
            : UserModel(
                id: '', // Will be filled from profile API
                email: request.email,
                firstName: '',
                lastName: '',
              ),
          message: responseData['message'] as String?,
        );

        // Store tokens and user data
        await storeTokens(
          authResponse.tokens.accessToken,
          authResponse.tokens.refreshToken,
        );
        await storeUser(authResponse.user);

        return Result.success(authResponse);
      } else if (responseData['isBlock'] == true) {
        return Result.failure(
          const ForbiddenException('Your account has been blocked by admin'),
        );
      } else {
        final message = responseData['message'] ?? 'Login failed';
        if (message.contains('not verified')) {
          return Result.failure(
            ValidationException(message, {'email_verification': true}),
          );
        }
        return Result.failure(
          NetworkException(message),
        );
      }
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Login failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<AuthResponse>> signup(SignupRequest request) async {
    try {
      // React Native API doesn't need device info for signup
      final response = await _apiClient.post<Map<String, dynamic>>(
        ApiEndpoints.signup,
        data: request.toJson(),
      );

      if (response.data == null) {
        return Result.failure(
          const NetworkException('Invalid response from server'),
        );
      }

      final responseData = response.data!;

      // Handle React Native API response format for signup
      if (responseData['success'] == true) {
        // Signup usually requires email verification, so might not return token immediately
        final token = responseData['data']?['token'] as String?;
        final userData = responseData['data']?['user'] as Map<String, dynamic>?;

        // Create auth response from RN format
        final authResponse = AuthResponse(
          tokens: TokenResponse(
            accessToken: token ?? '', // Empty if verification needed
            refreshToken: token ?? '',
            tokenType: 'Bearer',
            expiresIn: 86400,
          ),
          user: userData != null
            ? UserModel.fromJson(userData)
            : UserModel(
                id: '',
                email: request.email,
                firstName: '', // Will be filled from profile API
                lastName: '',  // Will be filled from profile API
                username: request.username,
              ),
          message: responseData['message'] ?? 'Account created successfully',
        );

        // Don't store tokens for signup - user needs to verify email first
        // Tokens will be stored after successful email verification
        // if (token != null && token.isNotEmpty) {
        //   await storeTokens(
        //     authResponse.tokens.accessToken,
        //     authResponse.tokens.refreshToken,
        //   );
        //   await storeUser(authResponse.user);
        // }

        return Result.success(authResponse);
      } else {
        final message = responseData['message'] ?? 'Signup failed';
        return Result.failure(
          NetworkException(message),
        );
      }
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Signup failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> forgotPassword(ForgotPasswordRequest request) async {
    try {
      await _apiClient.post(
        ApiEndpoints.forgotPassword,
        data: request.toJson(),
      );

      return Result.success(null);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Forgot password failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> verifyCode(VerifyCodeRequest request) async {
    try {
      await _apiClient.post(
        ApiEndpoints.verifyCode,
        data: request.toJson(),
      );

      return Result.success(null);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Code verification failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> resetPassword(ResetPasswordRequest request) async {
    try {
      await _apiClient.post(
        ApiEndpoints.resetPassword,
        data: request.toJson(),
      );

      return Result.success(null);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Password reset failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> changePassword(ChangePasswordRequest request) async {
    try {
      await _apiClient.post(
        ApiEndpoints.changePassword,
        data: request.toJson(),
      );

      return Result.success(null);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Change password failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<AuthResponse>> refreshToken(RefreshTokenRequest request) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        ApiEndpoints.refreshToken,
        data: request.toJson(),
      );

      if (response.data == null) {
        return Result.failure(
          const NetworkException('Invalid response from server'),
        );
      }

      final authResponse = AuthResponse.fromJson(response.data!);

      // Store new tokens
      await storeTokens(
        authResponse.tokens.accessToken,
        authResponse.tokens.refreshToken,
      );

      return Result.success(authResponse);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Token refresh failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> logout(LogoutRequest request) async {
    try {
      await _apiClient.post(
        ApiEndpoints.logout,
        data: request.toJson(),
      );

      // Clear stored data
      await clearStoredData();

      return Result.success(null);
    } on AppException catch (e) {
      // Even if logout fails on server, clear local data
      await clearStoredData();
      return Result.failure(e);
    } catch (e) {
      // Even if logout fails on server, clear local data
      await clearStoredData();
      return Result.failure(
        NetworkException('Logout failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<AuthResponse>> socialLogin(SocialLoginRequest request) async {
    try {
      // Add device info to request
      final deviceInfo = await _getDeviceInfo();
      final requestWithDevice = request.copyWith(
        deviceId: deviceInfo['deviceId'],
        deviceName: deviceInfo['deviceName'],
      );

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/social-login',
        data: requestWithDevice.toJson(),
      );

      if (response.data == null) {
        return Result.failure(
          const NetworkException('Invalid response from server'),
        );
      }

      final authResponse = AuthResponse.fromJson(response.data!);

      // Store tokens and user data
      await storeTokens(
        authResponse.tokens.accessToken,
        authResponse.tokens.refreshToken,
      );
      await storeUser(authResponse.user);

      return Result.success(authResponse);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Social login failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> resendVerificationCode(String email, String type) async {
    try {
      // For password reset, use the forgot password endpoint to resend code
      if (type == 'password_reset') {
        await _apiClient.post(
          ApiEndpoints.forgotPassword,  // Use /user/changePass_request for password reset
          data: {
            'email': email,
          },
        );
      } else {
        // For other verification types, use the resend endpoint
        await _apiClient.post(
          ApiEndpoints.resendVerification,
          data: {
            'email': email,
            'type': type,
          },
        );
      }

      return Result.success(null);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Resend code failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<UserModel>> getCurrentUser() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        ApiEndpoints.profile,
      );

      if (response.data == null) {
        return Result.failure(
          const NetworkException('Invalid response from server'),
        );
      }

      // Handle React Native API response format
      final responseData = response.data!;
      Map<String, dynamic> userData;

      // Check if response has 'data' wrapper
      if (responseData['data'] != null && responseData['data'] is Map) {
        userData = responseData['data'] as Map<String, dynamic>;
      } else {
        userData = responseData;
      }

      // Map the fields properly
      // React Native API might use different field names
      if (userData['_id'] != null && userData['id'] == null) {
        userData['id'] = userData['_id'];
      }
      if (userData['name'] != null && userData['username'] == null) {
        userData['username'] = userData['name'];
      }
      if (userData['first_name'] != null && userData['firstName'] == null) {
        userData['firstName'] = userData['first_name'];
      }
      if (userData['last_name'] != null && userData['lastName'] == null) {
        userData['lastName'] = userData['last_name'];
      }

      final user = UserModel.fromJson(userData);
      await storeUser(user);

      return Result.success(user);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(
        NetworkException('Get user failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<UserModel?> getStoredUser() async {
    try {
      final userJson = _prefs.getString(AppConstants.userDataKey);
      if (userJson == null) return null;

      final userMap = json.decode(userJson) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> storeUser(UserModel user) async {
    try {
      final userJson = json.encode(user.toJson());
      await _prefs.setString(AppConstants.userDataKey, userJson);
    } catch (e) {
      // Handle error silently for now
    }
  }

  @override
  Future<void> clearStoredData() async {
    try {
      await Future.wait([
        _prefs.remove(AppConstants.tokenKey),
        _prefs.remove(AppConstants.refreshTokenKey),
        _prefs.remove(AppConstants.userDataKey),
      ]);

      // Also clear from API client
      await ApiClient().clearTokens();
    } catch (e) {
      // Handle error silently for now
    }
  }

  @override
  Future<String?> getStoredToken() async {
    return _prefs.getString(AppConstants.tokenKey);
  }

  @override
  Future<String?> getStoredRefreshToken() async {
    return _prefs.getString(AppConstants.refreshTokenKey);
  }

  @override
  Future<void> storeTokens(String accessToken, String refreshToken) async {
    try {
      await Future.wait([
        _prefs.setString(AppConstants.tokenKey, accessToken),
        _prefs.setString(AppConstants.refreshTokenKey, refreshToken),
      ]);

      // Also store in API client
      await ApiClient().setTokens(accessToken, refreshToken);
    } catch (e) {
      // Handle error silently for now
    }
  }

  Future<Map<String, String>> _getDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      String deviceName = '';

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
        deviceName = '${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
        deviceName = '${iosInfo.name} ${iosInfo.model}';
      }

      return {
        'deviceId': deviceId,
        'deviceName': deviceName,
      };
    } catch (e) {
      return {
        'deviceId': '',
        'deviceName': 'Unknown Device',
      };
    }
  }
}

// Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ApiClient(),
    ref.watch(sharedPreferencesProvider),
  );
});