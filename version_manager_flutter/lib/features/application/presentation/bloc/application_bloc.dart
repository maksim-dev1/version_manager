import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';

part 'application_bloc.freezed.dart';
part 'application_event.dart';
part 'application_state.dart';

/// BLoC для управления списком приложений.
///
/// Отвечает за:
/// - Загрузку списка приложений пользователя
/// - Редактирование и удаление приложений
/// - Активацию / деактивацию
/// - Передачу владения
///
/// Создание вынесено в CreateApplicationBloc.
/// Регенерация API ключа — в ApiKeyBloc.
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepository _applicationRepository;

  ApplicationBloc({
    required ApplicationRepository applicationRepository,
  }) : _applicationRepository = applicationRepository,
       super(const ApplicationState.initial()) {
    on<ApplicationEvent>(
      (event, emit) => switch (event) {
        _LoadApplications() => _onLoadApplications(emit: emit),
        _UpdateApplication(
          :final applicationId,
          :final namespace,
          :final name,
          :final description,
          :final iconUrl,
          :final platforms,
          :final storeLinks,
        ) =>
          _onUpdateApplication(
            applicationId: applicationId,
            namespace: namespace,
            name: name,
            description: description,
            iconUrl: iconUrl,
            platforms: platforms,
            storeLinks: storeLinks,
            emit: emit,
          ),
        _DeleteApplication(:final applicationId, :final confirmationName) =>
          _onDeleteApplication(
            applicationId: applicationId,
            confirmationName: confirmationName,
            emit: emit,
          ),
        _ToggleApplicationStatus(:final applicationId, :final isActive) =>
          _onToggleApplicationStatus(
            applicationId: applicationId,
            isActive: isActive,
            emit: emit,
          ),
        _TransferApplicationOwnership(
          :final applicationId,
          :final newOwnerType,
          :final newTeamId,
        ) =>
          _onTransferApplicationOwnership(
            applicationId: applicationId,
            newOwnerType: newOwnerType,
            newTeamId: newTeamId,
            emit: emit,
          ),
      },
    );
  }

  // ── Загрузка ──

  Future<void> _onLoadApplications({
    required Emitter<ApplicationState> emit,
  }) async {
    if (state is! ApplicationLoaded) {
      emit(const ApplicationState.loading());
    }
    try {
      final applications = await _applicationRepository.getMyApplications();
      final teams = await _applicationRepository.getMyTeams();
      emit(
        ApplicationState.loaded(applications: applications, teams: teams),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  // ── Обновление ──

  Future<void> _onUpdateApplication({
    required UuidValue applicationId,
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<PlatformType>? platforms,
    List<StoreLinkEntry>? storeLinks,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      await _applicationRepository.updateApplication(
        applicationId: applicationId,
        namespace: namespace,
        name: name,
        description: description,
        iconUrl: iconUrl,
        platforms: platforms,
        storeLinks: storeLinks,
      );
      final applications = await _applicationRepository.getMyApplications();
      final teams = await _applicationRepository.getMyTeams();
      emit(
        ApplicationState.loaded(applications: applications, teams: teams),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  // ── Удаление ──

  Future<void> _onDeleteApplication({
    required UuidValue applicationId,
    required String confirmationName,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      await _applicationRepository.deleteApplication(
        applicationId: applicationId,
        confirmationName: confirmationName,
      );
      final applications = await _applicationRepository.getMyApplications();
      final teams = await _applicationRepository.getMyTeams();
      emit(
        ApplicationState.loaded(applications: applications, teams: teams),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  // ── Статус ──

  Future<void> _onToggleApplicationStatus({
    required UuidValue applicationId,
    required bool isActive,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      await _applicationRepository.toggleApplicationStatus(
        applicationId: applicationId,
        isActive: isActive,
      );
      final applications = await _applicationRepository.getMyApplications();
      final teams = await _applicationRepository.getMyTeams();
      emit(
        ApplicationState.loaded(applications: applications, teams: teams),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  // ── Передача владения ──

  Future<void> _onTransferApplicationOwnership({
    required UuidValue applicationId,
    required OwnerType newOwnerType,
    UuidValue? newTeamId,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      await _applicationRepository.transferApplicationOwnership(
        applicationId: applicationId,
        newOwnerType: newOwnerType,
        newTeamId: newTeamId,
      );
      final applications = await _applicationRepository.getMyApplications();
      final teams = await _applicationRepository.getMyTeams();
      emit(
        ApplicationState.loaded(applications: applications, teams: teams),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }
}
