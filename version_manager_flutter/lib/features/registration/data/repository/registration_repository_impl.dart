import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

/// Реализация репозитория регистрации.
class RegistrationRepositoryImpl implements RegistrationRepository {
  final EndpointAuth _authEndpoint;
  final StorageService _storageService;

  RegistrationRepositoryImpl({
    required EndpointAuth authEndpoint,
    required StorageService storageService,
  }) : _authEndpoint = authEndpoint,
       _storageService = storageService;

  @override
  Future<SendCodeResponse> resendCode({
    required String email,
  }) async {
    return await _authEndpoint.resendCode(
      request: RegisterSendCodeRequest(email: email),
    );
  }

  @override
  Future<SuccessResponse> verifyCode({
    required String email,
    required String code,
  }) async {
    return await _authEndpoint.verifyRegisterCode(
      request: RegisterVerifyCodeRequest(email: email, code: code),
    );
  }

  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
  }) async {
    final response = await _authEndpoint.register(
      request: RegisterRequest(email: email, password: password),
    );

    // Сохраняем токены после успешной регистрации (автовход)
    await _storageService.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    return response;
  }
}
