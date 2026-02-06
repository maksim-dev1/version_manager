import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для работы с профилем пользователя.
///
/// Отвечает за:
/// - Получение информации о текущем пользователе
abstract interface class UserRepository {
  /// Получает информацию о текущем авторизованном пользователе.
  Future<UserPublic> getCurrentUser();
}
