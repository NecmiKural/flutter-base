import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A base class for all routes in the application.
/// This class defines the basic structure of a route.
/// All routes in the application should extend this class.
/// This class is used to create a GoRoute instance for each route.
abstract class BaseRouteClass {
  /// A base class for all routes in the application.
  /// This class defines the basic structure of a route.
  /// All routes in the application should extend this class.
  /// This class is used to create a GoRoute instance for each route.
  const BaseRouteClass();

  /// The path of the route.
  /// This is the path that the user will navigate to in order to reach the route.
  ///
  ///
  String get path;

  /// The name of the route.
  /// This is the name of the route that will be displayed in the GoRouterState.
  /// This is also the name that will be used to identify the route in the application.
  ///
  /// ? I recommend using the name instead of the path to navigate to the route.
  String get name;

  /// The page builder for the route.
  /// This is the function that will be called to build the page for the route.
  /// This function takes a [BuildContext] and a [GoRouterState] as
  /// parameters and returns a Widget.
  ///
  ///
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder;

  /// The list of child routes for the route.
  /// This is the list of routes that will be nested under the current route.
  /// Initially this list is empty, but it can be overridden in the
  /// child class to add child routes.
  List<GoRoute> get routes => [];

  /// The redirect function for the route.
  /// This is the function that will be called to determine if the user should
  /// be redirected to another route.
  FutureOr<String?> Function(BuildContext, GoRouterState)? get redirect => null;

  ///
  /// This is the GoRoute instance that will be created for the route.
  GoRoute get route => GoRoute(
        path: path,
        name: name,
        pageBuilder: (context, state) =>
            MaterialPage(child: pageBuilder(context, state)),
        routes: routes,
        redirect: redirect,
      );
}
