import 'package:base_app/app/app.dart';
import 'package:base_app/app/app_bootstrap.dart';
import 'package:base_app/core/logging/log_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // await _CoreInit().init();
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  container.read(logServiceProvider).initialize();

  await AppBootstrap.initialize();

  // TODO: implement Global Exception Handling, Custom Error Screens, Crash Reporting
  // or ProviderScope
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}
