import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:version_manager_flutter/shared/services/auth_key_provider.dart';

/// Реализация репозитория аутентификации.
///
/// Использует [AuthKeyProvider] для:
/// - Хранения токенов
/// - Автоматического refresh при 401 ошибке
/// - Очистки токенов при logout
///
/// ## Сроки жизни токенов
/// - **Access Token**: 1 час
/// - **Refresh Token**: 30 дней
class AuthRepositoryImpl implements AuthRepository {
  final EndpointAuth _authEndpoint;
  final AuthKeyProvider _authKeyProvider;

  AuthRepositoryImpl({
    required EndpointAuth authEndpoint,
    required AuthKeyProvider authKeyProvider,
  }) : _authEndpoint = authEndpoint,
       _authKeyProvider = authKeyProvider;

  @override
  Future<bool> checkAuth() async {
    return _authKeyProvider.hasTokens;
  }

  @override
  Future<void> logout() async {
    try {
      await _authEndpoint.logout();
    } catch (_) {
      // Игнорируем ошибки — всё равно очищаем токены
    }

    await _authKeyProvider.clearTokens();
  }

  @override
  Future<void> logoutAll() async {
    try {
      await _authEndpoint.logoutAll();
    } catch (_) {
      // Игнорируем ошибки — всё равно очищаем токены
    }

    await _authKeyProvider.clearTokens();
  }

  @override
  void setOnAuthenticationFailed(void Function() callback) {
    _authKeyProvider.onAuthenticationFailed = callback;
  }
}
