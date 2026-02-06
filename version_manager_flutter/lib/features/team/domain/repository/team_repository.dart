import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления командами и участниками.
///
/// Отвечает за:
/// - CRUD операции с командами
/// - Работу с приглашениями (загрузка, ответ)
/// - Получение текущего пользователя
/// - Управление участниками (приглашение, удаление, роли)
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
  Future<List<Team>> respondToInvitation({
    required UuidValue teamId,
    required bool accept,
  });

  /// Удаляет команду.
  Future<List<Team>> deleteTeam({
    required UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
  });

  // ── Участники команды ──

  /// Получает список участников команды.
  Future<List<TeamMember>> getTeamMembers({
    required UuidValue teamId,
  });

  /// Приглашает пользователя в команду.
  Future<List<Team>> inviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
  });

  /// Отзывает приглашение.
  Future<List<Team>> revokeInvitation({
    required UuidValue memberId,
  });

  /// Обновляет роль участника.
  Future<List<Team>> updateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
  });

  /// Удаляет участника из команды.
  Future<List<Team>> removeMember({
    required UuidValue memberId,
  });

  /// Покидает команду.
  Future<List<Team>> leaveTeam({
    required UuidValue teamId,
  });

  /// Передаёт владение командой.
  Future<List<Team>> transferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
  });
}
