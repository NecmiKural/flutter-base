// part of '../../main.dart';

// ///
// /// A utility class that provides methods to configure the system chrome settings.
// class _SystemChromeSettings {
//   ///
//   /// This method sets the preferred orientations to portrait up and
//   /// sets the system UI overlay style.
//   ///
//   /// This method is called in the [_CoreInit] class.
//   static Future<void> configureSystemChromeSettings() async {
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: AppColors.backgroundColor[50],
//         systemNavigationBarIconBrightness: Brightness.dark,
//       ),
//     );
//   }
// }
