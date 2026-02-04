import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления аутентификацией.
///
/// Отвечает за:
/// - Проверку наличия сохранённых токенов
/// - Сохранение и получение токенов из хранилища
/// - Обновление токенов (refresh)
/// - Выход из системы (logout/logoutAll)
abstract interface class AuthRepository {
  /// Проверяет наличие сохранённых токенов.
  ///
  /// ### Возвращает
  /// `true` если токены существуют, `false` если нет.
  Future<bool> checkAuth();

  // /// Получает сохранённые токены из хранилища.
  // ///
  // /// ### Возвращает
  // /// Объект с токенами или `null` если токены не найдены.
  // Future<({String accessToken, String refreshToken})?> getSavedTokens();

  // /// Сохраняет токены в хранилище.
  // ///
  // /// ### Параметры
  // /// - [accessToken] — access token для сохранения
  // /// - [refreshToken] — refresh token для сохранения
  // Future<void> saveTokens({
  //   required String accessToken,
  //   required String refreshToken,
  // });

  // /// Обновляет пару токенов доступа.
  // ///
  // /// ### Параметры
  // /// - [refreshToken] — текущий refresh token
  // ///
  // /// ### Возвращает
  // /// [TokenPairResponse] с новыми токенами
  // ///
  // /// ### Исключения
  // /// - [InvalidDataException] — если refresh token недействителен
  // Future<TokenPairResponse> refreshTokens({
  //   required String refreshToken,
  // });

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
