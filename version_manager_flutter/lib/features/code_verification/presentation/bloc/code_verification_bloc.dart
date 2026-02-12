import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';

part 'code_verification_bloc.freezed.dart';
part 'code_verification_event.dart';
part 'code_verification_state.dart';

/// BLoC для проверки кода верификации и повторной отправки.
///
/// Выделен из RegistrationBloc, чтобы изолировать
/// шаг подтверждения кода от шага создания пароля.
class CodeVerificationBloc
    extends Bloc<CodeVerificationEvent, CodeVerificationState> {
  final RegistrationRepository _registrationRepository;

  CodeVerificationBloc({
    required RegistrationRepository registrationRepository,
  }) : _registrationRepository = registrationRepository,
       super(const CodeVerificationState.initial()) {
    on<CodeVerificationEvent>(
      (event, emit) => switch (event) {
        _VerifyCode(:final email, :final code) => _onVerifyCode(
          email: email,
          code: code,
          emit: emit,
        ),
        _ResendCode(:final email) => _onResendCode(
          email: email,
          emit: emit,
        ),
      },
    );
  }

  // ── Проверка кода ──

  Future<void> _onVerifyCode({
    required String email,
    required String code,
    required Emitter<CodeVerificationState> emit,
  }) async {
    emit(const CodeVerificationState.loading());
    try {
      final response = await _registrationRepository.verifyCode(
        email: email,
        code: code,
      );
      if (response.success) {
        emit(CodeVerificationState.verified(email: email));
      } else {
        emit(
          const CodeVerificationState.error(message: 'Неверный код'),
        );
      }
    } on TooManyAttemptsException catch (e) {
      emit(
        CodeVerificationState.error(
          message: e.message,
          isAttemptsExhausted: true,
        ),
      );
    } on InvalidDataException catch (e) {
      emit(
        CodeVerificationState.error(message: e.message, field: e.field),
      );
    } catch (e) {
      emit(
        CodeVerificationState.error(message: 'Ошибка проверки кода: $e'),
      );
    }
  }

  // ── Повторная отправка ──

  Future<void> _onResendCode({
    required String email,
    required Emitter<CodeVerificationState> emit,
  }) async {
    try {
      final response = await _registrationRepository.resendCode(email: email);

      if (response.retryAfterSeconds != null) {
        return; // rate limit — UI управляет таймером самостоятельно
      }

      if (response.success) {
        emit(const CodeVerificationState.initial());
        return;
      }

      emit(
        const CodeVerificationState.error(
          message: 'Не удалось отправить код',
        ),
      );
    } on InvalidDataException catch (e) {
      emit(
        CodeVerificationState.error(message: e.message, field: e.field),
      );
    } catch (e) {
      emit(
        CodeVerificationState.error(message: 'Ошибка отправки кода: $e'),
      );
    }
  }
}
