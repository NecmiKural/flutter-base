import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/logging/app_logger.dart';
import 'package:base_app/core/storage/hive_service.dart';
import 'package:base_app/core/utils/workers/token_refresh_worker.dart';

/// Interceptor for handling authentication tokens in API requests
class AuthInterceptor extends Interceptor {
  final Ref _ref;
  final _logger = AppLogger('AuthInterceptor');

  AuthInterceptor(this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip authentication for login and public endpoints
    if (_isPublicEndpoint(options.path)) {
      return super.onRequest(options, handler);
    }

    try {
      // Get the token from storage
      final hiveService = _ref.read(hiveServiceProvider);
      final token = await hiveService.getAuthToken();

      if (token != null && token.isNotEmpty) {
        // Add the token to the request headers
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        _logger.warning('No auth token available for request: ${options.path}');
      }
    } catch (e) {
      _logger.error('Error adding auth token to request', e);
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized errors (token expired)
    if (err.response?.statusCode == 401) {
      _logger.info('Received 401 Unauthorized, attempting to refresh token');

      try {
        // Get a new token using the refresh token
        final hiveService = _ref.read(hiveServiceProvider);
        final refreshToken = await hiveService.getRefreshToken();

        if (refreshToken != null && refreshToken.isNotEmpty) {
          // Implement token refresh logic here
          final refreshResult =
              await _ref
                  .read(tokenRefreshProvider.notifier)
                  .debouncedTokenRefresher();

          if (refreshResult) {
            // Token refresh was successful
            // retry the original request here
          } else {
            // Token refresh failed
            // redirect login page here or inside of the worker. here would be better
          }

          // For now, we'll just log that we would refresh the token
          _logger.info('Would refresh token using refresh token');

          // In a real implementation, you would:
          // 1. Call your auth service to refresh the token
          // 2. Update the token in storage
          // 3. Retry the original request with the new token
          // 4. Redirect to the login screen if request fails
        } else {
          _logger.warning(
            'No refresh token available, cannot refresh auth token',
          );
        }
      } catch (e) {
        _logger.error('Error refreshing auth token', e);
      }
    }

    super.onError(err, handler);
  }

  // todo change here
  /// Determines if the endpoint is public (doesn't require authentication)
  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      '/auth/login',
      '/auth/register',
      '/auth/forgot-password',
    ];

    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
