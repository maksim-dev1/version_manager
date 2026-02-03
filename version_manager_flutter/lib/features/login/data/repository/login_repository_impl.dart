import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/login/domain/repository/login_repository.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  final EndpointAuth _authEndpoint;
  final StorageService _storageService;

  LoginRepositoryImpl({
    required EndpointAuth authEndpoint,
    required StorageService storageService,
  }) : _authEndpoint = authEndpoint,
       _storageService = storageService;

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _authEndpoint.login(
      LoginRequest(email: email, password: password),
    );

    // Сохраняем токены после успешного логина
    await _storageService.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    return response;
  }
}
