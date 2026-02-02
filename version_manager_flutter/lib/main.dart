import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = _getServerUrl();

  final client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();
    // ..authSessionManager = FlutterAuthSessionManager();

  // await client.auth.initialize();

  // runApp(MaterialApp(
  //   home: AuthScreen(client: client),
  // ));

}

String _getServerUrl() {
  final urlFromEnv = const String.fromEnvironment('SERVER_URL');
  return urlFromEnv.isNotEmpty ? urlFromEnv : 'http://localhost:8080/';
}


