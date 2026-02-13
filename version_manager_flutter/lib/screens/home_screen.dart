import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_flutter/features/application/presentation/view/applications_screen.dart';
import 'package:version_manager_flutter/features/session/presentation/session_provider.dart';
import 'package:version_manager_flutter/features/team/presentation/view/teams_screen.dart';
import 'package:version_manager_flutter/features/user/presentation/user_provider.dart';
import 'package:version_manager_flutter/features/user/presentation/view/user_screen.dart';
import 'package:version_manager_flutter/screens/dev_ui_kit_screen.dart';
import 'package:version_manager_flutter/shared/widgets/app_navigation_rail.dart';

class HomeScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.themeMode,
    required this.onThemeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _profileIndex = -1;
  int _selectedIndex = 0;

  bool get _isProfileSelected => _selectedIndex == _profileIndex;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onProfileTap() {
    setState(() {
      _selectedIndex = _profileIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final useBottomNav = MediaQuery.sizeOf(context).width < 840;

    return UserProvider(
      child: SessionProvider(
        child: useBottomNav
            ? _MobileScaffold(
                selectedIndex: _selectedIndex == _profileIndex
                    ? 2
                    : _selectedIndex,
                onDestinationSelected: _onDestinationSelected,
              )
            : _DesktopScaffold(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onDestinationSelected,
                isProfileSelected: _isProfileSelected,
                onProfileTap: _onProfileTap,
                themeMode: widget.themeMode,
                onThemeToggle: widget.onThemeToggle,
              ),
      ),
    );
  }
}

/// Мобильная версия с BottomNavigationBar.
class _MobileScaffold extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const _MobileScaffold({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MobileBody(selectedIndex: selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.apps_outlined),
            selectedIcon: Icon(Icons.apps_rounded),
            label: 'Приложения',
          ),
          const NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups_rounded),
            label: 'Команды',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Профиль',
          ),
          if (kDebugMode)
            const NavigationDestination(
              icon: Icon(Icons.palette_outlined),
              selectedIcon: Icon(Icons.palette_rounded),
              label: 'UI Kit',
            ),
        ],
      ),
    );
  }
}

/// Десктопная версия с NavigationRail.
class _DesktopScaffold extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool isProfileSelected;
  final VoidCallback onProfileTap;
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;

  const _DesktopScaffold({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.isProfileSelected,
    required this.onProfileTap,
    required this.themeMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final maxIndex = kDebugMode ? 2 : 1;
    final railIndex = isProfileSelected
        ? null
        : (selectedIndex > maxIndex ? 0 : selectedIndex);

    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(
            selectedIndex: railIndex,
            onDestinationSelected: onDestinationSelected,
            onProfileTap: onProfileTap,
            isProfileSelected: isProfileSelected,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: isProfileSelected
                ? UserScreen(
                    themeMode: themeMode,
                    onThemeToggle: onThemeToggle,
                  )
                : _DesktopBody(
                    selectedIndex: selectedIndex > maxIndex ? 0 : selectedIndex,
                  ),
          ),
        ],
      ),
    );
  }
}

/// Body для мобильной навигации (с вкладкой «Профиль»).
class _MobileBody extends StatelessWidget {
  final int selectedIndex;
  const _MobileBody({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return switch (selectedIndex) {
      0 => const ApplicationsScreen(),
      1 => const TeamsScreen(),
      2 => const UserScreen(),
      3 when kDebugMode => const DevUiKitScreen(),
      _ => const ApplicationsScreen(),
    };
  }
}

/// Body для десктопной навигации (профиль доступен через попап в NavigationRail).
class _DesktopBody extends StatelessWidget {
  final int selectedIndex;
  const _DesktopBody({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return switch (selectedIndex) {
      0 => const ApplicationsScreen(),
      1 => const TeamsScreen(),
      2 when kDebugMode => const DevUiKitScreen(),
      _ => const ApplicationsScreen(),
    };
  }
}
