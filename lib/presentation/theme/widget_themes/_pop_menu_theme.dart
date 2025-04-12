part of "../app_theme.dart";

final class _PopMenuTheme {
  _PopMenuTheme._();
  static final PopupMenuThemeData popMenuTheme = PopupMenuThemeData(
    color: AppColors.backgroundColor[50],
    shape: const RoundedRectangleBorder(
      borderRadius: AppBorderRadius.small(),
    ),
    position: PopupMenuPosition.under,
  );
}
