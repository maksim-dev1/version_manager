part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthentication() = _CheckAuthentication;
  const factory AuthEvent.logout() = _Logout;
}
