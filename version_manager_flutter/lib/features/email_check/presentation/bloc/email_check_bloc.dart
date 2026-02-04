import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_flutter/features/email_check/domain/repository/email_check_repository.dart';

part 'email_check_bloc.freezed.dart';
part 'email_check_event.dart';
part 'email_check_state.dart';

/// BLoC для управления проверкой email при входе/регистрации.
///
/// Отвечает за:
/// - Проверку существования email в системе
/// - Валидацию формата email
/// - Отправку кода верификации при регистрации
class EmailCheckBloc extends Bloc<EmailCheckEvent, EmailCheckState> {
  final EmailCheckRepository _emailCheckRepository;

  EmailCheckBloc({
    required EmailCheckRepository emailCheckRepository,
  }) : _emailCheckRepository = emailCheckRepository,
       super(const EmailCheckState.initial()) {
    // Регистрация обработчиков событий
    on<EmailCheckEvent>(
      (event, emit) => switch (event) {
        _CheckEmail(:final email) => _onCheckEmail(email: email, emit: emit),
      },
    );
  }

  /// Метод: проверка существования email в системе
  ///
  /// Отправляет запрос на сервер для проверки email:
  /// - Если email существует → состояние `checked` с emailExists: true
  /// - Если email не существует → состояние `checked` с emailExists: false
  Future<void> _onCheckEmail({
    required String email,
    required Emitter<EmailCheckState> emit,
  }) async {
    emit(const EmailCheckState.emailCheckLoading());

    try {
      final result = await _emailCheckRepository.checkEmail(email: email);

      emit(
        EmailCheckState.emailCheckSuccess(
          email: email,
          emailExists: result.existsEmail,
        
          retryAfterSeconds: result.retryAfterSeconds,
        ),
      );
    } catch (e) {
      emit(
        EmailCheckState.emailCheckError(
          message: 'Ошибка проверки email: $e',
        ),
      );
    }
  }

}
