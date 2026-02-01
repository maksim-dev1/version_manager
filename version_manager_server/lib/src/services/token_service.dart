import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

/// Сервис для генерации и хеширования токенов
class TokenService {
  static const int _tokenLength = 64;

  /// Генерирует криптографически стойкий случайный токен
  String generateToken() {
    final random = Random.secure();
    final bytes = List<int>.generate(_tokenLength, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  /// Хеширует токен для безопасного хранения в БД
  String hashToken(String token) {
    final bytes = utf8.encode(token);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Генерирует пару токенов с разным временем жизни
  TokenPair generateTokenPair() {
    return TokenPair(
      accessToken: generateToken(),
      refreshToken: generateToken(),
    );
  }
}

class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({
    required this.accessToken,
    required this.refreshToken,
  });
}
