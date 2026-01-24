import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/feature/applications/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/feature/versions/presentation/bloc/version_bloc.dart';
import 'package:version_manager_flutter/shared/ui/my_text_form_field.dart';
import 'package:version_manager_flutter/shared/ui/store_link_card.dart';

class AddVersionScreen extends StatefulWidget {
  const AddVersionScreen({
    super.key,
  });

  @override
  State<AddVersionScreen> createState() => _AddVersionScreenState();
}

class _AddVersionScreenState extends State<AddVersionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _versionController = TextEditingController();
  final _buildNumberController = TextEditingController();
  final _changelogController = TextEditingController();

  Application? _selectedApplication;
  final List<Platform> _selectedPlatforms = [];
  final Map<Platform, List<StoreLinks>> _platformStoreLinks = {};

  @override
  void initState() {
    super.initState();
    context.read<ApplicationBloc>().add(
      const ApplicationEvent.getAllApplications(),
    );
  }

  @override
  void dispose() {
    _versionController.dispose();
    _buildNumberController.dispose();
    _changelogController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedApplication == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Выберите приложение')),
        );
        return;
      }

      if (_selectedPlatforms.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Выберите хотя бы одну платформу')),
        );
        return;
      }

      // Проверяем, что для каждой платформы добавлена хотя бы одна ссылка
      final platformsWithoutLinks = <Platform>[];
      for (final platform in _selectedPlatforms) {
        if (!_platformStoreLinks.containsKey(platform) ||
            _platformStoreLinks[platform]!.isEmpty) {
          platformsWithoutLinks.add(platform);
        }
      }

      if (platformsWithoutLinks.isNotEmpty) {
        final platformNames = platformsWithoutLinks
            .map((p) => _getPlatformName(p))
            .join(', ');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Добавьте ссылки на магазины для: $platformNames',
            ),
          ),
        );
        return;
      }

      // Собираем все ссылки на магазины из всех платформ
      final allStoreLinks = <StoreLinks>[];
      for (final platform in _selectedPlatforms) {
        if (_platformStoreLinks.containsKey(platform)) {
          allStoreLinks.addAll(_platformStoreLinks[platform]!);
        }
      }

      context.read<VersionBloc>().add(
        VersionEvent.addVersion(
          applicationId: _selectedApplication!.id!,
          version: _versionController.text.trim(),
          buildNumber: int.parse(_buildNumberController.text.trim()),
          changelog: _changelogController.text.trim(),
          platforms: _selectedPlatforms,
          storeLinks: allStoreLinks.isEmpty ? null : allStoreLinks,
        ),
      );

      Navigator.of(context).pop();
    }
  }

  void _addStoreLink(Platform platform) {
    if (_selectedPlatforms.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сначала выберите хотя бы одну платформу'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => _AddStoreLinkDialog(
        platform: platform,
        onAdd: (storeLink) {
          setState(() {
            if (!_platformStoreLinks.containsKey(platform)) {
              _platformStoreLinks[platform] = [];
            }
            _platformStoreLinks[platform]!.add(storeLink);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Добавить версию'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Заголовок
                        Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(
                                  Icons.add_box_rounded,
                                  color: colorScheme.onPrimaryContainer,
                                  size: 32,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Новая версия',
                                    style: theme.textTheme.headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Добавьте информацию о новой версии',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Выбор приложения
                        Text(
                          'Приложения',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 80,
                          child: BlocBuilder<ApplicationBloc, ApplicationState>(
                            builder: (context, state) => switch (state) {
                              ApplicationLoading() => Center(
                                child: CircularProgressIndicator(),
                              ),
                              ApplicationError() => Center(
                                child: Text(
                                  'Ошибка загрузки приложений',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.error,
                                  ),
                                ),
                              ),
                              ApplicationLoaded(:final applications) => Builder(
                                builder: (context) {
                                  if (_selectedApplication == null) {
                                    return InkWell(
                                      onTap: () async {
                                        final selectedIndex = await showDialog<int>(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              elevation: 4,
                                              child: ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                      maxWidth: 500,
                                                      maxHeight: 600,
                                                    ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    // Заголовок диалога
                                                    DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: colorScheme
                                                            .primaryContainer,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    20,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    20,
                                                                  ),
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              24,
                                                            ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .apps_rounded,
                                                              color: colorScheme
                                                                  .onPrimaryContainer,
                                                              size: 28,
                                                            ),
                                                            const SizedBox(
                                                              width: 12,
                                                            ),
                                                            Text(
                                                              'Выберите приложение',
                                                              style: theme
                                                                  .textTheme
                                                                  .titleLarge
                                                                  ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: colorScheme
                                                                        .onPrimaryContainer,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Список приложений
                                                    Flexible(
                                                      child: ListView.separated(
                                                        shrinkWrap: true,
                                                        padding:
                                                            const EdgeInsets.all(
                                                              16,
                                                            ),
                                                        itemBuilder: (context, index) {
                                                          final app =
                                                              applications[index];
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop(index);
                                                              },
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                              child: _AppCard(
                                                                iconUrl:
                                                                    app.iconUrl,
                                                                appName:
                                                                    app.appName,
                                                                packageName: app
                                                                    .packageName,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                const SizedBox(
                                                                  height: 8,
                                                                ),
                                                        itemCount:
                                                            applications.length,
                                                      ),
                                                    ),
                                                    // Кнопка отмены
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            16,
                                                          ),
                                                      child: TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                              context,
                                                            ).pop(),
                                                        style: TextButton.styleFrom(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 12,
                                                              ),
                                                        ),
                                                        child: const Text(
                                                          'Отмена',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (selectedIndex != null) {
                                          setState(() {
                                            _selectedApplication =
                                                applications[selectedIndex];
                                          });
                                        }
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: colorScheme
                                              .surfaceContainerHighest,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Center(
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color:
                                                  colorScheme.primaryContainer,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                2.0,
                                              ),
                                              child: Icon(
                                                Icons.add_rounded,
                                                size: 32,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return _AppCard(
                                    appName: _selectedApplication!.appName,
                                    packageName:
                                        _selectedApplication!.packageName,
                                    iconUrl: _selectedApplication!.iconUrl,
                                  );
                                },
                              ),
                              _ => SizedBox.shrink(),
                            },
                          ),
                        ),
                        // if (_selectedApplication == null)
                        //   BlocBuilder<ApplicationBloc, ApplicationState>(
                        //     builder: (context, state) {
                        //       return switch (state) {
                        //         ApplicationLoaded(:final applications) =>
                        //           DropdownButtonFormField<Application>(
                        //             decoration: InputDecoration(
                        //               labelText: 'Приложение',
                        //               prefixIcon: const Icon(
                        //                 Icons.apps_rounded,
                        //               ),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(12),
                        //               ),
                        //               filled: true,
                        //             ),
                        //             value: _selectedApplication,
                        //             items: applications
                        //                 .map(
                        //                   (app) => DropdownMenuItem(
                        //                     value: app,
                        //                     child: Text(app.appName),
                        //                   ),
                        //                 )
                        //                 .toList(),
                        //             onChanged: (value) {
                        //               setState(() {
                        //                 _selectedApplication = value;
                        //               });
                        //             },
                        //             validator: (value) {
                        //               if (value == null) {
                        //                 return 'Выберите приложение';
                        //               }
                        //               return null;
                        //             },
                        //           ),
                        //         _ => const Center(
                        //           child: CircularProgressIndicator(),
                        //         ),
                        //       };
                        //     },
                        //   )
                        // else
                        //   Container(
                        //     padding: const EdgeInsets.all(16),
                        //     decoration: BoxDecoration(
                        //       color: colorScheme.surfaceContainerHighest,
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         const Icon(Icons.apps_rounded),
                        //         const SizedBox(width: 12),
                        //         Expanded(
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 _selectedApplication!.appName,
                        //                 style: theme.textTheme.titleMedium
                        //                     ?.copyWith(
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //               ),
                        //               Text(
                        //                 _selectedApplication!.packageName,
                        //                 style: theme.textTheme.bodySmall
                        //                     ?.copyWith(
                        //                       color:
                        //                           colorScheme.onSurfaceVariant,
                        //                     ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        const SizedBox(height: 20),

                        // Версия
                        MyTextFormField(
                          controller: _versionController,
                          labelText: 'Версия',
                          prefixIcon: Icons.numbers_rounded,
                          hintText: '1.0.0',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Введите версию';
                            }
                            if (!RegExp(
                              r'^\d+\.\d+\.\d+$',
                            ).hasMatch(value.trim())) {
                              return 'Формат: X.Y.Z (например: 1.0.0)';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Build Number
                        MyTextFormField(
                          controller: _buildNumberController,
                          labelText: 'Номер сборки',
                          prefixIcon: Icons.tag_rounded,
                          hintText: '1',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Введите номер сборки';
                            }
                            if (int.tryParse(value.trim()) == null) {
                              return 'Введите целое число';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Платформа
                        Text(
                          'Платформы',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: Platform.values
                              .where((p) => p != Platform.unknown)
                              .map(
                                (platform) => FilterChip(
                                  label: Text(_getPlatformName(platform)),
                                  avatar: Icon(
                                    _getPlatformIcon(platform),
                                    size: 18,
                                  ),
                                  selected: _selectedPlatforms.contains(
                                    platform,
                                  ),
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        _selectedPlatforms.add(platform);
                                      } else {
                                        _selectedPlatforms.remove(platform);
                                      }
                                    });
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 20),

                        // Changelog
                        MyTextFormField(
                          controller: _changelogController,
                          labelText: 'Список изменений',
                          prefixIcon: Icons.description_rounded,
                          hintText: 'Что нового в этой версии?',
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Введите список изменений';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Ссылки на магазины
                        Text(
                          'Ссылки на магазины',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_selectedPlatforms.isEmpty)
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  'Выберите платформы для добавления ссылок',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          ..._selectedPlatforms.map((platform) {
                            final links = _platformStoreLinks[platform] ?? [];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          _getPlatformIcon(platform),
                                          size: 20,
                                          color: colorScheme.onPrimaryContainer,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          _getPlatformName(platform),
                                          style: theme.textTheme.titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: colorScheme
                                                    .onPrimaryContainer,
                                              ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () =>
                                              _addStoreLink(platform),
                                          icon: const Icon(Icons.add_rounded),
                                          tooltip: 'Добавить ссылку',
                                          iconSize: 20,
                                          color: colorScheme.onPrimaryContainer,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                if (links.isEmpty)
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color:
                                          colorScheme.surfaceContainerHighest,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Center(
                                        child: Text(
                                          'Нет ссылок',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                  ...links.map(
                                    (link) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: StoreLinkCard(
                                        storeLink: link,
                                        onDelete: () {
                                          setState(() {
                                            _platformStoreLinks[platform]!
                                                .remove(link);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }),
                        const SizedBox(height: 32),

                        // Submit Button
                        FilledButton.icon(
                          onPressed: _submit,
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('Добавить версию'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getPlatformName(Platform platform) {
    return switch (platform) {
      Platform.android => 'Android',
      Platform.ios => 'iOS',
      Platform.unknown => 'Неизвестно',
    };
  }

  IconData _getPlatformIcon(Platform platform) {
    return switch (platform) {
      Platform.android => Icons.android_rounded,
      Platform.ios => Icons.apple_rounded,
      Platform.unknown => Icons.question_mark_rounded,
    };
  }
}

class _AddStoreLinkDialog extends StatefulWidget {
  final Platform platform;
  final Function(StoreLinks) onAdd;

  const _AddStoreLinkDialog({
    required this.platform,
    required this.onAdd,
  });

  @override
  State<_AddStoreLinkDialog> createState() => _AddStoreLinkDialogState();
}

class _AddStoreLinkDialogState extends State<_AddStoreLinkDialog> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  late Store _selectedStore;

  @override
  void initState() {
    super.initState();
    // Выбираем магазин по умолчанию в зависимости от платформы
    _selectedStore = _getDefaultStore(widget.platform);
  }

  Store _getDefaultStore(Platform platform) {
    return switch (platform) {
      Platform.android => Store.google_play,
      Platform.ios => Store.app_store,
      _ => Store.google_play,
    };
  }

  List<Store> _getAvailableStores(Platform platform) {
    return switch (platform) {
      Platform.android => [
        Store.google_play,
        Store.ru_store,
      ],
      Platform.ios => [Store.app_store],
      _ => Store.values.where((s) => s != Store.unknown).toList(),
    };
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onAdd(
        StoreLinks(
          store: _selectedStore,
          url: _urlController.text.trim(),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableStores = _getAvailableStores(widget.platform);
    final platformName = _getPlatformName(widget.platform);

    return AlertDialog(
      title: Text('Добавить ссылку для $platformName'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<Store>(
              decoration: InputDecoration(
                labelText: 'Магазин',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              initialValue: _selectedStore,
              items: availableStores
                  .map(
                    (store) => DropdownMenuItem(
                      value: store,
                      child: Text(_getStoreName(store)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedStore = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'URL',
                hintText: 'https://play.google.com/store/apps/details?id=...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите URL';
                }
                final uri = Uri.tryParse(value.trim());
                if (uri == null || !uri.hasScheme) {
                  return 'Неверный формат URL';
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
          onPressed: _submit,
          child: const Text('Добавить'),
        ),
      ],
    );
  }

  String _getStoreName(Store store) {
    return switch (store) {
      Store.google_play => 'Google Play',
      Store.app_store => 'App Store',
      Store.ru_store => 'RuStore',
      Store.unknown => 'Неизвестно',
    };
  }

  String _getPlatformName(Platform platform) {
    return switch (platform) {
      Platform.android => 'Android',
      Platform.ios => 'iOS',
      Platform.unknown => 'Неизвестно',
    };
  }
}

class _AppCard extends StatelessWidget {
  final String appName;
  final String packageName;
  final String iconUrl;
  const _AppCard({
    required this.appName,
    required this.packageName,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Иконка приложения
            DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
                image: iconUrl.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(iconUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                width: 48,
                height: 48,
                child: iconUrl.isEmpty
                    ? Icon(
                        Icons.apps_rounded,
                        color: colorScheme.onPrimaryContainer,
                        size: 24,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            // Информация о приложении
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    packageName,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Стрелка
            Icon(
              Icons.chevron_right_rounded,
              color: colorScheme.onSurfaceVariant,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
