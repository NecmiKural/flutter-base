part of "../app_theme.dart";

final class _DatePickerTheme {
  _DatePickerTheme._();
  static final DatePickerThemeData datePickerTheme = DatePickerThemeData(
    backgroundColor: AppColors.backgroundColor[80],
    cancelButtonStyle: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(
        AppColors.accentError[50],
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(
        AppColors.primaryColor[50],
      ),
    ),
    dayBackgroundColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondaryColor[90];
        }
        return null;
      },
    ),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.secondaryColor[10];
      } else if (states.contains(WidgetState.disabled)) {
        return AppColors.lightTextColors[50];
      }
      return null;
    }),
    todayBorder: BorderSide(
      color: AppColors.primaryColor[50] ?? Colors.transparent,
      width: 2,
    ),
    todayForegroundColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor[50];
        } else {
          return AppColors.primaryColor[40];
        }
      },
    ),
    yearBackgroundColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondaryColor[50] ?? Colors.transparent;
        }
        return Colors.transparent;
      },
    ),
    todayBackgroundColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondaryColor[90];
        }
        return null;
      },
    ),
  );
}
