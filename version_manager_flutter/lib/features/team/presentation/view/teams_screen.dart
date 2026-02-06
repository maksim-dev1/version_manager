import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';
import 'package:version_manager_flutter/features/team/presentation/team_provider.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/create_team_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/invitation_card.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/team_card.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/teams_empty_state.dart';
import 'package:version_manager_flutter/shared/services/notification_service.dart';

/// Экран «Команды» — отдельная страница навигации.
///
/// Оборачивает содержимое в [TeamProvider] и предоставляет
/// собственный AppBar.
class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TeamProvider(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Команды'),
          elevation: 0,
        ),
        body: const _TeamsScreenBody(),
      ),
    );
  }
}

class _TeamsScreenBody extends StatelessWidget {
  const _TeamsScreenBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<TeamBloc, TeamState>(
      listener: (context, state) => switch (state) {
        MemberActionSuccess(:final message) => NotificationService.showSuccess(
          context,
          message,
        ),
        MemberActionError(:final message) => NotificationService.showError(
          context,
          message,
        ),
        _ => null,
      },
      child: BlocBuilder<TeamBloc, TeamState>(
        builder: (context, state) => switch (state) {
          TeamLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          TeamLoaded(:final teams, :final invitations, :final currentUserId) =>
            _TeamsContent(
              teams: teams,
              invitations: invitations,
              currentUserId: currentUserId,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          TeamError(:final message) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                const SizedBox(height: 16),
                Text(message, style: textTheme.bodyLarge),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => context.read<TeamBloc>().add(
                    const TeamEvent.loadTeams(),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Повторить'),
                ),
              ],
            ),
          ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}

class _TeamsContent extends StatelessWidget {
  final List<Team> teams;
  final List<TeamMember> invitations;
  final UuidValue? currentUserId;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _TeamsContent({
    required this.teams,
    required this.invitations,
    required this.currentUserId,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TeamBloc>().add(const TeamEvent.loadTeams());
      },
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Заголовок с кнопкой создания
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Мои команды',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilledButton.icon(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<TeamBloc>(),
                    child: const CreateTeamDialog(),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text('Создать'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Приглашения
          Builder(
            builder: (context) {
              if (invitations.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Приглашения',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: invitations.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InvitationCard(
                        invitation: invitations[index],
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),

          // Список команд
          Builder(
            builder: (context) {
              if (teams.isEmpty) {
                return TeamsEmptyState(
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: teams.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TeamCard(
                    team: teams[index],
                    currentUserId: currentUserId,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
