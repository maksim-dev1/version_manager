import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления участниками команды.
///
/// Отвечает за:
/// - Приглашение и удаление участников
/// - Изменение ролей
/// - Отзыв приглашений
/// - Выход из команды
/// - Передачу владения
abstract interface class TeamMemberRepository {
  /// Получает список участников команды.
  Future<List<TeamMember>> getTeamMembers({
    required UuidValue teamId,
  });

  /// Приглашает пользователя в команду.
  Future<SuccessResponse> inviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
  });

  /// Отзывает приглашение.
  Future<SuccessResponse> revokeInvitation({
    required UuidValue memberId,
  });

  /// Обновляет роль участника.
  Future<SuccessResponse> updateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
  });

  /// Удаляет участника из команды.
  Future<SuccessResponse> removeMember({
    required UuidValue memberId,
  });

  /// Покидает команду.
  Future<SuccessResponse> leaveTeam({
    required UuidValue teamId,
  });

  /// Передаёт владение командой.
  Future<SuccessResponse> transferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
  });
}
