import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

class ApplicationEndpoint extends Endpoint {
  /// Добавление нового приложения.
  ///
  Future<List<Application>> addAplication(
    Session session, {
    required Application application,
  }) async {
    try {
      // Валидация входных данных
      if (application.packageName.trim().isEmpty) {
        throw ArgumentError('Package name cannot be empty');
      }

      if (application.appName.trim().isEmpty) {
        throw ArgumentError('Application name cannot be empty');
      }

      /// Проверка на существование приложения с таким же packageName
      final existing = await Application.db.findFirstRow(
        session,
        where: (app) => app.packageName.equals(application.packageName),
      );

      /// Если приложение с таким packageName уже существует, выбрасываем исключение
      if (existing != null) {
        throw StateError(
          'Application with package name "${application.packageName}" already exists.',
        );
      }

      /// Вставка нового приложения в базу данных
      await Application.db.insertRow(session, application);

      /// Получение и возврат обновленного списка всех приложений
      final applications = await Application.db.find(session);
      return applications;
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in addAplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log('State error in addAplication: $e', level: LogLevel.warning);
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in addAplication: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to add application: ${e.toString()}');
    }
  }

  /// Получение списка всех приложений.
  ///
  Future<List<Application>> getAllApplications(Session session) async {
    // Проверка авторизации

    try {
      /// Получение и возврат списка всех приложений из базы данных
      final applications = await Application.db.find(session);
      return applications;
    } catch (e, stackTrace) {
      session.log(
        'Error fetching applications: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to fetch applications: ${e.toString()}');
    }
  }

  /// Редактирование приложения.
  ///
  Future<List<Application>> editApplication(
    Session session, {
    required String changeablePackageName,
    required Application application,
  }) async {
    try {
      // Валидация входных данных
      if (application.packageName.trim().isEmpty) {
        throw ArgumentError('Package name cannot be empty');
      }

      if (application.appName.trim().isEmpty) {
        throw ArgumentError('Application name cannot be empty');
      }

      /// Поиск существующего приложения по packageName
      final existingApp = await Application.db.findFirstRow(
        session,
        where: (app) => app.packageName.equals(changeablePackageName),
      );

      /// Если приложение не найдено, выбрасываем исключение
      if (existingApp == null) {
        throw StateError(
          'Application with package name "$changeablePackageName" does not exist.',
        );
      }

      /// Добавление времени обновления
      final appToUpdated = application.copyWith(
        id: existingApp.id,
        updatedAt: DateTime.now(),
      );

      /// Обновление приложения
      await Application.db.updateRow(session, appToUpdated);

      final applications = await Application.db.find(session);

      return applications;
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in editApplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log(
        'State error in editApplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in editApplication: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to update application: ${e.toString()}');
    }
  }

  /// Деактивация/Активация приложения.
  ///
  Future<List<Application>> deactivateApplication(
    Session session, {
    required String packageName,
    required bool isActive,
  }) async {
    // Проверка авторизации

    try {
      // Валидация входных данных
      if (packageName.trim().isEmpty) {
        throw ArgumentError('Package name cannot be empty');
      }

      /// Поиск существующего приложения по packageName
      final app = await Application.db.findFirstRow(
        session,
        where: (app) => app.packageName.equals(packageName),
      );

      /// Если приложение не найдено, выбрасываем исключение
      if (app == null) {
        throw StateError(
          'Application with package name "$packageName" does not exist.',
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
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in deactivateApplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log(
        'State error in deactivateApplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in deactivateApplication: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to update application status: ${e.toString()}');
    }
  }

  /// Удаление приложения.
  ///
  Future<List<Application>> deleteApplication(
    Session session, {
    required String packageName,
  }) async {
    // Проверка авторизации

    try {
      // Валидация входных данных
      if (packageName.trim().isEmpty) {
        throw ArgumentError('Package name cannot be empty');
      }

      /// Поиск существующего приложения по packageName
      final app = await Application.db.findFirstRow(
        session,
        where: (app) => app.packageName.equals(packageName),
      );

      /// Если приложение не найдено, выбрасываем исключение
      if (app == null) {
        throw StateError(
          'Application with package name "$packageName" does not exist.',
        );
      }

      /// Удаление приложения из базы данных
      await Application.db.deleteRow(session, app);

      /// Получение и возврат обновленного списка всех приложений
      final applications = await Application.db.find(session);
      return applications;
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in deleteApplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log(
        'State error in deleteApplication: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in deleteApplication: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete application: ${e.toString()}');
    }
  }
}
