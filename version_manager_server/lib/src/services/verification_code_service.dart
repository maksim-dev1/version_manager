import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

/// Сервис для работы с кодами верификации (OTP)
class VerificationCodeService {
  final Session session;

  VerificationCodeService(this.session);

  /// Генерирует 6-значный код
  String generateCode() {
    final random = Random.secure();
    final code = random.nextInt(900000) + 100000; // 100000-999999
    return code.toString();
  }

  /// Хеширует код для безопасного хранения
  String hashVerificationCode(String code) {
    final bytes = utf8.encode(code);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Создает новую запись verification_code
  Future<VerificationCode> createVerificationCode({
    required String email,
    required VerificationPurposeType purpose,
    UuidValue? userId,
    String? ipAddress,
    String? userAgent,
  }) async {
    final code = generateCode();
    final codeHash = hashVerificationCode(code);
    
    final now = DateTime.now();
    
    final verificationCode = VerificationCode(
      userId: userId,
      email: email.toLowerCase().trim(),
      purpose: purpose,
      codeHash: codeHash,
      expiresAt: now.add(Duration(minutes: 10)),
      createdAt: now,
      isUsed: false,
      attemptsUsed: 0,
      maxAttempts: 5,
      resendAvailableAt: now.add(Duration(minutes: 1)),
      ipAddress: ipAddress,
      userAgent: userAgent,
    );

    final saved = await VerificationCode.db.insertRow(session, verificationCode);
    
    // Возвращаем объект с незахешированным кодом для отправки email
    return saved.copyWith(codeHash: code);
  }

  /// Проверяет можно ли отправить новый код (rate limit)
  Future<Duration?> checkRateLimit(
    String email,
    VerificationPurposeType purpose,
  ) async {
    final now = DateTime.now();
    
    // ИСПРАВЛЕНО: используем обычный find без where по дате
    final existing = await VerificationCode.db.find(
      session,
      where: (t) =>
          t.email.equals(email.toLowerCase().trim()) &
          t.purpose.equals(purpose) &
          t.isUsed.equals(false),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 1,
    );

    if (existing.isEmpty) return null;

    final lastCode = existing.first;
    
    // Проверяем вручную после получения данных
    if (lastCode.expiresAt.isBefore(now)) {
      return null; // Код уже истек
    }
    
    final resendAt = lastCode.resendAvailableAt;
    
    if (resendAt != null && DateTime.now().isBefore(resendAt)) {
      return resendAt.difference(DateTime.now());
    }

    return null;
  }

  /// Проверяет код и возвращает запись если валидный
  Future<VerificationCode?> verifyCode({
    required String email,
    required String code,
    required VerificationPurposeType purpose,
  }) async {
    final codeHash = hashVerificationCode(code);
    final now = DateTime.now();
    
    // ИСПРАВЛЕНО: убираем фильтрацию по дате из where
    final records = await VerificationCode.db.find(
      session,
      where: (t) =>
          t.email.equals(email.toLowerCase().trim()) &
          t.purpose.equals(purpose) &
          t.isUsed.equals(false),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 1,
    );

    if (records.isEmpty) return null;

    final record = records.first;

    // Проверяем истек ли код
    if (record.expiresAt.isBefore(now)) {
      return null;
    }

    // Проверка лимита попыток
    if (record.attemptsUsed >= record.maxAttempts) {
      return null;
    }

    // Проверка хеша кода
    if (record.codeHash != codeHash) {
      // Увеличиваем счетчик неудачных попыток
      await VerificationCode.db.updateRow(
        session,
        record.copyWith(attemptsUsed: record.attemptsUsed + 1),
      );
      return null;
    }

    // Код верный - помечаем как использованный
    final updated = record.copyWith(
      isUsed: true,
      usedAt: DateTime.now(),
    );
    
    await VerificationCode.db.updateRow(session, updated);

    return updated;
  }

  /// Инвалидирует все активные коды пользователя для данного purpose
  Future<void> invalidateUserCodes(
    String email,
    VerificationPurposeType purpose,
  ) async {
    final codes = await VerificationCode.db.find(
      session,
      where: (t) =>
          t.email.equals(email.toLowerCase().trim()) &
          t.purpose.equals(purpose) &
          t.isUsed.equals(false),
    );

    for (final code in codes) {
      await VerificationCode.db.updateRow(
        session,
        code.copyWith(isUsed: true),
      );
    }
  }
}
