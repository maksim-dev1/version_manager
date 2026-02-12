import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';
import 'package:version_manager_flutter/shared/widgets/role_selector.dart';

/// Диалог изменения роли участника команды.
///
/// Доступен владельцу и администраторам.
/// Нельзя изменить роль владельца.
class ChangeRoleDialog extends StatefulWidget {
  final TeamMember member;

  const ChangeRoleDialog({super.key, required this.member});

  @override
  State<ChangeRoleDialog> createState() => _ChangeRoleDialogState();
}

class _ChangeRoleDialogState extends State<ChangeRoleDialog> {
  late TeamRoleType _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.member.role;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final user = widget.member.user;
    final displayName =
        user?.displayName ??
        [user?.firstName, user?.lastName].whereType<String>().join(' ');
    final name = displayName.isNotEmpty ? displayName : (user?.email ?? '');

    return AlertDialog(
      title: const Text('Изменить роль'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Информация об участнике
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      name,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Выбор роли
            Text(
              'Новая роль',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            RoleSelector(
              selectedRole: _selectedRole,
              onRoleChanged: (role) => setState(() => _selectedRole = role),
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
          onPressed: _selectedRole != widget.member.role ? _submit : null,
          child: const Text('Сохранить'),
        ),
      ],
    );
  }

  void _submit() {
    final bloc = context.read<TeamMemberBloc>();
    Navigator.pop(context);
    bloc.add(
      TeamMemberEvent.updateMemberRole(
        memberId: widget.member.id!,
        newRole: _selectedRole,
      ),
    );
  }
}
