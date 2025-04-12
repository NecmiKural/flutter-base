import 'package:flutter/material.dart';
import 'package:base_app/core/extensions/context_extension.dart';
import 'package:base_app/presentation/theme/border_radiuses.dart';
import 'package:base_app/presentation/theme/colors.dart';

/// A custom dropdown button widget that allows the user to select an item from a list of items.
class CustomDropDownButton<T> extends StatefulWidget {
  /// Constructor for the custom dropdown button widget.
  const CustomDropDownButton({
    required this.items,
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  /// A list of items to be displayed in the dropdown.
  final List<T> items;

  /// The initial value from the dropdown.
  final T? initialValue;

  /// A callback function that is called when the dropdown value is changed.
  final void Function(dynamic) onChanged;

  @override
  State<CustomDropDownButton<T>> createState() =>
      _CustomDropDownButtonState<T>();
}

class _CustomDropDownButtonState<T> extends State<CustomDropDownButton<T>> {
  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  FocusNode focusNode = FocusNode();
  T? selected;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      focusNode: focusNode,
      borderRadius: const AppBorderRadius.medium(),
      dropdownColor: AppColors.backgroundColor[80],
      selectedItemBuilder:
          (context) =>
              widget.items
                  .map(
                    (value) => Center(
                      child: Text(
                        value.toString(),
                        style: context.textTheme.labelLarge?.copyWith(
                          color: AppColors.secondaryColor[40],
                        ),
                      ),
                    ),
                  )
                  .toList(),
      onChanged: (T? value) {
        selected = value;
        widget.onChanged(value);
        focusNode.unfocus();
        setState(() {});
      },
      value: selected,
      items:
          widget.items
              .map<DropdownMenuItem<T>>(
                (dynamic value) => DropdownMenuItem<T>(
                  value: value as T,
                  child: Text(value.toString()),
                ),
              )
              .toList(),
    );
  }
}
