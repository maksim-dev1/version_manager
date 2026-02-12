import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/api_key/presentation/view/api_key_display_dialog.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/features/create_application/presentation/bloc/create_application_bloc.dart';
import 'package:version_manager_flutter/shared/services/notification_service.dart';

/// Диалог создания нового приложения.
class CreateApplicationDialog extends StatefulWidget {
  /// Если передана команда — диалог сразу откроется в режиме командного
  /// приложения с предвыбранной командой.
  final Team? preselectedTeam;

  const CreateApplicationDialog({super.key, this.preselectedTeam});

  @override
  State<CreateApplicationDialog> createState() =>
      _CreateApplicationDialogState();
}

class _CreateApplicationDialogState extends State<CreateApplicationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _namespaceController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _iconUrlController = TextEditingController();

  final Set<PlatformType> _selectedPlatforms = {};
  final Map<PlatformType, List<_StoreLinkFormEntry>> _platformStoreLinks = {};

  bool _showPlatformError = false;
  bool _showStoreLinkErrors = false;

  @override
  void dispose() {
    _namespaceController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _iconUrlController.dispose();
    for (final entries in _platformStoreLinks.values) {
      for (final entry in entries) {
        entry.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateApplicationBloc, CreateApplicationState>(
      listener: (context, state) {
        switch (state) {
          case CreateApplicationSuccess(:final apiKey):
            Navigator.pop(context);
            NotificationService.showSuccess(context, 'Приложение создано');
            // Перезагружаем список приложений
            context.read<ApplicationBloc>().add(
              const ApplicationEvent.loadApplications(),
            );
            // Показать диалог с API ключом
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => ApiKeyDisplayDialog(
                apiKey: apiKey,
                title: 'API ключ создан',
              ),
            );
          case CreateApplicationError(:final message):
            NotificationService.showError(context, message);
          default:
            break;
        }
      },
      child: _buildDialog(context),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.preselectedTeam != null
            ? 'Создать приложение · ${widget.preselectedTeam!.name}'
            : 'Создать личное приложение',
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Namespace
                TextFormField(
                  controller: _namespaceController,
                  decoration: const InputDecoration(
                    labelText: 'Namespace',
                    hintText: 'com.example.myapp',
                    helperText:
                        'Обратная доменная нотация (минимум 3 сегмента)',
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите namespace';
                    }
                    final ns = value.trim().toLowerCase();
                    final regex = RegExp(
                      r'^[a-z][a-z0-9]*(\.[a-z][a-z0-9]*){2,}$',
                    );
                    if (!regex.hasMatch(ns)) {
                      return 'Формат: com.example.app (мин. 3 сегмента)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Название
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Название',
                    hintText: 'Моё приложение',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите название';
                    }
                    if (value.trim().length < 3) {
                      return 'Минимум 3 символа';
                    }
                    if (value.trim().length > 50) {
                      return 'Максимум 50 символов';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Описание
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Описание',
                    hintText: 'Краткое описание приложения',
                    helperText: 'Необязательно',
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value != null && value.trim().isNotEmpty) {
                      if (value.trim().length < 10) {
                        return 'Минимум 10 символов';
                      }
                      if (value.trim().length > 500) {
                        return 'Максимум 500 символов';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // URL иконки (необязательно)
                TextFormField(
                  controller: _iconUrlController,
                  decoration: const InputDecoration(
                    labelText: 'URL иконки',
                    hintText: 'https://example.com/icon.png',
                    helperText: 'Необязательно',
                  ),
                ),
                const SizedBox(height: 20),

                // ── Платформы и ссылки на магазины ──
                _PlatformAndStoreLinksSection(
                  selectedPlatforms: _selectedPlatforms,
                  platformStoreLinks: _platformStoreLinks,
                  showPlatformError: _showPlatformError,
                  showStoreLinkErrors: _showStoreLinkErrors,
                  onPlatformToggled: (platform, selected) {
                    setState(() {
                      if (selected) {
                        _selectedPlatforms.add(platform);
                        _platformStoreLinks[platform] = [
                          _StoreLinkFormEntry(),
                        ];
                      } else {
                        _selectedPlatforms.remove(platform);
                        final entries = _platformStoreLinks.remove(platform);
                        if (entries != null) {
                          for (final e in entries) {
                            e.dispose();
                          }
                        }
                      }
                      _showPlatformError = false;
                      _showStoreLinkErrors = false;
                    });
                  },
                  onAddLink: (platform) {
                    setState(() {
                      _platformStoreLinks
                          .putIfAbsent(platform, () => [])
                          .add(_StoreLinkFormEntry());
                    });
                  },
                  onRemoveLink: (platform, i) {
                    final links = _platformStoreLinks[platform] ?? [];
                    setState(() {
                      links[i].dispose();
                      links.removeAt(i);
                    });
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
        BlocBuilder<CreateApplicationBloc, CreateApplicationState>(
          builder: (context, state) {
            final isLoading = state is CreateApplicationLoading;
            return FilledButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Создать'),
            );
          },
        ),
      ],
    );
  }

  void _submit() {
    final formValid = _formKey.currentState?.validate() ?? false;

    // Проверяем платформы
    final platformsValid = _selectedPlatforms.isNotEmpty;
    if (!platformsValid) {
      setState(() => _showPlatformError = true);
    }

    // Проверяем что у каждой платформы есть хотя бы одна заполненная ссылка
    bool storeLinksValid = true;
    for (final platform in _selectedPlatforms) {
      final links = _platformStoreLinks[platform] ?? [];
      final hasValid = links.any(
        (e) =>
            e.storeNameController.text.trim().isNotEmpty &&
            e.urlController.text.trim().isNotEmpty,
      );
      if (!hasValid) {
        storeLinksValid = false;
        break;
      }
    }
    if (!storeLinksValid) {
      setState(() => _showStoreLinkErrors = true);
    }

    if (!formValid || !platformsValid || !storeLinksValid) return;

    // Собираем ссылки
    final storeLinks = <StoreLinkEntry>[];
    for (final platform in _selectedPlatforms) {
      final entries = _platformStoreLinks[platform] ?? [];
      for (final entry in entries) {
        if (entry.storeNameController.text.trim().isNotEmpty &&
            entry.urlController.text.trim().isNotEmpty) {
          storeLinks.add(
            StoreLinkEntry(
              platform: platform,
              storeName: entry.storeNameController.text.trim(),
              url: entry.urlController.text.trim(),
            ),
          );
        }
      }
    }

    context.read<CreateApplicationBloc>().add(
      CreateApplicationEvent.create(
        namespace: _namespaceController.text.trim(),
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        iconUrl: _iconUrlController.text.trim().isEmpty
            ? null
            : _iconUrlController.text.trim(),
        platforms: _selectedPlatforms.toList(),
        ownerType: widget.preselectedTeam != null
            ? OwnerType.team
            : OwnerType.user,
        teamId: widget.preselectedTeam?.id,
        storeLinks: storeLinks.isEmpty ? null : storeLinks,
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Секция платформ + ссылки
// ──────────────────────────────────────────────────────────────────

class _PlatformAndStoreLinksSection extends StatelessWidget {
  final Set<PlatformType> selectedPlatforms;
  final Map<PlatformType, List<_StoreLinkFormEntry>> platformStoreLinks;
  final bool showPlatformError;
  final bool showStoreLinkErrors;
  final void Function(PlatformType platform, bool selected) onPlatformToggled;
  final void Function(PlatformType platform) onAddLink;
  final void Function(PlatformType platform, int index) onRemoveLink;

  const _PlatformAndStoreLinksSection({
    required this.selectedPlatforms,
    required this.platformStoreLinks,
    required this.showPlatformError,
    required this.showStoreLinkErrors,
    required this.onPlatformToggled,
    required this.onAddLink,
    required this.onRemoveLink,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Платформы и ссылки на магазины',
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          'Для каждой платформы укажите хотя бы одну ссылку на магазин',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            PlatformType.values.length,
            (index) {
              final p = PlatformType.values[index];
              return FilterChip(
                selected: selectedPlatforms.contains(p),
                label: Text(_platformLabel(p)),
                avatar: Icon(_platformIcon(p), size: 18),
                onSelected: (s) => onPlatformToggled(p, s),
              );
            },
          ),
        ),
        if (showPlatformError)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Выберите хотя бы одну платформу',
              style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
            ),
          ),
        for (final platform in selectedPlatforms.toList())
          _PlatformLinksCard(
            platform: platform,
            links: platformStoreLinks[platform] ?? [],
            showError: showStoreLinkErrors,
            onAddLink: () => onAddLink(platform),
            onRemoveLink: (i) => onRemoveLink(platform, i),
          ),
      ],
    );
  }
}

/// Карточка ссылок одной платформы.
class _PlatformLinksCard extends StatelessWidget {
  final PlatformType platform;
  final List<_StoreLinkFormEntry> links;
  final bool showError;
  final VoidCallback onAddLink;
  final ValueChanged<int> onRemoveLink;

  const _PlatformLinksCard({
    required this.platform,
    required this.links,
    required this.showError,
    required this.onAddLink,
    required this.onRemoveLink,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final hasValid = links.any(
      (e) =>
          e.storeNameController.text.trim().isNotEmpty &&
          e.urlController.text.trim().isNotEmpty,
    );
    final hasError = showError && !hasValid;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: hasError ? colorScheme.error : colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок платформы
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.3,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(11),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _platformIcon(platform),
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _platformLabel(platform),
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 28,
                    child: TextButton.icon(
                      onPressed: onAddLink,
                      icon: const Icon(Icons.add, size: 14),
                      label: const Text('Ещё'),
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        textStyle: const TextStyle(fontSize: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Строки ссылок
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < links.length; i++)
                    Padding(
                      padding: EdgeInsets.only(top: i > 0 ? 8 : 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: links[i].storeNameController,
                              decoration: InputDecoration(
                                hintText: 'App Store',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: links[i].urlController,
                              decoration: InputDecoration(
                                hintText: 'https://...',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          if (links.length > 1)
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: SizedBox(
                                width: 28,
                                height: 28,
                                child: IconButton(
                                  onPressed: () => onRemoveLink(i),
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    size: 16,
                                    color: colorScheme.error,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 14,
                            color: colorScheme.error,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Заполните название и URL',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Внутреннее состояние одной ссылки на магазин.
class _StoreLinkFormEntry {
  final storeNameController = TextEditingController();
  final urlController = TextEditingController();

  _StoreLinkFormEntry({String? storeName, String? url}) {
    if (storeName != null) storeNameController.text = storeName;
    if (url != null) urlController.text = url;
  }

  void dispose() {
    storeNameController.dispose();
    urlController.dispose();
  }
}

// ──────────────────────────────────────────────────────────────────
// Хелперы для платформ
// ──────────────────────────────────────────────────────────────────

String _platformLabel(PlatformType platform) {
  return switch (platform) {
    PlatformType.ios => 'iOS',
    PlatformType.android => 'Android',
    PlatformType.web => 'Web',
    PlatformType.macos => 'macOS',
    PlatformType.windows => 'Windows',
    PlatformType.linux => 'Linux',
  };
}

IconData _platformIcon(PlatformType platform) {
  return switch (platform) {
    PlatformType.ios => Icons.apple,
    PlatformType.android => Icons.android,
    PlatformType.web => Icons.language,
    PlatformType.macos => Icons.desktop_mac,
    PlatformType.windows => Icons.desktop_windows,
    PlatformType.linux => Icons.computer,
  };
}
