// import 'package:uuid/uuid_value.dart';
// import 'package:version_manager_client/src/protocol/app_version.dart';
// import 'package:version_manager_client/src/protocol/enums/platform.dart';
// import 'package:version_manager_client/src/protocol/store_links.dart';
// import 'package:version_manager_flutter/feature/versions/domain/repository/version_repository.dart';
// import 'package:version_manager_flutter/shared/services/api_client_service.dart';

// class VersionRepositoryImpl implements VersionRepository {
//   final ApiClientService _apiService;

//   VersionRepositoryImpl({required ApiClientService apiService})
//     : _apiService = apiService;

//   @override
//   Future<List<AppVersion>> addVersion({
//     required UuidValue applicationId,
//     required String version,
//     required int buildNumber,
//     required String changelog,
//     List<Platform>? platforms,
//     List<StoreLinks>? storeLinks,
//   }) async {
//     final versions = await _apiService.client.version.addVersion(
//       applicationId: applicationId,
//       version: version,
//       buildNumber: buildNumber,
//       changelog: changelog,
//       platforms: platforms,
//       storeLinks: storeLinks,
//     );

//     return versions;
//   }

//   @override
//   Future<List<AppVersion>> blockUnblockVersion({
//     required UuidValue id,
//     required bool isBlocked,
//     required String reason,
//   }) async {
//     final versions = await _apiService.client.version.blockUnblockVersion(
//       id: id,
//       isBlocked: isBlocked,
//       reason: reason,
//     );

//     return versions;
//   }

//   @override
//   Future<List<AppVersion>> deleteVersion({required AppVersion version}) async {
//     final versions = await _apiService.client.version.deleteVersion(
//       version: version,
//     );

//     return versions;
//   }

//   @override
//   Future<List<AppVersion>> getAllVersions() async {
//     final versions = await _apiService.client.version.getAllVersions();
//     return versions;
//   }

//   @override
//   Future<List<AppVersion>> getVersionsByFilters({
//     required UuidValue applicationId,
//     Platform? platform,
//   }) async {
//     final versions = await _apiService.client.version.getVersionsByFilters(
//       applicationId: applicationId,
//       platform: platform,
//     );

//     return versions;
//   }

//   @override
//   Future<List<AppVersion>> updateVersion({required AppVersion appVersion}) async {
//     final updatedVersion = await _apiService.client.version.updateVersion(
//       appVersion: appVersion,
//     );

//     return updatedVersion;
//   }
// }
