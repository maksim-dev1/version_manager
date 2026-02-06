part of 'user_profile_bloc.dart';

/// Состояния для UserProfileBloc.
@freezed
sealed class UserProfileState with _$UserProfileState {
  /// Начальное состояние.
  const factory UserProfileState.initial() = Initial;

  /// Загрузка профиля.
  const factory UserProfileState.userProfileLoading() = UserProfileLoading;

  /// Профиль загружен.
  const factory UserProfileState.userProfileLoaded({required UserPublic user}) =
      UserProfileLoaded;

  /// Ошибка загрузки.
  const factory UserProfileState.userProfileError({required String message}) =
      UserProfileError;
}
