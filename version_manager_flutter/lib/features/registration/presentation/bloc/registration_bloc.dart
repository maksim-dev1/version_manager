import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';

part 'registration_bloc.freezed.dart';
part 'registration_event.dart';
part 'registration_state.dart';

/// BLoC для регистрации пользователя (создание пароля и автовход).
///
/// Отвечает ТОЛЬКО за:
/// - Регистрацию с созданием пароля и автовходом
///
/// Проверка кода верификации вынесена в CodeVerificationBloc.
/// Проверка email и отправка первого кода выполняется в AuthBloc.
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository _registrationRepository;

  RegistrationBloc({
    required RegistrationRepository registrationRepository,
  }) : _registrationRepository = registrationRepository,
       super(const RegistrationState.initial()) {
    on<RegistrationEvent>(
      (event, emit) => switch (event) {
        _Register(:final email, :final password) => _onRegister(
          email: email,
          password: password,
          emit: emit,
        ),
      },
    );
  }

  /// Метод: регистрация пользователя
  Future<void> _onRegister({
    required String email,
    required String password,
    required Emitter<RegistrationState> emit,
  }) async {
    try {
      emit(const RegistrationState.registrationLoading());

      final response = await _registrationRepository.register(
        email: email,
        password: password,
      );

      emit(
        RegistrationState.registrationsuccess(
          user: response.user,
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        ),
      );
    } on InvalidDataException catch (e) {
      emit(
        RegistrationState.registrationError(
          message: e.message,
          field: e.field,
        ),
      );
    } catch (e) {
      emit(
        RegistrationState.registrationError(
          message: 'Ошибка регистрации: $e',
        ),
      );
    }
  }
}
