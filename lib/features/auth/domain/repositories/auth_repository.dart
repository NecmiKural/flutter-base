import 'package:base_app/core/resources/data_state.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

/// Abstract class [AuthRepository] is used to define the methods that will be used to interact with the data sources.
/// This class will be implemented by the data layer, using the [AuthRepositoryImpl] class.
/// This class will be used by the domain layer to interact with the data layer.
abstract class AuthRepository {
  Future<DataState<AuthorizationTokenResponse?>> performAuth();
}
