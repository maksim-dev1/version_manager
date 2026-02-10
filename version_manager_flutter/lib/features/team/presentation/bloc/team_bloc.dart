import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/domain/repository/team_repository.dart';

part 'team_bloc.freezed.dart';
part 'team_event.dart';
part 'team_state.dart';

/// BLoC для управления командами.
///
/// Отвечает за:
/// - Загрузку списка команд пользователя
/// - Создание, редактирование и удаление команд
/// - Работу с приглашениями (ответ на приглашение)
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
      },
    );
  }

  // ── Команды ──

  /// Загружает список команд пользователя.
  ///
  /// Показывает индикатор загрузки только при первом запуске.
  /// При повторных вызовах обновляет данные без спиннера.
  Future<void> _onLoadTeams({
    required Emitter<TeamState> emit,
  }) async {
    if (state is! TeamLoaded) {
      emit(const TeamState.teamLoading());
    }
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
      await _teamRepository.deleteTeam(
        teamId: teamId,
        transferAppsToOwner: transferAppsToOwner,
        confirmationName: confirmationName,
      );
      await _reloadTeams(emit: emit);
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
      await _teamRepository.respondToInvitation(
        teamId: teamId,
        accept: accept,
      );
      await _reloadTeams(emit: emit);
    } catch (e) {
      emit(TeamState.teamError(message: e.toString()));
    }
  }

  // ── Вспомогательные методы ──

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
    emit(
      TeamState.teamLoaded(
        currentUserId: user.id,
        teams: teams,
        invitations: invitations,
      ),
    );
  }
}
