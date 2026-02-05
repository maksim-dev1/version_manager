import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/login/domain/repository/login_repository.dart';
import 'package:version_manager_flutter/shared/services/auth_key_provider.dart';
import 'package:version_manager_flutter/shared/services/device_info_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  final EndpointAuth _authEndpoint;
  final AuthKeyProvider _authKeyProvider;
  final DeviceInfoService _deviceInfoService;

  LoginRepositoryImpl({
    required EndpointAuth authEndpoint,
    required AuthKeyProvider authKeyProvider,
    required DeviceInfoService deviceInfoService,
  }) : _authEndpoint = authEndpoint,
       _authKeyProvider = authKeyProvider,
       _deviceInfoService = deviceInfoService;

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    // Получаем информацию об устройстве
    final deviceInfo = await _deviceInfoService.getDeviceInfo();
    final userAgent = await _deviceInfoService.getUserAgent();
    final ipAddress = await _deviceInfoService.getPublicIpAddress();

    final response = await _authEndpoint.login(
      request: LoginRequest(
        email: email,
        password: password,
        deviceInfo: deviceInfo,
        userAgent: userAgent,
        ipAddress: ipAddress,
      ),
    );

    // Сохраняем токены после успешного логина
    await _authKeyProvider.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    return response;
  }
}
