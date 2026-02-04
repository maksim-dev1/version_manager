import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';
import 'package:version_manager_flutter/version_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = _getServerUrl();

  final clientService = ClientService()..initializeClient(serverUrl);

  final storageService = StorageService()..initialize();

  runApp(
    Provider<ClientService>(
      create: (context) => clientService,
      child: Provider<StorageService>(
        create: (context) => storageService,
        child: const VersionManagerApp(),
      ),
    ),
  );
}

/// Получает URL сервера из переменных окружения или возвращает значение по умолчанию.
String _getServerUrl() {
  final urlFromEnv = const String.fromEnvironment('SERVER_URL');
  return urlFromEnv.isNotEmpty ? urlFromEnv : 'http://localhost:8080/';
}
