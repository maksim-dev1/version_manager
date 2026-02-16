import 'package:flutter/material.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';
import 'package:version_manager_flutter/theme/snow_ui/snow_spacing.dart';

/// Экран UI Kit — доступен только в debug-режиме.
///
/// Показывает все компоненты дизайн-системы SnowUI:
/// типографику, кнопки, поля ввода, цвета, переключатели и т.д.
class DevUiKitScreen extends StatelessWidget {
  const DevUiKitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Kit (Dev)'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SnowSpacing.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text('Version Manager', style: textTheme.displayMedium),
            const SizedBox(height: SnowSpacing.spacing8),
            Text(
              'Powered by SnowUI Design System',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Typography Section
            Text('Typography', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Display Large', style: textTheme.displayLarge),
                    const SizedBox(height: SnowSpacing.spacing8),
                    Text('Headline Medium', style: textTheme.headlineMedium),
                    const SizedBox(height: SnowSpacing.spacing8),
                    Text('Title Large', style: textTheme.titleLarge),
                    const SizedBox(height: SnowSpacing.spacing8),
                    Text('Body Large', style: textTheme.bodyLarge),
                    const SizedBox(height: SnowSpacing.spacing8),
                    Text('Label Medium', style: textTheme.labelMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Buttons Section
            Text('Buttons', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text('Filled Button'),
                    ),
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('With Icon'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Elevated Button'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Outlined Button'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Text Button'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Input Fields Section
            Text('Input Fields', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Label',
                        hintText: 'Enter text...',
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: SnowSpacing.spacing16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'With suffix',
                        suffixIcon: const Icon(Icons.visibility_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Colors Section
            Text('Colors', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Column(
                  children: [
                    _ColorRow(
                      name: 'Primary',
                      color: colorScheme.primary,
                      onColor: colorScheme.onPrimary,
                    ),
                    const SizedBox(height: SnowSpacing.spacing8),
                    _ColorRow(
                      name: 'Secondary',
                      color: colorScheme.secondary,
                      onColor: colorScheme.onSecondary,
                    ),
                    const SizedBox(height: SnowSpacing.spacing8),
                    _ColorRow(
                      name: 'Tertiary',
                      color: colorScheme.tertiary,
                      onColor: colorScheme.onTertiary,
                    ),
                    const SizedBox(height: SnowSpacing.spacing8),
                    _ColorRow(
                      name: 'Error',
                      color: colorScheme.error,
                      onColor: colorScheme.onError,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Switches & Checkboxes Section
            Text('Switches & Checkboxes', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Enable notifications'),
                      subtitle: const Text(
                        'Receive updates about new versions',
                      ),
                      value: true,
                      onChanged: (value) {},
                    ),
                    CheckboxListTile(
                      title: const Text('Auto-update'),
                      subtitle: const Text('Automatically download updates'),
                      value: false,
                      onChanged: (value) {},
                    ),
                    RadioListTile<String>(
                      title: const Text('Daily'),
                      value: 'daily',
                      groupValue: 'daily',
                      onChanged: (value) {},
                    ),
                    RadioListTile<String>(
                      title: const Text('Weekly'),
                      value: 'weekly',
                      groupValue: 'daily',
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Progress Indicators Section
            Text('Progress & Loading', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Linear Progress', style: textTheme.bodyMedium),
                    const SizedBox(height: SnowSpacing.spacing8),
                    const LinearProgressIndicator(value: 0.7),
                    const SizedBox(height: SnowSpacing.spacing16),
                    Text('Circular Progress', style: textTheme.bodyMedium),
                    const SizedBox(height: SnowSpacing.spacing8),
                    Row(
                      children: [
                        const CircularProgressIndicator(value: 0.7),
                        const SizedBox(width: SnowSpacing.spacing24),
                        CircularProgressIndicator(
                          value: 0.7,
                          backgroundColor: colorScheme.surfaceContainerHighest,
                        ),
                      ],
                    ),
                    const SizedBox(height: SnowSpacing.spacing16),
                    Text('Slider', style: textTheme.bodyMedium),
                    const SizedBox(height: SnowSpacing.spacing8),
                    Slider(
                      value: 0.7,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Chips Section
            Text('Chips & Tags', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Wrap(
                  spacing: SnowSpacing.spacing8,
                  runSpacing: SnowSpacing.spacing8,
                  children: [
                    Chip(label: const Text('Default')),
                    Chip(
                      label: const Text('With Icon'),
                      avatar: const Icon(Icons.check_circle, size: 18),
                    ),
                    Chip(
                      label: const Text('Deletable'),
                      onDeleted: () {},
                    ),
                    ActionChip(
                      label: const Text('Action'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Cards & Lists Section
            Text('Cards & Lists', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      child: Icon(
                        Icons.apps,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    title: const Text('My App Android'),
                    subtitle: const Text('Version 1.5.0'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.secondaryContainer,
                      child: Icon(
                        Icons.apple,
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                    title: const Text('My App iOS'),
                    subtitle: const Text('Version 1.4.2'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Badges & Icons Section
            Text('Badges & Icons', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Wrap(
                  spacing: SnowSpacing.spacing24,
                  runSpacing: SnowSpacing.spacing24,
                  children: [
                    Badge(
                      label: const Text('3'),
                      child: Icon(Icons.notifications_outlined, size: 32),
                    ),
                    Badge(
                      label: const Text('99+'),
                      child: Icon(Icons.mail_outlined, size: 32),
                    ),
                    Badge.count(
                      count: 5,
                      child: Icon(Icons.chat_bubble_outline, size: 32),
                    ),
                    Badge(
                      child: Icon(Icons.favorite_outlined, size: 32),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Dialogs & Alerts Section
            Text('Dialogs & Alerts', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Wrap(
                  spacing: SnowSpacing.spacing12,
                  runSpacing: SnowSpacing.spacing12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _showDialog(context),
                      icon: const Icon(Icons.info_outline),
                      label: const Text('Show Dialog'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _showSnackBar(context),
                      icon: const Icon(Icons.message),
                      label: const Text('Show Snackbar'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _showBottomSheet(context),
                      icon: const Icon(Icons.vertical_align_bottom),
                      label: const Text('Show Bottom Sheet'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing32),

            // Date & Time Section
            Text('Date & Time Pickers', style: textTheme.headlineMedium),
            const SizedBox(height: SnowSpacing.spacing16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SnowSpacing.spacing20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Pick Date'),
                    ),
                    const SizedBox(height: SnowSpacing.spacing12),
                    OutlinedButton.icon(
                      onPressed: () async {
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                      icon: const Icon(Icons.access_time),
                      label: const Text('Pick Time'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SnowSpacing.spacing48),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert Dialog'),
        content: const Text('This is a sample dialog with SnowUI theming.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    NotificationService.showInfo(
      context,
      'This is a notification message',
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(SnowSpacing.spacing24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bottom Sheet',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: SnowSpacing.spacing16),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Copy link'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: SnowSpacing.spacing16),
          ],
        ),
      ),
    );
  }
}

/// Строка палитры цветов.
class _ColorRow extends StatelessWidget {
  final String name;
  final Color color;
  final Color onColor;

  const _ColorRow({
    required this.name,
    required this.color,
    required this.onColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name)),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          child: Center(
            child: Text(
              'Aa',
              style: TextStyle(
                color: onColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
