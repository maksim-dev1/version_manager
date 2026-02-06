import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

class ProfileHeader extends StatelessWidget {
  final UserPublic user;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const ProfileHeader({
    super.key,
    required this.user,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final displayName =
        user.displayName ??
        [user.firstName, user.lastName].whereType<String>().join(' ');
    final initials = _getInitials(displayName, user.email);

    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: colorScheme.primaryContainer,
          backgroundImage: user.avatarUrl != null
              ? NetworkImage(user.avatarUrl!)
              : null,
          child: user.avatarUrl == null
              ? Text(
                  initials,
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          displayName.isNotEmpty ? displayName : user.email,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  String _getInitials(String displayName, String email) {
    if (displayName.isNotEmpty) {
      final parts = displayName.trim().split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return parts[0][0].toUpperCase();
    }
    return email[0].toUpperCase();
  }
}
