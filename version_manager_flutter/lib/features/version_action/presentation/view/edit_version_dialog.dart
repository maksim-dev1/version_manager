import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';

/// Диалог редактирования версии.
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
  late final TextEditingController _versionNumberController;
  late final TextEditingController _buildNumberController;
  late final TextEditingController _changelogController;

  @override
  void initState() {
    super.initState();
    _versionNumberController = TextEditingController(
      text: widget.version.versionNumber,
    );
    _buildNumberController = TextEditingController(
      text: widget.version.buildNumber.toString(),
    );
    _changelogController = TextEditingController(
      text: widget.version.changelog,
    );
  }

  @override
  void dispose() {
    _versionNumberController.dispose();
    _buildNumberController.dispose();
    _changelogController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Редактирование v${widget.version.versionNumber}'),
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
              // ── Номер версии ──
              TextFormField(
                controller: _versionNumberController,
                decoration: const InputDecoration(
                  labelText: 'Номер версии',
                  hintText: '1.0.0',
                  helperText: 'Формат: MAJOR.MINOR.PATCH',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Укажите номер версии';
                  }
                  final regex = RegExp(r'^\d+\.\d+\.\d+$');
                  if (!regex.hasMatch(value.trim())) {
                    return 'Формат: MAJOR.MINOR.PATCH (например, 1.0.0)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // ── Номер сборки ──
              TextFormField(
                controller: _buildNumberController,
                decoration: const InputDecoration(
                  labelText: 'Номер сборки',
                  hintText: '1',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Укажите номер сборки';
                  }
                  final n = int.tryParse(value.trim());
                  if (n == null || n <= 0) {
                    return 'Номер сборки должен быть положительным числом';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

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

    final newVersionNumber = _versionNumberController.text.trim();
    final newBuildNumber = int.parse(_buildNumberController.text.trim());
    final newChangelog = _changelogController.text.trim();

    context.read<VersionActionBloc>().add(
      VersionActionEvent.updateVersion(
        versionId: widget.version.id,
        versionNumber: newVersionNumber != widget.version.versionNumber
            ? newVersionNumber
            : null,
        buildNumber: newBuildNumber != widget.version.buildNumber
            ? newBuildNumber
            : null,
        changelog: newChangelog != widget.version.changelog
            ? newChangelog
            : null,
      ),
    );
  }
}
