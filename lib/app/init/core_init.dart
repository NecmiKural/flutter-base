// part of "../../main.dart";

// /// Core initialization
// ///
// /// This class is responsible for initializing the core functionalities of the app
// ///
// /// This class is called in the main function before the app is run
// ///
// /// This class initializes the following:
// /// - WidgetsFlutterBinding
// /// - Firebase
// /// - Localization
// class _CoreInit {
//   Future<void> init() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await _SystemChromeSettings.configureSystemChromeSettings();
//     await Firebase.initializeApp();

//     /// TODO: If you are using Firebase Remote Config, uncomment the following lines
//     /// TODO: and import the necessary packages
//     ///  TODO: If you are not using Firebase Remote Config, you can remove the following lines
//     ///
//     // final remoteConfig = FirebaseRemoteConfig.instance;
//     // await remoteConfig.ensureInitialized();
//     // await remoteConfig.fetchAndActivate();
//     // await remoteConfig.setConfigSettings(
//     //   RemoteConfigSettings(
//     //     fetchTimeout: const Duration(minutes: 1),
//     //     minimumFetchInterval: const Duration(minutes: 1),
//     //   ),
//     // );
//     await _LocalizationInit().initLocale();
//   }
// }
