// ignore_for_file: public_member_api_docs

import 'package:base_app/presentation/theme/colors.dart';
import 'package:base_app/presentation/theme/text_styles.dart';

import '../../core/extensions/context_extension.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
// ignore: must_be_immutable
class CustomTextField extends TextFormField {
  /// A custom text field widget.
  ///
  /// This widget provides a customizable text field with various properties
  /// to tailor its appearance and behavior.
  ///
  /// Example usage:
  /// ```dart
  /// CustomTextField(
  ///   // Add your parameters here
  /// )
  /// ```
  ///
  /// You can customize the following properties:
  /// - `controller`: The controller for the text field.
  /// - `focusNode`: The focus node for the text field.
  /// - `decoration`: The decoration to show around the text field.
  /// - `keyboardType`: The type of keyboard to use for editing the text.
  /// - `textInputAction`: The action button to use for the keyboard.
  /// - `style`: The style to use for the text being edited.
  /// - `textAlign`: How the text should be aligned horizontally.
  /// - `autofocus`: Whether this text field should focus itself if nothing else is already focused.
  /// - `obscureText`: Whether to hide the text being edited (e.g., for passwords).
  /// - `maxLines`: The maximum number of lines to show at one time.
  /// - `onChanged`: Called when the text being edited changes.
  /// - `onSubmitted`: Called when the user indicates that they are done editing the text in the field.
  CustomTextField({
    super.key,
    super.controller,
    super.validator,
    this.label,
    super.autofillHints,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.helperText,
    this.suffix,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.obscured = false,
    this.focusNode,
    this.prefixIcon,
    this.color,
    this.onFieldSubmitted,
    this.unfocusOnTapOutside = false,
    this.maxLength,
  });

  final Color? color;
  final FocusNode? focusNode;
  final String? label;
  bool obscured;
  Widget? prefixIcon;
  final TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  String? helperText;
  Widget? suffix;
  final bool unfocusOnTapOutside;
  final int? maxLength;
  void Function(String)? onFieldSubmitted;
  @override
  FormFieldBuilder<String> get builder => (state) {
    assert(
      ((unfocusOnTapOutside == false && focusNode != null) !=
          (unfocusOnTapOutside != (focusNode == null))),
      "If you want to use the unfocusOnTapOutside property, you must provide a focusNode",
    );
    return TextFormField(
      contextMenuBuilder: _CustomTextFieldUtils._contextMenuBuilder,
      cursorColor: AppColors.primaryColor,
      onTapOutside:
          (event) => unfocusOnTapOutside ? focusNode?.unfocus() : null,
      focusNode: focusNode,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyles().textTheme.bodyLarge,
      textCapitalization: textCapitalization,
      controller: controller,
      obscureText: obscured,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        errorText: state.errorText,
        helperText: helperText,
        labelText: label,
        suffix: suffix,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color ?? AppColors.neutralGray500[40]!),
        ),
        prefixIcon:
            prefixIcon == null
                ? null
                : ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    color ?? Colors.transparent,
                    BlendMode.srcATop,
                  ),
                  child: prefixIcon,
                ),
      ),
    );
  };
}

class CustomTextArea extends TextFormField {
  /// A custom text field widget.
  ///
  /// This widget provides a customizable text field with various properties
  /// to tailor its appearance and behavior.
  ///
  /// Example usage:
  /// ```dart
  /// CustomTextField(
  ///   // Add your parameters here
  /// )
  /// ```
  ///
  /// You can customize the following properties:
  /// - `controller`: The controller for the text field.
  /// - `focusNode`: The focus node for the text field.
  /// - `decoration`: The decoration to show around the text field.
  /// - `keyboardType`: The type of keyboard to use for editing the text.
  /// - `textInputAction`: The action button to use for the keyboard.
  /// - `style`: The style to use for the text being edited.
  /// - `textAlign`: How the text should be aligned horizontally.
  /// - `autofocus`: Whether this text field should focus itself if nothing else is already focused.
  /// - `obscureText`: Whether to hide the text being edited (e.g., for passwords).
  /// - `maxLines`: The maximum number of lines to show at one time.
  /// - `onChanged`: Called when the text being edited changes.
  /// - `onSubmitted`: Called when the user indicates that they are done editing the text in the field.
  CustomTextArea({
    super.key,
    super.controller,
    super.validator,
    this.label,
    super.autofillHints,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.helperText,
    this.suffix,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.obscured = false,
    this.focusNode,
    this.prefixIcon,
    this.color,
    this.constraints,
    this.hintText,
    this.unfocusOnTapOutside = false,
    this.maxLength,
  });
  final BoxConstraints? constraints;
  final Color? color;
  final FocusNode? focusNode;
  final String? label;
  final String? hintText;
  bool obscured;
  Widget? prefixIcon;
  final TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  String? helperText;
  Widget? suffix;
  final int? maxLength;
  final bool unfocusOnTapOutside;

