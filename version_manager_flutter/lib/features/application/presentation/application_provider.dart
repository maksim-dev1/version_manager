import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/application/data/repository/application_repository_impl.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Приложения».
///
/// Создаёт и предоставляет:
/// - [ApplicationRepository]
/// - [ApplicationBloc]
class ApplicationProvider extends StatelessWidget {
  final Widget child;

  const ApplicationProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<ApplicationRepository>(
      create: (_) => ApplicationRepositoryImpl(
        appEndpoint: clientService.client.app,
        teamEndpoint: clientService.client.team,
      ),
      child: BlocProvider(
        create: (context) => ApplicationBloc(
          applicationRepository: context.read<ApplicationRepository>(),
        )..add(const ApplicationEvent.loadApplications()),
        child: child,
      ),
    );
  }
}
