part of 'registration_bloc.dart';

/// События для RegistrationBloc.
@freezed
sealed class RegistrationEvent with _$RegistrationEvent {
  /// Событие: регистрация с созданием пароля
  ///
  /// Отправляет email и пароль на сервер для создания аккаунта.
  const factory RegistrationEvent.register({
    required String email,
    required String password,
  }) = _Register;
}
