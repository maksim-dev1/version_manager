import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team_member/domain/repository/team_member_repository.dart';

part 'team_member_bloc.freezed.dart';
part 'team_member_event.dart';
part 'team_member_state.dart';

/// BLoC для управления участниками команды.
///
/// Отвечает за:
/// - Приглашение участников
/// - Удаление участников
/// - Изменение ролей
/// - Отзыв приглашений
/// - Выход из команды
/// - Передачу владения
///
/// После успешного действия эмитит [TeamMemberActionSuccess],
/// на который UI-слой реагирует перезагрузкой списка команд.
class TeamMemberBloc extends Bloc<TeamMemberEvent, TeamMemberState> {
  final TeamMemberRepository _teamMemberRepository;

  TeamMemberBloc({
    required TeamMemberRepository teamMemberRepository,
  }) : _teamMemberRepository = teamMemberRepository,
       super(const TeamMemberState.initial()) {
    on<TeamMemberEvent>(
      (event, emit) => switch (event) {
        _InviteMember(:final teamId, :final email, :final role) =>
          _onInviteMember(
            teamId: teamId,
            email: email,
            role: role,
            emit: emit,
          ),
        _RemoveMember(:final memberId) => _onRemoveMember(
          memberId: memberId,
          emit: emit,
        ),
        _UpdateMemberRole(:final memberId, :final newRole) =>
          _onUpdateMemberRole(
            memberId: memberId,
            newRole: newRole,
            emit: emit,
          ),
        _RevokeInvitation(:final memberId) => _onRevokeInvitation(
          memberId: memberId,
          emit: emit,
        ),
        _LeaveTeam(:final teamId) => _onLeaveTeam(
          teamId: teamId,
          emit: emit,
        ),
        _TransferOwnership(:final teamId, :final newOwnerId) =>
          _onTransferOwnership(
            teamId: teamId,
            newOwnerId: newOwnerId,
            emit: emit,
          ),
      },
    );
  }

  Future<void> _onInviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
    required Emitter<TeamMemberState> emit,
  }) async {
    emit(const TeamMemberState.actionInProgress());
    try {
      await _teamMemberRepository.inviteMember(
        teamId: teamId,
        email: email,
        role: role,
      );
      emit(
        TeamMemberState.actionSuccess(
          message: 'Приглашение отправлено на $email',
        ),
      );
    } catch (e) {
      emit(
        TeamMemberState.actionError(
          message: 'Не удалось отправить приглашение: $e',
        ),
      );
    }
  }

  Future<void> _onRemoveMember({
    required UuidValue memberId,
    required Emitter<TeamMemberState> emit,
  }) async {
    emit(const TeamMemberState.actionInProgress());
    try {
      await _teamMemberRepository.removeMember(memberId: memberId);
      emit(
        const TeamMemberState.actionSuccess(
          message: 'Участник удалён из команды',
        ),
      );
    } catch (e) {
      emit(
        TeamMemberState.actionError(
          message: 'Не удалось удалить участника: $e',
        ),
      );
    }
  }

  Future<void> _onUpdateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
    required Emitter<TeamMemberState> emit,
  }) async {
    emit(const TeamMemberState.actionInProgress());
    try {
      await _teamMemberRepository.updateMemberRole(
        memberId: memberId,
        newRole: newRole,
      );
      emit(
        const TeamMemberState.actionSuccess(
          message: 'Роль участника обновлена',
        ),
      );
    } catch (e) {
      emit(
        TeamMemberState.actionError(
          message: 'Не удалось обновить роль: $e',
        ),
      );
    }
  }

  Future<void> _onRevokeInvitation({
    required UuidValue memberId,
    required Emitter<TeamMemberState> emit,
  }) async {
    emit(const TeamMemberState.actionInProgress());
    try {
      await _teamMemberRepository.revokeInvitation(memberId: memberId);
      emit(
        const TeamMemberState.actionSuccess(
          message: 'Приглашение отозвано',
        ),
      );
    } catch (e) {
      emit(
        TeamMemberState.actionError(
          message: 'Не удалось отозвать приглашение: $e',
        ),
      );
    }
  }

  Future<void> _onLeaveTeam({
    required UuidValue teamId,
    required Emitter<TeamMemberState> emit,
  }) async {
    emit(const TeamMemberState.actionInProgress());
    try {
      await _teamMemberRepository.leaveTeam(teamId: teamId);
      emit(
        const TeamMemberState.actionSuccess(
          message: 'Вы покинули команду',
        ),
      );
    } catch (e) {
      emit(
        TeamMemberState.actionError(
          message: 'Не удалось покинуть команду: $e',
        ),
      );
    }
  }

  Future<void> _onTransferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
    required Emitter<TeamMemberState> emit,
  }) async {
    emit(const TeamMemberState.actionInProgress());
    try {
      await _teamMemberRepository.transferOwnership(
        teamId: teamId,
        newOwnerId: newOwnerId,
      );
      emit(
        const TeamMemberState.actionSuccess(
          message: 'Владение командой передано',
        ),
      );
    } catch (e) {
      emit(
        TeamMemberState.actionError(
          message: 'Не удалось передать владение: $e',
        ),
      );
    }
  }
}
