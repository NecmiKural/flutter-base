import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/network/connectivity_service.dart';
import 'package:base_app/core/network/api_client.dart';
import 'package:base_app/features/auth/presentation/widgets/sign_in_from.dart';

import 'package:flutter/material.dart';

import '../providers/provider.dart';

// todo delete this file and use it inside of the provider, no need mixing for initState actions
mixin LoginMixin on ConsumerState<SignInForm> {
  final formKey = GlobalKey<FormState>();
  final double inputFieldWidth = 300;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _fetchApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signIn() async {
    // Use mounted check to prevent accessing the provider after disposal
    if (mounted) {
      // Store the provider in a local variable to prevent accessing it after disposal
      final viewModel = ref.read(authViewModelProvider);

      // Check if the viewModel is not disposed before using it
      if (!viewModel.isDisposed) {
        await viewModel.performAuth();
      }
    }
  }

  // add token refresher worker also
  Future<void> _fetchApp() async {
    final apiClient = ref.read(apiClientProvider);
    final connectivityService = ConnectivityService(apiClient);
    final bool internetConnectionResult =
        await connectivityService.checkConnectivity();

    // final String? storedRefreshToken = await secureStorage.read(
    //   key: 'refresh_token',
    // );
    // if (!internetConnectionResult) {
    //   return Get.snackbar(
    //     constants.ERROR_MESSAGE,
    //     constants.NO_INTERNET_MESSAGE,
    //     icon: const Icon(Icons.error),
    //     shouldIconPulse: true,
    //     barBlur: 20,
    //     isDismissible: true,
    //     duration: const Duration(hours: 3),
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // } else {
    //   if (variables.sources.isNotEmpty) {
    //     variables.appSource =
    //         Source.values
    //             .where(
    //               (source) =>
    //                   source.name.toLowerCase() ==
    //                   variables.sources.first.toLowerCase(),
    //             )
    //             .firstOrNull;
    //   }
    //   if (storedRefreshToken != null && variables.appSource != null) {
    //     variables.isLogging.value = true;

    //     final TokenRefreshWorker tokenRefreshWorker =
    //         Get.find<TokenRefreshWorker>();
    //     await tokenRefreshWorker.debouncedTokenRefresher();

    //     if (variables.isLogging.value) {
    //       await appIgniter();
    //       Timer.periodic(const Duration(minutes: 3), (Timer t) async {
    //         await tokenRefreshWorker.debouncedTokenRefresher();
    //       });
    //     }
    //   }
    // }
  }
}
