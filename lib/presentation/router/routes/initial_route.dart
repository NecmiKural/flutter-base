import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:base_app/presentation/theme/colors.dart';

import '../redirectors/authentication_based_redirect.dart';
import 'base_route_class.dart';

/// The initial route.
/// here user will be redirected to the appropriate route based on their
/// authentication state.
final class InitialRoute extends BaseRouteClass {
  /// The initial route.
  factory InitialRoute() => _instance;

  InitialRoute._internal();

  static final InitialRoute _instance = InitialRoute._internal();

  @override
  String get name => 'root';

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => Scaffold(backgroundColor: AppColors.backgroundColor);

  @override
  FutureOr<String?> Function(BuildContext p1, GoRouterState p2)? get redirect =>
      AuthenticationBasedRedirector().redirect;

  @override
  String get path => '/';
}
