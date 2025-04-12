part of "../app_theme.dart";

final class _ElevatedButtonTheme {
  _ElevatedButtonTheme._();
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.lightTextColors[90],
      backgroundColor: AppColors.primaryColor,
      disabledBackgroundColor: AppColors.neutralGray500,
      textStyle: TextStyles().textTheme.labelLarge,
      backgroundBuilder: (context, states, child) {
        if (states.contains(WidgetState.hovered)) {
          return ColoredBox(
            color: AppColors.primaryColor[60] ?? Colors.transparent,
            child: child,
          );
        }

        return child ?? const SizedBox();
      },
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSizes.medium,
        vertical: SpacingSizes.small,
      ),
      maximumSize: const Size.fromHeight(52),
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.small(),
      ),
    ),
  );
}
