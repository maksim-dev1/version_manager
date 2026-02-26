import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/presentation/bloc/version_bloc.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';
import 'package:version_manager_flutter/shared/widgets/user_visible_field_banner.dart';

/// Карточка версии в списке.
class VersionCard extends StatelessWidget {
  final VersionListItem version;
  final UuidValue applicationId;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback? onRecommendation;

  const VersionCard({
    super.key,
    required this.version,
    required this.applicationId,
    required this.onEdit,
    required this.onDelete,
    this.onRecommendation,
  });

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
            // ── Верхняя строка: версия + статус + действия ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'v${version.versionNumber}',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceBright,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '+${version.buildNumber}',
                              style: textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          if (version.isLatest) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Новейшая',
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      _VersionStatusBadge(version: version),
                    ],
                  ),
                ),
                // Действия
                if (!isCompact) ...[
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit,
                      semanticLabel: 'Редактировать версию',
                    ),
                    color: colorScheme.primary,
                    tooltip: 'Редактировать',
                    visualDensity: VisualDensity.compact,
                  ),
                  if (!version.isLatest) ...[
                    IconButton(
                      onPressed: onRecommendation,
                      icon: const Icon(
                        Icons.star,
                        semanticLabel: 'Сделать рекомендацией',
                      ),
                      color: colorScheme.tertiary,
                      tooltip: 'Рекомендация',
                      visualDensity: VisualDensity.compact,
                    ),
                    _BlockToggleButton(
                      version: version,
                      applicationId: applicationId,
                    ),
                  ],
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete_forever,
                      semanticLabel: 'Удалить версию',
                    ),
                    color: version.isLatest
                        ? colorScheme.error.withValues(alpha: 0.55)
                        : colorScheme.error,
                    tooltip: version.isLatest
                        ? 'Удалить (актуальная версия)'
                        : 'Удалить',
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),

            // ── Changelog ──
            Text(
              version.changelog,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // ── Нижняя строка: дата + пользователи ──
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 14,
                  semanticLabel: 'Дата создания',
                ),
                const SizedBox(width: 4),
                Text(
                  _formatDate(version.createdAt),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.people,
                  size: 14,
                  semanticLabel: 'Уникальные пользователи',
                ),
                const SizedBox(width: 4),
                Text(
                  '${version.activeUsersCount} ${_pluralUsers(version.activeUsersCount)}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            // ── Мобильные действия ──
            if (isCompact) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (!version.isLatest) ...[
                    _BlockToggleButton(
                      version: version,
                      applicationId: applicationId,
                    ),
                    OutlinedButton.icon(
                      onPressed: onRecommendation,
                      icon: const Icon(
                        Icons.star,
                        size: 16,
                        semanticLabel: 'Рекомендация',
                      ),
                      label: const Text('Рекомендация'),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                  OutlinedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit,
                      size: 16,
                      semanticLabel: 'Редактировать',
                    ),
                    label: const Text('Изменить'),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete_forever,
                      size: 16,
                      color: colorScheme.error.withValues(
                        alpha: version.isLatest ? 0.55 : 1.0,
                      ),
                      semanticLabel: 'Удалить',
                    ),
                    label: Text(
                      'Удалить',
                      style: TextStyle(
                        color: colorScheme.error.withValues(
                          alpha: version.isLatest ? 0.55 : 1.0,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: colorScheme.error.withValues(
                          alpha: version.isLatest ? 0.4 : 1.0,
                        ),
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Бейдж статуса
// ──────────────────────────────────────────────────────────────────

class _VersionStatusBadge extends StatelessWidget {
  final VersionListItem version;

  const _VersionStatusBadge({required this.version});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (version.isBlocked) {
      return _Badge(
        icon: Icons.block,
        label: 'Заблокирована',
        color: colorScheme.error,
        backgroundColor: colorScheme.errorContainer.withValues(alpha: 0.3),
      );
    }

    if (version.recommendedVersionNumber != null) {
      return _Badge(
        icon: Icons.star,
        label: 'Рекомендуется: ${version.recommendedVersionNumber}',
        color: colorScheme.tertiary,
        backgroundColor: colorScheme.tertiaryContainer.withValues(alpha: 0.3),
      );
    }

    return _Badge(
      icon: Icons.check_circle,
      label: 'Активна',
      color: Colors.green,
      backgroundColor: Colors.green.withValues(alpha: 0.15),
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color backgroundColor;

  const _Badge({
    required this.icon,
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Кнопка быстрой блокировки
// ──────────────────────────────────────────────────────────────────

class _BlockToggleButton extends StatelessWidget {
  final VersionListItem version;
  final UuidValue applicationId;

  const _BlockToggleButton({
    required this.version,
    required this.applicationId,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (version.isBlocked) {
      return IconButton(
        onPressed: () {
          context.read<VersionBloc>().add(
            VersionEvent.toggleVersionBlock(
              versionId: version.id,
              isBlocked: false,
              applicationId: applicationId,
            ),
          );
        },
        icon: const Icon(Icons.lock_open, semanticLabel: 'Разблокировать'),
        color: colorScheme.primary,
        tooltip: 'Разблокировать',
        visualDensity: VisualDensity.compact,
      );
    }

    return IconButton(
      onPressed: () => _showBlockReasonDialog(context),
      icon: const Icon(Icons.lock, semanticLabel: 'Заблокировать'),
      color: colorScheme.onSurfaceVariant,
      tooltip: 'Заблокировать',
      visualDensity: VisualDensity.compact,
    );
  }

  void _showBlockReasonDialog(BuildContext context) {
    final controller = TextEditingController();
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = context.read<VersionBloc>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: colorScheme.error),
            const SizedBox(width: 8),
            const Expanded(child: Text('Заблокировать версию')),
          ],
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Версия v${version.versionNumber} будет заблокирована. '
                'Укажите причину блокировки.',
              ),
              const SizedBox(height: 16),
              const UserVisibleFieldBanner(
                message:
                    'Причина блокировки будет показана пользователям при попытке запустить эту версию',
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Причина блокировки',
                  hintText: 'Минимум 10 символов',
                ),
                maxLines: 3,
                maxLength: 500,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Отмена'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
            ),
            onPressed: () {
              final reason = controller.text.trim();
              if (reason.length < 10) {
                NotificationService.showError(
                  dialogContext,
                  'Причина блокировки должна содержать минимум 10 символов',
                );
                return;
              }
              Navigator.pop(dialogContext);
              bloc.add(
                VersionEvent.toggleVersionBlock(
                  versionId: version.id,
                  isBlocked: true,
                  blockReason: reason,
                  applicationId: applicationId,
                ),
              );
            },
            child: const Text('Заблокировать'),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Хелперы
// ──────────────────────────────────────────────────────────────────

String _formatDate(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  return '$day.$month.${date.year}';
}

String _pluralUsers(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return 'пользователь';
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
    return 'пользователя';
  }
  return 'пользователей';
}
