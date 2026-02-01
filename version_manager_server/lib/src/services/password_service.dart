import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

/// Сервис для хеширования и проверки паролей.
///
/// Использует PBKDF2 с SHA-256 для безопасного хеширования паролей.
/// Каждый пароль хешируется с уникальной солью.
class PasswordService {
  /// Количество итераций PBKDF2
  static const int _iterations = 100000;

  /// Длина соли в байтах
  static const int _saltLength = 32;

  /// Длина хеша в байтах
  static const int _hashLength = 32;

  /// Разделитель между солью и хешем
  static const String _separator = ':';

  static final _random = Random.secure();

  /// Хеширует пароль с генерацией случайной соли.
  ///
  /// Возвращает строку формата "salt:hash" в base64.
  static String hashPassword(String password) {
    // Генерируем случайную соль
    final salt = _generateSalt();

    // Хешируем пароль с солью
    final hash = _pbkdf2(password, salt);

    // Возвращаем "salt:hash" в base64
    return '${base64Encode(salt)}$_separator${base64Encode(hash)}';
  }

  /// Проверяет пароль против сохраненного хеша.
  ///
  /// [password] - введенный пароль
  /// [storedHash] - сохраненный хеш формата "salt:hash"
  static bool verifyPassword(String password, String storedHash) {
    try {
      final parts = storedHash.split(_separator);
      if (parts.length != 2) return false;

      final salt = base64Decode(parts[0]);
      final expectedHash = base64Decode(parts[1]);

      // Хешируем введенный пароль с той же солью
      final actualHash = _pbkdf2(password, salt);

      // Сравниваем хеши (constant-time comparison для защиты от timing attacks)
      return _constantTimeEquals(actualHash, expectedHash);
    } catch (e) {
      return false;
    }
  }

  /// Генерирует случайную соль.
  static List<int> _generateSalt() {
    return List<int>.generate(_saltLength, (_) => _random.nextInt(256));
  }

  /// PBKDF2 с SHA-256.
  static List<int> _pbkdf2(String password, List<int> salt) {
    final passwordBytes = utf8.encode(password);

    // Простая реализация PBKDF2-HMAC-SHA256
    var block = <int>[];
    var result = <int>[];

    // Для одного блока (достаточно для 32 байт)
    final blockIndex = [0, 0, 0, 1]; // Big-endian 1

    // U1 = HMAC(password, salt || INT(i))
    var u = Hmac(sha256, passwordBytes).convert([...salt, ...blockIndex]).bytes;
    block = List<int>.from(u);

    // U2...Un
    for (var i = 1; i < _iterations; i++) {
      u = Hmac(sha256, passwordBytes).convert(u).bytes;
      // XOR
      for (var j = 0; j < block.length; j++) {
        block[j] ^= u[j];
      }
    }

    result.addAll(block);

    // Обрезаем до нужной длины
    return result.sublist(0, _hashLength);
  }

  /// Constant-time сравнение для защиты от timing attacks.
  static bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;

    var result = 0;
    for (var i = 0; i < a.length; i++) {
      result |= a[i] ^ b[i];
    }
    return result == 0;
  }
}
