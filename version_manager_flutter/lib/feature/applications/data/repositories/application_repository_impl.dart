import 'package:version_manager_client/src/protocol/application.dart';
import 'package:version_manager_flutter/feature/applications/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/shared/services/api_service.dart';

class ApplicationRepositoryImpl implements ApplicationRepository {
  final ApiService _apiService;

  ApplicationRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<List<Application>> addAplication({
    required Application application,
  }) {
    final applications = _apiService.client.application.addAplication(
      application: application,
    );

    return applications;
  }

  @override
  Future<List<Application>> deactivateApplication({
    required String packageName,
    required bool isActive,
  }) {
    final applications = _apiService.client.application.deactivateApplication(
      packageName: packageName,
      isActive: isActive,
    );

    return applications;
  }

  @override
  Future<List<Application>> deleteApplication({
    required String packageName,
  }) {
    final applications = _apiService.client.application.deleteApplication(
      packageName: packageName,
    );

    return applications;
  }

  @override
  Future<Application> editApplication({
    required Application application,
  }) {
    final updatedApplication = _apiService.client.application.editApplication(
      application: application,
    );

    return updatedApplication;
  }

  @override
  Future<List<Application>> getAllApplications() {
    final applications = _apiService.client.application.getAllApplications();

    return applications;
  }
}
