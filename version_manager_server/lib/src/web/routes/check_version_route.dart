import 'dart:async';
import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/check_version_service.dart';

/// Маршрут для публичного REST API проверки версии мобильного приложения.
///
/// ## Эндпоинт
/// `POST /api/v1/check-version`
///
/// ## Аутентификация
/// Bearer token (API ключ приложения) в заголовке `Authorization`.
///
/// ## Описание
/// Принимает информацию о текущей версии мобильного приложения и возвращает:
/// - Статус версии (blocked/update_available/active)
/// - Рекомендации по обновлению с ссылками на магазины
/// - Приоритет обновления (critical/high/medium/low)
///
/// ## Варианты ответов
/// - **200 OK** — успешная проверка (blocked, update_available, active)
/// - **400 Bad Request** — невалидный запрос
/// - **401 Unauthorized** — неверный или отсутствующий API ключ
/// - **404 Not Found** — приложение не найдено по namespace
/// - **405 Method Not Allowed** — не POST метод
/// - **500 Internal Server Error** — серверная ошибка
///
/// ## Пример запроса
/// ```json
/// POST /api/v1/check-version
/// Authorization: Bearer {API_KEY}
/// Content-Type: application/json
///
/// {
///   "namespace": "com.example.myapp",
///   "version": "1.2.0",
///   "buildNumber": 42,
///   "platform": "ios",
///   "osVersion": "17.2.1",
///   "deviceModel": "iPhone 15 Pro",
///   "locale": "ru_RU",
///   "consentGiven": true
/// }
/// ```
class CheckVersionRoute extends Route {
  CheckVersionRoute() : super(methods: {Method.post, Method.options});

  final _service = CheckVersionService();

  @override
  FutureOr<Result> handleCall(Session session, Request request) async {
    // CORS preflight
    if (request.method == Method.options) {
      return _corsResponse(Response.ok());
    }

    // Только POST
    if (request.method != Method.post) {
      return _corsResponse(
        _errorResponse(
          statusCode: 405,
          errorCode: 'method_not_allowed',
          message: 'Только POST запросы разрешены',
        ),
      );
    }

    try {
      // 1. Извлечение и валидация API ключа из заголовка Authorization
      final authHeader = request.headers['authorization'];
      if (authHeader == null || authHeader.isEmpty) {
        return _corsResponse(
          _errorResponse(
            statusCode: 401,
            errorCode: 'missing_api_key',
            message:
                'Заголовок Authorization обязателен. '
                'Формат: Bearer {API_KEY}',
          ),
        );
      }

      final authValue = authHeader is List
          ? authHeader.first
          : authHeader.toString();
      if (!authValue.startsWith('Bearer ')) {
        return _corsResponse(
          _errorResponse(
            statusCode: 401,
            errorCode: 'invalid_auth_format',
            message:
                'Неверный формат заголовка Authorization. '
                'Ожидается: Bearer {API_KEY}',
          ),
        );
      }

      final apiKey = authValue.substring('Bearer '.length).trim();

      session.log(
        'check-version: Authorization header type: ${authHeader.runtimeType}, '
        'raw value: "$authValue"',
        level: LogLevel.info,
      );
      session.log(
        'check-version: Извлечённый API ключ (длина: ${apiKey.length}): '
        '"${apiKey.length > 12 ? '${apiKey.substring(0, 8)}...${apiKey.substring(apiKey.length - 4)}' : '***'}"',
        level: LogLevel.info,
      );

      if (apiKey.isEmpty) {
        return _corsResponse(
          _errorResponse(
            statusCode: 401,
            errorCode: 'empty_api_key',
            message: 'API ключ не может быть пустым',
          ),
        );
      }

      // 2. Чтение и парсинг тела запроса
      String bodyString;
      try {
        bodyString = await request.readAsString();
      } catch (e) {
        return _corsResponse(
          _errorResponse(
            statusCode: 400,
            errorCode: 'invalid_body',
            message: 'Не удалось прочитать тело запроса',
          ),
        );
      }

      if (bodyString.trim().isEmpty) {
        return _corsResponse(
          _errorResponse(
            statusCode: 400,
            errorCode: 'empty_body',
            message:
                'Тело запроса не может быть пустым. '
                'Ожидается JSON объект.',
          ),
        );
      }

      Map<String, dynamic> json;
      try {
        json = jsonDecode(bodyString) as Map<String, dynamic>;
      } catch (e) {
        return _corsResponse(
          _errorResponse(
            statusCode: 400,
            errorCode: 'invalid_json',
            message: 'Невалидный JSON в теле запроса',
            details: e.toString(),
          ),
        );
      }

      session.log(
        'check-version: Получен запрос: '
        'namespace=${json['namespace']}, '
        'version=${json['version']}, '
        'buildNumber=${json['buildNumber']}, '
        'platform=${json['platform']}',
        level: LogLevel.info,
      );

      // 3. Валидация обязательных полей
      final validationError = CheckVersionService.validateRequest(json);
      if (validationError != null) {
        return _corsResponse(
          _errorResponse(
            statusCode: 400,
            errorCode: 'invalid_request',
            message: validationError,
          ),
        );
      }

      // 4. Валидация API ключа
      session.log(
        'check-version: Начинаю валидацию API ключа...',
        level: LogLevel.info,
      );
      final application = await _service.validateApiKey(session, apiKey);
      if (application == null) {
        session.log(
          'check-version: ❌ Валидация API ключа НЕ пройдена. '
          'namespace из запроса: ${json['namespace']}',
          level: LogLevel.warning,
        );
        return _corsResponse(
          _errorResponse(
            statusCode: 401,
            errorCode: 'invalid_api_key',
            message: 'Неверный API ключ или приложение деактивировано',
          ),
        );
      }

      session.log(
        'check-version: ✅ API ключ валиден. '
        'Приложение: ${application.namespace} (id: ${application.id})',
        level: LogLevel.info,
      );

      // 5. Парсинг запроса
      final checkRequest = CheckVersionService.parseRequest(json);

      // 6. Проверка соответствия namespace
      if (checkRequest.namespace != application.namespace) {
        return _corsResponse(
          _errorResponse(
            statusCode: 404,
            errorCode: 'app_not_found',
            message:
                'Приложение с namespace "${checkRequest.namespace}" не найдено '
                'или API ключ не соответствует данному приложению',
          ),
        );
      }

      // 7. Обработка запроса
      final response = await _service.processVersionCheck(
        session,
        application,
        checkRequest,
      );

      // 8. Обновляем IP и User-Agent в последнем логе (если есть)
      unawaited(_updateLogWithRequestInfo(session, application, request));

      // 9. Формирование и возврат ответа
      final responseJson = CheckVersionService.serializeResponse(response);

      session.log(
        'check-version: ${application.namespace} v${checkRequest.version} '
        '(${checkRequest.buildNumber}) ${checkRequest.platform.name} → '
        '${response.status.name}',
        level: LogLevel.info,
      );

      return _corsResponse(
        Response.ok(
          body: Body.fromString(
            jsonEncode(responseJson),
            mimeType: MimeType.json,
          ),
        ),
      );
    } catch (e, stackTrace) {
      session.log(
        'Ошибка при обработке check-version: $e',
        level: LogLevel.error,
        stackTrace: stackTrace,
      );

      return _corsResponse(
        _errorResponse(
          statusCode: 500,
          errorCode: 'internal_error',
          message: 'Внутренняя ошибка сервера. Попробуйте позже.',
        ),
      );
    }
  }

