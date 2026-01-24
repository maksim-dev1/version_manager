import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/feature/applications/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/feature/versions/presentation/bloc/version_bloc.dart';
import 'package:version_manager_flutter/feature/versions/presentation/view/add_version_screen.dart';
import 'package:version_manager_flutter/feature/versions/presentation/view/ui/version_card.dart';
import 'package:version_manager_flutter/shared/ui/action_sheet.dart';
import 'package:version_manager_flutter/shared/ui/details_dialog.dart';

class VersionsScreen extends StatefulWidget {
  final Application? application;
  const VersionsScreen({super.key, this.application});

  @override
  State<VersionsScreen> createState() => _VersionsScreenState();
}

class _VersionsScreenState extends State<VersionsScreen> {
  Platform? _selectedPlatformFilter;

  @override
  void initState() {
    super.initState();
    if (widget.application != null) {
      context.read<VersionBloc>().add(
        VersionEvent.getVersionsByFilters(
          applicationId: widget.application!.id!,
        ),
      );
    } else {
      context.read<VersionBloc>().add(const VersionEvent.getAllVersions());
    }
  }

  void _applyFilter() {
    if (widget.application != null) {
      context.read<VersionBloc>().add(
        VersionEvent.getVersionsByFilters(
          applicationId: widget.application!.id!,
          platform: _selectedPlatformFilter,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.application != null
            ? Text(
                '${widget.application!.appName}(${widget.application!.packageName})',
              )
            : const Text('Версии'),
        actions: [
          if (widget.application != null)
            PopupMenuButton<Platform?>(
              icon: const Icon(Icons.filter_list_rounded),
              tooltip: 'Фильтр по платформе',
              onSelected: (platform) {
                setState(() {
                  _selectedPlatformFilter = platform;
                });
                _applyFilter();
              },
              itemBuilder: (context) => [
                PopupMenuItem<Platform?>(
                  value: null,
                  child: Row(
                    children: [
                      Icon(
                        Icons.all_inclusive_rounded,
                        color: _selectedPlatformFilter == null
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                      const SizedBox(width: 12),
                      const Text('Все платформы'),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                ...Platform.values
                    .where((p) => p != Platform.unknown)
                    .map(
                      (platform) => PopupMenuItem<Platform?>(
                        value: platform,
                        child: Row(
                          children: [
                            Icon(
                              _getPlatformIcon(platform),
                              color: _selectedPlatformFilter == platform
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            Text(_getPlatformName(platform)),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
        ],
      ),
      body: Column(
        children: [
          if (_selectedPlatformFilter != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  Icon(
                    _getPlatformIcon(_selectedPlatformFilter!),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Фильтр: ${_getPlatformName(_selectedPlatformFilter!)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedPlatformFilter = null;
                      });
                      _applyFilter();
                    },
                  ),
                ],
              ),
            ),
          const Expanded(child: VersionList()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'fab_versions',
        onPressed: () {
          final versionBloc = context.read<VersionBloc>();
          final applicationBloc = context.read<ApplicationBloc>();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: versionBloc),
                  BlocProvider.value(value: applicationBloc),
                ],
                child: AddVersionScreen(
                ),
              ),
            ),
          );
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            SizedBox(width: 6),
            Text('Добавить версию'),
          ],
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

class VersionList extends StatelessWidget {
  const VersionList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<VersionBloc, VersionState>(
      builder: (context, state) => switch (state) {
        VersionLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        VersionError(:final message) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 80,
                  color: colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Ошибка',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: colorScheme.error,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        VersionLoaded(:final versions) => Builder(
          builder: (context) {
            if (versions.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mobile_off_rounded,
                      size: 80,
                      color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Нет версий',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Добавьте первую версию приложения',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final version = versions[index];
                return VersionCard(
                  version: version,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: versions.length,
            );
          },
        ),
      },
    );
  }
}


