import 'package:version_manager_client/version_manager_client.dart';

abstract interface class ApplicationRepository {
  /// Добавление нового приложения.
  Future<List<Application>> addAplication({
    required Application application,
  });

  /// Получение списка всех приложений.
  Future<List<Application>> getAllApplications();

  /// Редактирование приложения.
  Future<List<Application>> editApplication({
    required String changeablePackageName,
    required Application application,
  });

  /// Деактивация/Активация приложения.
  Future<List<Application>> deactivateApplication({
    required String packageName,
    required bool isActive,
  });

  /// Удаление приложения.
  Future<List<Application>> deleteApplication({
    required String packageName,
  });
}
