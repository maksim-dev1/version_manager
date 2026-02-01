import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Сервис авторизации для Flutter клиента.
/// Хранит токены и управляет состоянием сессии.
class AuthService extends ChangeNotifier {
  final Client _client;

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'auth_refresh_token';
  static const String _userIdKey = 'auth_user_id';

  User? _currentUser;
  String? _token;
  String? _refreshToken;
  bool _isLoading = false;
  String? _error;

  AuthService(this._client);

  // Геттеры
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _token != null && _currentUser != null;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get token => _token;

  /// Инициализация - загрузка сохранённых токенов
  Future<void> initialize() async {
    _setLoading(true);

    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString(_tokenKey);
      _refreshToken = prefs.getString(_refreshTokenKey);

      if (_token != null) {
        // Валидируем токен
        final user = await _client.auth.validateToken(_token!);

        if (user != null) {
          _currentUser = user;
        } else {
          // Токен невалидный, пробуем обновить
          if (_refreshToken != null) {
            await _tryRefreshToken();
          } else {
            await _clearAuth();
          }
        }
      }
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      await _clearAuth();
    } finally {
      _setLoading(false);
    }
  }

  /// Проверка email
  Future<EmailCheckResult> checkEmail(String email) async {
    _clearError();
    _setLoading(true);

    try {
      return await _client.auth.checkEmail(email);
    } catch (e) {
      _setError('Ошибка проверки email: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// Начало регистрации (отправка кода)
  Future<VerificationCodeSentResult> startRegistration(String email) async {
    _clearError();
    _setLoading(true);

    try {
      return await _client.auth.startRegistration(email);
    } catch (e) {
      _setError('Ошибка отправки кода: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// Завершение регистрации
  Future<bool> completeRegistration({
    required int verificationId,
    required String code,
    required String password,
  }) async {
    _clearError();
    _setLoading(true);

    try {
      final response = await _client.auth.completeRegistration(
        verificationId: verificationId,
        code: code,
        password: password,
      );

      await _saveAuth(
        token: response.token,
        refreshToken: response.refreshToken,
        user: response.user,
      );
      return true;
    } catch (e) {
      _setError(_extractErrorMessage(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Вход
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _clearError();
    _setLoading(true);

    try {
      final response = await _client.auth.login(
        email: email,
        password: password,
      );

      await _saveAuth(
        token: response.token,
        refreshToken: response.refreshToken,
        user: response.user,
      );
      return true;
    } catch (e) {
      _setError(_extractErrorMessage(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Начало сброса пароля
  Future<VerificationCodeSentResult> startPasswordReset(String email) async {
    _clearError();
    _setLoading(true);

    try {
      return await _client.auth.startPasswordReset(email);
    } catch (e) {
      _setError('Ошибка отправки кода: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// Завершение сброса пароля
  Future<bool> completePasswordReset({
    required int verificationId,
    required String code,
    required String newPassword,
  }) async {
    _clearError();
    _setLoading(true);

    try {
      await _client.auth.completePasswordReset(
        verificationId: verificationId,
        code: code,
        newPassword: newPassword,
      );
      return true;
    } catch (e) {
      _setError(_extractErrorMessage(e));
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Выход
  Future<void> logout() async {
    _setLoading(true);

    try {
      if (_token != null) {
        await _client.auth.logout(_token!);
      }
    } catch (e) {
      debugPrint('Logout error: $e');
    } finally {
      await _clearAuth();
      _setLoading(false);
    }
  }

  /// Выход со всех устройств
  Future<void> logoutAll() async {
    _setLoading(true);

    try {
      if (_token != null) {
        await _client.auth.logoutAll(_token!);
      }
    } catch (e) {
      debugPrint('Logout all error: $e');
    } finally {
      await _clearAuth();
      _setLoading(false);
    }
  }

  // Приватные методы

  Future<void> _tryRefreshToken() async {
    if (_refreshToken == null) return;

    try {
      final response = await _client.auth.refreshToken(_refreshToken!);

      await _saveAuth(
        token: response.token,
        refreshToken: response.refreshToken,
        user: response.user,
      );
    } catch (e) {
      debugPrint('Refresh token error: $e');
      await _clearAuth();
    }
  }

  Future<void> _saveAuth({
    required String token,
    required String refreshToken,
    required User user,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_refreshTokenKey, refreshToken);
    if (user.id != null) {
      await prefs.setInt(_userIdKey, user.id!);
    }

    _token = token;
    _refreshToken = refreshToken;
    _currentUser = user;

    notifyListeners();
  }

  Future<void> _clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userIdKey);

    _token = null;
    _refreshToken = null;
    _currentUser = null;

    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }

  String _extractErrorMessage(dynamic error) {
    if (error is ServerpodClientException) {
      return error.message;
    }
    return error.toString();
  }
}
