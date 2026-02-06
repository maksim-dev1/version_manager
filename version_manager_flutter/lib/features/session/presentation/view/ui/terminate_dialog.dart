import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart';

class TerminateDialog extends StatelessWidget {
  final SessionInfo session;
  const TerminateDialog({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        title: const Text('Завершить сессию?'),
        content: Text(
          'Сессия на устройстве "${session.deviceInfo ?? 'Неизвестное'}" '
          'будет завершена.',
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
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Завершить'),
          ),
        ],
      );
  }
}