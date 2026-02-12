import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';

/// Диалог редактирования приложения.
///
/// Позволяет изменить: название, описание, иконку, платформы, ссылки на магазины.
/// Namespace изменить нельзя.
class EditApplicationDialog extends StatefulWidget {
  final Application application;

  const EditApplicationDialog({super.key, required this.application});

  @override
  State<EditApplicationDialog> createState() => _EditApplicationDialogState();
}

class _EditApplicationDialogState extends State<EditApplicationDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _iconUrlController;
  late final Set<PlatformType> _selectedPlatforms;
  late final Map<PlatformType, List<_StoreLinkFormEntry>> _platformStoreLinks;

  bool _showPlatformError = false;
  bool _showStoreLinkErrors = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.application.name);
    _descriptionController = TextEditingController(
      text: widget.application.description,
    );
    _iconUrlController = TextEditingController(
      text: widget.application.iconUrl ?? '',
    );
    _selectedPlatforms = Set.from(widget.application.platforms);

    // Группируем storeLinks по платформам
    _platformStoreLinks = {};
    for (final platform in _selectedPlatforms) {
      _platformStoreLinks[platform] = [];
    }
    for (final link in widget.application.storeLinks ?? <StoreLink>[]) {
      _platformStoreLinks
          .putIfAbsent(link.platform, () => [])
          .add(_StoreLinkFormEntry(storeName: link.storeName, url: link.url));
    }
    // Гарантируем хотя бы одну пустую запись для каждой платформы
    for (final platform in _selectedPlatforms) {
      final links = _platformStoreLinks[platform];
      if (links == null || links.isEmpty) {
        _platformStoreLinks[platform] = [_StoreLinkFormEntry()];
      }
    }
  }

  @override
  void dispose() {
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: const Text('Редактировать приложение'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Namespace (нередактируемый)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.application.namespace,
                        style: textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Название
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Название',
                    hintText: 'Моё приложение',
                  ),
                  autofocus: true,
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

                // URL иконки
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
        FilledButton(
          onPressed: _submit,
          child: const Text('Сохранить'),
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
    for (final entry in _platformStoreLinks.entries) {
      for (final link in entry.value) {
        if (link.storeNameController.text.trim().isNotEmpty &&
            link.urlController.text.trim().isNotEmpty) {
          storeLinks.add(
            StoreLinkEntry(
              platform: entry.key,
              storeName: link.storeNameController.text.trim(),
              url: link.urlController.text.trim(),
            ),
          );
        }
      }
    }

    final bloc = context.read<ApplicationBloc>();
    Navigator.pop(context);
    bloc.add(
      ApplicationEvent.updateApplication(
        applicationId: widget.application.id!,
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        iconUrl: _iconUrlController.text.trim().isEmpty
            ? null
            : _iconUrlController.text.trim(),
        platforms: _selectedPlatforms.toList(),
        storeLinks: storeLinks,
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Единая секция: платформы + ссылки на магазины
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
