import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:base_app/presentation/router/redirectors/base_route_redirector.dart';

/// Checks if the user is authenticated and determines the appropriate route.
///
/// This function checks if the user is authenticated or not. If the user is
/// trying to reach the home page but is not authenticated, they will be
// ignore: comment_references
/// redirected to the [SignIn] page.
///
/// - Parameters:
///   - context: The BuildContext of the widget.
///   - state: The current state of the GoRouter.
///
/// - Returns: A FutureOr<String?> that represents the path to redirect to,
///  or null if no redirection is needed.
class AuthenticationBasedRedirector implements BaseRouteRedirector {
  /// The factory constructor for the [AuthenticationBasedRedirector] class.
  ///
  /// This constructor returns a singleton instance of the
  /// [AuthenticationBasedRedirector] class.
  ///
  ///
  factory AuthenticationBasedRedirector() => _instance;

  /// The internal constructor for the [AuthenticationBasedRedirector] class.
  /// This constructor is called only once to create a singleton instance of the
  /// [AuthenticationBasedRedirector] class.
  AuthenticationBasedRedirector._internal();

  /// The singleton instance of the [AuthenticationBasedRedirector] class.
  static final AuthenticationBasedRedirector _instance =
      AuthenticationBasedRedirector._internal();

  /// Checks if the user is authenticated and determines the appropriate route.
  ///
  /// This function checks if the user is authenticated or not. If the user is
  /// trying to reach the home page but is not authenticated, they will be
  // ignore: comment_references
  /// redirected to the [SignIn] page.
  ///
  /// - Parameters:
  ///   - context: The BuildContext of the widget.
  ///   - state: The current state of the GoRouter.
  ///
  /// - Returns: A FutureOr<String?> that represents the path to redirect to,
  ///  or null if no redirection is needed.
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    // final isLoggedIn = AuthService().currentUser != null;
    // final currentLocation = state.fullPath;
    // if (!isLoggedIn) {
    //   return SignInRoute().route.path;
    // }

    ///TODO : Add your page here which you want to redirect after login
    /// Example : return state.namedLocation(MembersRoute().route.name ?? "");
    // if (isLoggedIn) {
    //   if (currentLocation == InitialRoute().route.path ||
    //       currentLocation == SignInRoute().route.path) {
    //     return state.namedLocation(HomeRoute().route.name ?? "");
    //   }
    /// !!! IMPORTANT !!!
    //   if (currentLocation == SignInRoute().route.path) {
    //     return null;
    //   }
    // }
    return null;
  }
}
