import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart';
import 'package:version_manager_flutter/features/session/presentation/view/ui/terminate_dialog.dart';

IconData _getDeviceIcon(SessionInfo session) {
  final info = (session.deviceInfo ?? '').toLowerCase();
  if (info.contains('iphone') || info.contains('android')) {
    return Icons.smartphone;
  }
  if (info.contains('ipad') || info.contains('tablet')) {
    return Icons.tablet;
  }
  return Icons.computer;
}

String _formatRelativeTime(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inMinutes < 1) return 'Только что';
  if (diff.inMinutes < 60) return '${diff.inMinutes} мин назад';
  if (diff.inHours < 24) return '${diff.inHours} ч назад';
  if (diff.inDays < 7) return '${diff.inDays} дн назад';
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  return '$day.$month.${date.year}';
}

class SessionCard extends StatelessWidget {
  final SessionInfo session;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const SessionCard({
    super.key,
    required this.session,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isCurrent = session.isCurrent;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isCurrent
            ? BorderSide(color: colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getDeviceIcon(session),
                  color: isCurrent
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              session.deviceInfo ?? 'Неизвестное устройство',
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isCurrent)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Текущая',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      if (session.userAgent != null)
                        Text(
                          session.userAgent!,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (!isCurrent)
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: colorScheme.error,
                    ),
                    tooltip: 'Завершить сессию',
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: context.read<SessionBloc>(),
                        child: TerminateDialog(session: session),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                if (session.ipAddress != null)
                  _DetailChip(
                    icon: Icons.language,
                    label: session.ipAddress!,
                    colorScheme: colorScheme,
                  ),
                if (session.city != null || session.country != null)
                  _DetailChip(
                    icon: Icons.location_on_outlined,
                    label: [
                      session.city,
                      session.country,
                    ].whereType<String>().join(', '),
                    colorScheme: colorScheme,
                  ),
                if (session.lastActivityAt != null)
                  _DetailChip(
                    icon: Icons.access_time,
                    label: _formatRelativeTime(session.lastActivityAt!),
                    colorScheme: colorScheme,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;

  const _DetailChip({
    required this.icon,
    required this.label,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
