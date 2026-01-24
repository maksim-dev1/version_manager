import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

class PlatformChip extends StatelessWidget {
  final Platform platform;
  final VoidCallback? onDeleted;

  const PlatformChip({
    super.key,
    required this.platform,
    this.onDeleted,
  });

  IconData _getPlatformIcon() {
    return switch (platform) {
      Platform.android => Icons.android_rounded,
      Platform.ios => Icons.apple_rounded,
      Platform.unknown => Icons.question_mark_rounded,
    };
  }

  Color _getPlatformColor(ColorScheme colorScheme) {
    return switch (platform) {
      Platform.android => Colors.green,
      Platform.ios => Colors.blue,
      Platform.unknown => colorScheme.surfaceContainerHighest,
    };
  }

  String _getPlatformLabel() {
    return switch (platform) {
      Platform.android => 'Android',
      Platform.ios => 'iOS',
      Platform.unknown => 'Неизвестно',
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platformColor = _getPlatformColor(colorScheme);

    return Chip(
      avatar: Icon(
        _getPlatformIcon(),
        size: 18,
        color: platformColor,
      ),
      label: Text(_getPlatformLabel()),
      deleteIcon: onDeleted != null ? const Icon(Icons.close, size: 18) : null,
      onDeleted: onDeleted,
      side: BorderSide(color: platformColor.withOpacity(0.3)),
    );
  }
}
