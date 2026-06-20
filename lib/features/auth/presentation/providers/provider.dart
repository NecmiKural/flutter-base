import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:base_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:base_app/features/auth/data/services/auth_service.dart';
import 'package:base_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:base_app/features/auth/domain/usecases/perform_auth_use_case.dart';
import 'package:base_app/features/auth/presentation/providers/auth_view_model.dart';

/// Dependency Injection
///
/// These providers are app-lifetime singletons. They use `ref.watch` (not
/// `ref.read`) so each dependency is wired reactively and shares a single
/// instance for as long as it is needed.
final Provider<AuthService> _authServiceProvider = Provider<AuthService>((
  Ref ref,
) {
  return AuthService();
});

final Provider<AuthRepository> _authRepositoryProvider =
    Provider<AuthRepository>((Ref ref) {
      return AuthRepositoryImpl(authService: ref.watch(_authServiceProvider));
    });

final Provider<PerformAuthUseCase> _performAuthProvider =
    Provider<PerformAuthUseCase>((Ref ref) {
      return PerformAuthUseCase(ref.watch(_authRepositoryProvider));
    });

/// ViewModel
final ChangeNotifierProvider<AuthViewModel> authViewModelProvider =
    ChangeNotifierProvider<AuthViewModel>((Ref ref) {
      final authViewModel = AuthViewModel(
        performAuthUseCase: ref.watch(_performAuthProvider),
      );

      // Start listening to auth state changes.
      final authService = ref.watch(_authServiceProvider);
      authViewModel.startListening(authService.authStateChanges());

      return authViewModel;
    });
