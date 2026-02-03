import 'package:shared_preferences/shared_preferences.dart';
import 'package:version_manager_flutter/common/constants/storage_keys.dart';

class StorageService {
  SharedPreferences? _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ===== Методы для работы с токенами =====

  /// Сохранить access token
  Future<bool> saveAccessToken(String token) async {
    return await setString(accessTokenKey, token);
  }

  /// Получить access token
  String? getAccessToken() {
    return getString(accessTokenKey);
  }

  /// Сохранить refresh token
  Future<bool> saveRefreshToken(String token) async {
    return await setString(refreshTokenKey, token);
  }

  /// Получить refresh token
  String? getRefreshToken() {
    return getString(refreshTokenKey);
  }

  /// Сохранить оба токена
  Future<bool> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final accessResult = await saveAccessToken(accessToken);
    final refreshResult = await saveRefreshToken(refreshToken);
    return accessResult && refreshResult;
  }

  /// Удалить токены
  Future<bool> clearTokens() async {
    final accessResult = await remove(accessTokenKey);
    final refreshResult = await remove(refreshTokenKey);
    return accessResult && refreshResult;
  }

  /// Проверить наличие токенов
  bool hasTokens() {
    return getAccessToken() != null && getRefreshToken() != null;
  }

  // ===== Общие методы для работы с данными =====

  /// Сохранить строку
  Future<bool> setString(String key, String value) async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.setString(key, value);
  }

  /// Получить строку
  String? getString(String key) {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.getString(key);
  }

  /// Сохранить целое число
  Future<bool> setInt(String key, int value) async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.setInt(key, value);
  }

  /// Получить целое число
  int? getInt(String key) {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.getInt(key);
  }

  /// Сохранить дробное число
  Future<bool> setDouble(String key, double value) async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.setDouble(key, value);
  }

  /// Получить дробное число
  double? getDouble(String key) {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.getDouble(key);
  }

  /// Сохранить булево значение
  Future<bool> setBool(String key, bool value) async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.setBool(key, value);
  }

  /// Получить булево значение
  bool? getBool(String key) {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.getBool(key);
  }

  /// Сохранить список строк
  Future<bool> setStringList(String key, List<String> value) async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.setStringList(key, value);
  }

  /// Получить список строк
  List<String>? getStringList(String key) {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.getStringList(key);
  }

  /// Удалить значение по ключу
  Future<bool> remove(String key) async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.remove(key);
  }

  /// Проверить существование ключа
  bool containsKey(String key) {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.containsKey(key);
  }

  /// Получить все ключи
  Set<String> getKeys() {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return _prefs!.getKeys();
  }

  /// Очистить все данные
  Future<bool> clear() async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    return await _prefs!.clear();
  }

  /// Перезагрузить данные из хранилища
  Future<void> reload() async {
    if (_prefs == null) throw Exception('StorageService не инициализирован');
    await _prefs!.reload();
  }
}
