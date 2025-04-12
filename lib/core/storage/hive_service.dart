import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/logging/app_logger.dart';
import 'dart:convert';

/// Provider for the HiveService
final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

/// Service for interacting with Hive storage with encryption
// u can split with encryption ones and general ones; like auth, user, settings
class HiveService {
  static const String _settingsBoxName = 'settings';
  static const String _secureBoxName = 'secure_box';

  static const String _authTokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _idTokenKey = "id_token";
  static const String _tokenExpirationTimeKey = "expiration_time";
  static const String _encryptionKeyIdentifier = 'encryption_key';

  final _logger = AppLogger('HiveService');
  // can use encrypt package also for key
  final _secureStorage = const FlutterSecureStorage();

  /// Initialize the secure storage
  Future<void> initialize() async {
    try {
      // I init that on app
      // final document = await getApplicationDocumentsDirectory();
      // await Hive.initFlutter(document.path);
      // if you have custom types, models to store u should register it first
      // registerAdapter();

      // Get or generate encryption key
      final encryptionKey = await _getEncryptionKey();

      // Register the encrypted box
      await Hive.openBox(_settingsBoxName); // Regular box
      // await Hive.openEncryptedBox(
      await Hive.openBox(
        _secureBoxName,
        // encryptionKey: Hive.generateSecureKey(),
        encryptionCipher: HiveAesCipher(encryptionKey),
      );

      _logger.info('Secure Hive storage initialized');
    } catch (e) {
      _logger.error('Failed to initialize secure Hive storage', e);
      // Fallback to non-encrypted storage if encryption fails
      await Hive.openBox(_secureBoxName);
    }
  }

  /// Get or generate encryption key
  Future<List<int>> _getEncryptionKey() async {
    try {
      // Try to get existing key
      String? existingKey = await _secureStorage.read(
        key: _encryptionKeyIdentifier,
      );

      if (existingKey != null) {
        return base64Url.decode(existingKey);
      }

      // Generate a new key if none exists
      final key = Hive.generateSecureKey();
      await _secureStorage.write(
        key: _encryptionKeyIdentifier,
        value: base64Url.encode(key),
      );

      return key;
    } catch (e) {
      _logger.error('Error with encryption key', e);
      // Fallback to a default key (not recommended for production)
      return List<int>.filled(32, 1);
    }
  }

  /// Get the auth token from secure storage
  Future<String?> getAuthToken() async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      return box.get(_authTokenKey) as String?;
    } catch (e) {
      _logger.error('Failed to get auth token from Hive', e);
      return null;
    }
  }

  /// Save the auth token to secure storage
  Future<void> saveAuthToken(String token) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      await box.put(_authTokenKey, token);
    } catch (e) {
      _logger.error('Failed to save auth token to Hive', e);
    }
  }

  Future<String?> getIdToken() async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      return box.get(_idTokenKey);
    } catch (e) {
      _logger.error('Failed to get id token from Hive', e);
      return null;
    }
  }

  Future<void> saveIdToken(String token) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      await box.put(_idTokenKey, token);
    } catch (e) {
      _logger.error('Failed to save id token to Hive', e);
    }
  }

  Future<String?> getTokenExpirationTime() async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      return box.get(_tokenExpirationTimeKey);
    } catch (e) {
      _logger.error('Failed to get token expiration time from Hive', e);
      return null;
    }
  }

  Future<void> saveTokenExpirationTime(String tokenTime) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      await box.put(_tokenExpirationTimeKey, tokenTime);
    } catch (e) {
      _logger.error('Failed to save token expiration time to Hive', e);
    }
  }

  /// Get the refresh token from secure storage
  Future<String?> getRefreshToken() async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      return box.get(_refreshTokenKey) as String?;
    } catch (e) {
      _logger.error('Failed to get refresh token from Hive', e);
      return null;
    }
  }

  /// Save the refresh token to secure storage
  Future<void> saveRefreshToken(String token) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      await box.put(_refreshTokenKey, token);
    } catch (e) {
      _logger.error('Failed to save refresh token to Hive', e);
    }
  }

  /// Clear all auth-related tokens from storage
  Future<void> clearAuthTokens() async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      await box.delete(_authTokenKey);
      await box.delete(_refreshTokenKey);
      await box.delete(_idTokenKey);
    } catch (e) {
      _logger.error('Failed to clear auth tokens from Hive', e);
    }
  }

  // value can be any type<T>, but u should register that type before save it or it will give you an error
  Future<void> settingStore(String key, value) async {
    try {
      final box = await Hive.openBox(_settingsBoxName);
      await box.put(key, value);
    } catch (e) {
      _logger.error('Failed to store setting data: $key', e);
    }
  }

  Future<String?> settingRetrieve(String key) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      return box.get(key) as String?;
    } catch (e) {
      _logger.error('Failed to retrieve secure data: $key', e);
      return null;
    }
  }

  /// Store any secure data
  Future<void> secureStore(String key, String value) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      await box.put(key, value);
    } catch (e) {
      _logger.error('Failed to store secure data: $key', e);
    }
  }

  /// Retrieve secure data
  Future<String?> secureRetrieve(String key) async {
    try {
      final box = await Hive.openBox(_secureBoxName);
      return box.get(key) as String?;
    } catch (e) {
      _logger.error('Failed to retrieve secure data: $key', e);
      return null;
    }
  }
}
