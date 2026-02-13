import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_flutter/features/auth/domain/repository/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// BLoC для управления глобальным состоянием аутентификации.
///
/// Отвечает за:
/// - Проверку авторизации пользователя (наличие токенов)
/// - Установку состояния авторизации после входа/регистрации
/// - Выход из системы (logout/logoutAll)
///
/// ## Refresh токенов
/// Refresh выполняется автоматически через [AuthKeyProvider]
/// при получении 401 ошибки от сервера.
///
/// ## Сроки жизни токенов
/// - **Access Token**: 1 час
/// - **Refresh Token**: 30 дней
///
/// ВАЖНО: Блок управляет только состоянием авторизован/не авторизован.
/// Логика проверки email, входа и регистрации вынесена в отдельные фичи.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(const AuthState.authLoading()) {
    // ===== Регистрация обработчиков событий =====
    on<AuthEvent>(
      (event, emit) => switch (event) {
        // Событие: проверка авторизации при запуске
        _CheckAuth() => _onCheckAuth(emit: emit),
        // Событие: выход из текущей сессии
        _Logout() => _onLogout(emit: emit),
        // Событие: выход из всех сессий
        _LogoutAll() => _onLogoutAll(emit: emit),
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
    emit(const AuthState.authLoading());
    try {
      final isAuth = await _authRepository.checkAuth();

      if (isAuth) {
        emit(const AuthState.authenticated());
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      // При ошибке считаем пользователя не авторизованным
      emit(const AuthState.unauthenticated());
    }
  }

  /// Метод: выход из текущей сессии
  ///
  /// Отправляет запрос на сервер и очищает локальные токены.
  Future<void> _onLogout({required Emitter<AuthState> emit}) async {
    try {
      emit(const AuthState.authLoading());
      await _authRepository.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      // Даже при ошибке разлогиниваем локально
      emit(const AuthState.unauthenticated());
    }
  }

  /// Метод: выход из всех сессий
  ///
  /// Завершает все активные сессии пользователя на всех устройствах.
  Future<void> _onLogoutAll({required Emitter<AuthState> emit}) async {
    try {
      emit(const AuthState.authLoading());
      await _authRepository.logoutAll();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      // Даже при ошибке разлогиниваем локально
      emit(const AuthState.unauthenticated());
    }
  }
}
