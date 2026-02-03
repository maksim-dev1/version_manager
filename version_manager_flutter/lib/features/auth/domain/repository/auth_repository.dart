import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления аутентификацией.
///
/// Отвечает за:
/// - Проверку наличия сохранённых токенов
/// - Проверку существования email в системе
/// - Обновление токенов (refresh)
/// - Выход из системы (logout/logoutAll)
/// - Получение сохранённых токенов
abstract interface class AuthRepository {
  /// Проверяет наличие сохранённых токенов.
  ///
  /// ### Возвращает
  /// `true` если токены существуют, `false` если нет.
  Future<bool> checkAuth();

  /// Получает сохранённые токены из хранилища.
  ///
  /// ### Возвращает
  /// Объект с токенами или `null` если токены не найдены.
  Future<({String accessToken, String refreshToken})?> getSavedTokens();

  /// Проверяет существование email в системе.
  ///
  /// Это первый шаг в потоке регистрации/входа. Метод определяет,
  /// существует ли пользователь с указанным email:
  /// - **Если существует** — возвращает `existsEmail: true`
  /// - **Если не существует** — возвращает `existsEmail: false`, `codeSent: true`
  ///   (код верификации отправлен автоматически)
  ///
  /// ### Параметры
  /// - [email] — адрес электронной почты пользователя
  ///
  /// ### Возвращает
  /// [CheckEmailAndSendCodeResponse] со следующими полями:
  /// - `existsEmail` — `true` если пользователь существует
  /// - `codeSent` — `true` если код верификации отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'email'` — невалидный формат email
  Future<CheckEmailAndSendCodeResponse> checkEmail({
    required String email,
  });

  /// Обновляет пару токенов доступа.
  ///
  /// ### Параметры
  /// - [refreshToken] — текущий refresh token
  ///
  /// ### Возвращает
  /// [TokenPairResponse] с новыми токенами
  ///
  /// ### Исключения
  /// - [InvalidDataException] — если refresh token недействителен
  Future<TokenPairResponse> refreshTokens({
    required String refreshToken,
  });

  /// Завершает текущую сессию.
  ///
  /// ### Параметры
  /// - [accessToken] — текущий access token
  Future<SuccessResponse> logout({
    required String accessToken,
  });

  /// Завершает все активные сессии пользователя.
  ///
  /// ### Параметры
  /// - [accessToken] — текущий access token
  Future<SuccessResponse> logoutAll({
    required String accessToken,
  });
}
