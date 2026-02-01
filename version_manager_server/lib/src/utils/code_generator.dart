// myproject_server/lib/src/utils/code_generator.dart

import 'dart:math';

class CodeGenerator {
  static final _random = Random.secure();

  /// Генерирует случайный 6-значный код подтверждения
  static String generateVerificationCode({int length = 6}) {
    final min = pow(10, length - 1).toInt();
    final max = pow(10, length).toInt() - 1;
    return (min + _random.nextInt(max - min)).toString();
  }

  /// Генерирует буквенно-цифровой код заданной длины
  static String generateAlphanumericCode(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(
      length,
      (_) => chars[_random.nextInt(chars.length)],
    ).join();
  }

  /// Генерирует временный токен для сброса пароля
  static String generateResetToken() {
    return generateAlphanumericCode(32);
  }
}