  @override
  FormFieldBuilder<String> get builder => (state) {
    assert(
      ((unfocusOnTapOutside == false && focusNode != null) !=
          (unfocusOnTapOutside != (focusNode == null))),
      "If you want to use the unfocusOnTapOutside property, you must provide a focusNode",
    );
    return TextFormField(
      contextMenuBuilder: _CustomTextFieldUtils._contextMenuBuilder,
      // selectionControls: CustomTextSelectionControls(),
      cursorColor: AppColors.primaryColor,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onTapOutside: (event) => focusNode?.unfocus(),
      focusNode: focusNode,
      validator: validator,
      style: TextStyles().textTheme.bodyLarge,
      textCapitalization: textCapitalization,
      controller: controller,
      obscureText: obscured,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.bottom,
      maxLength: maxLength,
      // expands: true,
      maxLines: null,

      decoration: InputDecoration(
        errorText: state.errorText,
        helperText: helperText,
        labelText: label,
        hintStyle: TextStyles().textTheme.bodyMedium?.copyWith(
          color: AppColors.lightTextColors[10],
        ),
        suffix: suffix,
        constraints: constraints,
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color ?? AppColors.neutralGray500[40]!),
        ),
        prefixIcon:
            prefixIcon == null
                ? null
                : ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    color ?? Colors.transparent,
                    BlendMode.srcATop,
                  ),
                  child: prefixIcon,
                ),
      ),
    );
  };
}

final class _CustomTextFieldUtils {
  static Widget _contextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    final text = editableTextState.textEditingValue;
    return AdaptiveTextSelectionToolbar(
      anchors: editableTextState.contextMenuAnchors,
      children: <Widget>[
        // if there is a selection, show the options
        if (!text.selection.isCollapsed)
          // cut option
          TextButton.icon(
            onPressed: () {
              editableTextState
                ..cutSelection(SelectionChangedCause.tap)
                ..hideToolbar();
            },
            icon: Icon(Icons.cut_rounded, color: context.theme.primaryColor),
            label: Text("LocaleKeys.common_cut.tr()"),
          ),
        // copy option
        TextButton.icon(
          label: Text("LocaleKeys.common_copy.tr()"),
          onPressed: () {
            editableTextState
              ..copySelection(SelectionChangedCause.tap)
              ..hideToolbar();
          },
          icon: Icon(color: context.theme.primaryColor, Icons.copy_rounded),
        ),
        // paste option
        Visibility(
          visible: editableTextState.pasteEnabled,
          child: TextButton.icon(
            onPressed: () {
              editableTextState
                ..pasteText(SelectionChangedCause.tap)
                ..hideToolbar();
            },
            icon: Icon(color: context.theme.primaryColor, Icons.paste_rounded),
            label: Text("LocaleKeys.common_paste.tr()"),
          ),
        ),
        // select all option
        TextButton.icon(
          label: Text("LocaleKeys.common_selectAll.tr()"),
          onPressed: () {
            editableTextState.selectAll(SelectionChangedCause.tap);
          },
          icon: Icon(color: context.theme.primaryColor, Icons.select_all),
        ),
      ],
    );
  }
}
