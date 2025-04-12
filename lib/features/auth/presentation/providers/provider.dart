import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:base_app/features/auth/data/services/auth_service.dart';
import 'package:base_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:base_app/features/auth/domain/usecases/perform_auth_use_case.dart';
import 'package:base_app/features/auth/presentation/providers/auth_view_model.dart';

/// Dependency Injection
final AutoDisposeProvider<AuthService> _authServiceProvider =
    Provider.autoDispose<AuthService>((Ref<AuthService> ref) {
      return AuthService();
    });

final AutoDisposeProvider<AuthRepository> _authRepositoryProvider =
    Provider.autoDispose<AuthRepository>((Ref<AuthRepository> ref) {
      return AuthRepositoryImpl(
        authService: ref.read<AuthService>(_authServiceProvider),
      );
    });

final Provider<PerformAuthUseCase> _performAuthProvider =
    Provider<PerformAuthUseCase>((Ref<PerformAuthUseCase> ref) {
      return PerformAuthUseCase(
        ref.read<AuthRepository>(_authRepositoryProvider),
      );
    });

/// ViewModel
final ChangeNotifierProvider<AuthViewModel>
authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((
  Ref<AuthViewModel> ref,
) {
  final authViewModel = AuthViewModel(
    performAuthUseCase: ref.read<PerformAuthUseCase>(_performAuthProvider),
  );

  // Get the AuthService instance
  final authService = ref.read<AuthService>(_authServiceProvider);

  // Start listening to auth state changes
  authViewModel.startListening(authService.authStateChanges());

  // Remove autoDispose to prevent the ViewModel from being disposed prematurely
  // This ensures the ViewModel stays alive as long as needed

  return authViewModel;
});
