import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';

/// Диалог подтверждения удаления участника из команды.
class RemoveMemberDialog extends StatelessWidget {
  final TeamMember member;
  final String teamName;

  const RemoveMemberDialog({
    super.key,
    required this.member,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final user = member.user;
    final displayName =
        user?.displayName ??
        [user?.firstName, user?.lastName].whereType<String>().join(' ');
    final name = displayName.isNotEmpty ? displayName : (user?.email ?? '');

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.person_remove, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Удалить участника')),
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
              'Участник «$name» будет удалён из команды «$teamName» '
              'и потеряет доступ ко всем командным приложениям.',
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
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () {
            final bloc = context.read<TeamMemberBloc>();
            Navigator.pop(context);
            bloc.add(
              TeamMemberEvent.removeMember(memberId: member.id!),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
          ),
          child: const Text('Удалить'),
        ),
      ],
    );
  }
}
