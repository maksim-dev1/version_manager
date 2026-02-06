import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/shared/services/auth_key_provider.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

/// Сервис для работы с Serverpod клиентом.
///
/// Управляет инициализацией клиента и настройкой аутентификации.
/// Использует [AuthKeyProvider] для автоматической передачи токенов
/// в заголовках запросов.
class ClientService {
  Client? _client;
  AuthKeyProvider? _authKeyProvider;

  /// Инициализирует клиент с поддержкой аутентификации.
  ///
  /// [baseUrl] — базовый URL сервера Serverpod.
  /// [storageService] — сервис для хранения токенов.
  void initializeClient(
    String baseUrl, {
    required StorageService storageService,
  }) {
    _authKeyProvider = AuthKeyProvider(storageService: storageService);

    _client = Client(
      baseUrl,
      onFailedCall: _handleFailedCall,
    )..authKeyProvider = _authKeyProvider;

    // Настраиваем callback для refresh token
    _authKeyProvider!.onRefreshToken = _performRefreshToken;
  }

  /// Провайдер аутентификации для внешнего доступа.
  AuthKeyProvider get authKeyProvider => _authKeyProvider != null
      ? _authKeyProvider!
      : throw InvalidDataException(
          message: 'AuthKeyProvider не инициализирован',
          field: 'ClientService',
          stackTrace: StackTrace.current.toString(),
        );

  /// Эндпоинт аутентификации.
  EndpointAuth get auth => _client != null
      ? _client!.auth
      : throw InvalidDataException(
          message: 'Клиент не инициализирован',
          field: 'ClientService',
          stackTrace: StackTrace.current.toString(),
        );

  /// Получить клиент напрямую (для особых случаев).
  Client get client => _client != null
      ? _client!
      : throw InvalidDataException(
          message: 'Клиент не инициализирован',
          field: 'ClientService',
          stackTrace: StackTrace.current.toString(),
        );

  /// Обрабатывает неудачные вызовы API.
  ///
  /// При получении ошибки аутентификации (401) пытается
  /// обновить токены. Если refresh не удался — вызывается
  /// [AuthKeyProvider.onAuthenticationFailed], что приводит к logout.
  void _handleFailedCall(
    MethodCallContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    if (error is ServerpodClientException && error.statusCode == 401) {
      // Пытаемся обновить токены в фоне.
      // При неудаче refreshTokens() сам вызовет onAuthenticationFailed → logout.
      _authKeyProvider?.refreshTokens();
    }
  }

  /// Выполняет refresh token через API.
  Future<RefreshResult> _performRefreshToken(String refreshToken) async {
    try {
      // Создаём временный клиент без аутентификации для refresh
      // чтобы избежать рекурсии
      final tempClient = Client(_client!.host);

      final response = await tempClient.auth.refreshTokens(
        request: RefreshTokenRequest(refreshToken: refreshToken),
      );

      return RefreshResult.success(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
    } on ServerpodClientException catch (e) {
      return RefreshResult.failure(errorMessage: e.message);
    } catch (e) {
      return RefreshResult.failure(errorMessage: e.toString());
    }
  }
}
