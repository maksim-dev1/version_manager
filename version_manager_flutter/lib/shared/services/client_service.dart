import 'package:version_manager_client/version_manager_client.dart';

class ClientService {
  Client? _client;

  Future<void> initializeClient(String baseUrl) async {
    _client = Client(baseUrl);
  }

  EndpointAuth get auth => _client != null
      ? _client!.auth
      : throw InvalidDataException(
          message: 'Клиент не инициализирован',
          field: 'ClientService',
          stackTrace: StackTrace.current.toString(),
        );
}
