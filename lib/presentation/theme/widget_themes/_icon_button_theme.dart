part of '../app_theme.dart';

final class _IconButtonTheme {
  _IconButtonTheme._();
  static final IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.neutralGray500[30] ?? Colors.transparent;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryColor[70] ?? Colors.transparent;
          }
          return AppColors.backgroundColor[40] ?? Colors.transparent;
        },
      ),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: AppBorderRadius.medium(),
        ),
      ),
      foregroundColor: WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.neutralGray500[30] ?? Colors.transparent;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryColor[50] ?? Colors.transparent;
          }
          return AppColors.backgroundColor[10] ?? Colors.transparent;
        },
      ),
    ),
  );
}
