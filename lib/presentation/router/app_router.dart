import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/services/localization_service.dart';
import 'package:base_app/features/auth/presentation/pages/login_page_2.dart';
import 'package:base_app/features/auth_old/screens/login_screen.dart';
import 'package:base_app/presentation/router/routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const LoginPage(),
        // builder: (context, state) => const SignIn(),
        // builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      // Add more routes here
    ],
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
});

// import 'package:go_router/go_router.dart';

// import '../../features/auth/data/services/auth_service.dart';
// import 'auth_change_notifier.dart';
// import 'redirectors/authentication_based_redirect.dart';
// import 'routes/initial_route.dart';

// /// The AppRouter class is responsible for managing the application's routing.
// /// It listens to authentication state changes and updates the
// /// routes accordingly.
// final class AppRouter {
//   /// When the AppRouter is instantiated, it starts listening to authentication
//   ///  state changes.
//   AppRouter() {
//     AuthService().authStateChanges.listen((user) {
//       _authChangeNotifier.notify();
//     });
//   }

//   /// Getter for the GoRouter instance.
//   GoRouter get router => _router;

//   /// An instance of AuthChangeNotifier to listen for authentication changes.
//   static final AuthChangeNotifier _authChangeNotifier = AuthChangeNotifier();

//   /// The GoRouter instance that defines the application's routes and their
//   /// configurations.
//   static final GoRouter _router = GoRouter(
//     refreshListenable: _authChangeNotifier,
//     redirect: AuthenticationBasedRedirector().redirect,
//     initialLocation: InitialRoute().route.path,
//     routes: [
//       // //* Home Page
//       InitialRoute().route,

//       ///
//       /// .
//       /// .
//       /// .
//       /// Add more routes here
//     ],
//   );
// }
