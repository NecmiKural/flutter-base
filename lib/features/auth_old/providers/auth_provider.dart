import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/errors/app_exceptions.dart';
import 'package:base_app/domain/models/user.dart';
import 'package:base_app/domain/repositories/auth_repository.dart';

// Auth state
class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({User? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState());

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final user = await _authRepository.login(email, password);
      state = state.copyWith(user: user, isLoading: false);
    } on AppException catch (e) {
      state = state.copyWith(error: e.message, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'An unexpected error occurred',
        isLoading: false,
      );
    }
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _authRepository.logout();
      state = AuthState();
    } catch (e) {
      state = state.copyWith(error: 'Failed to logout', isLoading: false);
    }
  }
}

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository);
});
