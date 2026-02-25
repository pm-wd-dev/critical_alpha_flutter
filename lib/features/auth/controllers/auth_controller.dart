import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../core/errors/failures.dart';
import '../models/user_model.dart';
import '../models/auth_simple_models.dart';  // Contains AuthResponse, TokenResponse, etc.
import '../models/auth_request_models.dart';  // Contains LoginRequest and SignupRequest
import '../repositories/auth_repository.dart';

part 'auth_controller.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    UserModel? user,
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    AppException? error,
    String? message,
  }) = _AuthState;
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(const AuthState());

  // Check auth state on app startup
  Future<void> checkAuthState() async {
    // Don't set loading state during initial auth check
    // This prevents the login button from being stuck in loading state

    try {
      // Try to get stored user and token
      final storedUser = await _authRepository.getStoredUser();
      final storedToken = await _authRepository.getStoredToken();

      if (storedUser != null && storedToken != null) {
        // First, set authenticated with stored user data
        // This ensures user stays logged in during hot reload
        state = state.copyWith(
          user: storedUser,
          isAuthenticated: true,
          isLoading: false,
          error: null,
        );

        // Then try to get fresh user data from server in background
        final result = await _authRepository.getCurrentUser();

        result.when(
          success: (user) {
            // Update with fresh user data
            state = state.copyWith(
              user: user,
              isAuthenticated: true,
              isLoading: false,
              error: null,
            );
          },
          failure: (error) {
            // Only clear auth if it's a 401 unauthorized error
            // For other errors (network, etc), keep user logged in with cached data
            if (error.message.contains('401') || error.message.contains('Unauthorized')) {
              _authRepository.clearStoredData();
              state = state.copyWith(
                user: null,
                isAuthenticated: false,
                isLoading: false,
                error: null,
              );
            }
            // Otherwise keep the user logged in with cached data
          },
        );
      } else {
        // No stored credentials, just set unauthenticated state
        state = state.copyWith(
          isAuthenticated: false,
          isLoading: false,
          error: null,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        error: null, // Don't show error for initial auth check
      );
    }
  }

  // Login
  Future<bool> login(LoginRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.login(request);

    return result.when(
      success: (authResponse) async {
        // After successful login, fetch current user data to get complete profile
        final userResult = await _authRepository.getCurrentUser();

        final finalUser = userResult.when(
          success: (user) => user,
          failure: (_) => authResponse.user, // Fallback to login response user
        );

        state = state.copyWith(
          user: finalUser,
          isAuthenticated: true,
          isLoading: false,
          error: null,
          message: authResponse.message ?? 'Login successful',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Signup
  Future<bool> signup(SignupRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.signup(request);

    return result.when(
      success: (authResponse) {
        state = state.copyWith(
          user: authResponse.user,
          isAuthenticated: false, // Don't authenticate until OTP verification
          isLoading: false,
          error: null,
          message: authResponse.message ?? 'Account created successfully',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Social login
  Future<bool> socialLogin(SocialLoginRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.socialLogin(request);

    return result.when(
      success: (authResponse) {
        state = state.copyWith(
          user: authResponse.user,
          isAuthenticated: true,
          isLoading: false,
          error: null,
          message: authResponse.message ?? 'Login successful',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Forgot password
  Future<bool> forgotPassword(ForgotPasswordRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.forgotPassword(request);

    return result.when(
      success: (_) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          message: 'Password reset instructions sent to your email',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Verify code
  Future<bool> verifyCode(VerifyCodeRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.verifyCode(request);

    return result.when(
      success: (_) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          message: 'Code verified successfully',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Reset password
  Future<bool> resetPassword(ResetPasswordRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.resetPassword(request);

    return result.when(
      success: (_) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          message: 'Password reset successfully',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Get current user (refresh user data from server)
  Future<void> getCurrentUser() async {
    final result = await _authRepository.getCurrentUser();

    result.when(
      success: (user) {
        state = state.copyWith(
          user: user,
          error: null,
        );
      },
      failure: (error) {
        // Silent failure - don't update state with error
        // as this is just a refresh operation
      },
    );
  }

  // Change password
  Future<bool> changePassword(ChangePasswordRequest request) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.changePassword(request);

    return result.when(
      success: (_) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          message: 'Password changed successfully',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Resend verification code
  Future<bool> resendVerificationCode(String email, String type) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _authRepository.resendVerificationCode(email, type);

    return result.when(
      success: (_) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          message: 'Verification code sent',
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          message: null,
        );
        return false;
      },
    );
  }

  // Clear auth state without making API calls
  // Used when we want to ensure unauthenticated state (e.g., forgot password flow)
  void clearAuthState() {
    state = const AuthState(
      user: null,
      isAuthenticated: false,
      isLoading: false,
      error: null,
      message: null,
    );
  }

  // Logout
  Future<void> logout({bool logoutFromAllDevices = false}) async {
    state = state.copyWith(isLoading: true, error: null, message: null);

    final request = LogoutRequest(logoutFromAllDevices: logoutFromAllDevices);
    final result = await _authRepository.logout(request);

    // Always clear auth state completely regardless of server response
    state = const AuthState(
      user: null,  // Explicitly set user to null
      isAuthenticated: false,
      isLoading: false,
      error: null,
      message: null,
    );

    // Clear any cached data
    await _authRepository.clearStoredData();

    result.when(
      success: (_) {
        // State already cleared above
      },
      failure: (error) {
        // Even if logout fails on server, state is already cleared
      },
    );
  }

  // Refresh user data
  Future<void> refreshUser() async {
    if (!state.isAuthenticated) return;

    final result = await _authRepository.getCurrentUser();

    result.when(
      success: (user) {
        state = state.copyWith(user: user, error: null);
      },
      failure: (error) {
        // Don't update state if refresh fails, keep existing user
        debugPrint('Failed to refresh user: $error');
      },
    );
  }

  // Update user locally (for optimistic updates)
  void updateUser(UserModel user) {
    if (state.isAuthenticated) {
      state = state.copyWith(user: user);
    }
  }

  // Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  // Clear message
  void clearMessage() {
    state = state.copyWith(message: null);
  }

  // Auto-refresh token if needed
  Future<void> ensureValidToken() async {
    final refreshToken = await _authRepository.getStoredRefreshToken();
    if (refreshToken == null) {
      await logout();
      return;
    }

    try {
      final request = RefreshTokenRequest(refreshToken: refreshToken);
      final result = await _authRepository.refreshToken(request);

      result.when(
        success: (authResponse) {
          // Token refreshed successfully
          state = state.copyWith(user: authResponse.user);
        },
        failure: (error) {
          // Refresh failed, logout user
          logout();
        },
      );
    } catch (e) {
      // Refresh failed, logout user
      logout();
    }
  }
}

// Providers
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository);
});

final authStateProvider = Provider<AsyncValue<UserModel?>>((ref) {
  final authState = ref.watch(authControllerProvider);

  if (authState.isLoading) {
    return const AsyncValue.loading();
  }

  if (authState.error != null) {
    return AsyncValue.error(authState.error!, StackTrace.current);
  }

  return AsyncValue.data(authState.user);
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isAuthenticated;
});

final currentUserProvider = Provider<UserModel?>((ref) {
  return ref.watch(authControllerProvider).user;
});

final authLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isLoading;
});

final authErrorProvider = Provider<AppException?>((ref) {
  return ref.watch(authControllerProvider).error;
});

final authMessageProvider = Provider<String?>((ref) {
  return ref.watch(authControllerProvider).message;
});