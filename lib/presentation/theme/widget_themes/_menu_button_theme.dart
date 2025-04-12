part of '../app_theme.dart';

final class _MenuButtonTheme {
  _MenuButtonTheme._();
  static final MenuButtonThemeData menuButtonTheme = MenuButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColors.secondaryColor[50]),
      splashFactory: InkSplash.splashFactory,
      overlayColor: WidgetStatePropertyAll(AppColors.secondaryColor[90]),
    ),
  );
}
