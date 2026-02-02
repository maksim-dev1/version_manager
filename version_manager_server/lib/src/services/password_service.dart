import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

/// Сервис для безопасного хеширования и проверки паролей.
///
/// Реализует алгоритм **PBKDF2** (Password-Based Key Derivation Function 2)
/// с **SHA-256** для защиты от атак перебора и радужных таблиц.
///
/// ## Особенности безопасности
/// - **100,000 итераций** — замедляет атаки перебора
/// - **32-байтовая соль** — предотвращает атаки радужных таблиц
/// - **Constant-time сравнение** — защита от timing-атак
/// - **Криптографически стойкий генератор случайных чисел**
///
/// ## Формат хранения
/// Хэш сохраняется в формате: `iterations$salt$hash`
/// - `iterations` — количество итераций PBKDF2
/// - `salt` — соль в Base64URL кодировке
/// - `hash` — результирующий хэш в Base64URL кодировке
///
/// ### Пример использования
/// ```dart
/// final service = PasswordService();
///
/// // Хеширование при регистрации
/// final hash = service.hashPassword('userPassword123');
///
/// // Проверка при входе
/// final isValid = service.verifyPassword('userPassword123', hash);
/// ```
class PasswordService {
  static const int _iterations = 100000;
  static const int _saltLength = 32;

  /// Хеширует пароль с автоматической генерацией криптографически стойкой соли.
  ///
  /// Генерирует уникальную 32-байтовую соль для каждого пароля и применяет
  /// PBKDF2 с 100,000 итерациями для создания стойкого к атакам хэша.
  ///
  /// ### Параметры
  /// - [password] — исходный пароль пользователя
  ///
  /// ### Возвращает
  /// Строку в формате `iterations$salt$hash`, где:
  /// - `iterations` — количество итераций (100,000)
  /// - `salt` — Base64URL-кодированная соль
  /// - `hash` — Base64URL-кодированный результирующий хэш
  ///
  /// ### Пример
  /// ```dart
  /// final hash = service.hashPassword('mySecurePassword');
  /// // Результат: "100000$abc123$xyz789"
  /// ```
  String hashPassword(String password) {
    final salt = _generateSalt();
    final hash = _pbkdf2(password, salt);
    final saltEncoded = base64Url.encode(salt);
    final hashEncoded = base64Url.encode(hash);
    return '$_iterations\$${saltEncoded}\$${hashEncoded}';
  }

  /// Проверяет соответствие пароля сохранённому хэшу.
  ///
  /// Извлекает параметры из сохранённого хэша (итерации, соль) и применяет
  /// тот же алгоритм хэширования к проверяемому паролю. Сравнение результатов
  /// выполняется в постоянном времени для защиты от timing-атак.
  ///
  /// ### Параметры
  /// - [password] — пароль для проверки
  /// - [storedHash] — сохранённый хэш в формате `iterations$salt$hash`
  ///
  /// ### Возвращает
  /// `true` если пароль соответствует хэшу, `false` в противном случае.
  /// Также возвращает `false` при некорректном формате хэша или ошибках парсинга.
  ///
  /// ### Безопасность
  /// - Использует constant-time сравнение для предотвращения timing-атак
  /// - Graceful обработка некорректных форматов без выброса исключений
  ///
  /// ### Пример
  /// ```dart
  /// final isValid = service.verifyPassword('userPassword', storedHash);
  /// if (isValid) {
  ///   // Пароль верный, можно авторизовать
  /// }
  /// ```
  bool verifyPassword(String password, String storedHash) {
    try {
      final parts = storedHash.split('\$');
      if (parts.length != 3) return false;

      final iterations = int.parse(parts[0]);
      final salt = base64Url.decode(parts[1]);
      final hash = base64Url.decode(parts[2]);
      final testHash = _pbkdf2(password, salt, iterations: iterations);

      return _constantTimeCompare(hash, testHash);
    } catch (_) {
      return false;
    }
  }

  List<int> _generateSalt() {
    final random = Random.secure();
    return List<int>.generate(_saltLength, (_) => random.nextInt(256));
  }

  List<int> _pbkdf2(
    String password,
    List<int> salt, {
    int? iterations,
  }) {
    iterations ??= _iterations;
    final passwordBytes = utf8.encode(password);

    // Начальное значение: HMAC(password, salt || INT(1))
    final blockBytes = Uint8List.fromList([...salt, 0, 0, 0, 1]);
    var u = Hmac(sha256, passwordBytes).convert(blockBytes).bytes;
    var result = List<int>.from(u);

    for (var i = 1; i < iterations; i++) {
      u = Hmac(sha256, passwordBytes).convert(u).bytes;
      for (var j = 0; j < result.length; j++) {
        result[j] ^= u[j];
      }
    }

    return result;
  }

  /// Сравнивает два массива байт в постоянном времени.
  ///
  /// Предотвращает timing-атаки, при которых злоумышленник может
  /// определить корректность пароля по времени выполнения сравнения.
  /// Время выполнения не зависит от позиции первого различающегося байта.
  ///
  /// ### Параметры
  /// - [a] — первый массив для сравнения
  /// - [b] — второй массив для сравнения
  ///
  /// ### Возвращает
  /// `true` если массивы идентичны, `false` в противном случае.
  /// Возвращает `false` если длины массивов различаются.
  bool _constantTimeCompare(List<int> a, List<int> b) {
    if (a.length != b.length) return false;

    var result = 0;
    for (var i = 0; i < a.length; i++) {
      result |= a[i] ^ b[i];
    }

    return result == 0;
  }
}
