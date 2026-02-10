import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления командами.
///
/// Отвечает за:
/// - CRUD операции с командами
/// - Работу с приглашениями (загрузка, ответ)
/// - Получение текущего пользователя
abstract interface class TeamRepository {
  /// Получает текущего пользователя.
  Future<UserPublic> getCurrentUser();

  /// Создаёт новую команду.
  Future<Team> createTeam({
    required String name,
    String? description,
  });

  /// Обновляет информацию о команде.
  Future<Team> updateTeam({
    required UuidValue teamId,
    required String name,
    String? description,
  });

  /// Получает команду по ID.
  Future<Team> getTeam({
    required UuidValue teamId,
  });

  /// Получает список команд текущего пользователя.
  Future<List<Team>> getMyTeams();

  /// Получает список приглашений текущего пользователя.
  Future<List<TeamMember>> getMyInvitations();

  /// Принимает или отклоняет приглашение.
  Future<SuccessResponse> respondToInvitation({
    required UuidValue teamId,
    required bool accept,
  });

  /// Удаляет команду.
  Future<SuccessResponse> deleteTeam({
    required UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
  });
}
