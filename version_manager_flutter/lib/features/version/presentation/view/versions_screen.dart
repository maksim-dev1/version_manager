import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';
import 'package:version_manager_flutter/features/version/presentation/bloc/version_bloc.dart';
import 'package:version_manager_flutter/features/version/presentation/version_provider.dart';
import 'package:version_manager_flutter/features/version_action/presentation/view/create_version_dialog.dart';
import 'package:version_manager_flutter/features/version_action/presentation/view/delete_version_dialog.dart';
import 'package:version_manager_flutter/features/version_action/presentation/view/edit_version_dialog.dart';
import 'package:version_manager_flutter/features/version_action/presentation/view/recommendation_dialog.dart';
import 'package:version_manager_flutter/features/version_detail/presentation/bloc/version_detail_bloc.dart';
import 'package:version_manager_flutter/features/version/presentation/view/ui/version_card.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';

/// Экран списка версий приложения.
///
/// Встраивается во вкладку «Версии» экрана деталей приложения.
class VersionsScreen extends StatelessWidget {
  final Application application;

  const VersionsScreen({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return VersionProvider(
      applicationId: application.id!,
      child: _VersionsScreenBody(application: application),
    );
  }
}

class _VersionsScreenBody extends StatelessWidget {
  final Application application;

  const _VersionsScreenBody({required this.application});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VersionActionBloc, VersionActionState>(
      listener: (context, state) {
        switch (state) {
          case VersionActionSuccess(:final message):
            NotificationService.showSuccess(context, message);
            // Перезагружаем список после успешной операции
            context.read<VersionBloc>().add(
              VersionEvent.loadVersions(applicationId: application.id!),
            );
          case VersionActionError(:final message):
            NotificationService.showError(context, message);
          default:
            break;
        }
      },
      child: BlocBuilder<VersionBloc, VersionState>(
        buildWhen: (prev, curr) =>
            curr is VersionLoading ||
            curr is VersionLoaded ||
            curr is VersionError,
        builder: (context, state) => switch (state) {
          VersionLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          VersionLoaded(:final versions) => _VersionsContent(
            application: application,
            versions: versions,
          ),
          VersionError(:final message) => _ErrorState(
            message: message,
            applicationId: application.id!,
          ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Содержимое списка версий
// ──────────────────────────────────────────────────────────────────

class _VersionsContent extends StatelessWidget {
  final Application application;
  final List<VersionListItem> versions;

  const _VersionsContent({
    required this.application,
    required this.versions,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;

    if (versions.isEmpty) {
      return _EmptyState(application: application);
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<VersionBloc>().add(
          VersionEvent.loadVersions(applicationId: application.id!),
        );
      },
      child: ListView.builder(
        padding: EdgeInsets.all(padding),
        itemCount: versions.length + 1, // +1 для кнопки
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${versions.length} ${_pluralVersions(versions.length)}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () => _showCreateDialog(context),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Добавить версию'),
                  ),
                ],
              ),
            );
          }

          final version = versions[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: VersionCard(
              version: version,
              applicationId: application.id!,
              onEdit: () => _showEditDialog(context, version),
              onDelete: () => _showDeleteDialog(context, version),
              onRecommendation: version.isLatest
                  ? null
                  : () => _showRecommendationDialog(context, version),
            ),
          );
        },
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final actionBloc = context.read<VersionActionBloc>();
    final repo = context.read<VersionRepository>();
    showDialog(
      context: context,
      builder: (_) => RepositoryProvider.value(
        value: repo,
        child: BlocProvider.value(
          value: actionBloc,
          child: CreateVersionDialog(applicationId: application.id!),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, VersionListItem version) {
    final actionBloc = context.read<VersionActionBloc>();
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: actionBloc,
        child: EditVersionDialog(
          version: version,
          applicationId: application.id!,
        ),
      ),
    );
  }

  void _showRecommendationDialog(
    BuildContext context,
    VersionListItem version,
  ) {
    final actionBloc = context.read<VersionActionBloc>();
    final repo = context.read<VersionRepository>();
    showDialog(
      context: context,
      builder: (_) => RepositoryProvider.value(
        value: repo,
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: actionBloc),
            BlocProvider(
              create: (context) =>
                  VersionDetailBloc(
                    versionRepository: context.read<VersionRepository>(),
                  )..add(
                    VersionDetailEvent.loadDetail(versionId: version.id),
                  ),
            ),
          ],
          child: RecommendationDialog(
            version: version,
            applicationId: application.id!,
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, VersionListItem version) {
    final actionBloc = context.read<VersionActionBloc>();
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: actionBloc,
        child: DeleteVersionDialog(
          version: version,
          applicationId: application.id!,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Пустое состояние
// ──────────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final Application application;

  const _EmptyState({required this.application});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;

    return ListView(
      padding: EdgeInsets.all(padding),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.rocket_launch_outlined,
                  size: 56,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'Версий пока нет',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Создайте первую версию, чтобы начать '
                  'управлять обновлениями приложения.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () {
                    final actionBloc = context.read<VersionActionBloc>();
                    final repo = context.read<VersionRepository>();
                    showDialog(
                      context: context,
                      builder: (_) => RepositoryProvider.value(
                        value: repo,
                        child: BlocProvider.value(
                          value: actionBloc,
                          child: CreateVersionDialog(
                            applicationId: application.id!,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Создать первую версию'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Ошибка
// ──────────────────────────────────────────────────────────────────

class _ErrorState extends StatelessWidget {
  final String message;
  final UuidValue applicationId;

  const _ErrorState({required this.message, required this.applicationId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(message, style: textTheme.bodyLarge),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => context.read<VersionBloc>().add(
              VersionEvent.loadVersions(applicationId: applicationId),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Хелпер
// ──────────────────────────────────────────────────────────────────

String _pluralVersions(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return 'версия';
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
    return 'версии';
  }
  return 'версий';
}
