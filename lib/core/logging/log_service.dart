import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

/// Provider for the LogService
final logServiceProvider = Provider<LogService>((ref) {
  return LogService();
});

/// Service responsible for configuring and managing application-wide logging.
class LogService {
  /// Initialize the logging system.
  void initialize() {
    // Set the logging level based on whether we're in debug or release mode
    Logger.root.level = kDebugMode ? Level.ALL : Level.INFO;
    
    // Configure the logger to print to console
    Logger.root.onRecord.listen((record) {
      final message = '${record.level.name}: ${record.time}: '
          '${record.loggerName}: ${record.message}';
      
      // Print to console with appropriate coloring based on level
      if (record.level >= Level.SEVERE) {
        debugPrint('\x1B[31m$message\x1B[0m'); // Red for severe/error
      } else if (record.level >= Level.WARNING) {
        debugPrint('\x1B[33m$message\x1B[0m'); // Yellow for warnings
      } else if (record.level >= Level.INFO) {
        debugPrint('\x1B[36m$message\x1B[0m'); // Cyan for info
      } else {
        debugPrint(message); // Normal for debug and below
      }
      
      // If there's an error object, print that too
      if (record.error != null) {
        debugPrint('ERROR: ${record.error}');
      }
      
      // If there's a stack trace, print that too
      if (record.stackTrace != null) {
        debugPrint('STACK TRACE:\n${record.stackTrace}');
      }
    });
  }
}