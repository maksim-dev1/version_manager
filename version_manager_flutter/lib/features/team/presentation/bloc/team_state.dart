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

  /// Действие с участником выполнено успешно (для SnackBar).
  const factory TeamState.memberActionSuccess({
    required String message,
  }) = MemberActionSuccess;

  /// Действие с участником завершилось ошибкой (для SnackBar).
  const factory TeamState.memberActionError({
    required String message,
  }) = MemberActionError;
}
