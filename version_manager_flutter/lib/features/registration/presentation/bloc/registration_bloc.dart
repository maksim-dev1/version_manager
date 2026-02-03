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
        _Register(:final email, :final code, :final password) => _onRegister(
          email: email,
          code: code,
          password: password,
          emit: emit,
        ),
        // Событие: сброс состояния
        _Reset() => _onReset(emit: emit),
      },
    );
  }

  // ===== Методы-обработчики событий =====

  /// Метод: проверка введённого кода верификации
  ///
  /// Проверяет код локально (формат) и отмечает его как проверенный.
  /// Полная верификация происходит на сервере при регистрации.
  Future<void> _onVerifyCode({
    required String email,
    required String code,
    required Emitter<RegistrationState> emit,
  }) async {
    try {
      emit(const RegistrationState.loading());

      // Локальная проверка формата кода (6 цифр)
      final codeRegex = RegExp(r'^\d{6}$');
      if (!codeRegex.hasMatch(code)) {
        emit(
          RegistrationState.error(
            message: 'Код должен содержать 6 цифр',
            field: 'code',
            email: email,
          ),
        );
        return;
      }

      // Код прошёл локальную проверку → можно переходить к созданию пароля
      emit(RegistrationState.initial(email: email, verifiedCode: code));
    } catch (e) {
      emit(
        RegistrationState.error(
          message: 'Ошибка проверки кода: $e',
          email: email,
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
      emit(const RegistrationState.loading());

      final response = await _registrationRepository.resendCode(email: email);

      // Rate limit
      if (response.retryAfterSeconds != null) {
        emit(
          RegistrationState.initial(
            email: email,
            retryAfterSeconds: response.retryAfterSeconds,
          ),
        );
        return;
      }

      // Код успешно отправлен
      if (response.success) {
        emit(RegistrationState.initial(email: email, codeResent: true));
        return;
      }

      emit(
        RegistrationState.error(
          message: 'Не удалось отправить код',
          email: email,
        ),
      );
    } on InvalidDataException catch (e) {
      emit(
        RegistrationState.error(
          message: e.message,
          field: e.field,
          email: email,
        ),
      );
    } catch (e) {
      emit(
        RegistrationState.error(
          message: 'Ошибка отправки кода: $e',
          email: email,
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
    required String code,
    required String password,
    required Emitter<RegistrationState> emit,
  }) async {
    try {
      emit(const RegistrationState.loading());

      final response = await _registrationRepository.register(
        email: email,
        code: code,
        password: password,
      );

      emit(
        RegistrationState.success(
          user: response.user,
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        ),
      );
    } on InvalidDataException catch (e) {
      emit(
        RegistrationState.error(
          message: e.message,
          field: e.field,
          email: email,
          verifiedCode: code,
        ),
      );
    } catch (e) {
      emit(
        RegistrationState.error(
          message: 'Ошибка регистрации: $e',
          email: email,
          verifiedCode: code,
        ),
      );
    }
  }

  /// Метод: сброс состояния
  ///
  /// Возвращает блок в начальное состояние.
  /// Используется при возврате на предыдущий экран.
  Future<void> _onReset({required Emitter<RegistrationState> emit}) async {
    emit(const RegistrationState.initial());
  }
}
