import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/data/repository/version_repository_impl.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';
import 'package:version_manager_flutter/features/version/presentation/bloc/version_bloc.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Версии».
///
/// Создаёт [VersionRepository], [VersionBloc] и [VersionActionBloc].
class VersionProvider extends StatelessWidget {
  final UuidValue applicationId;
  final Widget child;

  const VersionProvider({
    super.key,
    required this.applicationId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<VersionRepository>(
      create: (_) => VersionRepositoryImpl(
        versionEndpoint: clientService.client.version,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VersionBloc(
              versionRepository: context.read<VersionRepository>(),
            )..add(VersionEvent.loadVersions(applicationId: applicationId)),
          ),
          BlocProvider(
            create: (context) => VersionActionBloc(
              versionRepository: context.read<VersionRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
