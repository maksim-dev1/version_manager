import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNavigationRail extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;

  const AppNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.themeMode,
    required this.onThemeToggle,
  });

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  bool _extended = false;

  IconData _getThemeIcon() {
    return switch (widget.themeMode) {
      ThemeMode.light => Icons.light_mode,
      ThemeMode.dark => Icons.dark_mode,
      ThemeMode.system => Icons.brightness_auto,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NavigationRail(
      extended: _extended,
      backgroundColor: colorScheme.surfaceContainerLow,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      labelType: _extended
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      leading: Column(
        children: [
          const SizedBox(height: 8),
          FloatingActionButton(
            elevation: 0,
            onPressed: () {
              setState(() {
                _extended = !_extended;
              });
            },
            child: Icon(_extended ? Icons.menu_open : Icons.menu),
          ),
          const SizedBox(height: 16),
        ],
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                const SizedBox(height: 8),
                IconButton(
                  icon: Icon(_getThemeIcon()),
                  tooltip: 'Переключить тему',
                  onPressed: widget.onThemeToggle,
                ),
                if (_extended)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      widget.themeMode == ThemeMode.dark ? 'Тёмная' : 'Светлая',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      destinations: [
        const NavigationRailDestination(
          icon: Icon(Icons.groups_outlined),
          selectedIcon: Icon(Icons.groups_rounded),
          label: Text('Команды'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.apps_outlined),
          selectedIcon: Icon(Icons.apps_rounded),
          label: Text('Приложения'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.person_outlined),
          selectedIcon: Icon(Icons.person_rounded),
          label: Text('Профиль'),
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
