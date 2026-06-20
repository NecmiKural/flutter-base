part of "../app_theme.dart";

final class _AppBarTheme {
  static final AppBarTheme appBarTheme = AppBarTheme(
    actionsIconTheme: IconThemeData(color: AppColors.secondaryColor[50]),
    backgroundColor: AppColors.backgroundColor[50],
    // foregroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor.withValues(alpha: 0.1),
      systemNavigationBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
