import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/api_key/presentation/view/api_key_display_dialog.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/features/create_application/presentation/bloc/create_application_bloc.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';

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
  final Set<PlatformType> _platformsWithLinkErrors = {};

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

  String? _validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final url = value.trim();

    final uri = Uri.tryParse(url);
    if (uri == null) {
      return 'Некорректный формат URL';
    }

    if (!uri.hasScheme) {
      return 'URL должен начинаться с http:// или https://';
    }

    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return 'Используйте http:// или https://';
    }

    if (!uri.hasAuthority || uri.host.isEmpty) {
      return 'URL должен содержать домен';
    }

    if (!uri.host.contains('.')) {
      return 'Укажите полный домен (например, example.com)';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateApplicationBloc, CreateApplicationState>(
      listener: (context, state) => switch (state) {
        CreateApplicationSuccess(:final apiKey) => {
          Navigator.pop(context),
          NotificationService.showSuccess(context, 'Приложение создано'),
          context.read<ApplicationBloc>().add(
            const ApplicationEvent.loadApplications(),
          ),
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => ApiKeyDisplayDialog(
              apiKey: apiKey,
              title: 'API ключ создан',
            ),
          ),
        },
        CreateApplicationError(:final message) => {
          NotificationService.showError(context, message),
        },
        _ => null,
      },
      child: _CreateApplicationDialogContent(
        preselectedTeam: widget.preselectedTeam,
        formKey: _formKey,
        namespaceController: _namespaceController,
        nameController: _nameController,
        descriptionController: _descriptionController,
        iconUrlController: _iconUrlController,
        selectedPlatforms: _selectedPlatforms,
        platformStoreLinks: _platformStoreLinks,
        showPlatformError: _showPlatformError,
        platformsWithLinkErrors: _platformsWithLinkErrors,
        validateUrl: _validateUrl,
        onPlatformToggled: (platform, selected) {
          setState(() {
            if (selected) {
              _selectedPlatforms.add(platform);
              _platformStoreLinks[platform] = [
                _StoreLinkFormEntry(),
              ];
            } else {
              _selectedPlatforms.remove(platform);
              _platformsWithLinkErrors.remove(platform);
              final entries = _platformStoreLinks.remove(platform);
              if (entries != null) {
                for (final e in entries) {
                  e.dispose();
                }
              }
            }
            _showPlatformError = false;
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
        onSubmit: _submit,
      ),
    );
  }

  void _submit() {
    final formValid = _formKey.currentState?.validate() ?? false;

    final platformsValid = _selectedPlatforms.isNotEmpty;
    if (!platformsValid) {
      setState(() => _showPlatformError = true);
    }

    _platformsWithLinkErrors.clear();
    for (final platform in _selectedPlatforms) {
      final links = _platformStoreLinks[platform] ?? [];
      bool hasValid = links.any(
        (e) =>
            e.storeNameController.text.trim().isNotEmpty &&
            e.urlController.text.trim().isNotEmpty,
      );

      if (!hasValid) {
        _platformsWithLinkErrors.add(platform);
      }
    }

    final storeLinksValid = _platformsWithLinkErrors.isEmpty;

    if (!formValid || !platformsValid || !storeLinksValid) {
      setState(() {});
      return;
    }

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
// Контент диалога
// ──────────────────────────────────────────────────────────────────

class _CreateApplicationDialogContent extends StatelessWidget {
  final Team? preselectedTeam;
  final GlobalKey<FormState> formKey;
  final TextEditingController namespaceController;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController iconUrlController;
  final Set<PlatformType> selectedPlatforms;
  final Map<PlatformType, List<_StoreLinkFormEntry>> platformStoreLinks;
  final bool showPlatformError;
  final Set<PlatformType> platformsWithLinkErrors;
  final String? Function(String?) validateUrl;
  final void Function(PlatformType platform, bool selected) onPlatformToggled;
  final void Function(PlatformType platform) onAddLink;
  final void Function(PlatformType platform, int index) onRemoveLink;
  final VoidCallback onSubmit;

  const _CreateApplicationDialogContent({
    required this.preselectedTeam,
    required this.formKey,
    required this.namespaceController,
    required this.nameController,
    required this.descriptionController,
    required this.iconUrlController,
    required this.selectedPlatforms,
    required this.platformStoreLinks,
    required this.showPlatformError,
    required this.platformsWithLinkErrors,
    required this.validateUrl,
    required this.onPlatformToggled,
    required this.onAddLink,
    required this.onRemoveLink,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        preselectedTeam != null
            ? 'Создать приложение · ${preselectedTeam!.name}'
            : 'Создать личное приложение',
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 540),
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: namespaceController,
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
                        r'^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*){2,}$',
                      );
                      if (!regex.hasMatch(ns)) {
                        return 'Формат: com.example.app (мин. 3 сегмента)';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
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
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
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
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: iconUrlController,
                    decoration: const InputDecoration(
                      labelText: 'URL иконки',
                      hintText: 'https://example.com/icon.png',
                      helperText: 'Необязательно',
                    ),
                    validator: validateUrl,
                  ),
                  const SizedBox(height: 32),
                  Divider(color: Theme.of(context).colorScheme.outlineVariant),
                  const SizedBox(height: 24),
                  _PlatformAndStoreLinksSection(
                    selectedPlatforms: selectedPlatforms,
                    platformStoreLinks: platformStoreLinks,
                    showPlatformError: showPlatformError,
                    platformsWithLinkErrors: platformsWithLinkErrors,
                    onPlatformToggled: onPlatformToggled,
                    onAddLink: onAddLink,
                    onRemoveLink: onRemoveLink,
                    validateUrl: validateUrl,
                  ),
                ],
              ),
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
              onPressed: isLoading ? null : onSubmit,
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
}

// ──────────────────────────────────────────────────────────────────
// Секция платформ + ссылки
// ──────────────────────────────────────────────────────────────────

class _PlatformAndStoreLinksSection extends StatelessWidget {
  final Set<PlatformType> selectedPlatforms;
  final Map<PlatformType, List<_StoreLinkFormEntry>> platformStoreLinks;
  final bool showPlatformError;
  final Set<PlatformType> platformsWithLinkErrors;
  final void Function(PlatformType platform, bool selected) onPlatformToggled;
  final void Function(PlatformType platform) onAddLink;
  final void Function(PlatformType platform, int index) onRemoveLink;
  final String? Function(String?) validateUrl;

  const _PlatformAndStoreLinksSection({
    required this.selectedPlatforms,
    required this.platformStoreLinks,
    required this.showPlatformError,
    required this.platformsWithLinkErrors,
    required this.onPlatformToggled,
    required this.onAddLink,
    required this.onRemoveLink,
    required this.validateUrl,
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
          'Платформы и магазины',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Выберите платформы и добавьте ссылки на магазины приложений',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        _StoreLinksInfoBanner(),
        _PlatformErrorMessage(
          showPlatformError: showPlatformError,
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PlatformType.values.length,
          separatorBuilder: (context, index) => const SizedBox.shrink(),
          itemBuilder: (context, index) {
            final platform = PlatformType.values[index];
            final isSelected = selectedPlatforms.contains(platform);
            final links = platformStoreLinks[platform] ?? [];
            final hasLinkError = platformsWithLinkErrors.contains(platform);

            return _PlatformItem(
              platform: platform,
              isSelected: isSelected,
              links: links,
              hasLinkError: hasLinkError,
              onToggle: (value) => onPlatformToggled(platform, value ?? false),
              onAddLink: () => onAddLink(platform),
              onRemoveLink: (index) => onRemoveLink(platform, index),
              validateUrl: validateUrl,
            );
          },
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Сообщение об ошибке платформ
// ──────────────────────────────────────────────────────────────────

class _PlatformErrorMessage extends StatelessWidget {
  final bool showPlatformError;

  const _PlatformErrorMessage({
    required this.showPlatformError,
  });

  @override
  Widget build(BuildContext context) {
    if (!showPlatformError) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 16, color: colorScheme.error),
          const SizedBox(width: 6),
          Text(
            'Выберите хотя бы одну платформу',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Виджет одной платформы
// ──────────────────────────────────────────────────────────────────

class _PlatformItem extends StatelessWidget {
  final PlatformType platform;
  final bool isSelected;
  final List<_StoreLinkFormEntry> links;
  final bool hasLinkError;
  final ValueChanged<bool?> onToggle;
  final VoidCallback onAddLink;
  final ValueChanged<int> onRemoveLink;
  final String? Function(String?) validateUrl;

  const _PlatformItem({
    required this.platform,
    required this.isSelected,
    required this.links,
    required this.hasLinkError,
    required this.onToggle,
    required this.onAddLink,
    required this.onRemoveLink,
    required this.validateUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = hasLinkError
        ? colorScheme.errorContainer.withValues(alpha: 0.1)
        : isSelected
        ? colorScheme.surfaceContainerHighest
        : colorScheme.surface;

    final borderColor = hasLinkError
        ? colorScheme.error
        : isSelected
        ? colorScheme.primary.withValues(alpha: 0.3)
        : colorScheme.outlineVariant.withValues(alpha: 0.4);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: hasLinkError ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PlatformHeader(
              platform: platform,
              isSelected: isSelected,
              linksCount: links.length,
              onToggle: onToggle,
            ),
            _PlatformLinksContent(
              isSelected: isSelected,
              hasLinkError: hasLinkError,
              links: links,
              onRemoveLink: onRemoveLink,
              validateUrl: validateUrl,
              onAddLink: onAddLink,
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Заголовок платформы
// ──────────────────────────────────────────────────────────────────

class _PlatformHeader extends StatelessWidget {
  final PlatformType platform;
  final bool isSelected;
  final int linksCount;
  final ValueChanged<bool?> onToggle;

  const _PlatformHeader({
    required this.platform,
    required this.isSelected,
    required this.linksCount,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onToggle(!isSelected),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
          bottom: Radius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: isSelected,
                  onChanged: onToggle,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _platformIcon(platform),
                  size: 20,
                  color: isSelected
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                _platformLabel(platform),
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.2,
                ),
              ),
              _LinkCountBadge(
                isSelected: isSelected,
                linksCount: linksCount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Badge с количеством ссылок
// ──────────────────────────────────────────────────────────────────

class _LinkCountBadge extends StatelessWidget {
  final bool isSelected;
  final int linksCount;

  const _LinkCountBadge({
    required this.isSelected,
    required this.linksCount,
  });

  @override
  Widget build(BuildContext context) {
    if (!isSelected || linksCount == 0) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '$linksCount',
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Контент с ссылками платформы
// ──────────────────────────────────────────────────────────────────

class _PlatformLinksContent extends StatelessWidget {
  final bool isSelected;
  final bool hasLinkError;
  final List<_StoreLinkFormEntry> links;
  final ValueChanged<int> onRemoveLink;
  final String? Function(String?) validateUrl;
  final VoidCallback onAddLink;

  const _PlatformLinksContent({
    required this.isSelected,
    required this.hasLinkError,
    required this.links,
    required this.onRemoveLink,
    required this.validateUrl,
    required this.onAddLink,
  });

  @override
  Widget build(BuildContext context) {
    if (!isSelected) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.outlineVariant.withValues(alpha: 0),
                  colorScheme.outlineVariant.withValues(alpha: 0.3),
                  colorScheme.outlineVariant.withValues(alpha: 0),
                ],
              ),
            ),
          ),
          _LinkErrorBanner(hasLinkError: hasLinkError),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: links.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _StoreLinkFields(
                entry: links[index],
                index: index,
                canRemove: links.length > 1,
                onRemove: () => onRemoveLink(index),
                validateUrl: validateUrl,
              );
            },
          ),
          const SizedBox(height: 12),
          _AddLinkButton(onAddLink: onAddLink),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Информационный баннер о видимости названий магазинов
// ──────────────────────────────────────────────────────────────────

class _StoreLinksInfoBanner extends StatelessWidget {
  const _StoreLinksInfoBanner();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            size: 18,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Названия магазинов будут видны пользователям в приложении',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Баннер с ошибкой ссылки
// ──────────────────────────────────────────────────────────────────

class _LinkErrorBanner extends StatelessWidget {
  final bool hasLinkError;

  const _LinkErrorBanner({
    required this.hasLinkError,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasLinkError) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.errorContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorScheme.error.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              size: 18,
              color: colorScheme.error,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Укажите хотя бы одну ссылку на магазин',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Кнопка добавления ссылки
// ──────────────────────────────────────────────────────────────────

class _AddLinkButton extends StatelessWidget {
  final VoidCallback onAddLink;

  const _AddLinkButton({
    required this.onAddLink,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onAddLink,
        icon: Icon(
          Icons.add_circle_outline,
          size: 18,
          color: colorScheme.primary,
        ),
        label: Text(
          'Добавить ссылку',
          style: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Поля для одной ссылки на магазин
// ──────────────────────────────────────────────────────────────────

class _StoreLinkFields extends StatelessWidget {
  final _StoreLinkFormEntry entry;
  final int index;
  final bool canRemove;
  final VoidCallback onRemove;
  final String? Function(String?) validateUrl;

  const _StoreLinkFields({
    required this.entry,
    required this.index,
    required this.canRemove,
    required this.onRemove,
    required this.validateUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: entry.storeNameController,
                decoration: InputDecoration(
                  labelText: 'Название магазина',
                  hintText: 'App Store',
                  filled: true,
                  fillColor: colorScheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                style: const TextStyle(fontSize: 14),
                validator: (value) {
                  final storeName = value?.trim() ?? '';
                  final url = entry.urlController.text.trim();

                  if (storeName.isEmpty && url.isEmpty) return null;

                  if (url.isNotEmpty && storeName.isEmpty) {
                    return 'Введите название';
                  }

                  if (storeName.isNotEmpty && storeName.length < 2) {
                    return 'Минимум 2 символа';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: entry.urlController,
                decoration: InputDecoration(
                  labelText: 'URL',
                  hintText: 'https://apps.apple.com/...',
                  filled: true,
                  fillColor: colorScheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                style: const TextStyle(fontSize: 14),
                keyboardType: TextInputType.url,
                validator: (value) {
                  final storeName = entry.storeNameController.text.trim();
                  final url = value?.trim() ?? '';

                  if (storeName.isEmpty && url.isEmpty) return null;

                  if (storeName.isNotEmpty && url.isEmpty) {
                    return 'Введите URL';
                  }

                  return validateUrl(value);
                },
              ),
            ],
          ),
        ),
        _RemoveButton(
          canRemove: canRemove,
          onRemove: onRemove,
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Кнопка удаления ссылки
// ──────────────────────────────────────────────────────────────────

class _RemoveButton extends StatelessWidget {
  final bool canRemove;
  final VoidCallback onRemove;

  const _RemoveButton({
    required this.canRemove,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (!canRemove) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: IconButton(
        onPressed: onRemove,
        icon: Icon(
          Icons.close,
          color: colorScheme.error.withValues(alpha: 0.7),
          size: 20,
        ),
        tooltip: 'Удалить',
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.error.withValues(alpha: 0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(36, 36),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Внутреннее состояние одной ссылки на магазин
// ──────────────────────────────────────────────────────────────────

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
// Хелперы
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
