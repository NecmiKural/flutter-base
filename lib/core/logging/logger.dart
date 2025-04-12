import 'package:logger/logger.dart';

/// A utility class that provides logging functionality.
/// This class is used to log messages at different levels.
/// The levels are debug, info, warning, and error.
///
/// It uses the `logger` package to log messages.
///
/// Usage:
/// ```dart
/// Log.debug('This is a debug message');
/// Log.info('This is an info message');
/// Log.warning('This is a warning message');
/// Log.error('This is an error message');
///
/// ```
abstract class Log {
  /// Logger instance from the `logger` package.
  static final Logger _logger = Logger();

  /// Logs a debug message.
  ///
  /// [message] The message to log.
  static void debug(dynamic message, [StackTrace? stackTrace]) {
    _logger.d(
      message.toString(),
      stackTrace: stackTrace ?? StackTrace.current,
      time: DateTime.now(),
    );
  }

  /// Logs an info message.
  ///
  /// [message] The message to log.
  static void info(dynamic message, [StackTrace? stackTrace]) {
    _logger.i(
      message.toString(),
      time: DateTime.now(),
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }

  /// Logs a warning message.
  ///
  /// [message] The message to log.
  static void warning(dynamic message) {
    _logger.w(
      message.toString(),
      stackTrace: StackTrace.current,
      time: DateTime.now(),
    );
  }

  /// Logs an error message.
  ///
  /// [message] The message to log.
  static void error(dynamic message, [StackTrace? stackTrace]) {
    _logger.e(
      message.toString(),
      time: DateTime.now(),
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }
}
