import 'package:base_app/presentation/theme/colors.dart';

import '../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

/// A wrapper widget that wraps a child widget with a [FormField].
/// It is used to display a validation error message below the child widget.
class ValidationWrapper<T> extends StatelessWidget {
  /// Creates a [ValidationWrapper] widget.
  const ValidationWrapper({
    required this.child,
    required this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    super.key,
  });

  /// The mode of auto-validation to use when the form field changes.
  final AutovalidateMode autovalidateMode;

  /// The child widget to wrap with a [FormField].
  final Widget child;

  /// The function that validates the form field.
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    /// Get the cross axis alignment of the parent widget.
    final parentWidgetCrossAxisAlignment =
        context.findAncestorWidgetOfExactType<Column>()?.crossAxisAlignment;
    return FormField<T>(
      autovalidateMode: autovalidateMode,
      validator: validator,
      builder:
          (field) => Column(
            crossAxisAlignment:
                parentWidgetCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: [
              child,
              if (field.errorText == null)
                const SizedBox()
              else
                Text(
                  field.errorText ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.accentError[60],
                  ),
                ),
            ],
          ),
    );
  }
}
