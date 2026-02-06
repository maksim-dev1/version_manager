import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';

/// Диалог подтверждения выхода из команды.
///
/// Показывает предупреждение о потере доступа к командным приложениям
/// и требует подтверждения.
class LeaveTeamDialog extends StatelessWidget {
  final Team team;

  const LeaveTeamDialog({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.exit_to_app, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Покинуть команду')),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Вы потеряете доступ ко всем приложениям команды '
              '«${team.name}». Это действие нельзя отменить самостоятельно — '
              'для возврата потребуется новое приглашение.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Остаться'),
        ),
        FilledButton(
          onPressed: () {
            final bloc = context.read<TeamBloc>();
            Navigator.pop(context);
            bloc.add(
              TeamEvent.leaveTeam(teamId: team.id!),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
          ),
          child: const Text('Покинуть'),
        ),
      ],
    );
  }
}
