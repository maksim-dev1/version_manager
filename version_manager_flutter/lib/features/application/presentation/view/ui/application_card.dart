import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/features/api_key/presentation/bloc/api_key_bloc.dart';
import 'package:version_manager_flutter/features/application/presentation/view/application_detail_screen.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/delete_application_dialog.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/edit_application_dialog.dart';
import 'package:version_manager_flutter/features/api_key/presentation/view/regenerate_api_key_dialog.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/transfer_application_dialog.dart';

/// Минималистичная квадратная карточка приложения.
class ApplicationCard extends StatelessWidget {
  final Application application;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const ApplicationCard({
    super.key,
    required this.application,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = application.isActive;

    return Opacity(
      opacity: isActive ? 1.0 : 0.5,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _openDetail(context),
          onLongPress: () => _showActionsSheet(context),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _AppIcon(
                      iconUrl: application.iconUrl,
                      name: application.name,
                      colorScheme: colorScheme,
                      size: 36,
                    ),
                    const Spacer(),
                    if (!isActive)
                      Icon(
                        Icons.pause_circle_filled,
                        size: 16,
                        color: colorScheme.error.withValues(alpha: 0.7),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  application.name,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  application.namespace,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontFamily: 'monospace',
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                _PlatformIcons(
                  platforms: application.platforms,
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDetail(BuildContext context) {
    final bloc = context.read<ApplicationBloc>();
    final repo = context.read<ApplicationRepository>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RepositoryProvider.value(
          value: repo,
          child: BlocProvider.value(
            value: bloc,
            child: ApplicationDetailScreen(application: application),
          ),
        ),
      ),
    );
  }

  void _showActionsSheet(BuildContext context) {
    final bloc = context.read<ApplicationBloc>();

    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  _AppIcon(
                    iconUrl: application.iconUrl,
                    name: application.name,
                    colorScheme: colorScheme,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          application.name,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          application.namespace,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                application.isActive
                    ? Icons.pause_circle_outlined
                    : Icons.play_circle_outlined,
              ),
              title: Text(
                application.isActive ? 'Деактивировать' : 'Активировать',
              ),
              onTap: () {
                Navigator.pop(sheetContext);
                bloc.add(
                  ApplicationEvent.toggleApplicationStatus(
                    applicationId: application.id!,
                    isActive: !application.isActive,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.key_outlined),
              title: const Text('Регенерировать API ключ'),
              onTap: () {
                final repo = context.read<ApplicationRepository>();
                Navigator.pop(sheetContext);
                showDialog(
                  context: context,
                  builder: (_) => RepositoryProvider.value(
                    value: repo,
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: bloc),
                        BlocProvider(
                          create: (context) =>
                              ApiKeyBloc(
                                applicationRepository: context
                                    .read<ApplicationRepository>(),
                              )..add(
                                ApiKeyEvent.fetchEmail(
                                  applicationId: application.id!,
                                ),
                              ),
                        ),
                      ],
                      child: RegenerateApiKeyDialog(application: application),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Редактировать'),
              onTap: () {
                Navigator.pop(sheetContext);
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: bloc,
                    child: EditApplicationDialog(application: application),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.swap_horiz_outlined),
              title: const Text('Передать владение'),
              onTap: () {
                Navigator.pop(sheetContext);
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: bloc,
                    child: TransferApplicationDialog(
                      application: application,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline, color: colorScheme.error),
              title: Text(
                'Удалить',
                style: TextStyle(color: colorScheme.error),
              ),
              onTap: () {
                Navigator.pop(sheetContext);
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: bloc,
                    child: DeleteApplicationDialog(application: application),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// Квадратная иконка приложения.
class _AppIcon extends StatelessWidget {
  final String? iconUrl;
  final String name;
  final ColorScheme colorScheme;
  final double size;

  const _AppIcon({
    required this.iconUrl,
    required this.name,
    required this.colorScheme,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: size,
        height: size,
        child: iconUrl != null
            ? Image.network(
                iconUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              )
            : _placeholder(),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: colorScheme.secondaryContainer,
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: size * 0.45,
        ),
      ),
    );
  }
}

/// Ряд иконок платформ.
class _PlatformIcons extends StatelessWidget {
  final List<PlatformType> platforms;
  final ColorScheme colorScheme;

  const _PlatformIcons({
    required this.platforms,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: List.generate(
        platforms.length,
        (index) => Icon(
          _platformIcon(platforms[index]),
          size: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
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
}
