import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/login/domain/repository/login_repository.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

/// BLoC для управления процессом входа в систему.
///
/// Отвечает ТОЛЬКО за:
/// - Вход по email и паролю
///
/// ВАЖНО:
/// - Проверка email выполняется в AuthBloc
/// - Блоки не должны общаться друг с другом напрямую
/// - События блока приватные (с префиксом _)
/// - После успешного входа UI должен вызвать AuthBloc.setAuthenticated()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository,
       super(const LoginState.initial()) {
    // ===== Регистрация обработчиков событий =====
    on<LoginEvent>(
      (event, emit) => switch (event) {
        // Событие: вход в систему по email и паролю
        _Login(:final email, :final password) => _onLogin(
          email: email,
          password: password,
          emit: emit,
        ),
      },
    );
  }

  // ===== Методы-обработчики событий =====

  /// Метод: вход в систему
  ///
  /// Отправляет email и пароль на сервер для аутентификации.
  /// При успехе возвращает данные пользователя и токены.
  ///
  /// ВАЖНО: После успешного входа UI должен:
  /// 1. Вызвать AuthBloc.setAuthenticated() с полученными данными
  /// 2. Перенаправить на главную страницу
  Future<void> _onLogin({
    required String email,
    required String password,
    required Emitter<LoginState> emit,
  }) async {
    try {
      emit(const LoginState.loading());

      final response = await _loginRepository.login(
        email: email,
        password: password,
      );

      emit(
        LoginState.success(
          user: response.user,
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        ),
      );
    } on InvalidDataException catch (e) {
      emit(LoginState.error(message: e.message, field: e.field));
    } catch (e) {
      emit(LoginState.error(message: 'Ошибка входа: $e'));
    }
  }
}
