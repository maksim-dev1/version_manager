import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';

/// Диалог удаления приложения.
///
/// Требует подтверждение — ввод названия приложения.
class DeleteApplicationDialog extends StatefulWidget {
  final Application application;

  const DeleteApplicationDialog({super.key, required this.application});

  @override
  State<DeleteApplicationDialog> createState() =>
      _DeleteApplicationDialogState();
}

class _DeleteApplicationDialogState extends State<DeleteApplicationDialog> {
  final _confirmController = TextEditingController();

  bool get _isConfirmed =>
      _confirmController.text.trim() == widget.application.name;

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Удалить приложение')),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Это действие необратимо!',
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Приложение «${widget.application.name}» будет удалено '
                    'вместе со всеми версиями, ссылками и статистикой.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Подтверждение
            Text(
              'Для подтверждения введите название приложения:',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _confirmController,
              decoration: InputDecoration(
                hintText: widget.application.name,
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
    final bloc = context.read<ApplicationBloc>();
    Navigator.pop(context);
    bloc.add(
      ApplicationEvent.deleteApplication(
        applicationId: widget.application.id!,
        confirmationName: _confirmController.text.trim(),
      ),
    );
  }
}