  /// Обновляет последний лог с серверной информацией (IP, User-Agent).
  ///
  /// Вызывается асинхронно после формирования ответа, чтобы не задерживать клиента.
  Future<void> _updateLogWithRequestInfo(
    Session session,
    Application application,
    Request request,
  ) async {
    try {
      // Получаем IP из X-Forwarded-For (если есть reverse proxy) или из connection
      String? clientIp;
      final xForwardedFor = request.headers['x-forwarded-for'];
      if (xForwardedFor != null && xForwardedFor.toString().isNotEmpty) {
        // Берём первый IP из цепочки (реальный клиент)
        final value = xForwardedFor is List
            ? xForwardedFor.first
            : xForwardedFor.toString();
        clientIp = value.split(',').first.trim();
      } else {
        // Fallback на connection info
        try {
          clientIp = request.connectionInfo.remote.address.toString();
        } catch (_) {
          clientIp = null;
        }
      }

      // Анонимизируем IP (GDPR)
      final anonymizedIp = CheckVersionService.anonymizeIp(clientIp);

      // Получаем User-Agent
      final userAgent = request.headers['user-agent']?.toString();

      // Обновляем последний лог
      final lastLog = await VersionCheckLog.db.findFirstRow(
        session,
        where: (t) => t.applicationId.equals(application.id),
        orderBy: (t) => t.checkedAt,
        orderDescending: true,
      );

      if (lastLog != null) {
        lastLog.ipAddress = anonymizedIp;
        lastLog.userAgent = userAgent;
        await VersionCheckLog.db.updateRow(session, lastLog);
      }
    } catch (e) {
      session.log(
        'Ошибка при обновлении лога с request info: $e',
        level: LogLevel.warning,
      );
    }
  }

  /// Формирует JSON ответ с ошибкой.
  Response _errorResponse({
    required int statusCode,
    required String errorCode,
    required String message,
    String? details,
  }) {
    final error = CheckVersionErrorResponse(
      errorCode: errorCode,
      message: message,
      details: details,
      serverTimestamp: DateTime.now(),
    );

    final jsonBody = jsonEncode(
      CheckVersionService.serializeErrorResponse(error),
    );

    final headers = Headers.build(
      (h) => h['X-Error-Code'] = [errorCode],
    );

    switch (statusCode) {
      case 400:
        return Response.badRequest(
          body: Body.fromString(jsonBody, mimeType: MimeType.json),
          headers: headers,
        );
      case 401:
        return Response.unauthorized(
          body: Body.fromString(jsonBody, mimeType: MimeType.json),
          headers: headers,
        );
      case 403:
        return Response.forbidden(
          body: Body.fromString(jsonBody, mimeType: MimeType.json),
          headers: headers,
        );
      case 404:
        return Response.notFound(
          body: Body.fromString(jsonBody, mimeType: MimeType.json),
          headers: headers,
        );
      default:
        return Response.internalServerError(
          body: Body.fromString(jsonBody, mimeType: MimeType.json),
          headers: headers,
        );
    }
  }

  /// Добавляет CORS заголовки к ответу.
  ///
  /// Необходимо для вызовов из веб-приложений и отладки.
  Response _corsResponse(Response response) {
    return response.copyWith(
      headers: Headers.build((h) {
        // Копируем существующие заголовки
        for (final entry in response.headers.entries) {
          h[entry.key] = entry.value.toList();
        }
        // Добавляем CORS
        h['Access-Control-Allow-Origin'] = ['*'];
        h['Access-Control-Allow-Methods'] = ['POST, OPTIONS'];
        h['Access-Control-Allow-Headers'] = [
          'Authorization, Content-Type, Accept',
        ];
        h['Access-Control-Max-Age'] = ['86400'];
      }),
    );
  }
}
