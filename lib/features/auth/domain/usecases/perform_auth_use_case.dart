import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:base_app/core/resources/data_state.dart';
import 'package:base_app/core/resources/use_case.dart';
import 'package:base_app/features/auth/domain/repositories/auth_repository.dart';

class PerformAuthUseCase extends NoParams {
  final AuthRepository repository;

  PerformAuthUseCase(this.repository);

  Future<DataState<AuthorizationTokenResponse?>> call() {
    return repository.performAuth();
  }
}
