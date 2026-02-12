import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart';

class TerminateAllDialog extends StatelessWidget {
  const TerminateAllDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Завершить все сессии?')),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: const Text(
          'Все сессии кроме текущей будут завершены. '
          'Вам потребуется заново войти на других устройствах.',
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
              const SessionEvent.terminateAllOther(),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
          ),
          child: const Text('Завершить все'),
        ),
      ],
    );
  }
}
