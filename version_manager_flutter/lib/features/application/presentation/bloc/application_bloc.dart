import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';

part 'application_bloc.freezed.dart';
part 'application_event.dart';
part 'application_state.dart';

/// BLoC для управления приложениями.
///
/// Отвечает за:
/// - Загрузку списка приложений пользователя
/// - Создание, редактирование и удаление приложений
/// - Управление API ключами
/// - Активацию / деактивацию
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepository _applicationRepository;

  ApplicationBloc({
    required ApplicationRepository applicationRepository,
  }) : _applicationRepository = applicationRepository,
       super(const ApplicationState.initial()) {
    on<ApplicationEvent>(
      (event, emit) => switch (event) {
        _LoadApplications() => _onLoadApplications(emit: emit),
        _CreateApplication(
          :final namespace,
          :final name,
          :final description,
          :final iconUrl,
          :final platforms,
          :final ownerType,
          :final teamId,
          :final storeLinks,
        ) =>
          _onCreateApplication(
            namespace: namespace,
            name: name,
            description: description,
            iconUrl: iconUrl,
            platforms: platforms,
            ownerType: ownerType,
            teamId: teamId,
            storeLinks: storeLinks,
            emit: emit,
          ),
        _UpdateApplication(
          :final applicationId,
          :final name,
          :final description,
          :final iconUrl,
          :final platforms,
          :final storeLinks,
        ) =>
          _onUpdateApplication(
            applicationId: applicationId,
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
        _RegenerateApiKey(:final applicationId, :final code) =>
          _onRegenerateApiKey(
            applicationId: applicationId,
            code: code,
            emit: emit,
          ),
        _RequestApiKeyRegeneration(:final applicationId) =>
          _onRequestApiKeyRegeneration(
            applicationId: applicationId,
            emit: emit,
          ),
        _FetchRegenerationEmail(:final applicationId) =>
          _onFetchRegenerationEmail(
            applicationId: applicationId,
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

  Future<void> _emitLoaded(Emitter<ApplicationState> emit) async {
    final (applications, teams) = await (
      _applicationRepository.getMyApplications(),
      _applicationRepository.getMyTeams(),
    ).wait;
    emit(ApplicationState.loaded(applications: applications, teams: teams));
  }

  Future<void> _onLoadApplications({
    required Emitter<ApplicationState> emit,
  }) async {
    if (state is! ApplicationLoaded) {
      emit(const ApplicationState.loading());
    }
    try {
      await _emitLoaded(emit);
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  // ── Создание ──

  Future<void> _onCreateApplication({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<PlatformType> platforms,
    required OwnerType ownerType,
    UuidValue? teamId,
    List<StoreLinkEntry>? storeLinks,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      final response = await _applicationRepository.createApplication(
        namespace: namespace,
        name: name,
        description: description,
        iconUrl: iconUrl,
        platforms: platforms,
        ownerType: ownerType,
        teamId: teamId,
        storeLinks: storeLinks,
      );
      emit(
        ApplicationState.created(
          application: response.application,
          apiKey: response.apiKey,
        ),
      );
      await _emitLoaded(emit);
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
      await _emitLoaded(emit);
    }
  }

  // ── Обновление ──

  Future<void> _onUpdateApplication({
    required UuidValue applicationId,
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
        name: name,
        description: description,
        iconUrl: iconUrl,
        platforms: platforms,
        storeLinks: storeLinks,
      );
      await _emitLoaded(emit);
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
      await _emitLoaded(emit);
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
      await _emitLoaded(emit);
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
      await _emitLoaded(emit);
    }
  }

  // ── API ключ ──

  Future<void> _onRequestApiKeyRegeneration({
    required UuidValue applicationId,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      final response = await _applicationRepository.requestApiKeyRegeneration(
        applicationId: applicationId,
      );
      if (response.codeSent) {
        emit(
          ApplicationState.apiKeyRegenerationCodeSent(
            maskedEmail: response.maskedEmail,
          ),
        );
      } else {
        emit(
          ApplicationState.apiKeyRegenerationCodeSent(
            retryAfterSeconds: response.retryAfterSeconds,
            maskedEmail: response.maskedEmail,
          ),
        );
      }
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  Future<void> _onFetchRegenerationEmail({
    required UuidValue applicationId,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      final maskedEmail = await _applicationRepository
          .getRegenerationTargetEmail(
            applicationId: applicationId,
          );
      emit(
        ApplicationState.regenerationEmailLoaded(
          maskedEmail: maskedEmail,
        ),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  Future<void> _onRegenerateApiKey({
    required UuidValue applicationId,
    required String code,
    required Emitter<ApplicationState> emit,
  }) async {
    try {
      final response = await _applicationRepository.regenerateApiKey(
        applicationId: applicationId,
        code: code,
      );
      emit(
        ApplicationState.apiKeyRegenerated(
          apiKey: response.apiKey,
          regeneratedAt: response.regeneratedAt,
        ),
      );
      await _emitLoaded(emit);
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
      await _emitLoaded(emit);
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
      await _emitLoaded(emit);
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
      await _emitLoaded(emit);
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
      await _emitLoaded(emit);
    }
  }
}
