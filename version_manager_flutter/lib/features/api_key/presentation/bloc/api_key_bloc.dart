import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';

part 'api_key_bloc.freezed.dart';
part 'api_key_event.dart';
part 'api_key_state.dart';

/// BLoC для регенерации API ключа.
///
/// Управляет 3-шаговым процессом:
/// 1. Загрузка email владельца → [ApiKeyResult.emailLoaded]
/// 2. Отправка кода → [ApiKeyResult.codeSent]
/// 3. Регенерация ключа → [ApiKeyResult.regenerated]
class ApiKeyBloc extends Bloc<ApiKeyEvent, ApiKeyState> {
  final ApplicationRepository _applicationRepository;

  ApiKeyBloc({
    required ApplicationRepository applicationRepository,
  }) : _applicationRepository = applicationRepository,
       super(const ApiKeyState.initial()) {
    on<ApiKeyEvent>(
      (event, emit) => switch (event) {
        _FetchEmail(:final applicationId) => _onFetchEmail(
          applicationId: applicationId,
          emit: emit,
        ),
        _RequestCode(:final applicationId) => _onRequestCode(
          applicationId: applicationId,
          emit: emit,
        ),
        _Regenerate(:final applicationId, :final code) => _onRegenerate(
          applicationId: applicationId,
          code: code,
          emit: emit,
        ),
      },
    );
  }

  // ── Загрузка email ──

  Future<void> _onFetchEmail({
    required UuidValue applicationId,
    required Emitter<ApiKeyState> emit,
  }) async {
    emit(const ApiKeyState.loading());
    try {
      final maskedEmail = await _applicationRepository
          .getRegenerationTargetEmail(
            applicationId: applicationId,
          );
      emit(
        ApiKeyState.loaded(
          result: ApiKeyResult.emailLoaded(maskedEmail: maskedEmail),
        ),
      );
    } catch (e) {
      emit(ApiKeyState.error(message: e.toString()));
    }
  }

  // ── Отправка кода ──

  Future<void> _onRequestCode({
    required UuidValue applicationId,
    required Emitter<ApiKeyState> emit,
  }) async {
    emit(const ApiKeyState.loading());
    try {
      final response = await _applicationRepository.requestApiKeyRegeneration(
        applicationId: applicationId,
      );
      emit(
        ApiKeyState.loaded(
          result: ApiKeyResult.codeSent(
            maskedEmail: response.maskedEmail,
            retryAfterSeconds: response.retryAfterSeconds,
          ),
        ),
      );
    } catch (e) {
      emit(ApiKeyState.error(message: e.toString()));
    }
  }

  // ── Регенерация ──

  Future<void> _onRegenerate({
    required UuidValue applicationId,
    required String code,
    required Emitter<ApiKeyState> emit,
  }) async {
    emit(const ApiKeyState.loading());
    try {
      final response = await _applicationRepository.regenerateApiKey(
        applicationId: applicationId,
        code: code,
      );
      emit(
        ApiKeyState.loaded(
          result: ApiKeyResult.regenerated(
            apiKey: response.apiKey,
            regeneratedAt: response.regeneratedAt,
          ),
        ),
      );
    } catch (e) {
      emit(ApiKeyState.error(message: e.toString()));
    }
  }
}
