import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/user/domain/repository/user_repository.dart';

/// Реализация репозитория пользователя.
///
/// Использует Serverpod эндпоинт [EndpointAuth]
/// для получения данных о текущем пользователе.
///
/// Авторизация осуществляется автоматически через заголовок запроса.
class UserRepositoryImpl implements UserRepository {
  final EndpointAuth _authEndpoint;

  UserRepositoryImpl({
    required EndpointAuth authEndpoint,
  }) : _authEndpoint = authEndpoint;

  @override
  Future<UserPublic> getCurrentUser() async {
    return await _authEndpoint.getCurrentUser();
  }
}
