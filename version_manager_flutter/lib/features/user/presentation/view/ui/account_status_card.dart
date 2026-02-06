import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

class AccountStatusCard extends StatelessWidget {
  final UserPublic user;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const AccountStatusCard({
    super.key,
    required this.user,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Статус аккаунта',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _StatusRow(
              label: 'Email подтверждён',
              isActive: user.isEmailVerified,
              colorScheme: colorScheme,
            ),
            const Divider(height: 24),
            _InfoRow(
              icon: Icons.calendar_today_outlined,
              label: 'Дата регистрации',
              value: _formatDate(user.createdAt),
              colorScheme: colorScheme,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day.$month.$year $hour:$minute';
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final bool isActive;
  final ColorScheme colorScheme;

  const _StatusRow({
    required this.label,
    required this.isActive,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isActive ? Icons.check_circle : Icons.cancel,
          size: 20,
          color: isActive ? Colors.green : colorScheme.error,
        ),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(fontSize: 14)),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isActive
                ? Colors.green.withValues(alpha: 0.1)
                : colorScheme.errorContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            isActive ? 'Да' : 'Нет',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.green : colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final ColorScheme colorScheme;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
