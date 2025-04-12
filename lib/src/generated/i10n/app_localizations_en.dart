// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Example App';

  @override
  String get welcomeMessage => 'Welcome to Example App';

  @override
  String get login => 'Login';

  @override
  String get successLogin => 'Logged in successfully!';

  @override
  String get logout => 'Logout';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get register => 'Register';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get error => 'Error';

  @override
  String get networkError => 'Network error. Please check your connection.';

  @override
  String get authError => 'Authentication error. Please login again.';
}
