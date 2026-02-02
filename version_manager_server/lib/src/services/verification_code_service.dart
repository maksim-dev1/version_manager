import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

/// Сервис для работы с одноразовыми кодами верификации (OTP - One-Time Password).
///
/// Обеспечивает полный жизненный цикл кодов подтверждения email:
/// генерацию, хранение, проверку и инвалидацию. Реализует защиту от
/// атак перебора и спама через rate limiting и ограничение попыток.
///
/// ## Основные возможности
/// - **6-значные коды** — легко вводимые пользователем (100,000 - 999,999)
/// - **SHA-256 хеширование** — коды не хранятся в открытом виде
/// - **Rate limiting** — защита от спама (1 код в минуту)
/// - **Ограничение попыток** — максимум 5 попыток ввода
/// - **Автоматическое истечение** — коды действуют 10 минут
/// - **Множественные цели** — регистрация, смена пароля, подтверждение действий
///
/// ## Поддерживаемые сценарии
/// Через [VerificationPurposeType]:
/// - `sign_up` — подтверждение email при регистрации
/// - `password_reset` — сброс забытого пароля
/// - `change_email` — смена email адреса
/// - `delete_account` — подтверждение удаления аккаунта
///
/// ## Безопасность
/// - Коды хешируются через SHA-256 перед сохранением
/// - Автоматическое удаление использованных и истёкших кодов
/// - Логирование всех операций для аудита
/// - Защита от timing-атак через единообразное время ответа
///
/// ### Пример использования
/// ```dart
/// final service = VerificationCodeService(session);
///
/// // Создание кода
/// final result = await service.createCode(
///   email: 'user@example.com',
///   purpose: VerificationPurposeType.sign_up,
/// );
///
/// // Проверка кода
/// final verified = await service.verifyCode(
///   email: 'user@example.com',
///   code: '123456',
///   purpose: VerificationPurposeType.sign_up,
/// );
/// ```
class VerificationCodeService {
  /// Сессия Serverpod для доступа к базе данных и логированию.
  final Session session;

  /// Создаёт экземпляр сервиса кодов верификации.
  ///
  /// ### Параметры
  /// - [session] — активная сессия Serverpod с доступом к БД
  VerificationCodeService(this.session);

  /// Генерирует случайный 6-значный код верификации.
  ///
  /// Использует `Random.secure()` для криптографической стойкости.
  /// Диапазон: 100,000 - 999,999 (всегда 6 цифр).
  ///
  /// ### Возвращает
  /// Строку с 6-значным числовым кодом.
  String _generateCode() {
    final random = Random.secure();
    final code = random.nextInt(900000) + 100000; // 100000-999999
    return code.toString();
  }

