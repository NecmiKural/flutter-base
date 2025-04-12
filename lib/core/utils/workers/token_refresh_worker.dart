import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ntp/ntp.dart';
import 'package:base_app/core/constants/app_constants.dart';
import 'package:base_app/core/logging/app_logger.dart';
import 'package:base_app/core/services/toast_service.dart';
import 'package:base_app/core/storage/hive_service.dart';

/// Provider for the TokenRefreshNotifier
final tokenRefreshProvider = StateNotifierProvider<TokenRefreshNotifier, bool>(
  (ref) => TokenRefreshNotifier(
    ref.watch(hiveServiceProvider),
    ref.watch(toastServiceProvider),
  ),
);

/// A notifier that handles token refresh operations
class TokenRefreshNotifier extends StateNotifier<bool> {
  final HiveService _hiveService;
  final ToastService _toastService;
  final _logger = AppLogger('TokenRefreshNotifier');
  Timer? _debounceTimer;
  static const FlutterAppAuth _appAuth = FlutterAppAuth();

  /// Creates a new instance of [TokenRefreshNotifier]
  TokenRefreshNotifier(this._hiveService, this._toastService) : super(false);

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  /// Refreshes the authentication token with debouncing
  Future<bool> debouncedTokenRefresher() async {
    if (state) {
      return true; // Return true if already refreshing
    }

    // Cancel any existing timer
    _debounceTimer?.cancel();

    try {
      state = true; // Set refreshing state to true

      final DateTime now = await NTP.now();

      final String? storedRefreshToken = await _hiveService.getRefreshToken();
      final String? expirationDateString =
          await _hiveService.getTokenExpirationTime();
      final DateTime expirationDate =
          expirationDateString != null
              ? DateTime.parse(expirationDateString)
              : now.subtract(const Duration(days: 1));

      if (storedRefreshToken != null && expirationDate.isAfter(now)) {
        try {
          final TokenResponse response = await _appAuth.token(
            TokenRequest(
              clientId,
              redirectUrl,
              allowInsecureConnections: allowInsecureConnections,
              issuer: issuer,
              discoveryUrl: discoveryUrl,
              refreshToken: storedRefreshToken,
            ),
          );

          final tokenExpirationDate = response.accessTokenExpirationDateTime;
          if (_isValidAuthResult(response) &&
              tokenExpirationDate!.isAfter(now)) {
            await _hiveService.saveRefreshToken(response.refreshToken!);
            await _hiveService.saveAuthToken(response.accessToken!);
            await _hiveService.saveIdToken(response.idToken!);
            await _hiveService.saveTokenExpirationTime(
              tokenExpirationDate.toString(),
            );

            return true;
          } else {
            await _logout();
            return false;
          }
        } catch (e, s) {
          _logger.error(
            'Token expiration checked and unexpected error caught: $e',
            e,
            s,
          );
          return false;
        }
      } else {
        await _logout();
        return false;
      }
    } finally {
      // Set a timer to reset the refreshing state after a delay
      _debounceTimer = Timer(const Duration(milliseconds: 500), () {
        state = false; // Set refreshing state to false
      });
    }
  }

  /// Shows an expired login notification
  void showExpiredLoginNotification(BuildContext context) {
    _toastService.showWarning(
      context,
      title: 'Session Expired',
      description: 'Your login session has expired. Please log in again.',
      duration: const Duration(seconds: 3),
    );
  }

  bool _isValidAuthResult(TokenResponse result) {
    return result.refreshToken != null &&
        result.accessToken != null &&
        result.idToken != null &&
        result.accessTokenExpirationDateTime != null;
  }

  /// Logs the user out
  Future<void> _logout() async {
    await _hiveService.clearAuthTokens();
    // TODO: Additional logout logic can be added here, redirect login page
  }
}
