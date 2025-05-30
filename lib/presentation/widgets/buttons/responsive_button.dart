part of 'buttons_import.dart';

// ignore: public_member_api_docs
class ResponsiveElevatedButton extends StatefulWidget {
  /// A responsive elevated button that shows a loading indicator when pressed.
  ///
  /// The [ResponsiveElevatedButton] widget is a stateful widget that displays an
  /// elevated button with a loading indicator. It supports primary and secondary
  /// styles with different shadow effects.
  ///
  /// The button's loading state is managed internally and can be triggered by
  /// the [onPressed] callback.
  ///
  /// The [isPrimary] parameter determines whether the button uses the primary
  /// or secondary style. The [child] parameter is the content of the button,
  /// and the [onPressed] parameter is the callback function to be executed when
  /// the button is pressed.
  ///
  /// Example usage:
  /// ```dart
  /// ResponsiveElevatedButton(
  ///   onPressed: () async {
  ///     // Perform some asynchronous operation
  ///   },
  ///   child: Text('Press Me'),
  ///   isPrimary: true,
  /// )
  /// ```
  const ResponsiveElevatedButton({
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
  State<ResponsiveElevatedButton> createState() =>
      _ResponsiveElevatedButtonState();
}

class _ResponsiveElevatedButtonState extends State<ResponsiveElevatedButton>
    with _ButtonLoadingState {
  @override
  Widget build(BuildContext context) {
    assert(
      context.findAncestorWidgetOfExactType<Row>() != null,
      'You have to wrap this this widget with Row !',
    );
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const AppBorderRadius.small(),
          boxShadow:
              widget.onPressed == null
                  ? null
                  : widget.isPrimary
                  ? _primaryShadows
                  : _secondaryShadows,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                widget.isPrimary
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
          ),
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }

  static final List<BoxShadow> _primaryShadows = [
    const BoxShadow(
      color: Color(0x63696165),
      blurRadius: 1,
      offset: Offset(0, 1),
    ),
    const BoxShadow(
      color: Color(0x56696165),
      blurRadius: 2,
      offset: Offset(0, 2),
    ),
    const BoxShadow(
      color: Color(0x33696165),
      blurRadius: 3,
      offset: Offset(0, 5),
    ),
    const BoxShadow(
      color: Color(0x0F696165),
      blurRadius: 4,
      offset: Offset(0, 10),
    ),
    const BoxShadow(
      color: Color(0x02696165),
      blurRadius: 4,
      offset: Offset(0, 15),
    ),
  ];
  static final List<BoxShadow> _secondaryShadows = [
    const BoxShadow(
      color: Color(0x6302B3A6),
      blurRadius: 1,
      offset: Offset(0, 1),
    ),
    const BoxShadow(
      color: Color(0x5602B3A6),
      blurRadius: 2,
      offset: Offset(0, 2),
    ),
    const BoxShadow(
      color: Color(0x3302B3A6),
      blurRadius: 3,
      offset: Offset(0, 5),
    ),
    const BoxShadow(
      color: Color(0x0F02B3A6),
      blurRadius: 4,
      offset: Offset(0, 10),
    ),
    const BoxShadow(
      color: Color(0x0202B3A6),
      blurRadius: 4,
      offset: Offset(0, 15),
    ),
  ];
}
