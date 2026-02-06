part of 'user_profile_bloc.dart';

/// События для UserProfileBloc.
@freezed
sealed class UserProfileEvent with _$UserProfileEvent {
  /// Загрузить профиль пользователя.
  const factory UserProfileEvent.loadProfile() = _LoadProfile;
}
