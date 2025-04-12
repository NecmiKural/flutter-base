import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:base_app/presentation/theme/border_radiuses.dart';
import 'package:base_app/presentation/theme/colors.dart';
import 'package:base_app/presentation/theme/spacing_sized.dart';
import 'package:base_app/presentation/theme/text_styles.dart';
import 'package:base_app/presentation/theme/theme_extensions/custom_bottom_sheet_them.dart';
import 'package:base_app/presentation/theme/theme_extensions/inline_text_button_theme.dart';
// import 'package:base_app/presentation/theme/text_styles.dart';
part 'widget_themes/_date_picker_theme.dart';
part 'widget_themes/_pop_menu_theme.dart';
part 'widget_themes/_floating_action_button_theme.dart';
part 'widget_themes/_progress_indicator_theme.dart';
part 'widget_themes/_check_box_theme.dart';
part 'widget_themes/_input_decoration_theme.dart';
part 'widget_themes/_app_bar_theme.dart';
part 'widget_themes/_outlined_button_theme.dart';
part 'widget_themes/_elevated_button_theme.dart';
part 'widget_themes/_inline_text_button_theme.dart';
part 'widget_themes/_custom_bottom_sheet_theme.dart';
part 'widget_themes/_tooltip_theme.dart';
part 'widget_themes/_icon_button_theme.dart';
part 'widget_themes/_text_selection_theme.dart';
part 'widget_themes/_menu_button_theme.dart';
part 'widget_themes/_expansion_tile_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor[50],
      primaryColor: AppColors.primaryColor[50],
      // textTheme: TextStyles().textTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),

      /// Widget Themes
      appBarTheme: _AppBarTheme.appBarTheme,
      elevatedButtonTheme: _ElevatedButtonTheme.elevatedButtonTheme,
      menuButtonTheme: _MenuButtonTheme.menuButtonTheme,
      textSelectionTheme: _TextSelectionTheme.textSelectionTheme,
      popupMenuTheme: _PopMenuTheme.popMenuTheme,
      outlinedButtonTheme: _OutlinedButtonTheme.outlinedButtonTheme,
      // textButtonTheme: _TextButtonTheme.textButtonTheme,
      inputDecorationTheme: _InputDecorationTheme.inputDecorationTheme,
      extensions: _extensions,
      expansionTileTheme: _ExpansionTileTheme.expansionTileTheme,
      checkboxTheme: _CheckboxTheme.checkboxTheme,
      progressIndicatorTheme: _ProgressIndicatorTheme.progressIndicatorTheme,
      floatingActionButtonTheme:
          _FloatingActionButtonTheme.floatingActionButtonTheme,
      datePickerTheme: _DatePickerTheme.datePickerTheme,
      tooltipTheme: _TooltipTheme.tooltipTheme,
      // chipTheme: _ChipTheme.chipTheme,
      dataTableTheme: const DataTableThemeData(
        headingRowAlignment: MainAxisAlignment.start,
      ),
      iconButtonTheme: _IconButtonTheme.iconButtonTheme,
      // Add more theme customizations
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      // Add more dark theme customizations
    );
  }

  // MARK: Theme Extensions
  static final Iterable<ThemeExtension<dynamic>> _extensions = [
    _InlineTextButtonTheme.inlineTextButtonTheme,
    _CustomBottomSheetTheme.customBottomSheetTheme,
  ];
}
