import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF2196F3);
  // Primary Color Shades
  static MaterialColor primaryColor =
      const MaterialColor(0xFF2D6A4F, <int, Color>{
        10: Color(0xFF0F2C21),
        20: Color(0xFF14382A),
        30: Color(0xFF1A4534),
        40: Color(0xFF245741),
        50: Color(0xFF2D6A4F),
        60: Color(0xFF5E9674),
        70: Color(0xFF6DA483),
        80: Color(0xFF80AF93),
        90: Color(0xFF92BBA2),
      });
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1976D2);

  // Secondary colors
  static const Color secondary = Color(0xFFFF9800);
  // Secondary Color Shades
  static MaterialColor secondaryColor =
      const MaterialColor(0xFF528265, <int, Color>{
        10: Color(0xFF0C2511),
        20: Color(0xFF173628),
        30: Color(0xFF204B38),
        40: Color(0xFF296048),
        50: Color(0xFF528265),
        60: Color(0xFF398462),
        70: Color(0xFF439D75),
        80: Color(0xFF50B487),
        90: Color(0xFF69BF98),
      });
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFF57C00);

  // Accent colors
  static const Color accent = Color(0xFF4CAF50);
  static const Color accentLight = Color(0xFF81C784);
  static const Color accentDark = Color(0xFF388E3C);

  /// Neutral colors
  static const Color background = Color(0xFFF5F5F5);
  // Background Color Shades
  static MaterialColor backgroundColor =
      const MaterialColor(0xFFF6FCF7, <int, Color>{
        10: Color(0xFF61CA73),
        20: Color(0xFF87D794),
        30: Color(0xFFACE3B6),
        40: Color(0xFFD2F0D7),
        50: Color(0xFFF6FCF7),
        60: Color(0xFFEAF5EB),
        70: Color(0xFFF7FCF8),
        80: Color(0xFFFAFDFB),
        90: Color(0xFFFFFFFF),
      });
  // Accent Error Shades
  static MaterialColor accentError = MaterialColor(0xFFFDE7E7, <int, Color>{
    0: const HSLColor.fromAHSL(1, 0, 0.529, 0.967).toColor(),
    10: const HSLColor.fromAHSL(1, 0, 0.533, 0.941).toColor(),
    20: const HSLColor.fromAHSL(1, 0, 0.538, 0.873).toColor(),
    30: const HSLColor.fromAHSL(1, 0, 0.553, 0.798).toColor(),
    40: const HSLColor.fromAHSL(1, 0, 0.651, 0.506).toColor(),
    50: const HSLColor.fromAHSL(1, 0, 0.651, 0.506).toColor(),
    60: const HSLColor.fromAHSL(1, 0, 0.634, 0.482).toColor(),
    70: const HSLColor.fromAHSL(1, 0, 0.636, 0.431).toColor(),
    80: const HSLColor.fromAHSL(1, 0, 0.634, 0.375).toColor(),
    90: const HSLColor.fromAHSL(1, 0, 0.639, 0.304).toColor(),
    100: const HSLColor.fromAHSL(1, 0, 0.636, 0.216).toColor(),
  });
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  // Neutral Gray 500 Shades
  static MaterialColor neutralGray500 = MaterialColor(0xFFE6E6E6, <int, Color>{
    0: const HSLColor.fromAHSL(1, 0, 0, 0.969).toColor(),
    10: const HSLColor.fromAHSL(1, 0, 0, 0.945).toColor(),
    20: const HSLColor.fromAHSL(1, 0, 0, 0.882).toColor(),
    30: const HSLColor.fromAHSL(1, 0, 0, 0.820).toColor(),
    40: const HSLColor.fromAHSL(1, 0, 0, 0.749).toColor(),
    50: const HSLColor.fromAHSL(1, 0, 0, 0.627).toColor(),
    60: const HSLColor.fromAHSL(1, 0, 0, 0.600).toColor(),
    70: const HSLColor.fromAHSL(1, 0, 0, 0.537).toColor(),
    80: const HSLColor.fromAHSL(1, 0, 0, 0.463).toColor(),
    90: const HSLColor.fromAHSL(1, 0, 0, 0.380).toColor(),
    100: const HSLColor.fromAHSL(1, 0, 0, 0.267).toColor(),
  });
  // Neutral Gray 100 Shades
  static MaterialColor neutralGray100 = MaterialColor(0xFFFCFCFC, <int, Color>{
    0: const HSLColor.fromAHSL(1, 0, 0, 0.996).toColor(),
    10: const HSLColor.fromAHSL(1, 0, 0, 0.988).toColor(),
    20: const HSLColor.fromAHSL(1, 0, 0, 0.980).toColor(),
    30: const HSLColor.fromAHSL(1, 0, 0, 0.969).toColor(),
    40: const HSLColor.fromAHSL(1, 0, 0, 0.957).toColor(),
    50: const HSLColor.fromAHSL(1, 0, 0, 0.941).toColor(),
    60: const HSLColor.fromAHSL(1, 0, 0, 0.898).toColor(),
    70: const HSLColor.fromAHSL(1, 0, 0, 0.804).toColor(),
    80: const HSLColor.fromAHSL(1, 0, 0, 0.694).toColor(),
    90: const HSLColor.fromAHSL(1, 0, 0, 0.569).toColor(),
    100: const HSLColor.fromAHSL(1, 0, 0, 0.400).toColor(),
  });
  // Accent Success Shades
  static MaterialColor accentSuccess = MaterialColor(0xFFE7F7F0, <int, Color>{
    0: const HSLColor.fromAHSL(1, 153, 0.529, 0.967).toColor(),
    10: const HSLColor.fromAHSL(1, 150, 0.500, 0.937).toColor(),
    20: const HSLColor.fromAHSL(1, 152, 0.515, 0.871).toColor(),
    30: const HSLColor.fromAHSL(1, 151, 0.538, 0.796).toColor(),
    40: const HSLColor.fromAHSL(1, 153, 0.557, 0.708).toColor(),
    50: const HSLColor.fromAHSL(1, 158, 0.639, 0.500).toColor(),
    60: const HSLColor.fromAHSL(1, 158, 0.638, 0.476).toColor(),
    70: const HSLColor.fromAHSL(1, 158, 0.641, 0.425).toColor(),
    80: const HSLColor.fromAHSL(1, 159, 0.638, 0.369).toColor(),
    90: const HSLColor.fromAHSL(1, 158, 0.636, 0.302).toColor(),
    100: const HSLColor.fromAHSL(1, 158, 0.633, 0.214).toColor(),
  });

  /// Text colors
  static const Color textPrimary = Color(0xFF212121);
  static Color primaryTextColor =
      const HSLColor.fromAHSL(1, 0, 0, 0.118).toColor();
  static const Color textSecondary = Color(0xFF757575);
  static Color secondaryTextColor =
      const HSLColor.fromAHSL(1, 0, 0, 0.29).toColor();
  static const Color textHint = Color(0xFF9E9E9E);
  // Light Text Colors
  static MaterialColor lightTextColors = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      10: Color(0xFFC7C7C7), // #C7C7C7
      30: Color(0xFFDADADA), // #DADADA
      50: Color(0xFFE2E2E2), // #E2E2E2
      70: Color(0xFFF4F4F4), // #F4F4F4
      90: Color(0xFFFFFFFF), // #FFFFFF
    },
  );
  // Dark Text Colors
  static MaterialColor darkTextColors = const MaterialColor(
    0xFF000000,
    <int, Color>{
      10: Color(0xFF9A9A9A), // #9A9A9A
      30: Color(0xFF6E6E6E), // #6E6E6E
      50: Color(0xFF3C3C3C), // #3C3C3C
      70: Color(0xFF1A1A1A), // #1A1A1A
      90: Color(0xFF000000), // #000000
    },
  );

  // Dark theme specific colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFEEEEEE);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);

  /// Other common colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);
  static const Color divider = Color(0xFFBDBDBD);

  /// App Colors
  static const Color loginScreenBackGround = Color.fromRGBO(47, 51, 73, 1);
}

