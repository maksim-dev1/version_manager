import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:version_manager_flutter/app.dart';
import 'package:version_manager_flutter/shared/services/api_service.dart';

void main() async {
  final serverUrl = _getServerUrl();
  // Инициализация API сервиса
  final apiService = ApiService();
  await apiService.initClient(serverUrl);

  runApp(
    Provider(
      create: (context) => apiService,
      child: const App(),
    ),
  );
}

String _getServerUrl() {
  final serverUrlFromEnv = const String.fromEnvironment('SERVER_URL');

  final serverUrl = serverUrlFromEnv.isEmpty
      ? 'http://$localhost:8080/'
      : serverUrlFromEnv;

  return serverUrl;
}

// class VersionManagerApp extends StatelessWidget {
//   const VersionManagerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Version Manager',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.deepPurple,
//           brightness: Brightness.light,
//         ),
//         useMaterial3: true,
//         cardTheme: CardThemeData(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//       darkTheme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.deepPurple,
//           brightness: Brightness.dark,
//         ),
//         useMaterial3: true,
//         cardTheme: CardThemeData(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//       themeMode: ThemeMode.system,
//       home: const LoginScreen(),
//     );
//   }
// }
