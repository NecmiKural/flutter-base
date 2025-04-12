// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Example App';

  @override
  String get welcomeMessage => 'Example App\'e Hoş Geldiniz';

  @override
  String get login => 'Giriş Yap';

  @override
  String get successLogin => 'Giriş Başarılı!';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get email => 'E-posta';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPassword => 'Şifremi Unuttum?';

  @override
  String get register => 'Kayıt Ol';

  @override
  String get settings => 'Ayarlar';

  @override
  String get profile => 'Profil';

  @override
  String get darkMode => 'Karanlık Mod';

  @override
  String get language => 'Dil';

  @override
  String get error => 'Hata';

  @override
  String get networkError => 'Ağ hatası. Lütfen bağlantınızı kontrol edin.';

  @override
  String get authError => 'Kimlik doğrulama hatası. Lütfen tekrar giriş yapın.';
}
