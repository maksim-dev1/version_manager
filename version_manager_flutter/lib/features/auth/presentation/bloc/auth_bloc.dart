import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/auth/domain/repository/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// BLoC для управления глобальным состоянием аутентификации.
///
/// Отвечает за:
/// - Проверку авторизации пользователя (наличие токенов)
/// - Проверку существования email в системе
/// - Обновление токенов (refresh)
/// - Выход из системы (logout/logoutAll)
///
/// ВАЖНО: Блоки не должны общаться друг с другом напрямую.
/// События блока приватные (с префиксом _).
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(const AuthState.loading()) {
    // ===== Регистрация обработчиков событий =====
    on<AuthEvent>(
      (event, emit) => switch (event) {
        // Событие: проверка авторизации при запуске
        _CheckAuth() => _onCheckAuth(emit: emit),
        // Событие: проверка существования email
        _CheckEmail(:final email) => _onCheckEmail(email: email, emit: emit),
        // Событие: обновление токенов
        _RefreshTokens(:final refreshToken) => _onRefreshTokens(
          refreshToken: refreshToken,
          emit: emit,
        ),
        // Событие: выход из текущей сессии
        _Logout(:final accessToken) => _onLogout(
          accessToken: accessToken,
          emit: emit,
        ),
        // Событие: выход из всех сессий
        _LogoutAll(:final accessToken) => _onLogoutAll(
          accessToken: accessToken,
          emit: emit,
        ),
      },
    );
  }

  // ===== Методы-обработчики событий =====

  /// Метод: проверка сохранённой сессии при запуске приложения
  ///
  /// Проверяет наличие токенов в хранилище:
  /// - Если токены есть → состояние `authenticated`
  /// - Если токенов нет → состояние `unauthenticated`
  Future<void> _onCheckAuth({required Emitter<AuthState> emit}) async {
    emit(const AuthState.loading());
    try {
      final isAuth = await _authRepository.checkAuth();

      if (isAuth) {
        // Получаем сохранённые токены
        final tokens = await _authRepository.getSavedTokens();
        if (tokens != null) {
          emit(
            AuthState.authenticated(
              // TODO: Получить данные пользователя из токена или с сервера
              user: UserPublic(
                id: UuidValue.fromString(
                  '00000000-0000-0000-0000-000000000000',
                ),
                email: '',
                isEmailVerified: true,
                createdAt: DateTime.now(),
              ),
              accessToken: tokens.accessToken,
              refreshToken: tokens.refreshToken,
            ),
          );
        } else {
          emit(const AuthState.unauthenticated());
        }
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(message: 'Ошибка проверки авторизации: $e'));
    }
  }

  /// Метод: проверка существования email в системе
  ///
  /// Отправляет запрос на сервер для проверки email:
  /// - Если email существует → `emailChecked` с emailExists: true (направить на вход)
  /// - Если email не существует → `emailChecked` с emailExists: false (направить на регистрацию)
  Future<void> _onCheckEmail({
    required String email,
    required Emitter<AuthState> emit,
  }) async {
    emit(const AuthState.loading());
    try {
      final response = await _authRepository.checkEmail(email: email);

      // Возвращаем emailChecked с информацией о результате проверки email
      emit(
        AuthState.emailChecked(
          email: email,
          emailExists: response.existsEmail,
          codeSent: response.codeSent,
          retryAfterSeconds: response.retryAfterSeconds,
        ),
      );
    } on InvalidDataException catch (e) {
      emit(AuthState.error(message: e.message, field: e.field));
    } catch (e) {
      emit(AuthState.error(message: 'Ошибка проверки email: $e'));
    }
  }

  /// Метод: обновление токенов
  ///
  /// Использует refresh token для получения новой пары токенов.
  /// При успехе обновляет состояние с новыми токенами.
  Future<void> _onRefreshTokens({
    required String refreshToken,
    required Emitter<AuthState> emit,
  }) async {
    try {
      final response = await _authRepository.refreshTokens(
        refreshToken: refreshToken,
      );

      // Сохраняем текущего пользователя, обновляем только токены
      final currentState = state;
      if (currentState is _Authenticated) {
        emit(
          AuthState.authenticated(
            user: currentState.user,
            accessToken: response.accessToken,
            refreshToken: response.refreshToken,
          ),
        );
      }
    } on InvalidDataException catch (e) {
      // Refresh token недействителен - разлогиниваем
      emit(const AuthState.unauthenticated());
      emit(AuthState.error(message: e.message, field: e.field));
    } catch (e) {
      emit(AuthState.error(message: 'Ошибка обновления токенов: $e'));
    }
  }

  /// Метод: выход из текущей сессии
  ///
  /// Отправляет запрос на сервер и очищает локальные токены.
  Future<void> _onLogout({
    required String accessToken,
    required Emitter<AuthState> emit,
  }) async {
    try {
      emit(const AuthState.loading());

      await _authRepository.logout(accessToken: accessToken);

      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(message: 'Ошибка выхода: $e'));
    }
  }

  /// Метод: выход из всех сессий
  ///
  /// Завершает все активные сессии пользователя на всех устройствах.
  Future<void> _onLogoutAll({
    required String accessToken,
    required Emitter<AuthState> emit,
  }) async {
    try {
      emit(const AuthState.loading());

      await _authRepository.logoutAll(accessToken: accessToken);

      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(message: 'Ошибка выхода: $e'));
    }
  }
}
