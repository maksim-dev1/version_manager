import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team_member/presentation/bloc/team_member_bloc.dart';
import 'package:version_manager_flutter/shared/widgets/role_selector.dart';

/// Диалог приглашения участника в команду.
class InviteMemberDialog extends StatefulWidget {
  final UuidValue teamId;

  const InviteMemberDialog({
    super.key,
    required this.teamId,
  });

  @override
  State<InviteMemberDialog> createState() => _InviteMemberDialogState();
}

class _InviteMemberDialogState extends State<InviteMemberDialog> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TeamRoleType _selectedRole = TeamRoleType.developer;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Пригласить участника'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'user@example.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите email';
                }
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Некорректный email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Роль',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
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
        FilledButton.icon(
          onPressed: _submit,
          icon: const Icon(Icons.send, size: 18),
          label: const Text('Пригласить'),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final bloc = context.read<TeamMemberBloc>();
      Navigator.pop(context);
      bloc.add(
        TeamMemberEvent.inviteMember(
          teamId: widget.teamId,
          email: _emailController.text.trim(),
          role: _selectedRole,
        ),
      );
    }
  }
}
