import 'package:base_app/presentation/theme/theme_extensions/custom_bottom_sheet_them.dart';

import '../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'custom_bottom_sheet_utils.dart';

///
class CustomBottomSheet extends StatefulWidget {
  /// A custom bottom sheet widget that can be used to display a modal bottom sheet
  /// with customizable title, content, background color, and height factor.
  ///
  /// The [CustomBottomSheet] widget is a [StatefulWidget] that allows you to
  /// create a bottom sheet with the following properties:
  ///
  /// * [title]: An optional title for the bottom sheet.
  /// * [content]: The main content of the bottom sheet, which is a [Widget].
  /// * [backgroundColor]: An optional background color for the bottom sheet.
  /// * [heightFactor]: A factor that determines the height of the bottom sheet
  ///   relative to the screen height. The default value is 0.5.
  ///
  /// Example usage:
  /// ```dart
  /// CustomBottomSheet(
  ///   title: 'My Bottom Sheet',
  ///   content: Text('This is the content of the bottom sheet.'),
  ///   backgroundColor: Colors.white,
  ///   heightFactor: 0.7,
  /// );
  /// ```
  const CustomBottomSheet({
    super.key,
    this.title,
    this.content,
    this.backgroundColor,
    this.heightFactor = .5,
  });

  ///  [title]: An optional title for the bottom sheet.
  final String? title;

  ///  [content]: The main content of the bottom sheet, which is a [Widget].
  final Widget? content;

  /// [backgroundColor]: An optional background color for the bottom sheet.
  final Color? backgroundColor;

  /// [heightFactor]: A factor that determines the height of the bottom sheet
  ///   relative to the screen height. The default value is 0.5.
  final double heightFactor;

  ///This method is used to show the bottom sheet
  ///
  ///[context] used for [showModalBottomSheet]
  ///
  ///[widget] is the widget that will be shown in the bottom sheet
  static bool isVisible = false;

  /// Displays a custom bottom sheet if it is not already visible.
  ///
  /// This method shows a modal bottom sheet with the provided widget content.
  /// The bottom sheet is scrollable and will only be displayed if it is not
  /// currently visible.
  ///
  /// ```dart
  /// CustomBottomSheet.show(
  ///   context,
  ///   widget: YourWidget(),
  /// );
  /// ```
  ///
  /// - Parameters:
  ///   - context: The BuildContext in which to show the bottom sheet.
  ///   - widget: The widget to display inside the bottom sheet.
  ///
  /// - Returns: A Future that completes when the bottom sheet is dismissed.
  static Future<void> show(
    BuildContext context, {
    required Widget widget,
  }) async {
    if (!isVisible) {
      isVisible = true;
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (context) => widget,
      );
    }
  }

  /// Hides the custom bottom sheet if it is currently visible.
  ///
  /// This method checks if the bottom sheet is visible, sets the visibility
  /// flag to false, and then pops the current context to hide the bottom sheet.
  ///
  /// - Parameter context: The BuildContext to use for popping the bottom sheet.
  static void hide(BuildContext context) {
    if (isVisible) {
      isVisible = false;
      if (context.mounted) {
        context.pop();
      }
    }
  }

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin, _CustomBottomSheetUtils {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      dragHandleColor: customBottomSheetTheme?.handleColor,
      backgroundColor:
          widget.backgroundColor ?? customBottomSheetTheme?.backgroundColor,
      onClosing: () => context.pop(),
      shadowColor: customBottomSheetTheme?.shadowColor,
      elevation: 5,
      showDragHandle: true,
      animationController: animationController,
      builder: (context) {
        return LayoutBuilder(
          builder:
              (context, constraints) => SizedBox(
                height: isKeyboardVisible ? keyboardSize * 1.5 : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //MARK: Title
                    Visibility(
                      visible: widget.title != null,
                      child: Text(
                        widget.title ?? '',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    // MARK: - Content
                    Flexible(
                      child: Visibility(
                        visible: widget.content != null,
                        child: widget.content!,
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }

  @override
  void initState() {
    initializeAnimationController(this);
    super.initState();
  }
}
