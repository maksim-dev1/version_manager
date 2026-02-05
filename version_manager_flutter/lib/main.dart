import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/device_info_service.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';
import 'package:version_manager_flutter/version_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = _getServerUrl();

  // Инициализируем storage первым (синхронно ждём)
  final storageService = StorageService();
  await storageService.initialize();

  // Инициализируем клиент с поддержкой аутентификации
  final clientService = ClientService();
  clientService.initializeClient(serverUrl, storageService: storageService);

  final deviceInfoService = DeviceInfoService();

  runApp(
    Provider<ClientService>(
      create: (context) => clientService,
      child: Provider<StorageService>(
        create: (context) => storageService,
        child: Provider(
          create: (context) => deviceInfoService,
          child: const VersionManagerApp(),
        ),
      ),
    ),
  );
}

/// Получает URL сервера из переменных окружения или возвращает значение по умолчанию.
String _getServerUrl() {
  final urlFromEnv = const String.fromEnvironment('SERVER_URL');
  return urlFromEnv.isNotEmpty ? urlFromEnv : 'http://localhost:8080/';
}
