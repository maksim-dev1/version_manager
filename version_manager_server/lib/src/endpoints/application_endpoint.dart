import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

class ApplicationEndpoint extends Endpoint {
  /// Добавление нового приложения.
  ///
  Future<List<Application>> addAplication(
    Session session, {
    required Application application,
  }) async {
    /// Проверка на существование приложения с таким же packageName
    final existing = await Application.db.findFirstRow(
      session,
      where: (app) => app.packageName.equals(application.packageName),
    );

    /// Если приложение с таким packageName уже существует, выбрасываем исключение
    if (existing != null) {
      throw Exception(
        'Application with package name ${application.packageName} already exists.',
      );
    }

    /// Вставка нового приложения в базу данных
    await Application.db.insertRow(session, application);

    /// Получение и возврат обновленного списка всех приложений
    final applications = await Application.db.find(session);
    return applications;
  }

  /// Получение списка всех приложений.
  ///
  Future<List<Application>> getAllApplications(Session session) async {
    /// Получение и возврат списка всех приложений из базы данных
    final applications = await Application.db.find(session);
    return applications;
  }

  /// Редактирование приложения.
  ///
  Future<Application> editApplication(
    Session session, {
    required Application application,
  }) async {
    /// Поиск существующего приложения по packageName
    final app = await Application.db.findFirstRow(
      session,
      where: (app) => app.packageName.equals(application.packageName),
    );

    /// Если приложение не найдено, выбрасываем исключение
    if (app == null) {
      throw Exception(
        'Application with id ${application.packageName} does not exist.',
      );
    }

    /// Добавление времени обновления
    final appToUpdated = application.copyWith(
      updatedAt: DateTime.now(),
    );

    /// Обновление приложения
    final updatedApp = await Application.db.updateRow(session, appToUpdated);

    return updatedApp;
  }

  /// Деактивация/Активация приложения.
  ///
  Future<List<Application>> deactivateApplication(
    Session session, {
    required String packageName,
    required bool isActive,
  }) async {
    /// Поиск существующего приложения по packageName
    final app = await Application.db.findFirstRow(
      session,
      where: (app) => app.packageName.equals(packageName),
    );

    /// Если приложение не найдено, выбрасываем исключение
    if (app == null) {
      throw Exception(
        'Application with id $packageName does not exist.',
      );
    }

    /// Обновление статуса приложения
    app.isActive = isActive;

    /// Сохранение изменений в базе данных
    await Application.db.updateRow(
      session,
      app,
      columns: (column) => [column.isActive],
    );

    /// Получение и возврат обновленного списка всех приложений
    final applications = await Application.db.find(session);
    return applications;
  }

  /// Удаление приложения.
  ///
  Future<List<Application>> deleteApplication(
    Session session, {
    required String packageName,
  }) async {
    /// Поиск существующего приложения по packageName
    final app = await Application.db.findFirstRow(
      session,
      where: (app) => app.packageName.equals(packageName),
    );

    /// Если приложение не найдено, выбрасываем исключение
    if (app == null) {
      throw Exception(
        'Application with id $packageName does not exist.',
      );
    }

    /// Удаление приложения из базы данных
    await Application.db.deleteRow(session, app);

    /// Получение и возврат обновленного списка всех приложений
    final applications = await Application.db.find(session);
    return applications;
  }
}
