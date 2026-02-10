import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserPublic user;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const ProfileInfoCard({
    super.key,
    required this.user,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Личная информация',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _InfoRow(
              icon: Icons.email_outlined,
              label: 'Email',
              value: user.email,
              colorScheme: colorScheme,
            ),
            Builder(
              builder: (context) {
                if (user.firstName == null) return const SizedBox.shrink();
                return Column(
                  children: [
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.person_outlined,
                      label: 'Имя',
                      value: user.firstName!,
                      colorScheme: colorScheme,
                    ),
                  ],
                );
              },
            ),
            Builder(
              builder: (context) {
                if (user.lastName == null) return const SizedBox.shrink();
                return Column(
                  children: [
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.person_outlined,
                      label: 'Фамилия',
                      value: user.lastName!,
                      colorScheme: colorScheme,
                    ),
                  ],
                );
              },
            ),
            Builder(
              builder: (context) {
                if (user.displayName == null) return const SizedBox.shrink();
                return Column(
                  children: [
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.badge_outlined,
                      label: 'Отображаемое имя',
                      value: user.displayName!,
                      colorScheme: colorScheme,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
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
