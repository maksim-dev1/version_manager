import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/theme/snow_ui/snow_theme.dart';
import 'package:version_manager_flutter/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = _getServerUrl();

  final clientService = ClientService()..initializeClient(serverUrl);

  runApp(
    Provider<ClientService>(
      create: (context) => clientService,
      child: const VersionManagerApp(),
    ),
  );
}

class VersionManagerApp extends StatefulWidget {
  const VersionManagerApp({super.key});

  @override
  State<VersionManagerApp> createState() => _VersionManagerAppState();
}

class _VersionManagerAppState extends State<VersionManagerApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Version Manager',
      debugShowCheckedModeBanner: false,
      theme: SnowTheme.light(),
      darkTheme: SnowTheme.dark(),
      themeMode: _themeMode,
      home: HomeScreen(
        themeMode: _themeMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

/// Получает URL сервера из переменных окружения или возвращает значение по умолчанию.
String _getServerUrl() {
  final urlFromEnv = const String.fromEnvironment('SERVER_URL');
  return urlFromEnv.isNotEmpty ? urlFromEnv : 'http://localhost:8080/';
}
