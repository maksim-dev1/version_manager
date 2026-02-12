import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/features/api_key/presentation/bloc/api_key_bloc.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/delete_application_dialog.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/edit_application_dialog.dart';
import 'package:version_manager_flutter/features/api_key/presentation/view/regenerate_api_key_dialog.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/transfer_application_dialog.dart';
import 'package:version_manager_flutter/features/version/presentation/view/versions_screen.dart';
import 'package:version_manager_flutter/shared/widgets/animated_copy_icon_button.dart';

/// Экран деталей приложения с вкладками «Информация», «Версии» и «Статистика».
class ApplicationDetailScreen extends StatelessWidget {
  final Application application;

  const ApplicationDetailScreen({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    return _ApplicationDetailBody(application: application);
  }
}

class _ApplicationDetailBody extends StatelessWidget {
  final Application application;

  const _ApplicationDetailBody({required this.application});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    return BlocListener<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        if (state is ApplicationLoaded) {
          final exists = state.applications.any(
            (a) => a.id == application.id,
          );
          if (!exists && context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: BlocSelector<ApplicationBloc, ApplicationState, Application>(
        selector: (state) {
          if (state is ApplicationLoaded) {
            return state.applications.firstWhere(
              (a) => a.id == application.id,
              orElse: () => application,
            );
          }
          return application;
        },
        builder: (context, app) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(app.name),
                elevation: 0,
                // actions: [
                //   _ActionsMenu(application: app, colorScheme: colorScheme),
                // ],
                bottom: TabBar(
                  tabAlignment: isCompact
                      ? TabAlignment.fill
                      : TabAlignment.start,
                  isScrollable: !isCompact,
                  tabs: [
                    Tab(
                      icon: isCompact
                          ? const Icon(Icons.info_outline, size: 20)
                          : null,
                      text: 'Информация',
                    ),
                    Tab(
                      icon: isCompact
                          ? const Icon(Icons.list_alt, size: 20)
                          : null,
                      text: 'Версии',
                    ),
                    Tab(
                      icon: isCompact
                          ? const Icon(Icons.bar_chart, size: 20)
                          : null,
                      text: 'Статистика',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  _InfoTab(application: app),
                  VersionsScreen(application: app),
                  _StatisticsTab(application: app),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Вкладка «Информация»
// ──────────────────────────────────────────────────────────────────

class _InfoTab extends StatefulWidget {
  final Application application;

  const _InfoTab({required this.application});

  @override
  State<_InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<_InfoTab> {
  Application get app => widget.application;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;
    final bloc = context.read<ApplicationBloc>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Владелец: почта пользователя или название команды
    final ownerLabel = app.ownerType == OwnerType.user
        ? (app.ownerUser?.email ?? 'Вы')
        : (app.ownerTeam?.name ?? 'Команда');

    // Последние 4 символа ключа (из поля apiKeyLast4 в БД)
    final apiKeyHint = '••••••••${app.apiKeyLast4}';

    return ListView(
      padding: EdgeInsets.all(padding),
      children: [
        // ── Основная информация ──
        _SectionCard(
          title: 'Основная информация',
          icon: Icons.info_outline,
          children: [
            // Иконка + название + статус
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: app.iconUrl != null
                        ? Image.network(
                            app.iconUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) =>
                                _IconPlaceholder(name: app.name),
                          )
                        : _IconPlaceholder(name: app.name),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        app.name,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      _StatusBadge(isActive: app.isActive),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _InfoRow(label: 'Namespace', value: app.namespace, mono: true),
            if (app.description.isNotEmpty)
              _InfoRow(label: 'Описание', value: app.description),
            _InfoRow(
              label: 'Владелец',
              child: Row(
                children: [
                  Icon(
                    app.ownerType == OwnerType.user
                        ? Icons.person_outlined
                        : Icons.groups_outlined,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(ownerLabel, style: textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
            _InfoRow(
              label: 'Создано',
              value: _formatDateTime(app.createdAt),
            ),
            _InfoRow(
              label: 'Обновлено',
              value: _formatDateTime(app.updatedAt),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Платформы и магазины ──
        _PlatformsCard(app: app),
        const SizedBox(height: 12),

        // ── API ключ ──
        _SectionCard(
          title: 'API ключ',
          icon: Icons.key,
          children: [
            _InfoRow(
              label: 'Ключ',
              child: Row(
                children: [
                  Text(
                    apiKeyHint,
                    style: textTheme.bodyMedium?.copyWith(
                      fontFamily: 'monospace',
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            _InfoRow(
              label: 'Создан',
              value: _formatDateTime(app.apiKeyCreatedAt),
            ),
            if (app.apiKeyLastRegeneratedAt != null)
              _InfoRow(
                label: 'Перегенерирован',
                value: _formatDateTime(app.apiKeyLastRegeneratedAt!),
              ),
            const SizedBox(height: 8),

            // Кнопка регенерации
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 18,
                        color: colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Регенерация ключа потребует подтверждения по электронной почте. '
                          'Старый ключ будет аннулирован.',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FilledButton.tonalIcon(
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Регенерировать API ключ'),
                    onPressed: () {
                      final repo = context.read<ApplicationRepository>();
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
                                        applicationId: app.id!,
                                      ),
                                    ),
                              ),
                            ],
                            child: RegenerateApiKeyDialog(
                              application: app,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Действия ──
        _ActionsCard(application: app),
        const SizedBox(height: 24),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Компактная карточка платформ со ссылками
// ──────────────────────────────────────────────────────────────────

class _PlatformsCard extends StatelessWidget {
  final Application app;

  const _PlatformsCard({required this.app});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final allLinks = app.storeLinks ?? <StoreLink>[];

    // Группируем ссылки по платформе
    final linksByPlatform = <PlatformType, List<StoreLink>>{};
    for (final link in allLinks) {
      linksByPlatform.putIfAbsent(link.platform, () => []).add(link);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.devices,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Платформы и ссылки на магазины',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            for (final platform in app.platforms)
              _PlatformDetailCard(
                platform: platform,
                links: linksByPlatform[platform] ?? [],
              ),
          ],
        ),
      ),
    );
  }
}

/// Карточка одной платформы со ссылками (только чтение).
class _PlatformDetailCard extends StatelessWidget {
  final PlatformType platform;
  final List<StoreLink> links;

  const _PlatformDetailCard({
    required this.platform,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок
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
                ],
              ),
            ),
            // Ссылки
            if (links.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < links.length; i++)
                      Padding(
                        padding: EdgeInsets.only(top: i > 0 ? 6 : 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.store,
                              size: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              links[i].storeName,
                              style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                links[i].url,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.primary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            AnimatedCopyIconButton(
                              textToCopy: links[i].url,
                              size: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: IconButton(
                                onPressed: () =>
                                    launchUrl(Uri.parse(links[i].url)),
                                icon: Icon(
                                  Icons.open_in_new,
                                  size: 14,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                tooltip: 'Открыть',
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.link_off,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Нет ссылок',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
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

class _IconPlaceholder extends StatelessWidget {
  final String name;

  const _IconPlaceholder({required this.name});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.secondaryContainer,
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Карточка действий
// ──────────────────────────────────────────────────────────────────

class _ActionsCard extends StatelessWidget {
  final Application application;

  const _ActionsCard({required this.application});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Действия',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (isCompact)
              _ActionsList(
                application: application,
                isCompact: true,
              )
            else
              _ActionsList(
                application: application,
                isCompact: false,
              ),
          ],
        ),
      ),
    );
  }
}

/// Список кнопок действий над приложением.
class _ActionsList extends StatelessWidget {
  final Application application;
  final bool isCompact;

  const _ActionsList({
    required this.application,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = context.read<ApplicationBloc>();
    final spacing = isCompact
        ? const SizedBox(height: 8)
        : const SizedBox.shrink();

    final actions = [
      _ActionButton(
        icon: application.isActive
            ? Icons.pause_circle_outlined
            : Icons.play_circle_outlined,
        label: application.isActive ? 'Деактивировать' : 'Активировать',
        style: _ActionStyle.filled,
        onPressed: () {
          bloc.add(
            ApplicationEvent.toggleApplicationStatus(
              applicationId: application.id!,
              isActive: !application.isActive,
            ),
          );
        },
      ),
      _ActionButton(
        icon: Icons.edit_outlined,
        label: 'Редактировать',
        style: _ActionStyle.outlined,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: bloc,
              child: EditApplicationDialog(application: application),
            ),
          );
        },
      ),
      _ActionButton(
        icon: Icons.swap_horiz,
        label: 'Передать владение',
        style: _ActionStyle.outlined,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: bloc,
              child: TransferApplicationDialog(application: application),
            ),
          );
        },
      ),
      _ActionButton(
        icon: Icons.delete_outline,
        label: 'Удалить приложение',
        style: _ActionStyle.danger,
        color: colorScheme.error,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: bloc,
              child: DeleteApplicationDialog(application: application),
            ),
          );
        },
      ),
    ];

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(actions.length * 2 - 1, (index) {
          if (index.isOdd) return spacing;
          return actions[index ~/ 2];
        }),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: actions,
    );
  }
}

enum _ActionStyle { filled, outlined, danger }

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final _ActionStyle style;
  final VoidCallback onPressed;
  final Color? color;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.style,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return switch (style) {
      _ActionStyle.filled => FilledButton.tonalIcon(
        icon: Icon(icon, size: 18),
        label: Text(label),
        onPressed: onPressed,
      ),
      _ActionStyle.outlined => OutlinedButton.icon(
        icon: Icon(icon, size: 18),
        label: Text(label),
        onPressed: onPressed,
      ),
      _ActionStyle.danger => OutlinedButton.icon(
        icon: Icon(icon, size: 18, color: color),
        label: Text(label, style: TextStyle(color: color)),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color ?? Colors.red),
        ),
        onPressed: onPressed,
      ),
    };
  }
}

// ──────────────────────────────────────────────────────────────────
// Общие виджеты для вкладки информации
// ──────────────────────────────────────────────────────────────────

/// Секционная карточка с заголовком.
class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final allChildren = <Widget>[
      Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      const Divider(height: 20),
    ];
    allChildren.addAll(children);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: allChildren,
        ),
      ),
    );
  }
}

/// Строка «Метка — Значение».
class _InfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final bool mono;
  final Widget? child;

  const _InfoRow({
    required this.label,
    this.value,
    this.mono = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child:
                child ??
                Text(
                  value ?? '—',
                  style: textTheme.bodyMedium?.copyWith(
                    fontFamily: mono ? 'monospace' : null,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

/// Бейдж статуса приложения.
class _StatusBadge extends StatelessWidget {
  final bool isActive;

  const _StatusBadge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.green.withValues(alpha: 0.15)
            : colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? Icons.check_circle : Icons.cancel,
            size: 14,
            color: isActive ? Colors.green : colorScheme.error,
          ),
          const SizedBox(width: 4),
          Text(
            isActive ? 'Активно' : 'Неактивно',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.green : colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Вкладка «Статистика»
// ──────────────────────────────────────────────────────────────────

class _StatisticsTab extends StatelessWidget {
  final Application application;

  const _StatisticsTab({required this.application});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;

    return ListView(
      padding: EdgeInsets.all(padding),
      children: [
        _StatisticsEmptyState(),
      ],
    );
  }
}

/// Заглушка — статистика ещё не собрана.
class _StatisticsEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bar_chart_outlined,
              size: 56,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Статистика пока недоступна',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Здесь будет отображаться статистика проверок версий: '
              'количество запросов, платформы, география и устройства.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Хелперы
// ──────────────────────────────────────────────────────────────────

String _formatDateTime(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  final hour = date.hour.toString().padLeft(2, '0');
  final minute = date.minute.toString().padLeft(2, '0');
  return '$day.$month.${date.year} в $hour:$minute';
}

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
