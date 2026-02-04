import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

/// Реализация репозитория аутентификации.
class AuthRepositoryImpl implements AuthRepository {
  final EndpointAuth _authEndpoint;
  final StorageService _storageService;

  AuthRepositoryImpl({
    required EndpointAuth authEndpoint,
    required StorageService storageService,
  }) : _authEndpoint = authEndpoint,
       _storageService = storageService;

  @override
  Future<bool> checkAuth() async {
    return _storageService.hasTokens();
  }

  // @override
  // Future<({String accessToken, String refreshToken})?> getSavedTokens() async {
  //   final accessToken = _storageService.getAccessToken();
  //   final refreshToken = _storageService.getRefreshToken();

  //   if (accessToken == null || refreshToken == null) {
  //     return null;
  //   }

  //   return (accessToken: accessToken, refreshToken: refreshToken);
  // }

  // @override
  // Future<void> saveTokens({
  //   required String accessToken,
  //   required String refreshToken,
  // }) async {
  //   await _storageService.saveTokens(
  //     accessToken: accessToken,
  //     refreshToken: refreshToken,
  //   );
  // }

  // @override
  // Future<TokenPairResponse> refreshTokens({
  //   required String refreshToken,
  // }) async {
  //   final response = await _authEndpoint.refreshTokens(
  //     RefreshTokenRequest(refreshToken: refreshToken),
  //   );

  //   // Обновляем токены после успешного refresh
  //   await _storageService.saveTokens(
  //     accessToken: response.accessToken,
  //     refreshToken: response.refreshToken,
  //   );

  //   return response;
  // }

  @override
  Future<SuccessResponse> logout({
    required String accessToken,
  }) async {
    final response = await _authEndpoint.logout(accessToken);

    // Удаляем токены после успешного logout
    await _storageService.clearTokens();

    return response;
  }

  @override
  Future<SuccessResponse> logoutAll({
    required String accessToken,
  }) async {
    final response = await _authEndpoint.logoutAll(accessToken: accessToken);

    // Удаляем токены после успешного logoutAll
    await _storageService.clearTokens();

    return response;
  }
}
