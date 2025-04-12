/// Represents the different environments the app can run in
enum Environment {
  /// Development environment for local testing
  development,
  
  /// Staging environment for pre-production testing
  staging,
  
  /// Production environment for released app
  production,
}

/// Extension methods for Environment enum
extension EnvironmentExtension on Environment {
  /// Returns a user-friendly name for the environment
  String get displayName {
    switch (this) {
      case Environment.development:
        return 'Development';
      case Environment.staging:
        return 'Staging';
      case Environment.production:
        return 'Production';
      }
  }
  
  /// Returns whether this is a production environment
  bool get isProduction => this == Environment.production;
  
  /// Returns whether this is a development environment
  bool get isDevelopment => this == Environment.development;
  
  /// Returns whether this is a staging environment
  bool get isStaging => this == Environment.staging;
}