part of "../app_theme.dart";

final class _InputDecorationTheme {
  _InputDecorationTheme._();
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    labelStyle: TextStyles().textTheme.bodyLarge?.copyWith(
          color: AppColors.lightTextColors[10],
        ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.accentError[40]!,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.accentError[40]!,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.neutralGray500[50]!,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondaryColor,
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(
      vertical: SpacingSizes.extraSmall,
      horizontal: SpacingSizes.extraSmall,
    ),
  );
}
