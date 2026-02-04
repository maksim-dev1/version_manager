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
/// - Установку состояния авторизации после входа/регистрации
/// - Обновление токенов (refresh)
/// - Выход из системы (logout/logoutAll)
///
/// ВАЖНО: Блок управляет только состоянием авторизован/не авторизован.
/// Логика проверки email, входа и регистрации вынесена в отдельные фичи.
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
        // Событие: установка авторизованного состояния
        // _SetAuthenticated(
        //   :final user,
        //   :final accessToken,
        //   :final refreshToken,
        // ) =>
        //   _onSetAuthenticated(
        //     user: user,
        //     accessToken: accessToken,
        //     refreshToken: refreshToken,
        //     emit: emit,
        //   ),
        // // Событие: обновление токенов
        // _RefreshTokens(:final refreshToken) => _onRefreshTokens(
        //   refreshToken: refreshToken,
        //   emit: emit,
        // ),
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
        emit(
          AuthState.authenticated(),
        );
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      // При ошибке считаем пользователя не авторизованным
      emit(const AuthState.unauthenticated());
    }
  }

  /// Метод: установка авторизованного состояния
  ///
  /// Вызывается после успешного входа или регистрации.
  /// Сохраняет токены и устанавливает состояние authenticated.
  // Future<void> _onSetAuthenticated({
  //   required UserPublic user,
  //   required String accessToken,
  //   required String refreshToken,
  //   required Emitter<AuthState> emit,
  // }) async {
  //   try {
  //     // Сохраняем токены в хранилище
  //     await _authRepository.saveTokens(
  //       accessToken: accessToken,
  //       refreshToken: refreshToken,
  //     );

  //     emit(
  //       AuthState.authenticated(

  //       ),
  //     );
  //   } catch (e) {
  //     emit(const AuthState.unauthenticated());
  //   }
  // }

  /// Метод: обновление токенов
  ///
  /// Использует refresh token для получения новой пары токенов.
  /// При успехе обновляет состояние с новыми токенами.
  // Future<void> _onRefreshTokens({
  //   required String refreshToken,
  //   required Emitter<AuthState> emit,
  // }) async {
  //   try {
  //     final response = await _authRepository.refreshTokens(
  //       refreshToken: refreshToken,
  //     );

  //     // Сохраняем текущего пользователя, обновляем только токены
  //     final currentState = state;
  //     if (currentState is Authenticated) {
  //       emit(
  //         AuthState.authenticated(
  //           user: currentState.user,
  //           accessToken: response.accessToken,
  //           refreshToken: response.refreshToken,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     // Refresh token недействителен - разлогиниваем
  //     emit(const AuthState.unauthenticated());
  //   }
  // }

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
      // Даже при ошибке разлогиниваем локально
      emit(const AuthState.unauthenticated());
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
      // Даже при ошибке разлогиниваем локально
      emit(const AuthState.unauthenticated());
    }
  }
}
