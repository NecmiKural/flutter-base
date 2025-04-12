import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A widget that displays a loading indicator.
///
/// Example Usage:
///
/// ```dart
/// LoadingIndicator.show(
///  context: context,
/// future: Future.delayed(const Duration(seconds: 2), () => 'Hello World'),
/// );
class LoadingIndicator extends StatefulWidget {
  /// Creates a new loading indicator widget.
  const LoadingIndicator({super.key});

  /// The [show] method displays a modal dialog with the loading indicator.
  /// The dialog is not dismissible by tapping outside of it and has a semi-transparent
  /// black background.
  static Future<T> show<T>({
    required BuildContext context,
    required Future<T> future,
  }) async {
    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withValues(
          alpha: 0.3,
        ),
        builder: (context) => const LoadingIndicator(),
      ),
    );
    final result = await future;
    if (context.mounted) {
      context.pop();
    }
    return result;
  }

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
