part of 'team_member_bloc.dart';

/// События для TeamMemberBloc.
@freezed
sealed class TeamMemberEvent with _$TeamMemberEvent {
  /// Пригласить участника в команду.
  const factory TeamMemberEvent.inviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
  }) = _InviteMember;

  /// Удалить участника из команды.
  const factory TeamMemberEvent.removeMember({
    required UuidValue memberId,
  }) = _RemoveMember;

  /// Обновить роль участника.
  const factory TeamMemberEvent.updateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
  }) = _UpdateMemberRole;

  /// Отозвать приглашение.
  const factory TeamMemberEvent.revokeInvitation({
    required UuidValue memberId,
  }) = _RevokeInvitation;

  /// Покинуть команду.
  const factory TeamMemberEvent.leaveTeam({
    required UuidValue teamId,
  }) = _LeaveTeam;

  /// Передать владение командой.
  const factory TeamMemberEvent.transferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
  }) = _TransferOwnership;
}
