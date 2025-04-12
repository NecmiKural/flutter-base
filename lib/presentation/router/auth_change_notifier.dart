import 'package:flutter/material.dart';

/// A ChangeNotifier that handles authentication state changes and notifies
///  listeners.
///
/// This class provides a method to check the authentication status of the user
/// and determine the appropriate route based on the user's authentication
/// state.
class AuthChangeNotifier extends ChangeNotifier {
  /// Notifies listeners about changes in the authentication state.
  ///
  /// This method triggers the router to rebuild.
  void notify() {
    notifyListeners(); // This triggers the router to rebuild
  }
}
