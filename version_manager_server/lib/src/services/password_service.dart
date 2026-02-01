import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

/// Сервис для безопасного хеширования и проверки паролей
class PasswordService {
  static const int _iterations = 100000;
  static const int _saltLength = 32;
  static const int _hashLength = 32;

  /// Хеширует пароль с автоматической генерацией соли
  /// Формат: iterations$salt$hash
  String hashPassword(String password) {
    print('[PasswordService] === HASHING PASSWORD ===');
    print('[PasswordService] Password length: ${password.length} chars');
    print('[PasswordService] Iterations: $_iterations');
    print('[PasswordService] Salt length: $_saltLength bytes');
    print('[PasswordService] Expected hash length: $_hashLength bytes');
    
    try {
      print('[PasswordService] Step 1: Generating salt...');
      final salt = _generateSalt();
      print('[PasswordService] Salt generated: ${salt.length} bytes');
      
      print('[PasswordService] Step 2: Running PBKDF2...');
      final startTime = DateTime.now();
      final hash = _pbkdf2(password, salt);
      final duration = DateTime.now().difference(startTime);
      
      print('[PasswordService] PBKDF2 complete in ${duration.inMilliseconds}ms');
      print('[PasswordService] Hash generated: ${hash.length} bytes');
      
      print('[PasswordService] Step 3: Encoding to base64url...');
      final saltEncoded = base64Url.encode(salt);
      final hashEncoded = base64Url.encode(hash);
      
      print('[PasswordService] Salt encoded: ${saltEncoded.length} chars');
      print('[PasswordService] Hash encoded: ${hashEncoded.length} chars');
      
      final result = '$_iterations\$${saltEncoded}\$${hashEncoded}';
      print('[PasswordService] Final hash: ${result.length} chars total');
      print('[PasswordService] ✅ Password hashed successfully');
      print('[PasswordService] ========================');
      
      return result;
    } catch (e, stackTrace) {
      print('[PasswordService] ❌ ERROR hashing password!');
      print('[PasswordService] Error: $e');
      print('[PasswordService] StackTrace: $stackTrace');
      print('[PasswordService] ========================');
      rethrow;
    }
  }

  /// Проверяет пароль против хеша
  bool verifyPassword(String password, String storedHash) {
    print('[PasswordService] === VERIFYING PASSWORD ===');
    print('[PasswordService] Password length: ${password.length} chars');
    print('[PasswordService] Stored hash length: ${storedHash.length} chars');
    
    try {
      print('[PasswordService] Step 1: Parsing stored hash...');
      final parts = storedHash.split('\$');
      print('[PasswordService] Hash parts count: ${parts.length} (expected: 3)');
      
      if (parts.length != 3) {
        print('[PasswordService] ❌ Invalid hash format!');
        print('[PasswordService] ========================');
        return false;
      }

      print('[PasswordService] Step 2: Decoding hash components...');
      final iterations = int.parse(parts[0]);
      print('[PasswordService] Iterations: $iterations');
      
      final salt = base64Url.decode(parts[1]);
      print('[PasswordService] Salt decoded: ${salt.length} bytes');
      
      final hash = base64Url.decode(parts[2]);
      print('[PasswordService] Hash decoded: ${hash.length} bytes');

      print('[PasswordService] Step 3: Hashing input password with same salt...');
      final startTime = DateTime.now();
      final testHash = _pbkdf2(password, salt, iterations: iterations);
      final duration = DateTime.now().difference(startTime);
      
      print('[PasswordService] Test hash generated in ${duration.inMilliseconds}ms');
      print('[PasswordService] Test hash length: ${testHash.length} bytes');
      
      print('[PasswordService] Step 4: Constant-time comparison...');
      final isMatch = _constantTimeCompare(hash, testHash);
      
      if (isMatch) {
        print('[PasswordService] ✅ Password verified successfully');
      } else {
        print('[PasswordService] ❌ Password verification failed');
      }
      print('[PasswordService] ========================');
      
      return isMatch;
    } catch (e, stackTrace) {
      print('[PasswordService] ❌ ERROR verifying password!');
      print('[PasswordService] Error: $e');
      print('[PasswordService] StackTrace: $stackTrace');
      print('[PasswordService] ========================');
      return false;
    }
  }

  List<int> _generateSalt() {
    print('[PasswordService]   Generating ${_saltLength} random bytes...');
    final random = Random.secure();
    final salt = List<int>.generate(_saltLength, (_) => random.nextInt(256));
    print('[PasswordService]   Salt first 8 bytes: ${salt.sublist(0, 8)}');
    return salt;
  }

  List<int> _pbkdf2(
    String password,
    List<int> salt, {
    int? iterations,
  }) {
    iterations ??= _iterations;
    
    print('[PasswordService]   PBKDF2 starting...');
    print('[PasswordService]   - Password length: ${password.length}');
    print('[PasswordService]   - Salt length: ${salt.length}');
    print('[PasswordService]   - Iterations: $iterations');
    
    final passwordBytes = utf8.encode(password);
    print('[PasswordService]   - Password encoded to ${passwordBytes.length} bytes');
    
    // Начальное значение: HMAC(password, salt || INT(1))
    final blockBytes = Uint8List.fromList([...salt, 0, 0, 0, 1]);
    print('[PasswordService]   - Block bytes length: ${blockBytes.length}');
    
    var u = Hmac(sha256, passwordBytes).convert(blockBytes).bytes;
    print('[PasswordService]   - Initial U length: ${u.length}');
    
    var result = List<int>.from(u);
    print('[PasswordService]   - Running $iterations iterations...');
    
    // Логируем прогресс каждые 20000 итераций
    for (var i = 1; i < iterations; i++) {
      if (i % 20000 == 0) {
        final progress = (i / iterations * 100).toStringAsFixed(1);
        print('[PasswordService]   - Progress: $progress% ($i/$iterations)');
      }
      
      u = Hmac(sha256, passwordBytes).convert(u).bytes;
      
      // XOR текущего результата с новым U
      for (var j = 0; j < result.length; j++) {
        result[j] ^= u[j];
      }
    }
    
    print('[PasswordService]   - PBKDF2 iterations complete');
    print('[PasswordService]   - Result length: ${result.length} bytes');
    print('[PasswordService]   - Result first 8 bytes: ${result.sublist(0, 8)}');
    
    return result;
  }

  bool _constantTimeCompare(List<int> a, List<int> b) {
    print('[PasswordService]   Comparing hashes...');
    print('[PasswordService]   - Hash A length: ${a.length}');
    print('[PasswordService]   - Hash B length: ${b.length}');
    
    if (a.length != b.length) {
      print('[PasswordService]   - Length mismatch!');
      return false;
    }
    
    var result = 0;
    for (var i = 0; i < a.length; i++) {
      result |= a[i] ^ b[i];
    }
    
    final isMatch = result == 0;
    print('[PasswordService]   - XOR result: $result (match: $isMatch)');
    
    return isMatch;
  }
}
