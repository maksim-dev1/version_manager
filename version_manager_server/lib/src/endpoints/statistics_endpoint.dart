import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/endpoints/base/logged_in_endpoint.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';

/// Эндпоинт для получения статистики и аналитики приложений.
///
/// Предоставляет функционал для:
/// - Общей статистики (количество проверок за день/неделю/месяц)
/// - Графиков активности по дням
/// - Статистики по версиям (adoption rate, распределение, динамика)
/// - Статистики по платформам (ОС, версии ОС, модели устройств)
/// - Статистики по локалям
/// - Временной аналитики (тепловая карта)
/// - Экспорта полного отчёта
///
/// Все метрики основаны на количестве запросов (не уникальных устройств).
/// Не собираются: deviceId, IP, User-Agent, GeoIP.
///
/// Наследуется от [LoggedInEndpoint] — требует авторизации.
/// Доступ контролируется по принадлежности приложения пользователю или команде.
class StatisticsEndpoint extends LoggedInEndpoint {
  final _statisticsService = Services().statisticsService;

  // ============================================================
  // ОСНОВНЫЕ МЕТРИКИ
  // ============================================================

  /// Получить общую статистику приложения.
  ///
  /// Возвращает ключевые метрики:
  /// - Общее количество проверок за всё время
  /// - Проверки за последние 24 часа / 7 дней / 30 дней
  /// - Количество проверок за период
  /// - Количество заблокированных и активных версий
  /// - Среднее время обработки запроса
  Future<StatisticsOverviewResponse> getOverview(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getOverview: appId=${filter.applicationId}, '
      'dateFrom=${filter.dateFrom}, dateTo=${filter.dateTo}, '
      'platform=${filter.platform}',
      level: LogLevel.info,
    );

    return await _statisticsService.getOverview(session, filter: filter);
  }

  // ============================================================
  // АКТИВНОСТЬ ПО ДНЯМ
  // ============================================================

  /// Получить данные активности по дням.
  ///
  /// Возвращает:
  /// - Количество проверок по дням (для линейного графика)
  /// - Кумулятивный рост общего количества проверок
  Future<DailyActiveUsersResponse> getDailyActiveUsers(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getDailyActiveUsers: appId=${filter.applicationId}',
      level: LogLevel.info,
    );

    return await _statisticsService.getDailyActiveUsers(
      session,
      filter: filter,
    );
  }

  // ============================================================
  // СТАТИСТИКА ПО ВЕРСИЯМ
  // ============================================================

  /// Получить статистику по версиям приложения.
  ///
  /// Возвращает:
  /// - Распределение проверок по версиям (количество, процент)
  /// - Adoption rate последней версии
  /// - Количество и процент проверок на заблокированных версиях
  /// - Возраст каждой версии в днях
  /// - Timeline adoption по дням для каждой версии
  Future<VersionStatisticsResponse> getVersionStatistics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getVersionStatistics: appId=${filter.applicationId}',
      level: LogLevel.info,
    );

    return await _statisticsService.getVersionStatistics(
      session,
      filter: filter,
    );
  }

  // ============================================================
  // СТАТИСТИКА ПО ПЛАТФОРМАМ
  // ============================================================

  /// Получить статистику по платформам.
  ///
  /// Возвращает:
  /// - Распределение по операционным системам (iOS, Android, Web и т.д.)
  /// - Распределение по версиям ОС
  /// - Топ-10 моделей устройств
  Future<PlatformStatisticsResponse> getPlatformStatistics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getPlatformStatistics: appId=${filter.applicationId}',
      level: LogLevel.info,
    );

    return await _statisticsService.getPlatformStatistics(
      session,
      filter: filter,
    );
  }

  // ============================================================
  // ГЕОГРАФИЧЕСКАЯ СТАТИСТИКА
  // ============================================================

  /// Получить статистику по локалям.
  ///
  /// Возвращает:
  /// - Распределение по локалям (на основе клиентского locale)
  ///
  /// Страны не собираются (IP не сохраняется, GeoIP не используется).
  Future<GeoStatisticsResponse> getGeoStatistics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getGeoStatistics: appId=${filter.applicationId}',
      level: LogLevel.info,
    );

    return await _statisticsService.getGeoStatistics(
      session,
      filter: filter,
    );
  }

  // ============================================================
  // ВРЕМЕННАЯ АНАЛИТИКА
  // ============================================================

  /// Получить временную аналитику.
  ///
  /// Возвращает:
  /// - Тепловая карта активности (день недели × час суток)
  ///
  /// Retention Rate и скорость обновления не доступны (требуют deviceId).
  Future<TimeAnalyticsResponse> getTimeAnalytics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getTimeAnalytics: appId=${filter.applicationId}',
      level: LogLevel.info,
    );

    return await _statisticsService.getTimeAnalytics(
      session,
      filter: filter,
    );
  }

  // ============================================================
  // ЭКСПОРТ ДАННЫХ
  // ============================================================

  /// Получить полный отчёт по статистике приложения.
  ///
  /// Объединяет все разделы статистики в один ответ для экспорта.
  /// Поддерживает все фильтры.
  ///
  /// Клиент может преобразовать полученные данные в CSV, Excel или JSON
  /// на своей стороне.
  Future<StatisticsExportData> getExportData(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    await _checkAppAccess(session, applicationId: filter.applicationId);

    session.log(
      'statistics.getExportData: appId=${filter.applicationId}',
      level: LogLevel.info,
    );

    return await _statisticsService.getExportData(session, filter: filter);
  }

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ: ПРОВЕРКА ДОСТУПА
  // ============================================================

  /// Проверяет, что текущий пользователь имеет доступ к приложению.
  ///
  /// Доступ имеют:
  /// — Владелец личного приложения (ownerType == user)
  /// — Любой активный участник команды-владельца (ownerType == team)
  Future<void> _checkAppAccess(
    Session session, {
    required UuidValue applicationId,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    final app = await Application.db.findById(session, applicationId);
    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    if (app.ownerType == OwnerType.user) {
      if (app.ownerUserId != userId) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Нет доступа к этому приложению',
        );
      }
    } else {
      final member = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            (t.teamId.equals(app.ownerTeamId!)) &
            (t.userId.equals(userId)) &
            (t.status.equals(TeamMemberStatusType.active)),
      );

      if (member == null) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Нет доступа к этому приложению',
        );
      }
    }
  }
}