/*
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// A class that holds the color constants used throughout the application.
///
/// This class provides a centralized place to define and manage the colors
/// used in the app, making it easier to maintain a consistent color scheme
/// and update colors as needed.
class AppColors {
  /// Text Colors

  /// Widget Colors

  // Text Colors
  static Color primary75 =
      const HSLColor.fromAHSL(0.75, 170, 0.231, 0.949).toColor();
  static Color lightText100 = const HSLColor.fromAHSL(1, 0, 0, 1).toColor();
  static Color errorText100 =
      const HSLColor.fromAHSL(1, 0, 0.651, 0.506).toColor();

// Neutral Gray 900 Shades
  static MaterialColor neutralGray900 = MaterialColor(
    0xFFF2F2F2,
    <int, Color>{
      0: const HSLColor.fromAHSL(1, 0, 0, 0.949).toColor(),
      10: const HSLColor.fromAHSL(1, 0, 0, 0.910).toColor(),
      20: const HSLColor.fromAHSL(1, 0, 0, 0.808).toColor(),
      30: const HSLColor.fromAHSL(1, 0, 0, 0.690).toColor(),
      40: const HSLColor.fromAHSL(1, 0, 0, 0.549).toColor(),
      50: const HSLColor.fromAHSL(1, 0, 0, 0.200).toColor(),
      60: const HSLColor.fromAHSL(1, 0, 0, 0.192).toColor(),
      70: const HSLColor.fromAHSL(1, 0, 0, 0.173).toColor(),
      80: const HSLColor.fromAHSL(1, 0, 0, 0.149).toColor(),
      90: const HSLColor.fromAHSL(1, 0, 0, 0.122).toColor(),
      100: const HSLColor.fromAHSL(1, 0, 0, 0.086).toColor(),
    },
  );

  // Dark Text Colors
  static MaterialColor darkTextColors = const MaterialColor(
    0xFF000000,
    <int, Color>{
      10: Color(0xFF9A9A9A), // #9A9A9A
      30: Color(0xFF6E6E6E), // #6E6E6E
      50: Color(0xFF3C3C3C), // #3C3C3C
      70: Color(0xFF1A1A1A), // #1A1A1A
      90: Color(0xFF000000), // #000000
    },
  );
}
*/
