import 'package:equatable/equatable.dart';

// Base exception class
abstract class AppException extends Equatable implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException(this.message, {this.code, this.details});

  @override
  List<Object?> get props => [message, code, details];

  @override
  String toString() => message;
}

// Network Exceptions
class NetworkException extends AppException {
  const NetworkException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class ServerException extends AppException {
  const ServerException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class BadRequestException extends AppException {
  const BadRequestException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class ForbiddenException extends AppException {
  const ForbiddenException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class NotFoundException extends AppException {
  const NotFoundException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class ValidationException extends AppException {
  final Map<String, dynamic>? errors;

  const ValidationException(String message, this.errors, {String? code, dynamic details})
      : super(message, code: code, details: details);

  @override
  List<Object?> get props => [message, code, details, errors];
}

class RateLimitException extends AppException {
  const RateLimitException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Authentication Exceptions
class AuthException extends AppException {
  const AuthException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class TokenExpiredException extends AuthException {
  const TokenExpiredException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class AccountLockedException extends AuthException {
  const AccountLockedException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class EmailNotVerifiedException extends AuthException {
  const EmailNotVerifiedException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Storage Exceptions
class StorageException extends AppException {
  const StorageException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class FileNotFoundException extends StorageException {
  const FileNotFoundException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class PermissionDeniedException extends StorageException {
  const PermissionDeniedException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class InsufficientStorageException extends StorageException {
  const InsufficientStorageException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Business Logic Exceptions
class BusinessLogicException extends AppException {
  const BusinessLogicException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class InvalidOperationException extends BusinessLogicException {
  const InvalidOperationException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class ResourceNotFoundException extends BusinessLogicException {
  const ResourceNotFoundException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class DuplicateResourceException extends BusinessLogicException {
  const DuplicateResourceException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class QuotaExceededException extends BusinessLogicException {
  const QuotaExceededException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Media Exceptions
class MediaException extends AppException {
  const MediaException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class AudioPlaybackException extends MediaException {
  const AudioPlaybackException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class UnsupportedFormatException extends MediaException {
  const UnsupportedFormatException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class MediaLoadException extends MediaException {
  const MediaLoadException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Payment Exceptions
class PaymentException extends AppException {
  const PaymentException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class PaymentFailedException extends PaymentException {
  const PaymentFailedException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class SubscriptionException extends PaymentException {
  const SubscriptionException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class PurchaseVerificationException extends PaymentException {
  const PurchaseVerificationException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Platform Exceptions
class PlatformException extends AppException {
  const PlatformException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class UnsupportedPlatformException extends PlatformException {
  const UnsupportedPlatformException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class PermissionException extends PlatformException {
  const PermissionException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

class DeviceException extends PlatformException {
  const DeviceException(String message, {String? code, dynamic details})
      : super(message, code: code, details: details);
}

// Utility class for handling exceptions
class ExceptionHandler {
  static String getErrorMessage(dynamic error) {
    if (error is AppException) {
      return error.message;
    } else if (error is Exception) {
      return error.toString();
    } else {
      return 'An unexpected error occurred';
    }
  }

  static String getErrorCode(dynamic error) {
    if (error is AppException && error.code != null) {
      return error.code!;
    }
    return 'unknown_error';
  }

  static bool isNetworkError(dynamic error) {
    return error is NetworkException ||
           error is ServerException ||
           (error is AppException && error.message.toLowerCase().contains('network'));
  }

  static bool isAuthError(dynamic error) {
    return error is AuthException ||
           error is UnauthorizedException ||
           error is ForbiddenException;
  }

  static bool isValidationError(dynamic error) {
    return error is ValidationException ||
           error is BadRequestException;
  }

  static bool isServerError(dynamic error) {
    return error is ServerException;
  }

  static bool isRetryableError(dynamic error) {
    return isNetworkError(error) ||
           isServerError(error) ||
           error is RateLimitException;
  }

  static Map<String, dynamic> toMap(AppException exception) {
    return {
      'message': exception.message,
      'code': exception.code,
      'details': exception.details,
      'type': exception.runtimeType.toString(),
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  static AppException fromMap(Map<String, dynamic> map) {
    final type = map['type'] as String? ?? 'AppException';
    final message = map['message'] as String? ?? 'Unknown error';
    final code = map['code'] as String?;
    final details = map['details'];

    switch (type) {
      case 'NetworkException':
        return NetworkException(message, code: code, details: details);
      case 'ServerException':
        return ServerException(message, code: code, details: details);
      case 'AuthException':
        return AuthException(message, code: code, details: details);
      case 'ValidationException':
        return ValidationException(message, details, code: code, details: details);
      case 'StorageException':
        return StorageException(message, code: code, details: details);
      case 'BusinessLogicException':
        return BusinessLogicException(message, code: code, details: details);
      case 'PaymentException':
        return PaymentException(message, code: code, details: details);
      case 'PlatformException':
        return PlatformException(message, code: code, details: details);
      default:
        return NetworkException(message, code: code, details: details);
    }
  }
}

// Result wrapper for error handling
abstract class Result<T> {
  const Result();

  factory Result.success(T data) = Success<T>;
  factory Result.failure(AppException exception) = Failure<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T get data {
    if (this is Success<T>) {
      return (this as Success<T>).data;
    }
    throw StateError('Result is not a success');
  }

  AppException get exception {
    if (this is Failure<T>) {
      return (this as Failure<T>).exception;
    }
    throw StateError('Result is not a failure');
  }

  R when<R>({
    required R Function(T data) success,
    required R Function(AppException exception) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else {
      return failure((this as Failure<T>).exception);
    }
  }

  Result<R> map<R>(R Function(T data) mapper) {
    if (this is Success<T>) {
      try {
        return Result.success(mapper((this as Success<T>).data));
      } catch (e) {
        return Result.failure(BusinessLogicException(e.toString()));
      }
    } else {
      return Result.failure((this as Failure<T>).exception);
    }
  }

  Future<Result<R>> mapAsync<R>(Future<R> Function(T data) mapper) async {
    if (this is Success<T>) {
      try {
        final result = await mapper((this as Success<T>).data);
        return Result.success(result);
      } catch (e) {
        return Result.failure(BusinessLogicException(e.toString()));
      }
    } else {
      return Result.failure((this as Failure<T>).exception);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Success<T> && data == other.data);

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success(data: $data)';
}

class Failure<T> extends Result<T> {
  final AppException exception;
  const Failure(this.exception);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Failure<T> && exception == other.exception);

  @override
  int get hashCode => exception.hashCode;

  @override
  String toString() => 'Failure(exception: $exception)';
}