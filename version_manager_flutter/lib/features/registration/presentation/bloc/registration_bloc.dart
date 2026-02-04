import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';

part 'registration_bloc.freezed.dart';
part 'registration_event.dart';
part 'registration_state.dart';

/// BLoC для управления процессом регистрации.
///
/// Отвечает ТОЛЬКО за:
/// - Проверку введённого кода верификации
/// - Повторную отправку кода
/// - Регистрацию с созданием пароля и автовходом
///
/// ВАЖНО:
/// - Проверка email и отправка первого кода выполняется в AuthBloc
/// - Блоки не должны общаться друг с другом напрямую
/// - События блока приватные (с префиксом _)
/// - После успешной регистрации UI должен вызвать AuthBloc.setAuthenticated()
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository _registrationRepository;

  RegistrationBloc({
    required RegistrationRepository registrationRepository,
  }) : _registrationRepository = registrationRepository,
       super(const RegistrationState.initial()) {
    // ===== Регистрация обработчиков событий =====
    on<RegistrationEvent>(
      (event, emit) => switch (event) {
        // Событие: проверка введённого кода верификации
        _VerifyCode(:final email, :final code) => _onVerifyCode(
          email: email,
          code: code,
          emit: emit,
        ),
        // Событие: повторная отправка кода
        _ResendCode(:final email) => _onResendCode(email: email, emit: emit),
        // Событие: регистрация с созданием пароля
        _Register(:final email, :final password) => _onRegister(
          email: email,
          password: password,
          emit: emit,
        ),
      },
    );
  }

  // ===== Методы-обработчики событий =====

  /// Метод: проверка введённого кода верификации
  ///
  /// Отправляет код на сервер для проверки.
  /// При успехе переходит в initial состояние (готово к созданию пароля).
  Future<void> _onVerifyCode({
    required String email,
    required String code,
    required Emitter<RegistrationState> emit,
  }) async {
    try {
      emit(const RegistrationState.registrationLoading());

      // Отправляем код на проверку
      final response = await _registrationRepository.verifyCode(
        email: email,
        code: code,
      );

      if (response.success) {
        emit(
          RegistrationState.codeConfirmated(
            email: email,
          ),
        );
      } else {
        emit(
          RegistrationState.registrationError(
            message: 'Неверный код',
          ),
        );
      }
    } on TooManyAttemptsException catch (e) {
      emit(
        RegistrationState.attemptsExhausted(
          message: e.message,
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
          message: 'Ошибка проверки кода: $e',
        ),
      );
    }
  }

  /// Метод: повторная отправка кода верификации
  ///
  /// Отправляет запрос на повторную отправку кода на email.
  /// Учитывает rate limit.
  Future<void> _onResendCode({
    required String email,
    required Emitter<RegistrationState> emit,
  }) async {
    try {
      final response = await _registrationRepository.resendCode(email: email);

      // Rate limit
      if (response.retryAfterSeconds != null) {
        return;
      }

      // Код успешно отправлен - сбрасываем состояние для разблокировки ввода
      if (response.success) {
        emit(const RegistrationState.initial());
        return;
      }

      emit(
        RegistrationState.registrationError(
          message: 'Не удалось отправить код',
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
          message: 'Ошибка отправки кода: $e',
        ),
      );
    }
  }

  /// Метод: регистрация пользователя
  ///
  /// Отправляет email, код и пароль на сервер для создания аккаунта.
  /// При успехе возвращает данные пользователя и токены (автовход).
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
