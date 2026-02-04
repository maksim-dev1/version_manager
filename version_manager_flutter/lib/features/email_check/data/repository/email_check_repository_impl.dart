import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/email_check/domain/repository/email_check_repository.dart';

/// Реализация репозитория проверки email.
class EmailCheckRepositoryImpl implements EmailCheckRepository {
  final EndpointAuth _authEndpoint;

  EmailCheckRepositoryImpl({
    required EndpointAuth authEndpoint,
  }) : _authEndpoint = authEndpoint;

  @override
  Future<CheckEmailAndSendCodeResponse> checkEmail({
    required String email,
  }) async {
    return await _authEndpoint.checkEmailAndSendCode(
      request: CheckEmailRequest(email: email),
    );
  }
}
