import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для входа в систему
abstract interface class LoginRepository {
  /// Аутентифицирует пользователя по email и паролю
  Future<AuthResponse> login({
    required String email,
    required String password,
  });
}
