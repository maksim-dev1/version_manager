import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';

/// Диалог подтверждения удаления версии.
class DeleteVersionDialog extends StatelessWidget {
  final VersionListItem version;
  final UuidValue applicationId;

  const DeleteVersionDialog({
    super.key,
    required this.version,
    required this.applicationId,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error),
          const SizedBox(width: 8),
          const Expanded(child: Text('Удалить версию')),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: textTheme.bodyMedium,
                children: [
                  const TextSpan(
                    text: 'Вы уверены, что хотите удалить версию ',
                  ),
                  TextSpan(
                    text: 'v${version.versionNumber}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' (сборка #${version.buildNumber})',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  const TextSpan(text: '?'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Это действие необратимо!',
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Будут удалены все связанные '
                    'логи и данные статистики.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                  if (version.recommendedVersionNumber != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Эта версия рекомендует обновление на '
                      'v${version.recommendedVersionNumber}. '
                      'Рекомендация будет утеряна.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (version.activeUsersCount > 0) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 16,
                      color: colorScheme.tertiary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'У этой версии ${version.activeUsersCount} '
                        '${_pluralUsers(version.activeUsersCount)}.',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
          ),
          onPressed: () {
            Navigator.pop(context);
            context.read<VersionActionBloc>().add(
              VersionActionEvent.deleteVersion(
                versionId: version.id,
              ),
            );
          },
          child: const Text('Удалить'),
        ),
      ],
    );
  }
}

String _pluralUsers(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return 'активный пользователь';
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
    return 'активных пользователя';
  }
  return 'активных пользователей';
}