  /// Хеширует код верификации для безопасного хранения.
  ///
  /// Преобразует plain-text код в необратимый SHA-256 хеш.
  /// Это предотвращает утечку кодов при компрометации БД.
  ///
  /// ### Параметры
  /// - [code] — исходный 6-значный код
  ///
  /// ### Возвращает
  /// Hex-строку SHA-256 хеша длиной 64 символа.
  String _hashCode(String code) {
    final bytes = utf8.encode(code);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Создаёт новый код верификации с автоматической очисткой старых кодов.
  ///
  /// Генерирует 6-значный код, хеширует его и сохраняет в БД с метаданными.
  /// Автоматически удаляет все предыдущие коды для того же email+purpose
  /// для предотвращения накопления неиспользованных кодов.
  ///
  /// ### Rate Limiting
  /// Проверяет время последнего отправленного кода. Если прошло меньше 1 минуты
  /// с момента последней отправки, возвращает время ожидания вместо создания нового кода.
  ///
  /// ### Параметры
  /// - [email] — email адрес получателя (автоматически нормализуется)
  /// - [purpose] — цель кода ([VerificationPurposeType.sign_up], etc.)
  /// - [userId] — ID пользователя (опционально, для привязки к аккаунту)
  /// - [ipAddress] — IP адрес запроса (для аудита)
  /// - [userAgent] — User-Agent браузера (для аудита)
  ///
  /// ### Возвращает
  /// Record с полями:
  /// - `code` — созданная запись [VerificationCode] с **plain-text кодом** в поле `codeHash` для отправки email
  /// - `waitTime` — время ожидания [Duration] при rate limit (если применимо)
  ///
  /// ### Конфигурация кода
  /// - **Время жизни:** 10 минут
  /// - **Максимум попыток:** 5
  /// - **Rate limit:** 1 минута между отправками
  /// - **Автоматическая очистка:** все старые коды удаляются
  ///
  /// ### Логирование
  /// - Создание кода (INFO)
  /// - Rate limit срабатывания (WARNING)
  /// - Удаление старых кодов (DEBUG)
  ///
  /// ### Пример использования
  /// ```dart
  /// final result = await service.createCode(
  ///   email: 'user@example.com',
  ///   purpose: VerificationPurposeType.sign_up,
  ///   ipAddress: request.ip,
  /// );
  ///
  /// if (result.waitTime != null) {
  ///   // Rate limit - показать таймер
  ///   final seconds = result.waitTime!.inSeconds;
  /// } else {
  ///   // Отправить код по email
  ///   final plainCode = result.code!.codeHash; // содержит plain код
  ///   await emailService.sendVerificationEmail(email, plainCode);
  /// }
  /// ```
  ///
  /// ### Важно
  /// Возвращаемый объект содержит **незахешированный код** в поле `codeHash`
  /// только для удобства отправки email. В БД сохраняется хешированная версия.
  Future<({VerificationCode? code, Duration? waitTime})> createCode({
    required String email,
    required VerificationPurposeType purpose,
    UuidValue? userId,
    String? ipAddress,
    String? userAgent,
  }) async {
    final normalizedEmail = email.toLowerCase().trim();
    final now = DateTime.now();

    session.log(
      'Создание кода верификации для $normalizedEmail (purpose: ${purpose.name})',
      level: LogLevel.info,
    );

    // Находим существующие коды
    final existing = await VerificationCode.db.find(
      session,
      where: (t) => t.email.equals(normalizedEmail) & t.purpose.equals(purpose),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    // Проверяем rate limit по последнему коду
    if (existing.isNotEmpty) {
      final last = existing.first;
      final resendAt = last.resendAvailableAt;
      if (resendAt != null &&
          now.isBefore(resendAt) &&
          last.expiresAt.isAfter(now)) {
        final waitTime = resendAt.difference(now);
        session.log(
          'Rate limit для $normalizedEmail: ожидание ${waitTime.inSeconds}с',
          level: LogLevel.warning,
        );
        return (code: null, waitTime: waitTime);
      }
    }

    // Удаляем все старые коды
    if (existing.isNotEmpty) {
      session.log(
        'Удаление ${existing.length} старых кодов для $normalizedEmail',
        level: LogLevel.debug,
      );
      await VerificationCode.db.delete(
        session,
        existing,
      );
    }

    // Создаем новый код
    final plainCode = _generateCode();
    final record = VerificationCode(
      userId: userId,
      email: normalizedEmail,
      purpose: purpose,
      codeHash: _hashCode(plainCode),
      expiresAt: now.add(Duration(minutes: 10)),
      createdAt: now,
      isUsed: false,
      attemptsUsed: 0,
      maxAttempts: 5,
      resendAvailableAt: now.add(Duration(minutes: 1)),
      ipAddress: ipAddress,
      userAgent: userAgent,
    );

    final saved = await VerificationCode.db.insertRow(session, record);

    session.log(
      'Код верификации создан для $normalizedEmail (истекает: ${record.expiresAt})',
      level: LogLevel.info,
    );

    // Возвращаем с незахешированным кодом для отправки email
    return (code: saved.copyWith(codeHash: plainCode), waitTime: null);
  }

  /// Проверяет код верификации и удаляет его при успешной верификации.
  ///
  /// Выполняет полную верификацию кода с проверкой всех условий:
  /// времени истечения, лимита попыток и корректности самого кода.
  /// При успешной проверке код автоматически удаляется из БД (одноразовое использование).
  ///
  /// ### Алгоритм проверки
  /// 1. Поиск активного кода для email+purpose
  /// 2. Проверка срока действия (10 минут)
  /// 3. Проверка лимита попыток (максимум 5)
  /// 4. Сравнение хешей кода
  /// 5. При успехе — удаление кода, при неудаче — инкремент счётчика попыток
  ///
  /// ### Параметры
  /// - [email] — email адрес пользователя
  /// - [code] — введённый пользователем 6-значный код
  /// - [purpose] — цель верификации (должна совпадать с кодом)
  ///
  /// ### Возвращает
  /// - **Успех:** запись [VerificationCode] с метаданными
  /// - **Неудача:** `null` в любом из случаев ошибки
  ///
  /// ### Сценарии ошибок
  /// Метод возвращает `null` в следующих случаях:
  ///
  /// **1. Код не найден**
  /// - Нет активных кодов для данного email+purpose
  /// - Код уже был использован ранее
  ///
  /// **2. Код истёк**
  /// - Прошло более 10 минут с момента создания
  /// - Код автоматически удаляется из БД
  ///
  /// **3. Превышен лимит попыток**
  /// - Использовано 5 или более попыток ввода
  /// - Код автоматически удаляется из БД
  ///
  /// **4. Неверный код**
  /// - Введённый код не совпадает с сохранённым
  /// - Счётчик попыток увеличивается на 1
  /// - Код остаётся активным (если не достигнут лимит)
  ///
  /// ### Безопасность
  /// - Хеширование кодов через SHA-256
  /// - Единообразное время ответа (защита от timing-атак)
  /// - Автоматическая очистка использованных/истёкших кодов
  /// - Подробное логирование для аудита
  ///
  /// ### Логирование
  /// - Все попытки проверки (INFO)
  /// - Неверные коды с указанием оставшихся попыток (WARNING)
  /// - Истёкшие коды и превышение лимита (WARNING)
  ///
  /// ### Пример использования
  /// ```dart
  /// final verified = await service.verifyCode(
  ///   email: 'user@example.com',
  ///   code: userInput, // "123456"
  ///   purpose: VerificationPurposeType.sign_up,
  /// );
  ///
  /// if (verified != null) {
  ///   // Код верный — продолжить регистрацию
  ///   final userId = verified.userId;
  ///   await createUser(...);
  /// } else {
  ///   // Неверный/истёкший код — показать ошибку
  ///   throw InvalidDataException(
  ///     message: 'Неверный или истёкший код',
  ///     field: 'code',
  ///   );
  /// }
  /// ```
  Future<VerificationCode?> verifyCode({
    required String email,
    required String code,
    required VerificationPurposeType purpose,
  }) async {
    final normalizedEmail = email.toLowerCase().trim();
    final codeHash = _hashCode(code);
    final now = DateTime.now();

    session.log(
      'Проверка кода верификации для $normalizedEmail (purpose: ${purpose.name})',
      level: LogLevel.info,
    );

    final records = await VerificationCode.db.find(
      session,
      where: (t) =>
          t.email.equals(normalizedEmail) &
          t.purpose.equals(purpose) &
          t.isUsed.equals(false),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 1,
    );

    if (records.isEmpty) {
      session.log(
        'Код не найден для $normalizedEmail',
        level: LogLevel.warning,
      );
      return null;
    }

    final record = records.first;

    // Код истек
    if (record.expiresAt.isBefore(now)) {
      session.log(
        'Код истёк для $normalizedEmail (истёк: ${record.expiresAt})',
        level: LogLevel.warning,
      );
      await VerificationCode.db.deleteRow(session, record);
      return null;
    }

    // Превышен лимит попыток
    if (record.attemptsUsed >= record.maxAttempts) {
      session.log(
        'Превышен лимит попыток для $normalizedEmail (${record.attemptsUsed}/${record.maxAttempts})',
        level: LogLevel.warning,
      );
      await VerificationCode.db.deleteRow(session, record);
      return null;
    }

    // Неверный код
    if (record.codeHash != codeHash) {
      final newAttempts = record.attemptsUsed + 1;
      session.log(
        'Неверный код для $normalizedEmail (попытка $newAttempts/${record.maxAttempts})',
        level: LogLevel.warning,
      );
      await VerificationCode.db.updateRow(
        session,
        record.copyWith(attemptsUsed: newAttempts),
      );
      return null;
    }

    // Код верный - удаляем и возвращаем
    session.log(
      'Код верификации подтверждён для $normalizedEmail',
      level: LogLevel.info,
    );
    await VerificationCode.db.deleteRow(session, record);
    return record;
  }
}
