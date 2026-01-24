import 'package:version_manager_client/src/protocol/application.dart';
import 'package:version_manager_flutter/feature/applications/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/shared/services/api_client_service.dart';

class ApplicationRepositoryImpl implements ApplicationRepository {
  final ApiClientService _apiService;

  ApplicationRepositoryImpl({required ApiClientService apiService})
    : _apiService = apiService;

  @override
  Future<List<Application>> addAplication({
    required Application application,
  }) async {
    final applications = await _apiService.client.application.addAplication(
      application: application,
    );

    return applications;
  }

  @override
  Future<List<Application>> deactivateApplication({
    required String packageName,
    required bool isActive,
  }) async {
    final applications = await _apiService.client.application.deactivateApplication(
      packageName: packageName,
      isActive: isActive,
    );

    return applications;
  }

  @override
  Future<List<Application>> deleteApplication({
    required String packageName,
  }) async {
    final applications = await _apiService.client.application.deleteApplication(
      packageName: packageName,
    );

    return applications;
  }

  @override
  Future<List<Application>> editApplication({
    required String changeablePackageName,
    required Application application,
  }) async {
    final applications = await _apiService.client.application.editApplication(
      changeablePackageName: changeablePackageName,
      application: application,
    );

    return applications;
  }

  @override
  Future<List<Application>> getAllApplications() async {
    final applications = await _apiService.client.application.getAllApplications();

    return applications;
  }
}
