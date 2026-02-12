import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/auth/presentation/auth_provider.dart';
import 'package:version_manager_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/features/email_check/presentation/view/email_screen.dart';
import 'package:version_manager_flutter/features/email_check/email_check_provider.dart';
import 'package:version_manager_flutter/screens/home_screen.dart';
import 'package:version_manager_flutter/theme/snow_ui/snow_theme.dart';

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
      home: AppAuth(
        themeMode: _themeMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

class AppAuth extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;
  const AppAuth({
    super.key,
    required this.themeMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => switch (state) {
          Authenticated() => HomeScreen(
            themeMode: themeMode,
            onThemeToggle: onThemeToggle,
          ),
          Unauthenticated() => EmailCheckProvider(child: EmailScreen()),
          _ => Scaffold(
            body: Center(
              child: Text('Не обработанное состояние AuthState: $state'),
            ),
          ),
        },
      ),
    );
  }
}
