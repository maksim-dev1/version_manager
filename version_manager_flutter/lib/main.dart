import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:version_manager_client/version_manager_client.dart';

import 'src/services/auth_service.dart';
import 'src/theme/app_theme.dart';
import 'src/screens/auth/login_screen.dart';
import 'src/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = _getServerUrl();

  final client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(VersionManagerApp(client: client));
}

String _getServerUrl() {
  final urlFromEnv = const String.fromEnvironment('SERVER_URL');
  return urlFromEnv.isNotEmpty ? urlFromEnv : 'http://localhost:8080/';
}

class VersionManagerApp extends StatefulWidget {
  final Client client;

  const VersionManagerApp({
    super.key,
    required this.client,
  });

  @override
  State<VersionManagerApp> createState() => _VersionManagerAppState();
}

class _VersionManagerAppState extends State<VersionManagerApp> {
  late final AuthService _authService;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _authService = AuthService(widget.client);
    _initialize();
  }

  Future<void> _initialize() async {
    await _authService.initialize();
    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthService>.value(
      value: _authService,
      child: MaterialApp(
        title: 'Version Manager',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: _buildHome(),
      ),
    );
  }

  Widget _buildHome() {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Загрузка...'),
            ],
          ),
        ),
      );
    }

    return Consumer<AuthService>(
      builder: (context, authService, _) {
        if (authService.isAuthenticated) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
