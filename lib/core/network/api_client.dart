import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/config/app_config.dart';
import 'package:base_app/core/logging/app_logger.dart';
import 'package:base_app/core/network/interceptors/auth_interceptor.dart';
import 'package:base_app/core/network/interceptors/logging_interceptor.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref);
});

class ApiClient {
  final Ref _ref;
  late final Dio _dio;
  final _logger = AppLogger('ApiClient');

  ApiClient(this._ref) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(AuthInterceptor(_ref));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _logger.error('GET request failed: $path', e);
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _logger.error('POST request failed: $path', e);
      rethrow;
    }
  }

  // Add other methods (put, delete, etc.)
}
