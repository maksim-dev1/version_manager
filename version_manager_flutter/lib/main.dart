// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:serverpod_flutter/serverpod_flutter.dart';
// import 'package:version_manager_flutter/app.dart';
// import 'package:version_manager_flutter/shared/services/api_client_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final serverUrl = _getServerUrl();

//   // Инициализация API сервиса
//   final apiService = ApiClientService();
//   await apiService.initClient(serverUrl);

//   runApp(
//     Provider<ApiClientService>(
//       create: (context) => apiService,
//       child: App(),
//     ),
//   );
// }

// String _getServerUrl() {
//   final serverUrlFromEnv = const String.fromEnvironment('SERVER_URL');

//   final serverUrl = serverUrlFromEnv.isEmpty
//       ? 'http://$localhost:8080/'
//       : serverUrlFromEnv;

//   return serverUrl;
// }
