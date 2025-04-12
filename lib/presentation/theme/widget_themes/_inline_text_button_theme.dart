part of "../app_theme.dart";

final class _InlineTextButtonTheme {
  _InlineTextButtonTheme._();
  static final InlineTextButtonTheme inlineTextButtonTheme =
      InlineTextButtonTheme(
    style: TextStyles()
        .textTheme
        .labelLarge
        ?.copyWith(color: AppColors.secondaryColor[50]),
  );
}
