import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/user/presentation/bloc/user_profile/user_profile_bloc.dart';

class AppNavigationRail extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final VoidCallback onProfileTap;
  final bool isProfileSelected;

  const AppNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.onProfileTap,
    this.isProfileSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NavigationRail(
      backgroundColor: colorScheme.surfaceContainerLow,
      selectedIndex: isProfileSelected ? null : selectedIndex,
      onDestinationSelected: onDestinationSelected,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            final user = state is UserProfileLoaded ? state.user : null;
            return _ProfileAvatar(
              user: user,
              colorScheme: colorScheme,
              isSelected: isProfileSelected,
              onTap: onProfileTap,
            );
          },
        ),
      ),
      trailing: const Expanded(child: SizedBox.shrink()),
      destinations: [
        const NavigationRailDestination(
          icon: Icon(Icons.apps_outlined),
          selectedIcon: Icon(Icons.apps_rounded),
          label: Text('Приложения'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.groups_outlined),
          selectedIcon: Icon(Icons.groups_rounded),
          label: Text('Команды'),
        ),
        if (kDebugMode)
          const NavigationRailDestination(
            icon: Icon(Icons.palette_outlined),
            selectedIcon: Icon(Icons.palette_rounded),
            label: Text('UI Kit'),
          ),
      ],
    );
  }
}

/// Аватар профиля в leading NavigationRail.
class _ProfileAvatar extends StatelessWidget {
  final UserPublic? user;
  final ColorScheme colorScheme;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileAvatar({
    required this.user,
    required this.colorScheme,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    String initials;
    if (user != null) {
      final displayName =
          user!.displayName ??
          [user!.firstName, user!.lastName].whereType<String>().join(' ');
      initials = _getInitials(displayName, user!.email);
    } else {
      initials = '?';
    }

    return Tooltip(
      message: 'Профиль',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: colorScheme.primary, width: 2)
                : null,
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colorScheme.primaryContainer,
            backgroundImage: user?.avatarUrl != null
                ? NetworkImage(user!.avatarUrl!)
                : null,
            child: user?.avatarUrl == null
                ? Text(
                    initials,
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
          ),
        ),
      ),
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
