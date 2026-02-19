import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/presentation/bloc/team_bloc.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/change_role_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/delete_team_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/edit_team_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/invite_member_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/leave_team_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/remove_member_dialog.dart';
import 'package:version_manager_flutter/features/team/presentation/view/ui/transfer_ownership_dialog.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final UuidValue? currentUserId;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const TeamCard({
    super.key,
    required this.team,
    required this.currentUserId,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final allMembers = team.members ?? [];
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    // Определяем роль текущего пользователя в команде
    final currentMember = allMembers.cast<TeamMember?>().firstWhere(
      (m) => m!.userId == currentUserId,
      orElse: () => null,
    );
    final currentRole = currentMember?.role;
    final isOwner = currentRole == TeamRoleType.owner;
    final isAdmin = currentRole == TeamRoleType.admin;
    final isOwnerOrAdmin = isOwner || isAdmin;

    // Сортируем: владелец → активные → приглашённые
    final sortedMembers = List<TeamMember>.from(allMembers)
      ..sort((a, b) {
        final statusOrder = {
          TeamMemberStatusType.active: 0,
          TeamMemberStatusType.invited: 1,
        };
        final roleOrder = {
          TeamRoleType.owner: 0,
          TeamRoleType.admin: 1,
          TeamRoleType.developer: 2,
          TeamRoleType.observer: 3,
        };
        // Сначала по статусу (active < invited)
        final statusCmp = (statusOrder[a.status] ?? 1).compareTo(
          statusOrder[b.status] ?? 1,
        );
        if (statusCmp != 0) return statusCmp;
        // Затем по роли (owner < admin < developer < observer)
        return (roleOrder[a.role] ?? 3).compareTo(roleOrder[b.role] ?? 3);
      });

    final activeCount = sortedMembers
        .where((m) => m.status == TeamMemberStatusType.active)
        .length;
    final invitedCount = sortedMembers
        .where((m) => m.status == TeamMemberStatusType.invited)
        .length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок команды
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: colorScheme.secondaryContainer,
                  child: Text(
                    team.name[0].toUpperCase(),
                    style: TextStyle(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        team.name,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (team.description != null)
                        Text(
                          team.description!,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                // На мобильном — PopupMenu, на десктопе — инлайн-кнопки
                _TeamCardActions(
                  isCompact: isCompact,
                  team: team,
                  isOwnerOrAdmin: isOwnerOrAdmin,
                  isOwner: isOwner,
                  currentMember: currentMember,
                  colorScheme: colorScheme,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Мета-информация
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _DetailChip(
                  icon: Icons.calendar_today,
                  label: _formatDate(team.createdAt),
                  colorScheme: colorScheme,
                ),
                if (currentRole != null)
                  _DetailChip(
                    icon: Icons.shield_outlined,
                    label: _roleLabel(currentRole),
                    colorScheme: colorScheme,
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Секция участников
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      text: 'Участники ($activeCount)',
                      children: [
                        if (invitedCount > 0)
                          TextSpan(
                            text: '  +$invitedCount приглаш.',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Приглашение — владелец и админ
                if (isOwnerOrAdmin)
                  TextButton.icon(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: context.read<TeamMemberBloc>(),
                        child: InviteMemberDialog(teamId: team.id!),
                      ),
                    ),
                    icon: const Icon(Icons.person_add_outlined, size: 18),
                    label: const Text('Пригласить'),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // Список участников
            Builder(
              builder: (context) {
                if (sortedMembers.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        'Нет участников',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sortedMembers.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) => _MemberTile(
                    member: sortedMembers[index],
                    currentUserId: currentUserId,
                    isOwnerOrAdmin: isOwnerOrAdmin,
                    isOwner: isOwner,
                    teamName: team.name,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }

  String _roleLabel(TeamRoleType role) {
    return switch (role) {
      TeamRoleType.owner => 'Владелец',
      TeamRoleType.admin => 'Админ',
      TeamRoleType.developer => 'Разработчик',
      TeamRoleType.observer => 'Наблюдатель',
    };
  }
}

/// Строка участника команды.
/// Действия с командой — PopupMenu на мобильном, инлайн-кнопки на десктопе.
class _TeamCardActions extends StatelessWidget {
  final bool isCompact;
  final Team team;
  final bool isOwnerOrAdmin;
  final bool isOwner;
  final TeamMember? currentMember;
  final ColorScheme colorScheme;

  const _TeamCardActions({
    required this.isCompact,
    required this.team,
    required this.isOwnerOrAdmin,
    required this.isOwner,
    required this.currentMember,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final hasActions = isOwnerOrAdmin || (!isOwner && currentMember != null);
    if (!hasActions) return const SizedBox.shrink();

    if (isCompact) {
      return PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, size: 20),
        padding: EdgeInsets.zero,
        onSelected: (value) => _onAction(context, value),
        itemBuilder: (context) => [
          if (isOwnerOrAdmin)
            const PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit_outlined, size: 20),
                title: Text('Редактировать'),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
          if (isOwner)
            const PopupMenuItem(
              value: 'transfer',
              child: ListTile(
                leading: Icon(Icons.swap_horiz, size: 20),
                title: Text('Передать владение'),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
          if (!isOwner && currentMember != null)
            PopupMenuItem(
              value: 'leave',
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  size: 20,
                  color: colorScheme.error,
                ),
                title: Text(
                  'Покинуть',
                  style: TextStyle(color: colorScheme.error),
                ),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
          if (isOwner)
            PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: colorScheme.error,
                ),
                title: Text(
                  'Удалить',
                  style: TextStyle(color: colorScheme.error),
                ),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isOwnerOrAdmin)
          IconButton(
            onPressed: () => _showDialog(
              context,
              BlocProvider.value(
                value: context.read<TeamBloc>(),
                child: EditTeamDialog(team: team),
              ),
            ),
            icon: const Icon(Icons.edit_outlined, size: 20),
            tooltip: 'Редактировать',
            visualDensity: VisualDensity.compact,
          ),
        if (isOwner)
          IconButton(
            onPressed: () => _showDialog(
              context,
              BlocProvider.value(
                value: context.read<TeamMemberBloc>(),
                child: TransferOwnershipDialog(team: team),
              ),
            ),
            icon: const Icon(Icons.swap_horiz, size: 20),
            tooltip: 'Передать владение',
            visualDensity: VisualDensity.compact,
          ),
        if (!isOwner && currentMember != null)
          IconButton(
            onPressed: () => _showDialog(
              context,
              BlocProvider.value(
                value: context.read<TeamMemberBloc>(),
                child: LeaveTeamDialog(team: team),
              ),
            ),
            icon: Icon(
              Icons.exit_to_app,
              size: 20,
              color: colorScheme.error,
            ),
            tooltip: 'Покинуть команду',
            visualDensity: VisualDensity.compact,
          ),
        if (isOwner)
          IconButton(
            onPressed: () => _showDialog(
              context,
              BlocProvider.value(
                value: context.read<TeamBloc>(),
                child: DeleteTeamDialog(team: team),
              ),
            ),
            icon: Icon(
              Icons.delete_outline,
              size: 20,
              color: colorScheme.error,
            ),
            tooltip: 'Удалить команду',
            visualDensity: VisualDensity.compact,
          ),
      ],
    );
  }

  void _onAction(BuildContext context, String value) {
    switch (value) {
      case 'edit':
        _showDialog(
          context,
          BlocProvider.value(
            value: context.read<TeamBloc>(),
            child: EditTeamDialog(team: team),
          ),
        );
      case 'transfer':
        _showDialog(
          context,
          BlocProvider.value(
            value: context.read<TeamMemberBloc>(),
            child: TransferOwnershipDialog(team: team),
          ),
        );
      case 'leave':
        _showDialog(
          context,
          BlocProvider.value(
            value: context.read<TeamMemberBloc>(),
            child: LeaveTeamDialog(team: team),
          ),
        );
      case 'delete':
        _showDialog(
          context,
          BlocProvider.value(
            value: context.read<TeamBloc>(),
            child: DeleteTeamDialog(team: team),
          ),
        );
    }
  }

  void _showDialog(BuildContext context, Widget dialog) {
    showDialog(context: context, builder: (_) => dialog);
  }
}

class _MemberTile extends StatelessWidget {
  final TeamMember member;
  final UuidValue? currentUserId;
  final bool isOwnerOrAdmin;
  final bool isOwner;
  final String teamName;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _MemberTile({
    required this.member,
    required this.currentUserId,
    required this.isOwnerOrAdmin,
    required this.isOwner,
    required this.teamName,
    required this.colorScheme,
    required this.textTheme,
  });

  bool get _isInvited => member.status == TeamMemberStatusType.invited;
  bool get _isCurrentUser => member.userId == currentUserId;
  bool get _isMemberOwner => member.role == TeamRoleType.owner;

  @override
  Widget build(BuildContext context) {
    final user = member.user;
    final displayName =
        user?.displayName ??
        [user?.firstName, user?.lastName].whereType<String>().join(' ');
    final email = user?.email ?? '';
    final initials = _getInitials(displayName, email);

    return Opacity(
      opacity: _isInvited ? 0.7 : 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // Аватар
            CircleAvatar(
              radius: 16,
              backgroundColor: _isInvited
                  ? colorScheme.surfaceContainerHighest
                  : colorScheme.primaryContainer,
              backgroundImage: user?.avatarUrl != null
                  ? NetworkImage(user!.avatarUrl!)
                  : null,
              child: user?.avatarUrl == null
                  ? Text(
                      initials,
                      style: textTheme.labelSmall?.copyWith(
                        color: _isInvited
                            ? colorScheme.onSurfaceVariant
                            : colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),

            // Имя / email / статус
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          displayName.isNotEmpty ? displayName : email,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (_isCurrentUser)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            '(вы)',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      if (_isInvited)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Приглашён',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (displayName.isNotEmpty && email.isNotEmpty)
                    Text(
                      email,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),

            // Бейдж роли (кликабельный для смены роли)
            _RoleBadge(
              member: member,
              isOwnerOrAdmin: isOwnerOrAdmin,
              isCurrentUser: _isCurrentUser,
              isMemberOwner: _isMemberOwner,
              isInvited: _isInvited,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),

            // Действия с участником — инлайн-кнопки
            // Отозвать приглашение — владелец/админ, приглашённый
            if (isOwnerOrAdmin && _isInvited && member.id != null)
              IconButton(
                onPressed: () {
                  context.read<TeamMemberBloc>().add(
                    TeamMemberEvent.revokeInvitation(memberId: member.id!),
                  );
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 18,
                  color: colorScheme.error,
                ),
                tooltip: 'Отозвать приглашение',
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            // Удалить участника — владелец/админ, не я, не владелец, активный
            if (isOwnerOrAdmin &&
                !_isCurrentUser &&
                !_isMemberOwner &&
                !_isInvited)
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<TeamMemberBloc>(),
                    child: RemoveMemberDialog(
                      member: member,
                      teamName: teamName,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.person_remove_outlined,
                  size: 18,
                  color: colorScheme.error,
                ),
                tooltip: 'Удалить из команды',
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String displayName, String email) {
    if (displayName.isNotEmpty) {
      final parts = displayName.trim().split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return displayName[0].toUpperCase();
    }
    if (email.isNotEmpty) return email[0].toUpperCase();
    return '?';
  }
}

/// Бейдж роли участника (кликабельный для смены роли).
class _RoleBadge extends StatelessWidget {
  final TeamMember member;
  final bool isOwnerOrAdmin;
  final bool isCurrentUser;
  final bool isMemberOwner;
  final bool isInvited;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _RoleBadge({
    required this.member,
    required this.isOwnerOrAdmin,
    required this.isCurrentUser,
    required this.isMemberOwner,
    required this.isInvited,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final canChangeRole =
        isOwnerOrAdmin && !isCurrentUser && !isMemberOwner && !isInvited;

    final badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: _roleBadgeColor(member.role).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _roleLabel(member.role),
            style: textTheme.labelSmall?.copyWith(
              color: _roleBadgeColor(member.role),
              fontWeight: FontWeight.w600,
            ),
          ),
          if (canChangeRole)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(
                Icons.edit,
                size: 12,
                color: _roleBadgeColor(member.role),
              ),
            ),
        ],
      ),
    );

    if (!canChangeRole) return badge;

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => BlocProvider.value(
          value: context.read<TeamMemberBloc>(),
          child: ChangeRoleDialog(member: member),
        ),
      ),
      borderRadius: BorderRadius.circular(8),
      child: badge,
    );
  }

  String _roleLabel(TeamRoleType role) {
    return switch (role) {
      TeamRoleType.owner => 'Владелец',
      TeamRoleType.admin => 'Админ',
      TeamRoleType.developer => 'Разработчик',
      TeamRoleType.observer => 'Наблюдатель',
    };
  }

  Color _roleBadgeColor(TeamRoleType role) {
    return switch (role) {
      TeamRoleType.owner => colorScheme.primary,
      TeamRoleType.admin => colorScheme.tertiary,
      TeamRoleType.developer => colorScheme.secondary,
      TeamRoleType.observer => colorScheme.outline,
    };
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;

  const _DetailChip({
    required this.icon,
    required this.label,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
