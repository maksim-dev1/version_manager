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
}
