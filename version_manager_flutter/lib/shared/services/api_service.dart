import 'package:version_manager_client/version_manager_client.dart';

class ApiService {
  Client? _client;

  Client get client {
    if (_client == null) {
      throw Exception('ApiService not initialized. Call initClient() first.');
    }
    return _client!;
  }

  Future<void> initClient(String serverUrl) async {
    _client = Client(serverUrl);
  }
}