import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/src/generated/i10n/app_localizations.dart';

/// A global navigator key that can be used to access the current context
/// throughout the application.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Provider for the localization service
final localizationServiceProvider = Provider<LocalizationService>((ref) {
  return LocalizationService();
});

/// A service that provides access to localized strings without requiring context
/// in every place of the application.
///
/// This service uses the global navigator key to access the current context
/// and retrieve localized strings.
class LocalizationService {
  /// Returns the current [AppLocalizations] instance.
  ///
  /// This method uses the global navigator key to access the current context
  /// and retrieve the [AppLocalizations] instance.
  ///
  /// If the context is not available, it returns null.
  AppLocalizations? get localizations {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return AppLocalizations.of(context);
    }
    return null;
  }

  /// Returns a localized string for the given key.
  ///
  /// If the localization is not available, it returns the fallback value.
  String getString(
    String Function(AppLocalizations) stringSelector, {
    String fallback = 'Error',
  }) {
    final appLocalizations = localizations;
    if (appLocalizations != null) {
      return stringSelector(appLocalizations);
    }
    return fallback;
  }

  /// Returns the error message from localizations.
  ///
  /// If the localization is not available, it returns a default error message.
  String get errorMessage =>
      getString((l) => l.error, fallback: 'An error occurred');

  // Add more convenience getters for commonly used strings here
}
