import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart';

class TerminateDialog extends StatelessWidget {
  final SessionInfo session;
  const TerminateDialog({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Завершить сессию?')),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: Text(
          'Сессия на устройстве "${session.deviceInfo ?? 'Неизвестное'}" '
          'будет завершена.',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<SessionBloc>().add(
              SessionEvent.terminateSession(sessionId: session.id),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
          ),
          child: const Text('Завершить'),
        ),
      ],
    );
  }
}
