import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart';

class TerminateAllDialog extends StatelessWidget {
  const TerminateAllDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Завершить все сессии?'),
        content: const Text(
          'Все сессии кроме текущей будут завершены. '
          'Вам потребуется заново войти на других устройствах.',
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
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Завершить все'),
          ),
        ],
      );
  }
}