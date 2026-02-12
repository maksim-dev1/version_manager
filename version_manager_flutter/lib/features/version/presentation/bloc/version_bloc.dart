import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';

part 'version_bloc.freezed.dart';
part 'version_event.dart';
part 'version_state.dart';

/// BLoC для управления списком версий приложения.
///
/// Отвечает ТОЛЬКО за:
/// - Загрузку списка версий
/// - Быструю блокировку/разблокировку
///
/// CUD-операции вынесены в VersionActionBloc.
/// Загрузка деталей — в VersionDetailBloc.
class VersionBloc extends Bloc<VersionEvent, VersionState> {
  final VersionRepository _versionRepository;

  VersionBloc({required VersionRepository versionRepository})
    : _versionRepository = versionRepository,
      super(const VersionState.initial()) {
    on<VersionEvent>(
      (event, emit) => switch (event) {
        _LoadVersions(:final applicationId) => _onLoadVersions(
          applicationId: applicationId,
          emit: emit,
        ),
        _ToggleVersionBlock(
          :final versionId,
          :final isBlocked,
          :final blockReason,
          :final applicationId,
        ) =>
          _onToggleVersionBlock(
            versionId: versionId,
            isBlocked: isBlocked,
            blockReason: blockReason,
            applicationId: applicationId,
            emit: emit,
          ),
      },
    );
  }

  // ── Загрузка списка ──

  Future<void> _onLoadVersions({
    required UuidValue applicationId,
    required Emitter<VersionState> emit,
  }) async {
    if (state is! VersionLoaded) {
      emit(const VersionState.loading());
    }
    try {
      final response = await _versionRepository.getVersions(
        applicationId: applicationId,
      );
      emit(
        VersionState.loaded(
          application: response.application,
          versions: response.versions,
        ),
      );
    } catch (e) {
      emit(VersionState.error(message: e.toString()));
    }
  }

  // ── Блокировка ──

  Future<void> _onToggleVersionBlock({
    required UuidValue versionId,
    required bool isBlocked,
    String? blockReason,
    required UuidValue applicationId,
    required Emitter<VersionState> emit,
  }) async {
    try {
      await _versionRepository.toggleVersionBlock(
        versionId: versionId,
        isBlocked: isBlocked,
        blockReason: blockReason,
      );
      final response = await _versionRepository.getVersions(
        applicationId: applicationId,
      );
      emit(
        VersionState.loaded(
          application: response.application,
          versions: response.versions,
        ),
      );
    } catch (e) {
      emit(VersionState.error(message: e.toString()));
    }
  }
}
