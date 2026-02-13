import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';
import 'package:version_manager_flutter/features/team/presentation/team_provider.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/create_team_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/invitation_card.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/team_card.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/teams_empty_state.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';
import 'package:version_manager_flutter/features/team_member/presentation/team_member_provider.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';

/// Экран «Команды» — отдельная страница навигации.
///
/// Оборачивает содержимое в [TeamProvider] и предоставляет
/// собственный AppBar.
class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TeamProvider(
      child: TeamMemberProvider(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Команды'),
            elevation: 0,
          ),
          body: const _TeamsScreenBody(),
        ),
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

    return BlocListener<TeamMemberBloc, TeamMemberState>(
      listener: (context, state) {
        switch (state) {
          case TeamMemberActionInProgress():
            NotificationService.showLoading(context, 'Загрузка');
          case TeamMemberActionSuccess(:final message):
            context.read<TeamBloc>().add(const TeamEvent.loadTeams());
            NotificationService.showSuccess(context, message);
          case TeamMemberActionError(:final message):
            context.read<TeamBloc>().add(const TeamEvent.loadTeams());
            NotificationService.showError(context, message);
          default:
            break;
        }
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
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TeamBloc>().add(const TeamEvent.loadTeams());
      },
      child: ListView(
        padding: EdgeInsets.all(padding),
        children: [
          // Заголовок
          Text(
            'Мои команды',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
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

          // Карточка создания команды
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _CreateTeamCard(
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          ),
        ],
      ),
    );
  }
}

/// Карточка «Создать команду».
class _CreateTeamCard extends StatelessWidget {
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _CreateTeamCard({
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<TeamBloc>(),
            child: const CreateTeamDialog(),
          ),
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                size: 24,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                'Создать команду',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
