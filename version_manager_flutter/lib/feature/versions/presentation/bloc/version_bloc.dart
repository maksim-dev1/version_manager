// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/feature/versions/domain/repository/version_repository.dart';

// part 'version_event.dart';
// part 'version_state.dart';
// part 'version_bloc.freezed.dart';

// class VersionBloc extends Bloc<VersionEvent, VersionState> {
//   final VersionRepository _versionRepository;
//   VersionBloc({required VersionRepository versionRepository})
//     : _versionRepository = versionRepository,
//       super(VersionState.versionLoading()) {
//     on<VersionEvent>(
//       (event, emit) => switch (event) {
//         _AddVersion(
//           :final applicationId,
//           :final version,
//           :final buildNumber,
//           :final changelog,
//           :final platforms,
//           :final storeLinks,
//         ) =>
//           _addVersion(
//             emit: emit,
//             applicationId: applicationId,
//             version: version,
//             buildNumber: buildNumber,
//             changelog: changelog,
//             platforms: platforms,
//             storeLinks: storeLinks,
//           ),
//         _GetAllVersions() => _getAllVersions(emit: emit),
//         _GetVersionsByFilters(:final applicationId, :final platform) =>
//           _getVersionsByFilters(
//             emit: emit,
//             applicationId: applicationId,
//             platform: platform,
//           ),
//         _UpdateVersion(:final appVersion) => _updateVersion(
//           emit: emit,
//           appVersion: appVersion,
//         ),
//         _BlockUnblockVersion(
//           :final id,
//           :final isBlocked,
//           :final reason,
//         ) =>
//           _blockUnblockVersion(
//             emit: emit,
//             id: id,
//             isBlocked: isBlocked,
//             reason: reason,
//           ),
//         _DeleteVersion(:final version) => _deleteVersion(
//           emit: emit,
//           version: version,
//         ),
//       },
//     );
//   }

//   Future<void> _addVersion({
//     required Emitter<VersionState> emit,
//     required UuidValue applicationId,
//     required String version,
//     required int buildNumber,
//     required String changelog,
//     List<Platform>? platforms,
//     List<StoreLinks>? storeLinks,
//   }) async {
//     emit(VersionState.versionLoading());
//     try {
//       final versions = await _versionRepository.addVersion(
//         applicationId: applicationId,
//         version: version,
//         buildNumber: buildNumber,
//         changelog: changelog,
//         platforms: platforms,
//         storeLinks: storeLinks,
//       );
//       emit(VersionState.versionLoaded(versions: versions));
//     } catch (e) {
//       emit(VersionState.versionError(message: e.toString()));
//     }
//   }

//   Future<void> _getAllVersions({required Emitter<VersionState> emit}) async {
//     emit(VersionState.versionLoading());
//     try {
//       final versions = await _versionRepository.getAllVersions();
//       emit(VersionState.versionLoaded(versions: versions));
//     } catch (e) {
//       emit(VersionState.versionError(message: e.toString()));
//     }
//   }

//   Future<void> _getVersionsByFilters({
//     required Emitter<VersionState> emit,
//     required UuidValue applicationId,
//     Platform? platform,
//   }) async {
//     emit(VersionState.versionLoading());
//     try {
//       final versions = await _versionRepository.getVersionsByFilters(
//         applicationId: applicationId,
//         platform: platform,
//       );
//       emit(VersionState.versionLoaded(versions: versions));
//     } catch (e) {
//       emit(VersionState.versionError(message: e.toString()));
//     }
//   }

//   Future<void> _updateVersion({
//     required Emitter<VersionState> emit,
//     required AppVersion appVersion,
//   }) async {
//     emit(VersionState.versionLoading());
//     try {
//       final versions = await _versionRepository.updateVersion(
//         appVersion: appVersion,
//       );
//       emit(VersionState.versionLoaded(versions: versions));
//     } catch (e) {
//       emit(VersionState.versionError(message: e.toString()));
//     }
//   }

//   Future<void> _blockUnblockVersion({
//     required Emitter<VersionState> emit,
//     required UuidValue id,
//     required bool isBlocked,
//     required String reason,
//   }) async {
//     emit(VersionState.versionLoading());
//     try {
//       final versions = await _versionRepository.blockUnblockVersion(
//         id: id,
//         isBlocked: isBlocked,
//         reason: reason,
//       );
//       emit(VersionState.versionLoaded(versions: versions));
//     } catch (e) {
//       emit(VersionState.versionError(message: e.toString()));
//     }
//   }

//   Future<void> _deleteVersion({
//     required Emitter<VersionState> emit,
//     required AppVersion version,
//   }) async {
//     emit(VersionState.versionLoading());
//     try {
//       final versions = await _versionRepository.deleteVersion(
//         version: version,
//       );
//       emit(VersionState.versionLoaded(versions: versions));
//     } catch (e) {
//       emit(VersionState.versionError(message: e.toString()));
//     }
//   }
// }
