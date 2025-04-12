import 'package:base_app/core/services/localization_service.dart';
import 'package:base_app/src/generated/i10n/app_localizations.dart';

/// A utility class that provides easy access to localized strings without requiring context.
///
/// This class uses the [LocalizationService] to access localized strings and provides
/// a more convenient way to use them throughout the application.
///
/// Example usage:
/// ```dart
/// // Instead of
/// AppLocalizations.of(context).error
///
/// // Use
/// I18n.error
/// ```
/// can use easy_localization also
class I18n {
  I18n._();

  /// The localization service instance used to access localized strings.
  static final _localizationService = LocalizationService();

  /// Returns the error message from localizations.
  static String get error => _localizationService.errorMessage;

  /// A generic method to get any localized string using a selector function.
  ///
  /// Example usage:
  /// ```dart
  /// L10n.get((l) => l.someString, fallback: 'Default value')
  /// ```
  static String get(
    String Function(dynamic) selector, {
    String fallback = 'Error',
  }) {
    return _localizationService.getString(selector, fallback: fallback);
  }

  // l10n, simple take ur value directly from here
  /// instead of: AppLocalizations.of(context).something
  /// can be used like: I18n.localizations!.something
  static AppLocalizations? get localizations =>
      _localizationService.localizations;

  // Add more convenience getters for commonly used strings here
  // For example:
  // static String get welcome => _localizationService.getString((l) => l.welcome, fallback: 'Welcome');
}
