import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';
import 'package:version_manager_flutter/shared/services/auth_key_provider.dart';
import 'package:version_manager_flutter/shared/services/device_info_service.dart';

/// Реализация репозитория регистрации.
class RegistrationRepositoryImpl implements RegistrationRepository {
  final EndpointAuth _authEndpoint;
  final AuthKeyProvider _authKeyProvider;
  final DeviceInfoService _deviceInfoService;

  RegistrationRepositoryImpl({
    required EndpointAuth authEndpoint,
    required AuthKeyProvider authKeyProvider,
    required DeviceInfoService deviceInfoService,
  }) : _authEndpoint = authEndpoint,
       _authKeyProvider = authKeyProvider,
       _deviceInfoService = deviceInfoService;

  @override
  Future<SendCodeResponse> resendCode({
    required String email,
  }) async {
    return await _authEndpoint.resendCode(
      request: RegisterSendCodeRequest(email: email),
    );
  }

  @override
  Future<SuccessResponse> verifyCode({
    required String email,
    required String code,
  }) async {
    return await _authEndpoint.verifyRegisterCode(
      request: RegisterVerifyCodeRequest(email: email, code: code),
    );
  }

  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
  }) async {
    // Получаем информацию об устройстве
    final deviceInfo = await _deviceInfoService.getDeviceInfo();
    final userAgent = await _deviceInfoService.getUserAgent();
    final ipAddress = await _deviceInfoService.getPublicIpAddress();

    final response = await _authEndpoint.register(
      request: RegisterRequest(
        email: email,
        password: password,
        deviceInfo: deviceInfo,
        userAgent: userAgent,
        ipAddress: ipAddress,
      ),
    );

    // Сохраняем токены после успешной регистрации (автовход)
    await _authKeyProvider.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    return response;
  }
}
