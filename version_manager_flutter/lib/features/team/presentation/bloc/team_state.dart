part of 'team_bloc.dart';

/// Состояния для TeamBloc.
@freezed
sealed class TeamState with _$TeamState {
  /// Начальное состояние.
  const factory TeamState.initial() = Initial;

  /// Загрузка.
  const factory TeamState.teamLoading() = TeamLoading;

  /// Команды загружены.
  const factory TeamState.teamLoaded({
    required UuidValue? currentUserId,
    required List<Team> teams,
    required List<TeamMember> invitations,
  }) = TeamLoaded;

  /// Ошибка загрузки списка команд.
  const factory TeamState.teamError({required String message}) = TeamError;
}
