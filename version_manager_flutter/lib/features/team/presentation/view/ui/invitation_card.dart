import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';

class InvitationCard extends StatelessWidget {
  final TeamMember invitation;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const InvitationCard({
    super.key,
    required this.invitation,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    return Card(
      color: colorScheme.tertiaryContainer.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isCompact
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outlined,
                        color: colorScheme.tertiary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              invitation.team?.name ?? 'Команда',
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Роль: ${_roleLabel(invitation.role)}',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            context.read<TeamBloc>().add(
                              TeamEvent.respondToInvitation(
                                teamId: invitation.teamId,
                                accept: false,
                              ),
                            );
                          },
                          child: const Text('Отклонить'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            context.read<TeamBloc>().add(
                              TeamEvent.respondToInvitation(
                                teamId: invitation.teamId,
                                accept: true,
                              ),
                            );
                          },
                          child: const Text('Принять'),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Icon(
                    Icons.mail_outlined,
                    color: colorScheme.tertiary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          invitation.team?.name ?? 'Команда',
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Роль: ${_roleLabel(invitation.role)}',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      context.read<TeamBloc>().add(
                        TeamEvent.respondToInvitation(
                          teamId: invitation.teamId,
                          accept: false,
                        ),
                      );
                    },
                    child: const Text('Отклонить'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () {
                      context.read<TeamBloc>().add(
                        TeamEvent.respondToInvitation(
                          teamId: invitation.teamId,
                          accept: true,
                        ),
                      );
                    },
                    child: const Text('Принять'),
                  ),
                ],
              ),
      ),
    );
  }

  String _roleLabel(TeamRoleType role) {
    return switch (role) {
      TeamRoleType.owner => 'Владелец',
      TeamRoleType.admin => 'Администратор',
      TeamRoleType.developer => 'Разработчик',
      TeamRoleType.observer => 'Наблюдатель',
    };
  }
}
