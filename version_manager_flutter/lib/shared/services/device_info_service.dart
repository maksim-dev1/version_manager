import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:http/http.dart' as http;
import 'dart:io' if (dart.library.html) 'platform_stub.dart';

/// Сервис для получения информации об устройстве и приложении.
///
/// Собирает данные о:
/// - Типе и модели устройства
/// - Версии ОС
/// - Версии приложения
/// - User Agent для API запросов
///
/// Поддерживает все платформы включая Web.
class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Получает информацию об устройстве в виде строки.
  ///
  /// Формат:
  /// - iOS: "iPhone 14 Pro, iOS 17.2.1"
  /// - Android: "Samsung Galaxy S23, Android 14"
  /// - macOS: "MacBook Pro, macOS 14.2.1"
  /// - Windows: "Windows 11 Pro"
  /// - Linux: "Ubuntu 22.04"
  /// - Web: "Chrome 120.0, Windows 10" или "Safari 17.0, macOS"
  ///
  /// ### Пример использования
  /// ```dart
  /// final deviceInfo = await DeviceInfoService().getDeviceInfo();
  /// print(deviceInfo); // "iPhone 14 Pro, iOS 17.2.1"
  /// ```
  Future<String> getDeviceInfo() async {
    try {
      if (kIsWeb) {
        final webInfo = await _deviceInfo.webBrowserInfo;
        final browser = _getBrowserDisplayName(webInfo.browserName.name);
        final platform = _getWebPlatformDisplayName(webInfo.platform);
        return '$browser, $platform';
      }

      if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        // name уже содержит полное название (например "iPhone 16e")
        return '${iosInfo.name}, iOS ${iosInfo.systemVersion}';
      } else if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return '${androidInfo.manufacturer} ${androidInfo.model}, Android ${androidInfo.version.release}';
      } else if (Platform.isMacOS) {
        final macInfo = await _deviceInfo.macOsInfo;
        return '${macInfo.model}, macOS ${macInfo.osRelease}';
      } else if (Platform.isWindows) {
        final windowsInfo = await _deviceInfo.windowsInfo;
        return 'Windows ${windowsInfo.productName}';
      } else if (Platform.isLinux) {
        final linuxInfo = await _deviceInfo.linuxInfo;
        return linuxInfo.prettyName;
      }
      return 'Unknown Device';
    } catch (e) {
      return 'Unknown Device';
    }
  }

  /// Генерирует User Agent для API запросов.
  ///
  /// Формат: `AppName/Version (Platform; DeviceInfo)`
  ///
  /// Примеры:
  /// - `VersionManager/1.0.0 (iOS; iPhone 14 Pro, iOS 17.2.1)`
  /// - `VersionManager/1.2.3 (Android; Samsung Galaxy S23, Android 14)`
  ///
  /// ### Пример использования
  /// ```dart
  /// final userAgent = await DeviceInfoService().getUserAgent();
  /// // Использовать в HTTP заголовках
  /// ```
  Future<String> getUserAgent() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final deviceInfo = await getDeviceInfo();
      final platform = _getPlatformName();

      return '${packageInfo.appName}/${packageInfo.version} ($platform; $deviceInfo)';
    } catch (e) {
      return 'VersionManager/1.0.0 (Unknown)';
    }
  }

  /// Получает краткое название платформы.
  String _getPlatformName() {
    if (kIsWeb) return 'Web';
    if (Platform.isIOS) return 'iOS';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isWindows) return 'Windows';
    if (Platform.isLinux) return 'Linux';
    return 'Unknown';
  }

  /// Преобразует техническое название браузера в дружелюбное.
  String _getBrowserDisplayName(String browserName) {
    final lower = browserName.toLowerCase();
    if (lower.contains('chrome')) return 'Chrome';
    if (lower.contains('safari')) return 'Safari';
    if (lower.contains('firefox')) return 'Firefox';
    if (lower.contains('edge')) return 'Edge';
    if (lower.contains('opera')) return 'Opera';
    return browserName;
  }

  /// Преобразует техническое название платформы web в дружелюбное.
  String _getWebPlatformDisplayName(String? platform) {
    if (platform == null) return 'Unknown OS';

    final lower = platform.toLowerCase();

    // macOS/Mac
    if (lower.contains('mac') || lower == 'macintel' || lower == 'macppc') {
      return 'macOS';
    }

    // Windows
    if (lower.contains('win')) {
      return 'Windows';
    }

    // Linux
    if (lower.contains('linux')) {
      return 'Linux';
    }

    // Android
    if (lower.contains('android')) {
      return 'Android';
    }

    // iOS
    if (lower.contains('iphone') ||
        lower.contains('ipad') ||
        lower.contains('ipod')) {
      return 'iOS';
    }

    return platform;
  }

  /// Получает краткую информацию об устройстве для отображения в UI.
  ///
  /// Формат:
  /// - iOS: "iPhone 14 Pro"
  /// - Android: "Samsung Galaxy S23"
  /// - Desktop: "MacBook Pro" / "Windows PC" / "Linux PC"
  /// - Web: "Chrome Browser" / "Safari Browser"
  ///
  /// ### Пример использования
  /// ```dart
  /// final shortInfo = await DeviceInfoService().getShortDeviceInfo();
  /// // Показать в списке активных сессий
  /// ```
  Future<String> getShortDeviceInfo() async {
    try {
      if (kIsWeb) {
        final webInfo = await _deviceInfo.webBrowserInfo;
        final browser = _getBrowserDisplayName(webInfo.browserName.name);
        return '$browser Browser';
      }

      if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        // name уже содержит полное название устройства
        return iosInfo.name;
      } else if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isMacOS) {
        final macInfo = await _deviceInfo.macOsInfo;
        return macInfo.model;
      } else if (Platform.isWindows) {
        return 'Windows PC';
      } else if (Platform.isLinux) {
        return 'Linux PC';
      }
      return 'Unknown Device';
    } catch (e) {
      return 'Unknown Device';
    }
  }

  /// Получает информацию о версии приложения.
  ///
  /// ### Возвращает
  /// Map с ключами:
  /// - `version` — версия (например, "1.2.3")
  /// - `buildNumber` — номер сборки (например, "42")
  /// - `appName` — название приложения
  Future<Map<String, String>> getAppInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return {
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
        'appName': packageInfo.appName,
      };
    } catch (e) {
      return {
        'version': '1.0.0',
        'buildNumber': '1',
        'appName': 'VersionManager',
      };
    }
  }

  /// Пытается получить публичный IP адрес клиента.
  ///
  /// **Важно**: Этот метод опционален и может не работать в некоторых сетях.
  /// IP адрес не критичен для безопасности, так как не используется для аутентификации.
  ///
  /// ### Возвращает
  /// IP адрес в виде строки или `null` если получить не удалось
  ///
  /// ### Примечание
  /// - Использует публичный API (ipify.org)
  /// - Имеет таймаут 5 секунд
  /// - Не критично если вернёт null
  Future<String?> getPublicIpAddress() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.ipify.org'))
          .timeout(Duration(seconds: 5));

      if (response.statusCode == 200) {
        final ip = response.body.trim();
        return ip.isNotEmpty ? ip : null;
      }
    } catch (e) {
      // Игнорируем ошибки получения IP - не критично
      if (kDebugMode) {
        print('DeviceInfoService: не удалось получить IP адрес - $e');
      }
    }
    return null;
  }
}
