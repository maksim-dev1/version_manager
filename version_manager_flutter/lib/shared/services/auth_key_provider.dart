import 'package:serverpod_client/serverpod_client.dart';
import 'package:version_manager_flutter/common/constants/storage_keys.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

/// Провайдер ключа аутентификации для Serverpod клиента.
///
/// Реализует [ClientAuthKeyProvider] и управляет:
/// - Хранением и получением access token
/// - Автоматическим refresh token при истечении
/// - Очисткой токенов при logout
///
/// ## Сроки жизни токенов
/// - **Access Token**: 1 час
/// - **Refresh Token**: 30 дней
class AuthKeyProvider implements ClientAuthKeyProvider {
  final StorageService _storageService;

  /// Callback для выполнения refresh token.
  /// Устанавливается после инициализации клиента.
  Future<RefreshResult> Function(String refreshToken)? onRefreshToken;

  /// Callback вызывается при ошибке refresh (logout).
  void Function()? onAuthenticationFailed;

  /// Флаг, предотвращающий повторные попытки refresh.
  bool _isRefreshing = false;

  AuthKeyProvider({
    required StorageService storageService,
  }) : _storageService = storageService;

  /// Возвращает access token в формате Bearer для заголовка Authorization.
  ///
  /// Если токен отсутствует, возвращает null и запрос выполнится
  /// без аутентификации.
  @override
  Future<String?> get authHeaderValue async {
    final accessToken = _storageService.getString(accessTokenKey);
    if (accessToken == null) return null;

    return wrapAsBearerAuthHeaderValue(accessToken);
  }

  /// Сохраняет новую пару токенов.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storageService.setString(accessTokenKey, accessToken);
    await _storageService.setString(refreshTokenKey, refreshToken);
  }

  /// Удаляет все токены (logout).
  Future<void> clearTokens() async {
    await _storageService.remove(accessTokenKey);
    await _storageService.remove(refreshTokenKey);
  }

  /// Проверяет наличие сохранённых токенов.
  bool get hasTokens {
    final accessToken = _storageService.getString(accessTokenKey);
    final refreshToken = _storageService.getString(refreshTokenKey);
    return accessToken != null && refreshToken != null;
  }

  /// Получает текущий access token.
  String? get accessToken => _storageService.getString(accessTokenKey);

  /// Получает текущий refresh token.
  String? get refreshToken => _storageService.getString(refreshTokenKey);

  /// Выполняет обновление токенов.
  ///
  /// Вызывается при получении 401 ошибки от сервера.
  /// Использует refresh token для получения новой пары токенов.
  ///
  /// Возвращает `true` если refresh успешен, `false` в противном случае.
  Future<bool> refreshTokens() async {
    // Предотвращаем параллельные refresh запросы
    if (_isRefreshing) return false;

    final currentRefreshToken = refreshToken;
    if (currentRefreshToken == null) {
      onAuthenticationFailed?.call();
      return false;
    }

    if (onRefreshToken == null) {
      onAuthenticationFailed?.call();
      return false;
    }

    _isRefreshing = true;

    try {
      final result = await onRefreshToken!(currentRefreshToken);

      if (result.success) {
        await saveTokens(
          accessToken: result.accessToken!,
          refreshToken: result.refreshToken!,
        );
        return true;
      } else {
        // Refresh не удался — токены невалидны
        await clearTokens();
        onAuthenticationFailed?.call();
        return false;
      }
    } catch (e) {
      // Ошибка refresh — очищаем токены и уведомляем
      await clearTokens();
      onAuthenticationFailed?.call();
      return false;
    } finally {
      _isRefreshing = false;
    }
  }
}

/// Результат операции refresh token.
class RefreshResult {
  final bool success;
  final String? accessToken;
  final String? refreshToken;
  final String? errorMessage;

  const RefreshResult.success({
    required String this.accessToken,
    required String this.refreshToken,
  }) : success = true,
       errorMessage = null;

  const RefreshResult.failure({this.errorMessage})
    : success = false,
      accessToken = null,
      refreshToken = null;
}
