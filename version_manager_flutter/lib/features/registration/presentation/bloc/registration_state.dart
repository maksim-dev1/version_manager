part of 'registration_bloc.dart';

/// Состояния для RegistrationBloc.
///
/// Минимальный набор состояний:
/// - initial: начальное состояние
/// - loading: загрузка (проверка кода, отправка кода, регистрация)
/// - success: успешная регистрация
/// - error: ошибка
@freezed
sealed class RegistrationState with _$RegistrationState {
  /// Состояние: начальное
  ///
  /// Может содержать данные о текущем этапе регистрации.
  const factory RegistrationState.initial({
    /// Email пользователя
    String? email,

    /// Проверенный код (если код уже введён)
    String? verifiedCode,

    /// Был ли код повторно отправлен
    @Default(false) bool codeResent,

    /// Время ожидания при rate limit
    int? retryAfterSeconds,
  }) = _Initial;

  /// Состояние: загрузка
  ///
  /// Используется при:
  /// - Проверке кода
  /// - Повторной отправке кода
  /// - Регистрации
  const factory RegistrationState.loading() = _Loading;

  /// Состояние: успешная регистрация
  ///
  /// Содержит данные пользователя и токены (автовход).
  /// После получения этого состояния UI должен:
  /// 1. Обновить AuthBloc состояние
  /// 2. Перенаправить на главную страницу
  const factory RegistrationState.success({
    required UserPublic user,
    required String accessToken,
    required String refreshToken,
  }) = _Success;

  /// Состояние: ошибка
  const factory RegistrationState.error({
    required String message,
    String? field,

    /// Предыдущие данные для восстановления состояния
    String? email,
    String? verifiedCode,
  }) = _RegistrationError;
}
