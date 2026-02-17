import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_manager_flutter/common/constants/env_consts.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/device_info_service.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';
import 'package:version_manager_flutter/version_manager_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDsn;

      // Окружение
      options.environment = isProd ? 'production' : 'development';

      // В debug-режиме полезно видеть диагностику Sentry
      options.debug = kDebugMode;

      // Производительность: в проде сэмплируем 20%, в dev — 100%
      options.tracesSampleRate = isProd ? 0.2 : 1.0;
      options.profilesSampleRate = isProd ? 0.2 : 1.0;

      // Навигация — автоматический трекинг переходов между экранами
      options.enableAutoPerformanceTracing = true;
    },
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();

      final serverUrl = _getServerUrl();

      // Инициализируем storage первым
      final storageService = StorageService();
      await storageService.initialize();

      // Инициализируем клиент с поддержкой аутентификации
      final clientService = ClientService();
      clientService.initializeClient(serverUrl, storageService: storageService);

      final deviceInfoService = DeviceInfoService();

      // Устанавливаем release из package info
      final packageInfo = await PackageInfo.fromPlatform();
      Sentry.configureScope((scope) {
        scope.setTag('version', packageInfo.version);
        scope.setTag('buildNumber', packageInfo.buildNumber);
      });

      runApp(
        SentryWidget(
          child: Provider<ClientService>(
            create: (context) => clientService,
            child: Provider<StorageService>(
              create: (context) => storageService,
              child: Provider(
                create: (context) => deviceInfoService,
                child: const VersionManagerApp(),
              ),
            ),
          ),
        ),
      );
    },
  );
}

/// Получает URL сервера из переменных окружения или возвращает значение по умолчанию.
String _getServerUrl() {
  const urlFromEnv = serverUrl;

  return urlFromEnv;
}
