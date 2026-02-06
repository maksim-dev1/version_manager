import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Карточка выбора роли — переиспользуемый виджет.
///
/// Используется в [ChangeRoleDialog] и [InviteMemberDialog].
class RoleOptionCard extends StatelessWidget {
  final TeamRoleType role;
  final IconData icon;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const RoleOptionCard({
    super.key,
    required this.role,
    required this.icon,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
          children: [
            Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
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
                    description,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Radio<TeamRoleType>(
              value: role,
              groupValue: selected ? role : null,
              onChanged: (_) => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Список карточек для выбора роли (админ / разработчик / наблюдатель).
class RoleSelector extends StatelessWidget {
  final TeamRoleType selectedRole;
  final ValueChanged<TeamRoleType> onRoleChanged;

  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RoleOptionCard(
          role: TeamRoleType.admin,
          icon: Icons.admin_panel_settings_outlined,
          title: 'Администратор',
          description:
              'Управление приложениями, версиями, участниками. '
              'Без удаления приложений и команды.',
          selected: selectedRole == TeamRoleType.admin,
          onTap: () => onRoleChanged(TeamRoleType.admin),
        ),
        const SizedBox(height: 8),
        RoleOptionCard(
          role: TeamRoleType.developer,
          icon: Icons.code,
          title: 'Разработчик',
          description:
              'Создание и редактирование версий, блокировка версий, '
              'просмотр статистики.',
          selected: selectedRole == TeamRoleType.developer,
          onTap: () => onRoleChanged(TeamRoleType.developer),
        ),
        const SizedBox(height: 8),
        RoleOptionCard(
          role: TeamRoleType.observer,
          icon: Icons.visibility_outlined,
          title: 'Наблюдатель',
          description: 'Только просмотр приложений, версий и статистики.',
          selected: selectedRole == TeamRoleType.observer,
          onTap: () => onRoleChanged(TeamRoleType.observer),
        ),
      ],
    );
  }
}
