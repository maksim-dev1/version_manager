import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/user/domain/repository/user_repository.dart';

part 'user_profile_bloc.freezed.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

/// BLoC для управления профилем пользователя.
///
/// Отвечает за:
/// - Загрузку информации о текущем пользователе
/// - Обновление отображаемых данных профиля
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRepository _userRepository;

  UserProfileBloc({
    required UserRepository userRepository,
  }) : _userRepository = userRepository,
       super(const UserProfileState.initial()) {
    on<UserProfileEvent>(
      (event, emit) => switch (event) {
        _LoadProfile() => _onLoadProfile(emit: emit),
      },
    );
  }

  /// Загружает профиль пользователя.
  Future<void> _onLoadProfile({
    required Emitter<UserProfileState> emit,
  }) async {
    emit(const UserProfileState.userProfileLoading());
    try {
      final user = await _userRepository.getCurrentUser();
      emit(UserProfileState.userProfileLoaded(user: user));
    } catch (e) {
      emit(UserProfileState.userProfileError(message: e.toString()));
    }
  }
}
