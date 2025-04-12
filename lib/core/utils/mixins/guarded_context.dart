import 'package:flutter/material.dart';

/// A mixin that provides a method to guard the context from being accessed when
/// the widget is not mounted.
mixin GuardedContextMixin<T extends StatefulWidget> on State<T> {
  /// A method that guards the context from being accessed when the widget is not mounted.
  void guard(VoidCallback callback) {
    if (mounted) {
      callback();
    }
  }
}

class GuardedContext {
  /// A method that guards the context from being accessed when the widget is not mounted.
  static void guard(BuildContext context, VoidCallback callback) {
    if (context.mounted) {
      callback();
    }
  }
}
