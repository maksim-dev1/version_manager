import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';

part 'version_detail_bloc.freezed.dart';
part 'version_detail_event.dart';
part 'version_detail_state.dart';

/// BLoC для загрузки детальной информации о версии.
///
/// Используется в диалоге редактирования версии.
/// Каждый экземпляр создаётся при открытии диалога
/// и уничтожается при его закрытии.
class VersionDetailBloc extends Bloc<VersionDetailEvent, VersionDetailState> {
  final VersionRepository _versionRepository;

  VersionDetailBloc({required VersionRepository versionRepository})
    : _versionRepository = versionRepository,
      super(const VersionDetailState.initial()) {
    on<VersionDetailEvent>(
      (event, emit) => switch (event) {
        _LoadDetail(:final versionId) => _onLoadDetail(
          versionId: versionId,
          emit: emit,
        ),
      },
    );
  }

  Future<void> _onLoadDetail({
    required UuidValue versionId,
    required Emitter<VersionDetailState> emit,
  }) async {
    emit(const VersionDetailState.loading());
    try {
      final detail = await _versionRepository.getVersionDetail(
        versionId: versionId,
      );
      emit(VersionDetailState.loaded(detail: detail));
    } catch (e) {
      emit(VersionDetailState.error(message: e.toString()));
    }
  }
}
