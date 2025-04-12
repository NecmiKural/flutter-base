import 'package:flutter/material.dart';

/// A mixin that provides loading state management for a [StatefulWidget].
///
/// This mixin adds a boolean [isLoading] property to the state and a method
/// [changeLoading] to toggle the loading state. The [changeLoading] method
/// can optionally force a UI update by calling `setState`.
///
/// Example usage:
///
/// ```dart
/// class MyWidget extends StatefulWidget {
///   @override
///   _MyWidgetState createState() => _MyWidgetState();
/// }
///
/// class _MyWidgetState extends State<MyWidget> with LoadingState<MyWidget> {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Center(
///         child: isLoading ? CircularProgressIndicator() : Text('Content'),
///       ),
///       floatingActionButton: FloatingActionButton(
///         onPressed: () {
///           changeLoading();
///         },
///         child: Icon(Icons.refresh),
///       ),
///     );
///   }
/// }
/// ```
///
/// Properties:
/// - [isLoading]: A boolean that indicates whether the loading state is active.
///
/// Methods:
/// - [changeLoading]: Toggles the loading state and optionally forces a UI update.

mixin LoadingState<T extends StatefulWidget> on State<T> {
  /// A boolean that indicates whether the loading state is active.
  bool isLoading = false;

  /// Toggles the loading state and optionally forces a UI update.
  void changeLoading({bool forceUI = true}) {
    if (!mounted) return;
    isLoading = !isLoading;
    if (!forceUI) return;
    setState(() {});
  }
}
