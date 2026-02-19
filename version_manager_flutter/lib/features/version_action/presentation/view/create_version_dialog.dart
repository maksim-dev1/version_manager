import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';
import 'package:version_manager_flutter/shared/widgets/user_visible_field_banner.dart';

/// Диалог создания новой версии.
class CreateVersionDialog extends StatefulWidget {
  final UuidValue applicationId;

  const CreateVersionDialog({
    super.key,
    required this.applicationId,
  });

  @override
  State<CreateVersionDialog> createState() => _CreateVersionDialogState();
}

class _CreateVersionDialogState extends State<CreateVersionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _versionController = TextEditingController();
  final _buildNumberController = TextEditingController();
  final _changelogController = TextEditingController();

  bool _isLoadingBuildNumber = true;
  int? _suggestedBuildNumber;

  @override
  void initState() {
    super.initState();
    _loadNextBuildNumber();
  }

  Future<void> _loadNextBuildNumber() async {
    try {
      final repo = context.read<VersionRepository>();
      final result = await repo.getNextBuildNumber(
        applicationId: widget.applicationId,
      );
      if (mounted) {
        setState(() {
          _suggestedBuildNumber = result.nextBuildNumber;
          _buildNumberController.text = result.nextBuildNumber.toString();
          _isLoadingBuildNumber = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingBuildNumber = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _versionController.dispose();
    _buildNumberController.dispose();
    _changelogController.dispose();
    super.dispose();
  }

  static final _semverRegExp = RegExp(
    r'^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)'
    r'(-((0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)'
    r'(\.(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?'
    r'(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?$',
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Новая версия'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Номер версии ──
                TextFormField(
                  controller: _versionController,
                  decoration: const InputDecoration(
                    labelText: 'Номер версии *',
                    hintText: '1.0.0',
                    helperText: 'Формат Semantic Versioning (1.0.0)',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Укажите номер версии';
                    }
                    if (!_semverRegExp.hasMatch(value.trim())) {
                      return 'Неверный формат (используйте 1.0.0)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // ── Номер сборки ──
                TextFormField(
                  controller: _buildNumberController,
                  decoration: InputDecoration(
                    labelText: 'Номер сборки *',
                    hintText: _suggestedBuildNumber?.toString() ?? '',
                    helperText: _suggestedBuildNumber != null
                        ? 'Рекомендуемый: $_suggestedBuildNumber'
                        : null,
                    suffixIcon: _isLoadingBuildNumber
                        ? const Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : _suggestedBuildNumber != null
                        ? IconButton(
                            icon: const Icon(Icons.auto_fix_high),
                            tooltip:
                                'Использовать рекомендуемый: $_suggestedBuildNumber',
                            onPressed: () {
                              _buildNumberController.text =
                                  _suggestedBuildNumber.toString();
                            },
                          )
                        : null,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Укажите номер сборки';
                    }
                    final num = int.tryParse(value.trim());
                    if (num == null || num <= 0) {
                      return 'Номер сборки должен быть положительным числом';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // ── Changelog ──
                const UserVisibleFieldBanner(
                  message:
                      'Текст changelog увидят пользователи при получении уведомления об обновлении',
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _changelogController,
                  decoration: const InputDecoration(
                    labelText: 'Changelog *',
                    hintText: 'Описание изменений в версии',
                    helperText: 'От 10 до 2000 символов',
                    alignLabelWithHint: true,
                  ),
                  maxLines: 5,
                  minLines: 3,
                  maxLength: 2000,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Укажите описание изменений';
                    }
                    if (value.trim().length < 10) {
                      return 'Минимум 10 символов';
                    }
                    if (value.trim().length > 2000) {
                      return 'Максимум 2000 символов';
                    }
                    return null;
                  },
                ),
              ],
            ),
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
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Создать'),
        ),
      ],
    );
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pop(context);
    context.read<VersionActionBloc>().add(
      VersionActionEvent.createVersion(
        applicationId: widget.applicationId,
        versionNumber: _versionController.text.trim(),
        buildNumber: int.parse(_buildNumberController.text.trim()),
        changelog: _changelogController.text.trim(),
      ),
    );
  }
}
