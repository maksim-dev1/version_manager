part of 'team_bloc.dart';

/// События для TeamBloc.
@freezed
sealed class TeamEvent with _$TeamEvent {
  /// Загрузить команды пользователя.
  const factory TeamEvent.loadTeams() = _LoadTeams;

  /// Создать новую команду.
  const factory TeamEvent.createTeam({
    required String name,
    String? description,
  }) = _CreateTeam;

  /// Обновить команду.
  const factory TeamEvent.updateTeam({
    required UuidValue teamId,
    required String name,
    String? description,
  }) = _UpdateTeam;

  /// Удалить команду.
  const factory TeamEvent.deleteTeam({
    required UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
  }) = _DeleteTeam;

  /// Загрузить приглашения.
  const factory TeamEvent.loadInvitations() = _LoadInvitations;

  /// Ответить на приглашение.
  const factory TeamEvent.respondToInvitation({
    required UuidValue teamId,
    required bool accept,
  }) = _RespondToInvitation;

  // ── Управление участниками ──

  /// Пригласить участника в команду.
  const factory TeamEvent.inviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
  }) = _InviteMember;

  /// Удалить участника из команды.
  const factory TeamEvent.removeMember({
    required UuidValue memberId,
  }) = _RemoveMember;

  /// Обновить роль участника.
  const factory TeamEvent.updateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
  }) = _UpdateMemberRole;

  /// Отозвать приглашение.
  const factory TeamEvent.revokeInvitation({
    required UuidValue memberId,
  }) = _RevokeInvitation;

  /// Покинуть команду.
  const factory TeamEvent.leaveTeam({
    required UuidValue teamId,
  }) = _LeaveTeam;

  /// Передать владение командой.
  const factory TeamEvent.transferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
  }) = _TransferOwnership;
}
