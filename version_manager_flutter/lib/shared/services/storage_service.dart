import 'package:shared_preferences/shared_preferences.dart';

/// Сервис для работы с локальным хранилищем SharedPreferences.
///
/// Предоставляет базовые методы для сохранения и получения данных.
/// Инкапсулирует работу с SharedPreferences.
class StorageService {
  SharedPreferences? _prefs;

  /// Инициализирует сервис.
  /// Должен быть вызван перед использованием любых методов.
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ===== Базовые методы для работы с данными =====

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
