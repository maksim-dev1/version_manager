part of 'team_member_bloc.dart';

/// Состояния для TeamMemberBloc.
@freezed
sealed class TeamMemberState with _$TeamMemberState {
  /// Начальное состояние (готов к действию).
  const factory TeamMemberState.initial() = _Initial;

  /// Действие с участником выполняется.
  const factory TeamMemberState.actionInProgress() = TeamMemberActionInProgress;

  /// Действие с участником выполнено успешно (для SnackBar).
  const factory TeamMemberState.actionSuccess({
    required String message,
  }) = TeamMemberActionSuccess;

  /// Действие с участником завершилось ошибкой (для SnackBar).
  const factory TeamMemberState.actionError({
    required String message,
  }) = TeamMemberActionError;
}
