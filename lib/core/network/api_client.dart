import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../constants/app_constants.dart';
import '../errors/failures.dart';
import 'api_endpoints.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  late Dio _dio;
  String? _authToken;
  String? _refreshToken;

  Dio get dio => _dio;

  Future<void> initialize() async {
    _dio = Dio(BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: AppConstants.connectionTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      sendTimeout: AppConstants.connectionTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    _dio.interceptors.addAll([
      _AuthInterceptor(),
      _NetworkInterceptor(),
      if (kDebugMode) _LoggingInterceptor(),
      _ErrorInterceptor(),
      _RetryInterceptor(),
    ]);

    // Load stored tokens
    await _loadStoredTokens();
  }

  Future<void> _loadStoredTokens() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString(AppConstants.tokenKey);
    _refreshToken = prefs.getString(AppConstants.refreshTokenKey);
  }

  Future<void> setTokens(String? authToken, String? refreshToken) async {
    _authToken = authToken;
    _refreshToken = refreshToken;

    final prefs = await SharedPreferences.getInstance();
    if (authToken != null && refreshToken != null) {
      await prefs.setString(AppConstants.tokenKey, authToken);
      await prefs.setString(AppConstants.refreshTokenKey, refreshToken);
    } else {
      await prefs.remove(AppConstants.tokenKey);
      await prefs.remove(AppConstants.refreshTokenKey);
    }
  }

  String? get authToken => _authToken;
  String? get refreshToken => _refreshToken;

  Future<void> clearTokens() async {
    await setTokens(null, null);
  }

  // Generic request method
  Future<Response<T>> request<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // POST request
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // PUT request
  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  AppException _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Connection timeout. Please try again.');

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        final message = e.response?.data?['message'] ?? 'Unknown error occurred';

        switch (statusCode) {
          case 400:
            return BadRequestException(message);
          case 401:
            return UnauthorizedException(message);
          case 403:
            return ForbiddenException(message);
          case 404:
            return NotFoundException(message);
          case 422:
            return ValidationException(message, e.response?.data?['errors']);
          case 429:
            return RateLimitException(message);
          case 500:
          case 502:
          case 503:
          case 504:
            return ServerException(message);
          default:
            return NetworkException(message);
        }

      case DioExceptionType.cancel:
        return NetworkException('Request was cancelled');

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return NetworkException('No internet connection');
        }
        return NetworkException('Network error occurred');

      default:
        return NetworkException('Unknown error occurred');
    }
  }
}

// Auth Interceptor
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = ApiClient()._authToken;
    if (token != null && !_isAuthEndpoint(options.path)) {
      // React Native sends token directly without Bearer prefix
      options.headers['Authorization'] = token;
    }
    handler.next(options);
  }

  bool _isAuthEndpoint(String path) {
    final authEndpoints = [
      ApiEndpoints.login,
      ApiEndpoints.signup,
      ApiEndpoints.refreshToken,
      ApiEndpoints.forgotPassword,
      ApiEndpoints.resetPassword,
    ];
    return authEndpoints.contains(path);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token expired, try to refresh
      final refreshToken = ApiClient()._refreshToken;
      if (refreshToken != null) {
        try {
          final response = await ApiClient()._dio.post(
            ApiEndpoints.refreshToken,
            data: {'refresh_token': refreshToken},
          );

          final newToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];

          await ApiClient().setTokens(newToken, newRefreshToken);

          // Retry the original request
          final requestOptions = err.requestOptions;
          // React Native sends token directly without Bearer prefix
          requestOptions.headers['Authorization'] = newToken;

          final retryResponse = await ApiClient()._dio.fetch(requestOptions);
          handler.resolve(retryResponse);
          return;
        } catch (e) {
          // Refresh failed, clear tokens and redirect to login
          await ApiClient().clearTokens();
        }
      }
    }
    handler.next(err);
  }
}

// Network Connectivity Interceptor
class _NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'No internet connection',
          type: DioExceptionType.unknown,
        ),
      );
      return;
    }
    handler.next(options);
  }
}

// Logging Interceptor (only in debug mode)
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Query Parameters: ${options.queryParameters}');
    if (options.data != null) {
      debugPrint('Body: ${options.data}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    debugPrint('Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    debugPrint('Message: ${err.message}');
    debugPrint('Data: ${err.response?.data}');
    handler.next(err);
  }
}

// Error Interceptor
class _ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle success responses with error status
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      if (data['success'] == false || data['error'] != null) {
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: data['message'] ?? 'Request failed',
            type: DioExceptionType.badResponse,
          ),
        );
        return;
      }
    }
    handler.next(response);
  }
}

// Retry Interceptor
class _RetryInterceptor extends Interceptor {
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final extra = err.requestOptions.extra;
    final retryCount = extra['retryCount'] ?? 0;

    if (_shouldRetry(err) && retryCount < maxRetries) {
      extra['retryCount'] = retryCount + 1;

      await Future.delayed(retryDelay * (retryCount + 1));

      try {
        final response = await ApiClient()._dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // Retry failed, continue with original error
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}