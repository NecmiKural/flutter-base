part of "../app_theme.dart";

final class _OutlinedButtonTheme {
  _OutlinedButtonTheme._();
  static final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      // Colors
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.secondaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSizes.medium,
        vertical: SpacingSizes.small,
      ),
      maximumSize: const Size.fromHeight(52),
      side: BorderSide(color: AppColors.secondaryColor),
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.small(),
      ),
    ),
  );
}
