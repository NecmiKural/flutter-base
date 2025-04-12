import 'package:flutter/material.dart';

class ExpandedTextButton extends StatelessWidget {
  const ExpandedTextButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.isPrimary = true,
  });

  /// The [isPrimary] parameter determines whether the button uses the primary
  /// or secondary style. The [child] parameter is the content of the button,
  final bool isPrimary;
  // The [child] parameter is the content of the button,
  /// and the [onPressed] parameter is the callback function to be executed when
  /// the button is pressed.
  final Widget child;

  ///the [onPressed] parameter is the callback function to be executed when
  /// the button is pressed.
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    assert(
      context.findAncestorWidgetOfExactType<Row>() != null,
      'You have to wrap this this widget with Row !',
    );
    return Expanded(child: TextButton(onPressed: onPressed, child: child));
  }
}
