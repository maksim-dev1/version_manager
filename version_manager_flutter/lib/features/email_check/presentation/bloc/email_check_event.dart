part of 'email_check_bloc.dart';

/// События для EmailCheckBloc.
@freezed
sealed class EmailCheckEvent with _$EmailCheckEvent {
  /// Событие: проверка существования email в системе
  ///
  /// Отправляет запрос на сервер для определения,
  /// зарегистрирован ли пользователь с данным email.
  const factory EmailCheckEvent.checkEmail({
    required String email,
  }) = _CheckEmail;
}
