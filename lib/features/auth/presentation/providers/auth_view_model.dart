import 'dart:async'; // Add this import for StreamSubscription
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:base_app/core/utils/i18n_helper.dart';
import 'package:base_app/features/auth/domain/usecases/perform_auth_use_case.dart';
import 'package:base_app/presentation/widgets/custom_toast.dart';

/// ViewModel for handling authentication-related operations.
///
/// This class extends [ChangeNotifier] to provide state management capabilities
class AuthViewModel extends ChangeNotifier {
  bool _disposed = false;
  StreamSubscription? _subscription;

  /// Returns whether this object has been disposed.
  bool get isDisposed => _disposed;

  /// Creates an instance of [AuthViewModel].
  AuthViewModel({required PerformAuthUseCase performAuthUseCase})
    : _performAuthUseCase = performAuthUseCase,
      super() {
    // You can call startListening() here if you want to start listening immediately
  }

  final PerformAuthUseCase _performAuthUseCase;

  /// Starts listening to a stream
  void startListening(Stream<dynamic> stream) {
    // Cancel any existing subscription first
    _subscription?.cancel();

    // Don't set up a new subscription if already disposed
    if (_disposed) return;

    _subscription = stream.listen(
      (data) {
        // Handle the data here
        // For example:
        // _handleStreamData(data);

        // Only notify listeners if not disposed
        if (!_disposed) {
          notifyListeners();
        }
      },
      onError: (error) {
        // Handle errors from the stream
        debugPrint('Stream error: $error');
      },
    );
  }

  /// Sign in.
  Future<AuthorizationTokenResponse?> performAuth() async {
    // Check if already disposed before performing operations
    if (_disposed) return null;

    final authCall = await _performAuthUseCase.call();
    final response = authCall.resultData;

    await Toast.toastDataStateMessageWrapper(
      dataState: await _performAuthUseCase(),
      successMessage: I18n.localizations?.successLogin ?? "Successful Login.",
    );

    // Check again if disposed before notifying listeners
    if (!_disposed) {
      notifyListeners();
    }

    return response;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _disposed = true;
    super.dispose();
  }
}
