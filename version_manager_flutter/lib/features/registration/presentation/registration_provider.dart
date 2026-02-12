import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/code_verification/presentation/bloc/code_verification_bloc.dart';
import 'package:version_manager_flutter/features/registration/data/repository/registration_repository_impl.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';
import 'package:version_manager_flutter/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/device_info_service.dart';

class RegistrationProvider extends StatelessWidget {
  final Widget child;
  const RegistrationProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<RegistrationRepository>(
      create: (context) => RegistrationRepositoryImpl(
        authEndpoint: clientService.auth,
        authKeyProvider: clientService.authKeyProvider,
        deviceInfoService: context.read<DeviceInfoService>(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationBloc(
              registrationRepository: context.read<RegistrationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CodeVerificationBloc(
              registrationRepository: context.read<RegistrationRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
