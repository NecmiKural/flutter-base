import 'package:dio/dio.dart';
import 'package:base_app/core/config/app_config.dart';
import 'package:base_app/core/logging/app_logger.dart';

/// Interceptor for logging API requests and responses
class LoggingInterceptor extends Interceptor {
  final _logger = AppLogger('API');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppConfig.enableApiLogging) {
      _logger.info('REQUEST[${options.method}] => PATH: ${options.path}');

      if (options.queryParameters.isNotEmpty) {
        _logger.info('Request Query Parameters: ${options.queryParameters}');
      }

      if (options.data != null) {
        _logger.info('Request Body: ${options.data}');
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (AppConfig.enableApiLogging) {
      _logger.info(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );

      if (response.data != null) {
        _logger.info('Response Body: ${response.data}');
      }
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.error(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      err,
    );

    if (err.response?.data != null) {
      _logger.error('Error Response: ${err.response?.data}');
    }

    super.onError(err, handler);
  }
}
