import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';

/// Диалог редактирования changelog версии.
class EditVersionDialog extends StatefulWidget {
  final VersionListItem version;
  final UuidValue applicationId;

  const EditVersionDialog({
    super.key,
    required this.version,
    required this.applicationId,
  });

  @override
  State<EditVersionDialog> createState() => _EditVersionDialogState();
}

class _EditVersionDialogState extends State<EditVersionDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _changelogController;

  @override
  void initState() {
    super.initState();
    _changelogController = TextEditingController(
      text: widget.version.changelog,
    );
  }

  @override
  void dispose() {
    _changelogController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Версия ${widget.version.versionNumber}'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 480,
          maxWidth: 480,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Информация о версии (read-only) ──
              _ReadOnlyField(
                label: 'Номер версии',
                value: widget.version.versionNumber,
              ),
              const SizedBox(height: 8),
              _ReadOnlyField(
                label: 'Номер сборки',
                value: '#${widget.version.buildNumber}',
              ),
              const SizedBox(height: 16),

              // ── Changelog ──
              TextFormField(
                controller: _changelogController,
                decoration: const InputDecoration(
                  labelText: 'Changelog',
                  helperText: 'От 10 до 2000 символов',
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                minLines: 2,
                maxLength: 2000,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Укажите описание изменений';
                  }
                  if (value.trim().length < 10) {
                    return 'Минимум 10 символов';
                  }
                  return null;
                },
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
        FilledButton.icon(
          onPressed: _onSubmit,
          icon: const Icon(Icons.save_outlined, size: 18),
          label: const Text('Сохранить'),
        ),
      ],
    );
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pop(context);

    context.read<VersionActionBloc>().add(
      VersionActionEvent.updateVersion(
        versionId: widget.version.id,
        changelog: _changelogController.text.trim(),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Вспомогательные виджеты
// ──────────────────────────────────────────────────────────────────

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Text(
          '$label: ',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
