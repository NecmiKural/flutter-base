import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:base_app/core/constants/app_constants.dart';
import 'package:base_app/core/logging/logger.dart';

/// A service class that handles authentication operations.
class AuthService {
  /// Singleton instance of [AuthService].
  factory AuthService() => _instance;
  AuthService._internal() {
    // Initialize the auth state controller
    _authStateController =
        StreamController<AuthorizationTokenResponse?>.broadcast();
  }
  static final AuthService _instance = AuthService._internal();
  static const FlutterAppAuth _appAuth = FlutterAppAuth();

  // Stream controller for auth state changes
  late final StreamController<AuthorizationTokenResponse?> _authStateController;

  /// Stream of authentication state changes
  Stream<AuthorizationTokenResponse?> authStateChanges() =>
      _authStateController.stream;

  Future<AuthorizationTokenResponse?> performAuth() async {
    try {
      // Create the authorization request
      final request = AuthorizationTokenRequest(
        allowInsecureConnections: allowInsecureConnections,
        clientId,
        redirectUrl,
        serviceConfiguration: AuthorizationServiceConfiguration(
          authorizationEndpoint: authEndpoint,
          tokenEndpoint: tokenEndpoint,
          endSessionEndpoint: endSessionEndpoint,
        ),
        scopes: scopes,
        // Add these parameters to help with debugging
        promptValues: ['login'],
        additionalParameters: {'kc_idp_hint': 'oidc'},
      );

      final response = await _appAuth.authorizeAndExchangeCode(request);

      // Emit the authentication state change
      _authStateController.add(response);
      return response;
    } on FlutterAppAuthUserCancelledException catch (e) {
      Log.info("User cancelled the authentication flow: ${e.toString()}");

      _authStateController.add(null);
      rethrow;
    } on FlutterAppAuthPlatformException catch (e) {
      final FlutterAppAuthPlatformErrorDetails details = e.details;
      Log.warning("Authentication error: ${e.toString()}");
      Log.warning("Error details: ${details.toString()}");

      _authStateController.add(null);
      rethrow;
    } catch (e) {
      // Improved error handling
      Log.warning("Authentication error: ${e.toString()}");

      if (e is PlatformException) {
        Log.warning("Error code: ${e.code}");
        Log.warning("Error message: ${e.message}");
        Log.warning("Error details: ${e.details}");

        // Check for specific error conditions
        if (e.code == 'authorize_and_exchange_code_failed') {
          if (e.details != null && e.details['user_did_cancel'] == false) {
            Log.warning(
              "Flow was cancelled programmatically, not by user. Check your Keycloak configuration.",
            );
          }
        }
      }

      _authStateController.add(null);
      rethrow;
    }
  }

  // /// Refreshes the authentication token using a refresh token
  // Future<AuthorizationTokenResponse?> refreshToken(String refreshToken) async {
  //   try {
  //     debugPrint("Refreshing token with Keycloak...");

  //     final request = TokenRequest(
  //       allowInsecureConnections: allowInsecureConnections,
  //       clientId,
  //       redirectUrl,
  //       refreshToken: refreshToken,
  //       serviceConfiguration: AuthorizationServiceConfiguration(
  //         authorizationEndpoint: authEndpoint,
  //         tokenEndpoint: tokenEndpoint,
  //         endSessionEndpoint: endSessionEndpoint,
  //       ),
  //       scopes: scopes,
  //       grantType: 'refresh_token',
  //     );

  //     final response = await _appAuth.token(request);

  //     debugPrint("Token refresh successful!");
  //     // Emit the authentication state change
  //     _authStateController.add(response);
  //     return response;
  //   } catch (e) {
  //     debugPrint("Token refresh error: ${e.toString()}");

  //     if (e is PlatformException) {
  //       debugPrint("Error code: ${e.code}");
  //       debugPrint("Error message: ${e.message}");
  //       debugPrint("Error details: ${e.details}");
  //     }

  //     // If refresh fails, we might need to re-authenticate
  //     _authStateController.add(null);
  //     rethrow;
  //   }
  // }

  // /// Logs the user out by ending the session with Keycloak
  // Future<void> logout(String idToken) async {
  //   try {
  //     debugPrint("Logging out from Keycloak...");

  //     await _appAuth.endSession(
  //       EndSessionRequest(
  //         allowInsecureConnections: allowInsecureConnections,
  //         idTokenHint: idToken,
  //         postLogoutRedirectUrl: redirectUrl,
  //         serviceConfiguration: AuthorizationServiceConfiguration(
  //           authorizationEndpoint: authEndpoint,
  //           tokenEndpoint: tokenEndpoint,
  //           endSessionEndpoint: endSessionEndpoint,
  //         ),
  //       ),
  //     );

  //     debugPrint("Logout successful!");
  //     _authStateController.add(null);
  //   } catch (e) {
  //     debugPrint("Logout error: ${e.toString()}");
  //     // Even if logout fails on the server, we clear the local state
  //     _authStateController.add(null);
  //     rethrow;
  //   }
  // }
}
