import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/logging/app_logger.dart';
import 'package:base_app/core/storage/hive_service.dart';

class AppBootstrap {
  static final _logger = AppLogger('AppBootstrap');

  static Future<void> initialize() async {
    try {
      // Initialize Hive
      await Hive.initFlutter();

      // Create a ProviderContainer for initialization
      final container = ProviderContainer();

      // Initialize secure storage
      await container.read(hiveServiceProvider).initialize();

      // Register Hive adapters
      // Hive.registerAdapter(YourModelAdapter());

      // Open Hive boxes
      await Hive.openBox('settings');

      // Other initializations
      _logger.info('App bootstrap completed successfully');
    } catch (e, stackTrace) {
      _logger.severe('Failed to bootstrap app', e, stackTrace);
      rethrow;
    }
  }
}
