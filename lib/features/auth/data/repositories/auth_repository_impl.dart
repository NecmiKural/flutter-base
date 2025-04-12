import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:base_app/core/resources/data_state.dart';
import 'package:base_app/features/auth/data/services/auth_service.dart';
import 'package:base_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authService});

  final AuthService authService;
  @override
  Future<DataState<AuthorizationTokenResponse?>> performAuth() {
    return DataState.handleDataState(() => authService.performAuth());
  }
}

// import '../../../../core/resources/data_state.dart';
// import '../../domain/entities/auth_entity.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../models/auth_model.dart';
// import '../services/auth_service.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   AuthRepositoryImpl({required this.authService});

//   final AuthService authService;
//   @override
//   Future<DataState<void>> signInWithEmailAndPassword(AuthEntity authEntity) {
//     return DataState.handleDataState(
//       () => authService
//           .signWithEmailAndPassword(AuthModel.fromEntity(authEntity)),
//     );
//   }
// }
