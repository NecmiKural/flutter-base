import 'package:logging/logging.dart';

/// A wrapper around the logging package to provide consistent logging throughout the app.
class AppLogger {
  final Logger _logger;

  /// Creates a new logger with the given [name].
  AppLogger(String name) : _logger = Logger(name);

  /// Log a message at the [Level.FINE] level.
  void fine(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.fine(message, error, stackTrace);
  }

  /// Log a message at the [Level.INFO] level.
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.info(message, error, stackTrace);
  }

  /// Log a message at the [Level.WARNING] level.
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.warning(message, error, stackTrace);
  }

  /// Log a message at the [Level.SEVERE] level.
  void severe(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(message, error, stackTrace);
  }

  /// Log a message at the [Level.SHOUT] level.
  void shout(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.shout(message, error, stackTrace);
  }

  /// Log a message at the [Level.CONFIG] level.
  void config(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.config(message, error, stackTrace);
  }

  /// Log a message at the [Level.FINEST] level.
  void finest(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.finest(message, error, stackTrace);
  }

  /// Log a message at the [Level.FINER] level.
  void finer(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.finer(message, error, stackTrace);
  }

  /// Log a message at the specified [level].
  void log(Level level, String message, [Object? error, StackTrace? stackTrace]) {
    _logger.log(level, message, error, stackTrace);
  }

  /// Log a message at the [Level.SEVERE] level specifically for errors.
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe('ERROR: $message', error, stackTrace);
  }
}