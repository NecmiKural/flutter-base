import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/logging/logger.dart';
import 'package:base_app/core/storage/hive_service.dart';
import 'package:base_app/features/auth/presentation/providers/provider.dart';

class LoginState {
  final bool isLogging;

  LoginState({this.isLogging = false});

  // Create a copy of the state with updated values
  LoginState copyWith({bool? isLogging}) {
    return LoginState(isLogging: isLogging ?? this.isLogging);
  }
}

// Define the notifier class that will manage the login state
class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(LoginState()) {
    startAuth();
  }

  Future<void> startAuth() async {
    // if (variables.sources.isEmpty) {
    //   Get.snackbar(
    //     constants.SOURCE_NOT_FOUND_MESSAGE,
    //     "Select a valid source.",
    //     icon: const Icon(Icons.error),
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //     duration: const Duration(seconds: 3),
    //   );
    //   return;
    // }

    try {
      state = state.copyWith(isLogging: true);
      if (mounted) {
        final viewModel = ref.read(authViewModelProvider);

        if (!viewModel.isDisposed) {
          final result = await viewModel.performAuth();
          if (result != null) {
            await _processAuthResult(result, ref);
          }
        }
      }
    } catch (e, s) {
      Log.error("error while logging in= $e, stack= \n $s");
      // TODO
      // await logoutAction();
    } finally {
      state = state.copyWith(isLogging: false);
    }
  }
}

// Create a provider for the login state
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

// ur functions here

Future<void> _processAuthResult(
  AuthorizationTokenResponse result,
  Ref ref,
) async {
  if (!_isValidAuthResult(result)) return;

  await _saveAuthData(result, ref);
  // await _fetchAndProcessUserInfo(result.accessToken!);
}

bool _isValidAuthResult(AuthorizationTokenResponse result) {
  return result.refreshToken != null &&
      result.accessToken != null &&
      result.idToken != null &&
      result.accessTokenExpirationDateTime != null;
}

Future<void> _saveAuthData(AuthorizationTokenResponse result, Ref ref) async {
  // final hiveService = HiveService();
  final hiveService = ref.read(hiveServiceProvider);

  await hiveService.saveAuthToken(result.accessToken!);
  await hiveService.saveRefreshToken(result.refreshToken!);
  await hiveService.saveIdToken(result.idToken!);
  await hiveService.saveTokenExpirationTime(
    result.accessTokenExpirationDateTime.toString(),
  );
}

  // Future<void> _fetchAndProcessUserInfo(
  //   String accessToken,
  // ) async {
  //   final response = await http.get(
  //     Uri.parse(variables.USER_INFO_URL),
  //     headers: {'Authorization': 'Bearer $accessToken'},
  //   );

  //   if (response.statusCode == 200) {
  //     final userInfoBox = Hive.box('userInfoBox');
  //     userInfoBox.put('userInfo', response.body);
  //     userInfoBox.put(
  //       'userName',
  //       jsonDecode(response.body)["given_name"],
  //     );

  //     await logic.appIgniter();
  //   }
  // }
