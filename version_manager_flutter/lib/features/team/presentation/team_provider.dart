import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/team/data/repository/team_repository_impl.dart';
import 'package:version_manager_flutter/features/team/domain/repository/team_repository.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Команды».
///
/// Создаёт и предоставляет:
/// - [TeamRepository]
/// - [TeamBloc]
class TeamProvider extends StatelessWidget {
  final Widget child;

  const TeamProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<TeamRepository>(
      create: (_) => TeamRepositoryImpl(
        teamEndpoint: clientService.client.team,
        authEndpoint: clientService.client.auth,
      ),
      child: BlocProvider(
        create: (context) => TeamBloc(
          teamRepository: context.read<TeamRepository>(),
        )..add(const TeamEvent.loadTeams()),
        child: child,
      ),
    );
  }
}
