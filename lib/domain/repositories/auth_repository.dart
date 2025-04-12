import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_app/core/network/api_client.dart';
import 'package:base_app/domain/models/user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRepository(apiClient);
});

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<User> login(String email, String password) async {
    final response = await _apiClient.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    return User.fromJson(response.data['user']);
  }

  Future<void> logout() async {
    await _apiClient.post('/auth/logout');
  }

  // Add other auth-related methods
}
