import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';

/// Диалог удаления команды с двумя вариантами:
/// - Вариант А: удалить команду и все приложения
/// - Вариант Б: удалить команду, но оставить приложения себе
///
/// Требуется подтверждение вводом названия команды.
class DeleteTeamDialog extends StatefulWidget {
  final Team team;

  const DeleteTeamDialog({super.key, required this.team});

  @override
  State<DeleteTeamDialog> createState() => _DeleteTeamDialogState();
}

class _DeleteTeamDialogState extends State<DeleteTeamDialog> {
  final _confirmController = TextEditingController();
  bool _transferApps = false;

  bool get _isConfirmed => _confirmController.text.trim() == widget.team.name;

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final membersCount = widget.team.members?.length ?? 0;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Удалить команду')),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Предупреждение
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Это действие необратимо. Команда «${widget.team.name}» '
                'с $membersCount участниками будет удалена.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onErrorContainer,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Выбор варианта
            Text(
              'Что делать с приложениями команды?',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Вариант А: Удалить всё
            _OptionTile(
              selected: !_transferApps,
              onTap: () => setState(() => _transferApps = false),
              icon: Icons.delete_forever,
              iconColor: colorScheme.error,
              title: 'Удалить команду и все приложения',
              subtitle:
                  'Все приложения, версии и статистика будут безвозвратно удалены.',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            const SizedBox(height: 8),

            // Вариант Б: Оставить приложения себе
            _OptionTile(
              selected: _transferApps,
              onTap: () => setState(() => _transferApps = true),
              icon: Icons.move_to_inbox,
              iconColor: colorScheme.primary,
              title: 'Удалить команду, оставить приложения себе',
              subtitle:
                  'Приложения станут вашими личными. Участники потеряют доступ.',
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            const SizedBox(height: 20),

            // Подтверждение
            Text(
              'Для подтверждения введите название команды:',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _confirmController,
              decoration: InputDecoration(
                hintText: widget.team.name,
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: _isConfirmed ? _onDelete : null,
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
          ),
          child: const Text('Удалить'),
        ),
      ],
    );
  }

  void _onDelete() {
    final bloc = context.read<TeamBloc>();
    Navigator.pop(context);
    bloc.add(
      TeamEvent.deleteTeam(
        teamId: widget.team.id!,
        transferAppsToOwner: _transferApps,
        confirmationName: _confirmController.text.trim(),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _OptionTile({
    required this.selected,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? colorScheme.primary : colorScheme.outlineVariant,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: selected
              ? colorScheme.primaryContainer.withValues(alpha: 0.2)
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Radio<bool>(
              value: selected,
              groupValue: true,
              onChanged: (_) => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}
