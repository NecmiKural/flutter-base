import 'package:flutter/foundation.dart';
import 'package:base_app/core/config/environment.dart';

/// Configuration class for application-wide settings
class AppConfig {
  /// The current environment the app is running in
  static final Environment environment = _getEnvironment();

  /// Base URL for API requests
  static String get apiBaseUrl => _getApiBaseUrl();

  /// Timeout duration for API requests in seconds
  static const int apiTimeoutSeconds = 30;

  /// Whether to enable detailed API logging
  static bool get enableApiLogging => kDebugMode;

  /// Authentication related configuration
  static const String authClientId = 'example_app';

  /// Token expiration buffer in seconds (refresh token if expiring within this time)
  static const int tokenExpirationBufferSeconds = 300; // 5 minutes

  /// Determines the current environment based on build configuration
  static Environment _getEnvironment() {
    if (kReleaseMode) {
      return Environment.production;
    } else if (const bool.fromEnvironment('STAGING')) {
      return Environment.staging;
    } else {
      return Environment.development;
    }
  }

  /// Returns the appropriate API base URL for the current environment
  static String _getApiBaseUrl() {
    switch (environment) {
      case Environment.development:
        return 'https://dev-api.example.com/v1';
      case Environment.staging:
        return 'https://staging-api.example.com/v1';
      case Environment.production:
        return 'https://api.example.com/v1';
    }
  }

  /// App version information
  static const String appVersion = '1.0.0';

  /// Build number
  static const String buildNumber = '1';

  /// Full app version string including build number
  static String get fullVersion => '$appVersion+$buildNumber';

  /// Cache configuration
  static const Duration defaultCacheDuration = Duration(hours: 1);

  /// Maximum number of retries for failed API requests
  static const int maxApiRetries = 3;
}
