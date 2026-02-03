part of 'login_bloc.dart';

/// События для LoginBloc.
///
/// ВАЖНО: Все события приватные (с префиксом _), чтобы предотвратить
/// вызов событий одного блока из другого блока.
/// Для отправки события используйте методы-расширения ниже.
@freezed
sealed class LoginEvent with _$LoginEvent {
  /// Событие: вход в систему по email и паролю
  const factory LoginEvent.login({
    required String email,
    required String password,
  }) = _Login;
}
