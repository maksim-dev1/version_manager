import 'package:version_manager_client/version_manager_client.dart';

class ApiService {
  static Client? _client;

  static void initialize(String serverUrl) {
    _client = Client(serverUrl);
  }

  static Client get client {
    if (_client == null) {
      throw Exception('ApiService not initialized. Call initialize() first.');
    }
    return _client!;
  }

  static Future<bool> login(String login, String password) async {
    try {
      final result = await client.auth.login(login, password);
      return result;
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  
}
