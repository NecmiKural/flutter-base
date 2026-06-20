import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/services/localization_service.dart';
import 'package:base_app/features/auth/presentation/pages/login_page.dart';
import 'package:base_app/presentation/router/routes.dart';

/// Application router.
///
/// Declarative navigation powered by GoRouter. Add new [GoRoute]s to the
/// [routes] list as features are introduced.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const LoginPage(),
      ),
      // Add more routes here
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
});
