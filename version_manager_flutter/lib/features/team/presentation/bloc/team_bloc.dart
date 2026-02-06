import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/domain/repository/team_repository.dart';

part 'team_bloc.freezed.dart';
part 'team_event.dart';
part 'team_state.dart';

/// BLoC для управления командами и участниками.
///
/// Отвечает за:
/// - Загрузку списка команд пользователя
/// - Создание, редактирование и удаление команд
/// - Работу с приглашениями (ответ на приглашение)
/// - Управление участниками (приглашение, удаление, роли)
class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamRepository _teamRepository;

  TeamBloc({
    required TeamRepository teamRepository,
  }) : _teamRepository = teamRepository,
       super(const TeamState.initial()) {
    on<TeamEvent>(
      (event, emit) => switch (event) {
        _LoadTeams() => _onLoadTeams(emit: emit),
        _CreateTeam(:final name, :final description) => _onCreateTeam(
          name: name,
          description: description,
          emit: emit,
        ),
        _UpdateTeam(:final teamId, :final name, :final description) =>
          _onUpdateTeam(
            teamId: teamId,
            name: name,
            description: description,
            emit: emit,
          ),
        _DeleteTeam(
          :final teamId,
          :final transferAppsToOwner,
          :final confirmationName,
        ) =>
          _onDeleteTeam(
            teamId: teamId,
            transferAppsToOwner: transferAppsToOwner,
            confirmationName: confirmationName,
            emit: emit,
          ),
        _LoadInvitations() => _onLoadInvitations(emit: emit),
        _RespondToInvitation(:final teamId, :final accept) =>
          _onRespondToInvitation(
            teamId: teamId,
            accept: accept,
            emit: emit,
          ),
        // ── Управление участниками ──
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

  // ── Команды ──

  /// Загружает список команд пользователя.
  Future<void> _onLoadTeams({
    required Emitter<TeamState> emit,
  }) async {
    emit(const TeamState.teamLoading());
    try {
      final results = await Future.wait([
        _teamRepository.getCurrentUser(),
        _teamRepository.getMyTeams(),
        _teamRepository.getMyInvitations(),
      ]);
      final user = results[0] as UserPublic;
      final teams = results[1] as List<Team>;
      final invitations = results[2] as List<TeamMember>;
      emit(
        TeamState.teamLoaded(
          currentUserId: user.id,
          teams: teams,
          invitations: invitations,
        ),
      );
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  /// Обновляет команду.
  Future<void> _onUpdateTeam({
    required UuidValue teamId,
    required String name,
    String? description,
    required Emitter<TeamState> emit,
  }) async {
    try {
      await _teamRepository.updateTeam(
        teamId: teamId,
        name: name,
        description: description,
      );
      await _reloadTeams(emit: emit);
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  /// Создаёт новую команду.
  Future<void> _onCreateTeam({
    required String name,
    String? description,
    required Emitter<TeamState> emit,
  }) async {
    try {
      await _teamRepository.createTeam(
        name: name,
        description: description,
      );
      await _reloadTeams(emit: emit);
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  /// Удаляет команду.
  Future<void> _onDeleteTeam({
    required UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
    required Emitter<TeamState> emit,
  }) async {
    try {
      final teams = await _teamRepository.deleteTeam(
        teamId: teamId,
        transferAppsToOwner: transferAppsToOwner,
        confirmationName: confirmationName,
      );
      await _emitTeamsWithInvitations(teams: teams, emit: emit);
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  /// Загружает приглашения.
  Future<void> _onLoadInvitations({
    required Emitter<TeamState> emit,
  }) async {
    try {
      final invitations = await _teamRepository.getMyInvitations();
      final currentState = state;
      if (currentState is TeamLoaded) {
        emit(currentState.copyWith(invitations: invitations));
      }
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  /// Отвечает на приглашение.
  Future<void> _onRespondToInvitation({
    required UuidValue teamId,
    required bool accept,
    required Emitter<TeamState> emit,
  }) async {
    try {
      final teams = await _teamRepository.respondToInvitation(
        teamId: teamId,
        accept: accept,
      );
      await _emitTeamsWithInvitations(teams: teams, emit: emit);
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  // ── Участники команды ──

  /// Перезагрузить список команд (без показа загрузки).
  Future<void> _reloadTeams({
    required Emitter<TeamState> emit,
  }) async {
    final results = await Future.wait([
      _teamRepository.getCurrentUser(),
      _teamRepository.getMyTeams(),
      _teamRepository.getMyInvitations(),
    ]);
    final user = results[0] as UserPublic;
    final teams = results[1] as List<Team>;
    final invitations = results[2] as List<TeamMember>;
    emit(TeamState.teamLoaded(
      currentUserId: user.id,
      teams: teams,
      invitations: invitations,
    ));
  }

  /// Обновить UI с уже полученным списком команд + догрузить приглашения.
  Future<void> _emitTeamsWithInvitations({
    required List<Team> teams,
    required Emitter<TeamState> emit,
  }) async {
    final invitations = await _teamRepository.getMyInvitations();
    final currentState = state;
    final currentUserId =
        currentState is TeamLoaded ? currentState.currentUserId : null;

    emit(TeamState.teamLoaded(
      currentUserId: currentUserId,
      teams: teams,
      invitations: invitations,
    ));
  }

  /// Вспомогательный метод: выполняет действие с участником,
  /// использует возвращённый сервером список команд для обновления UI,
  /// показывает результат через [MemberActionSuccess].
  Future<void> _performMemberAction({
    required Future<List<Team>> Function() action,
    required String successMessage,
    required String errorPrefix,
    required Emitter<TeamState> emit,
  }) async {
    try {
      final teams = await action();
      final invitations = await _teamRepository.getMyInvitations();
      final currentState = state;
      final currentUserId =
          currentState is TeamLoaded ? currentState.currentUserId : null;

      emit(TeamState.memberActionSuccess(message: successMessage));
      emit(TeamState.teamLoaded(
        currentUserId: currentUserId,
        teams: teams,
        invitations: invitations,
      ));
    } catch (e) {
      emit(
        TeamState.memberActionError(
          message: '$errorPrefix: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onInviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
    required Emitter<TeamState> emit,
  }) async {
    await _performMemberAction(
      action: () => _teamRepository.inviteMember(
        teamId: teamId,
        email: email,
        role: role,
      ),
      successMessage: 'Приглашение отправлено на $email',
      errorPrefix: 'Не удалось отправить приглашение',
      emit: emit,
    );
  }

  Future<void> _onRemoveMember({
    required UuidValue memberId,
    required Emitter<TeamState> emit,
  }) async {
    await _performMemberAction(
      action: () => _teamRepository.removeMember(memberId: memberId),
      successMessage: 'Участник удалён из команды',
      errorPrefix: 'Не удалось удалить участника',
      emit: emit,
    );
  }

  Future<void> _onUpdateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
    required Emitter<TeamState> emit,
  }) async {
    await _performMemberAction(
      action: () => _teamRepository.updateMemberRole(
        memberId: memberId,
        newRole: newRole,
      ),
      successMessage: 'Роль участника обновлена',
      errorPrefix: 'Не удалось обновить роль',
      emit: emit,
    );
  }

  Future<void> _onRevokeInvitation({
    required UuidValue memberId,
    required Emitter<TeamState> emit,
  }) async {
    await _performMemberAction(
      action: () => _teamRepository.revokeInvitation(memberId: memberId),
      successMessage: 'Приглашение отозвано',
      errorPrefix: 'Не удалось отозвать приглашение',
      emit: emit,
    );
  }

  Future<void> _onLeaveTeam({
    required UuidValue teamId,
    required Emitter<TeamState> emit,
  }) async {
    await _performMemberAction(
      action: () => _teamRepository.leaveTeam(teamId: teamId),
      successMessage: 'Вы покинули команду',
      errorPrefix: 'Не удалось покинуть команду',
      emit: emit,
    );
  }

  Future<void> _onTransferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
    required Emitter<TeamState> emit,
  }) async {
    await _performMemberAction(
      action: () => _teamRepository.transferOwnership(
        teamId: teamId,
        newOwnerId: newOwnerId,
      ),
      successMessage: 'Владение командой передано',
      errorPrefix: 'Не удалось передать владение',
      emit: emit,
    );
  }
}
