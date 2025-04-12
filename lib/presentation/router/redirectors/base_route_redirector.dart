// ChangeNotifier to refresh the router
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This is a base class for route redirectors.
/// Route redirectors are used to redirect users to a different route based on
/// certain conditions.
// ignore: one_member_abstracts
abstract class BaseRouteRedirector {
  /// Constructor for the BaseRouteRedirector class.
  const BaseRouteRedirector();

  /// This method is called when the router needs to redirect the user to a
  /// different route.
  FutureOr<String?> redirect(BuildContext context, GoRouterState state);
}
