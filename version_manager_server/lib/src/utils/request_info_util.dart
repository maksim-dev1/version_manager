/// Утилита для извлечения информации о клиенте.
class RequestInfoUtil {
  /// Получает IP адрес клиента.
  ///
  /// В Serverpod прямой доступ к HTTP контексту ограничен.
  /// IP адрес можно получить через:
  /// 1. Передачу с клиента (если клиент знает свой публичный IP)
  /// 2. Логирование на уровне веб-сервера (nginx, apache)
  /// 3. Кастомные middleware если используются
  ///
  /// ### Параметры
  /// - [clientIpAddress] — IP адрес переданный клиентом (опционально)
  ///
  /// ### Возвращает
  /// IP адрес клиента в виде строки или `null`
  ///
  /// ### Примечание
  /// Для production рекомендуется логировать IP на уровне reverse proxy
  /// (nginx, CloudFlare) и передавать через заголовки в middleware.
  static String? getClientIp(String? clientIpAddress) {
    return clientIpAddress;
  }

  /// Получает User Agent из запроса клиента.
  ///
  /// ### Параметры
  /// - [clientUserAgent] — User Agent переданный клиентом
  ///
  /// ### Возвращает
  /// User Agent строка или `null`
  static String? getUserAgent(String? clientUserAgent) {
    return clientUserAgent;
  }

  /// Объединяет информацию об устройстве с клиента.
  ///
  /// ### Параметры
  /// - [clientDeviceInfo] — информация переданная клиентом
  /// - [clientUserAgent] — User Agent переданный клиентом
  /// - [clientIpAddress] — IP адрес переданный клиентом (опционально)
  ///
  /// ### Возвращает
  /// Map с полями:
  /// - `deviceInfo` — информация об устройстве
  /// - `ipAddress` — IP адрес клиента (может быть null)
  /// - `userAgent` — User Agent строка
  ///
  /// ### Пример использования
  /// ```dart
  /// final info = RequestInfoUtil.getClientInfo(
  ///   request.deviceInfo,
  ///   request.userAgent,
  ///   request.ipAddress,
  /// );
  ///
  /// final authSession = AuthSession(
  ///   deviceInfo: info['deviceInfo'],
  ///   ipAddress: info['ipAddress'],
  ///   userAgent: info['userAgent'],
  ///   // ...
  /// );
  /// ```
  static Map<String, String?> getClientInfo(
    String? clientDeviceInfo,
    String? clientUserAgent,
    String? clientIpAddress,
  ) {
    return {
      'deviceInfo': clientDeviceInfo,
      'ipAddress': getClientIp(clientIpAddress),
      'userAgent': getUserAgent(clientUserAgent),
    };
  }
}
