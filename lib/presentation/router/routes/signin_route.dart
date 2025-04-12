import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:base_app/features/auth_old/screens/login_screen.dart';

import '../redirectors/authentication_based_redirect.dart';
import 'base_route_class.dart';

/// The sign-in route.
/// This route is used to navigate to the sign-in screen.
/// It is a child route of the initial route.
/// If the user is authenticated, they will be redirected to the appropriate route.
/// If the user is not authenticated, they will be redirected to the sign-in page.
final class SignInRoute extends BaseRouteClass {
  /// The sign-in route.
  factory SignInRoute() => _instance;

  SignInRoute._internal();

  static final SignInRoute _instance = SignInRoute._internal();

  @override
  FutureOr<String?> Function(BuildContext p1, GoRouterState p2)? get redirect =>
      AuthenticationBasedRedirector().redirect;

  @override
  String get name => "signIn";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const LoginScreen();

  @override
  String get path => "/sign-in";
}
