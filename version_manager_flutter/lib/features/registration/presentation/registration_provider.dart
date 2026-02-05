import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/registration/data/repository/registration_repository_impl.dart';
import 'package:version_manager_flutter/features/registration/domain/repository/registration_repository.dart';
import 'package:version_manager_flutter/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/device_info_service.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

class RegistrationProvider extends StatelessWidget {
  final Widget child;
  const RegistrationProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<RegistrationRepository>(
      create: (context) => RegistrationRepositoryImpl(
        authEndpoint: context.read<ClientService>().auth,
        storageService: context.read<StorageService>(),
        deviceInfoService: context.read<DeviceInfoService>(),
      ),
      child: BlocProvider(
        create: (context) => RegistrationBloc(
          registrationRepository: context.read<RegistrationRepository>(),
        ),
        child: child,
      ),
    );
  }
}
