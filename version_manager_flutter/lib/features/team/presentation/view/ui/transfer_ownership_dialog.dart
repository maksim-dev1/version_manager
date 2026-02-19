import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';

/// Диалог передачи владения командой другому активному участнику.
///
/// Доступен только владельцу команды.
class TransferOwnershipDialog extends StatefulWidget {
  final Team team;

  const TransferOwnershipDialog({super.key, required this.team});

  @override
  State<TransferOwnershipDialog> createState() =>
      _TransferOwnershipDialogState();
}

class _TransferOwnershipDialogState extends State<TransferOwnershipDialog> {
  UuidValue? _selectedMemberId;

  /// Активные участники, кроме владельца.
  List<TeamMember> get _candidates {
    return (widget.team.members ?? [])
        .where(
          (m) =>
              m.status == TeamMemberStatusType.active &&
              m.role != TeamRoleType.owner,
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final candidates = _candidates;

    return AlertDialog(
      title: const Text('Передать владение'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Новый владелец получит полный контроль над командой. '
                  'Вы станете администратором.',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (candidates.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      'Нет подходящих участников.\n'
                      'Сначала пригласите кого-нибудь в команду.',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                )
              else
                for (int i = 0; i < candidates.length; i++)
                  _CandidateTile(
                    member: candidates[i],
                    selected: _selectedMemberId == candidates[i].userId,
                    onTap: () => setState(
                      () => _selectedMemberId = candidates[i].userId,
                    ),
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: _selectedMemberId != null ? _onTransfer : null,
          child: const Text('Передать'),
        ),
      ],
    );
  }

  void _onTransfer() {
    if (_selectedMemberId == null) return;
    final bloc = context.read<TeamMemberBloc>();
    Navigator.pop(context);
    bloc.add(
      TeamMemberEvent.transferOwnership(
        teamId: widget.team.id!,
        newOwnerId: _selectedMemberId!,
      ),
    );
  }
}

class _CandidateTile extends StatelessWidget {
  final TeamMember member;
  final bool selected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _CandidateTile({
    required this.member,
    required this.selected,
    required this.onTap,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final user = member.user;
    final displayName =
        user?.displayName ??
        [user?.firstName, user?.lastName].whereType<String>().join(' ');
    final email = user?.email ?? '';

    return ListTile(
      onTap: onTap,
      selected: selected,
      selectedTileColor: colorScheme.primaryContainer.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Radio<bool>(
        value: selected,
        groupValue: true,
        onChanged: (_) => onTap(),
      ),
      title: Text(
        displayName.isNotEmpty ? displayName : email,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: displayName.isNotEmpty && email.isNotEmpty
          ? Text(email, style: textTheme.bodySmall)
          : null,
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _roleLabel(member.role),
          style: textTheme.labelSmall,
        ),
      ),
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
}
