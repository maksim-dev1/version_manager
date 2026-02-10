import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_flutter/features/application/presentation/view/applications_screen.dart';
import 'package:version_manager_flutter/features/team/presentation/view/teams_screen.dart';
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
  int _selectedIndex = 0;

  Widget _buildBody() {
    return switch (_selectedIndex) {
      0 => const TeamsScreen(),
      1 => const ApplicationsScreen(),
      2 => const UserScreen(),
      3 when kDebugMode => const DevUiKitScreen(),
      _ => const TeamsScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final useBottomNav = MediaQuery.sizeOf(context).width < 840;

    if (useBottomNav) {
      return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.groups_outlined),
              selectedIcon: Icon(Icons.groups_rounded),
              label: 'Команды',
            ),
            const NavigationDestination(
              icon: Icon(Icons.apps_outlined),
              selectedIcon: Icon(Icons.apps_rounded),
              label: 'Приложения',
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

    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            themeMode: widget.themeMode,
            onThemeToggle: widget.onThemeToggle,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }
}
