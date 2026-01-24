import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class ApiClientService {
  Client? _client;

  Client get client {
    if (_client == null) {
      throw Exception('ApiService not initialized. Call initClient() first.');
    }
    return _client!;
  }

  Future<void> initClient(String serverUrl) async {
    _client = Client(serverUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor()
      ..authSessionManager = FlutterAuthSessionManager();

    await _client?.auth.initialize();
  }
}
