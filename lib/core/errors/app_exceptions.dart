/// Base exception class for application-specific exceptions
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic data;
  final StackTrace? stackTrace;

  AppException(
    this.message, {
    this.code,
    this.data,
    this.stackTrace,
  });

  @override
  String toString() {
    return 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}

/// Network-related exceptions
class NetworkException extends AppException {
  NetworkException(
    super.message, {
    super.code,
    super.data,
    super.stackTrace,
  });
}

/// Authentication-related exceptions
class AuthException extends AppException {
  AuthException(
    super.message, {
    super.code,
    super.data,
    super.stackTrace,
  });
}

/// Server-related exceptions
class ServerException extends AppException {
  ServerException(
    super.message, {
    super.code,
    super.data,
    super.stackTrace,
  });
}

/// Cache-related exceptions
class CacheException extends AppException {
  CacheException(
    super.message, {
    super.code,
    super.data,
    super.stackTrace,
  });
}

/// Validation-related exceptions
class ValidationException extends AppException {
  ValidationException(
    super.message, {
    super.code,
    super.data,
    super.stackTrace,
  });
}

/// Permission-related exceptions
class PermissionException extends AppException {
  PermissionException(
    super.message, {
    super.code,
    super.data,
    super.stackTrace,
  });
}