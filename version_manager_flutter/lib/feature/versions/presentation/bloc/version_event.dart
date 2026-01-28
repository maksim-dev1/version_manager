// part of 'version_bloc.dart';

// @freezed
// sealed class VersionEvent with _$VersionEvent {
//   const factory VersionEvent.addVersion({
//     required UuidValue applicationId,
//     required String version,
//     required int buildNumber,
//     required String changelog,
//     List<Platform>? platforms,
//     List<StoreLinks>? storeLinks,
//   }) = _AddVersion;

//   const factory VersionEvent.getAllVersions() = _GetAllVersions;

//   const factory VersionEvent.getVersionsByFilters({
//     required UuidValue applicationId,
//     Platform? platform,
//   }) = _GetVersionsByFilters;

//   const factory VersionEvent.updateVersion({
//     required AppVersion appVersion,
//   }) = _UpdateVersion;

//   const factory VersionEvent.blockUnblockVersion({
//     required UuidValue id,
//     required bool isBlocked,
//     required String reason,
//   }) = _BlockUnblockVersion;

//   const factory VersionEvent.deleteVersion({
//     required AppVersion version,
//   }) = _DeleteVersion;


// }
