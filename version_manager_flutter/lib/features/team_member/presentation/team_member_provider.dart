import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/team_member/data/repository/team_member_repository_impl.dart';
import 'package:version_manager_flutter/features/team_member/domain/repository/team_member_repository.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Участники команды».
///
/// Создаёт и предоставляет:
/// - [TeamMemberRepository]
/// - [TeamMemberBloc]
///
/// Требует наличия [TeamBloc] в дереве выше.
class TeamMemberProvider extends StatelessWidget {
  final Widget child;

  const TeamMemberProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<TeamMemberRepository>(
      create: (_) => TeamMemberRepositoryImpl(
        teamEndpoint: clientService.client.team,
      ),
      child: BlocProvider(
        create: (context) => TeamMemberBloc(
          teamMemberRepository: context.read<TeamMemberRepository>(),
        ),
        child: child,
      ),
    );
  }
}
