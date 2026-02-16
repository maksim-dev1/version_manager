import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления приложениями.
///
/// Отвечает за:
/// - CRUD операции с приложениями
/// - Управление API ключами (генерация, регенерация)
/// - Активацию / деактивацию приложений
abstract interface class ApplicationRepository {
  /// Получает список приложений текущего пользователя.
  Future<List<Application>> getMyApplications();

  /// Получает список команд текущего пользователя.
  Future<List<Team>> getMyTeams();

  /// Получает приложение по ID.
  Future<Application> getApplication({
    required UuidValue applicationId,
  });

  /// Создаёт новое приложение.
  Future<CreateApplicationResponse> createApplication({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<PlatformType> platforms,
    required OwnerType ownerType,
    UuidValue? teamId,
    List<StoreLinkEntry>? storeLinks,
  });

  /// Обновляет данные приложения.
  Future<Application> updateApplication({
    required UuidValue applicationId,
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<PlatformType>? platforms,
    List<StoreLinkEntry>? storeLinks,
  });

  /// Удаляет приложение.
  Future<SuccessResponse> deleteApplication({
    required UuidValue applicationId,
    required String confirmationName,
  });

  /// Получает замаскированный email владельца приложения
  /// для отображения перед отправкой кода.
  Future<String> getRegenerationTargetEmail({
    required UuidValue applicationId,
  });

  /// Запрашивает код подтверждения для регенерации API ключа.
  Future<RequestApiKeyRegenerationResponse> requestApiKeyRegeneration({
    required UuidValue applicationId,
  });

  /// Регенерирует API ключ с кодом подтверждения.
  Future<RegenerateApiKeyResponse> regenerateApiKey({
    required UuidValue applicationId,
    required String code,
  });

  /// Активирует или деактивирует приложение.
  Future<Application> toggleApplicationStatus({
    required UuidValue applicationId,
    required bool isActive,
  });

  /// Передаёт владение приложением.
  Future<SuccessResponse> transferApplicationOwnership({
    required UuidValue applicationId,
    required OwnerType newOwnerType,
    UuidValue? newTeamId,
  });
}
