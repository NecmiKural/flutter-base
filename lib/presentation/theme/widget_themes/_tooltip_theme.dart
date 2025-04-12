part of '../app_theme.dart';

final class _TooltipTheme {
  _TooltipTheme._();
  static final TooltipThemeData tooltipTheme = TooltipThemeData(
    textStyle: TextStyles().textTheme.bodySmall,
    decoration: BoxDecoration(
      color: AppColors.backgroundColor[40],
      borderRadius: const AppBorderRadius.small(),
      boxShadow: [
        BoxShadow(
          color: AppColors.backgroundColor[40] ?? Colors.black,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
  );
}
