import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';

part 'version_action_bloc.freezed.dart';
part 'version_action_event.dart';
part 'version_action_state.dart';

/// BLoC для CUD-операций над версиями (создание, обновление, удаление).
///
/// После каждой успешной операции UI должен вызвать
/// [VersionBloc.loadVersions] для обновления списка.
class VersionActionBloc extends Bloc<VersionActionEvent, VersionActionState> {
  final VersionRepository _versionRepository;

  VersionActionBloc({required VersionRepository versionRepository})
    : _versionRepository = versionRepository,
      super(const VersionActionState.initial()) {
    on<VersionActionEvent>(
      (event, emit) => switch (event) {
        _CreateVersion(
          :final applicationId,
          :final versionNumber,
          :final buildNumber,
          :final changelog,
        ) =>
          _onCreateVersion(
            applicationId: applicationId,
            versionNumber: versionNumber,
            buildNumber: buildNumber,
            changelog: changelog,
            emit: emit,
          ),
        _UpdateVersion(
          :final versionId,
          :final versionNumber,
          :final buildNumber,
          :final changelog,
          :final isBlocked,
          :final blockReason,
          :final recommendedVersionId,
          :final clearRecommendation,
          :final recommendationFrequency,
          :final recommendationEveryNthLaunch,
          :final recommendationPeriodHours,
        ) =>
          _onUpdateVersion(
            versionId: versionId,
            versionNumber: versionNumber,
            buildNumber: buildNumber,
            changelog: changelog,
            isBlocked: isBlocked,
            blockReason: blockReason,
            recommendedVersionId: recommendedVersionId,
            clearRecommendation: clearRecommendation,
            recommendationFrequency: recommendationFrequency,
            recommendationEveryNthLaunch: recommendationEveryNthLaunch,
            recommendationPeriodHours: recommendationPeriodHours,
            emit: emit,
          ),
        _DeleteVersion(:final versionId) => _onDeleteVersion(
          versionId: versionId,
          emit: emit,
        ),
      },
    );
  }

  // ── Создание ──

  Future<void> _onCreateVersion({
    required UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    required Emitter<VersionActionState> emit,
  }) async {
    emit(const VersionActionState.loading());
    try {
      await _versionRepository.createVersion(
        applicationId: applicationId,
        versionNumber: versionNumber,
        buildNumber: buildNumber,
        changelog: changelog,
      );
      emit(const VersionActionState.success(message: 'Версия создана'));
    } catch (e) {
      emit(VersionActionState.error(message: e.toString()));
    }
  }

  // ── Обновление ──

  Future<void> _onUpdateVersion({
    required UuidValue versionId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    UuidValue? recommendedVersionId,
    bool? clearRecommendation,
    RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    required Emitter<VersionActionState> emit,
  }) async {
    emit(const VersionActionState.loading());
    try {
      await _versionRepository.updateVersion(
        versionId: versionId,
        versionNumber: versionNumber,
        buildNumber: buildNumber,
        changelog: changelog,
        isBlocked: isBlocked,
        blockReason: blockReason,
        recommendedVersionId: recommendedVersionId,
        clearRecommendation: clearRecommendation,
        recommendationFrequency: recommendationFrequency,
        recommendationEveryNthLaunch: recommendationEveryNthLaunch,
        recommendationPeriodHours: recommendationPeriodHours,
      );
      emit(const VersionActionState.success(message: 'Версия обновлена'));
    } catch (e) {
      emit(VersionActionState.error(message: e.toString()));
    }
  }

  // ── Удаление ──

  Future<void> _onDeleteVersion({
    required UuidValue versionId,
    required Emitter<VersionActionState> emit,
  }) async {
    emit(const VersionActionState.loading());
    try {
      final result = await _versionRepository.deleteVersion(
        versionId: versionId,
      );
      emit(
        VersionActionState.success(
          message: result.message ?? 'Версия удалена',
        ),
      );
    } catch (e) {
      emit(VersionActionState.error(message: e.toString()));
    }
  }
}
