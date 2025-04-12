part of "../app_theme.dart";

final class _CheckboxTheme {
  _CheckboxTheme._();
  static final CheckboxThemeData checkboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accentSuccess[90]!;
        }
        return Colors.transparent;
      },
    ),
    shape: const CircleBorder(),
    side: BorderSide(
      color: AppColors.secondaryColor,
      width: 2.5,
    ),
  );
}
