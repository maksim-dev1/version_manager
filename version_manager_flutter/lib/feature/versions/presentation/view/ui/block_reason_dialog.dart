import 'package:flutter/material.dart';

class BlockReasonDialog extends StatelessWidget {
  final String version;
  const BlockReasonDialog({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    final reasonController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: const Text('Блокировка версии'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Укажите причину блокировки версии $version:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: 'Причина блокировки',
                hintText: 'Например: критическая ошибка',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Укажите причину блокировки';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              Navigator.of(context).pop();
              // context.read<VersionBloc>().add(
              //   VersionEvent.blockUnblockVersion(
              //     id: version!.id!,
              //     isBlocked: true,
              //     reason: reasonController.text.trim(),
              //   ),
              // );
            }
          },
          child: const Text('Заблокировать'),
        ),
      ],
    );
  }
}
