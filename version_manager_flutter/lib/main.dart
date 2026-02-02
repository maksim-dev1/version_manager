import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/theme/snow_ui/snow_theme.dart';
import 'package:version_manager_flutter/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = _getServerUrl();

  final client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(const VersionManagerApp());
}

String _getServerUrl() {
  final urlFromEnv = const String.fromEnvironment('SERVER_URL');
  return urlFromEnv.isNotEmpty ? urlFromEnv : 'http://localhost:8080/';
}

class VersionManagerApp extends StatefulWidget {
  const VersionManagerApp({super.key});

  @override
  State<VersionManagerApp> createState() => _VersionManagerAppState();
}

class _VersionManagerAppState extends State<VersionManagerApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode = switch (_themeMode) {
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.system,
        ThemeMode.system => ThemeMode.light,
      };
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
