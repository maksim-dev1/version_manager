import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Диаграмма платформ (donut) + топ устройств — адаптивный layout.
class PlatformStatisticsChart extends StatelessWidget {
  final PlatformStatisticsResponse data;

  const PlatformStatisticsChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    if (isCompact) {
      return Column(
        children: [
          _PlatformDonut(data: data),
          const SizedBox(height: 12),
          _TopDevicesCard(data: data),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _PlatformDonut(data: data)),
        const SizedBox(width: 12),
        Expanded(child: _TopDevicesCard(data: data)),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Platform donut chart
// ---------------------------------------------------------------------------

class _PlatformDonut extends StatefulWidget {
  final PlatformStatisticsResponse data;
  const _PlatformDonut({required this.data});

  @override
  State<_PlatformDonut> createState() => _PlatformDonutState();
}

class _PlatformDonutState extends State<_PlatformDonut> {
  int _touchedIdx = -1;

  static const _colors = [
    Color(0xFF5C6BC0),
    Color(0xFF26A69A),
    Color(0xFFEF5350),
    Color(0xFFFFA726),
    Color(0xFF8D6E63),
    Color(0xFFAB47BC),
  ];

  String _platformLabel(PlatformType p) {
    switch (p) {
      case PlatformType.ios:
        return 'iOS';
      case PlatformType.android:
        return 'Android';
      case PlatformType.windows:
        return 'Windows';
      case PlatformType.macos:
        return 'macOS';
      case PlatformType.linux:
        return 'Linux';
      case PlatformType.web:
        return 'Web';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final platforms = widget.data.platforms;

    if (platforms.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'Нет данных по платформам',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    final sections = <PieChartSectionData>[
      for (int i = 0; i < platforms.length; i++)
        PieChartSectionData(
          value: platforms[i].userCount.toDouble(),
          color: _colors[i % _colors.length],
          radius: _touchedIdx == i ? 64.0 : 52.0,
          showTitle: platforms[i].percentage >= 15,
          title: platforms[i].percentage >= 15
              ? '${platforms[i].percentage.toStringAsFixed(0)}%'
              : '',
          titleStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.9),
          ),
          borderSide: _touchedIdx == i
              ? BorderSide(
                  color: _colors[i % _colors.length].withValues(alpha: 0.5),
                  width: 2,
                )
              : BorderSide.none,
        ),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Платформы',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sections: sections,
                      pieTouchData: PieTouchData(
                        mouseCursorResolver: (event, response) {
                          return response != null &&
                                  response.touchedSection != null
                              ? SystemMouseCursors.click
                              : SystemMouseCursors.basic;
                        },
                        touchCallback: (event, response) {
                          if (!mounted) return;
                          if (event is FlPointerExitEvent ||
                              response == null ||
                              response.touchedSection == null) {
                            setState(() => _touchedIdx = -1);
                          } else {
                            setState(
                              () => _touchedIdx =
                                  response.touchedSection!.touchedSectionIndex,
                            );
                          }
                        },
                      ),
                      centerSpaceRadius: 46,
                      sectionsSpace: 2.5,
                    ),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutCubic,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                for (int i = 0; i < platforms.length; i++)
                  _LegendChip(
                    color: _colors[i % _colors.length],
                    label: _platformLabel(platforms[i].platform),
                    value: '${platforms[i].percentage.toStringAsFixed(1)}%',
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    isActive: _touchedIdx == i,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Legend chip
// ---------------------------------------------------------------------------

class _LegendChip extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final bool isActive;

  const _LegendChip({
    required this.color,
    required this.label,
    required this.value,
    required this.textTheme,
    required this.colorScheme,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? color.withValues(alpha: 0.12)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? color : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Top devices card
// ---------------------------------------------------------------------------

class _TopDevicesCard extends StatelessWidget {
  final PlatformStatisticsResponse data;
  const _TopDevicesCard({required this.data});

  static const _platformColors = {
    'ios': Color(0xFF5C6BC0),
    'android': Color(0xFF26A69A),
    'windows': Color(0xFFEF5350),
    'macos': Color(0xFFEF5350),
    'linux': Color(0xFFFFA726),
    'web': Color(0xFF8D6E63),
  };

  Color _colorFor(PlatformType p) =>
      _platformColors[p.name.toLowerCase()] ?? const Color(0xFF78909C);

  IconData _iconFor(PlatformType p) {
    switch (p) {
      case PlatformType.ios:
        return Icons.phone_iphone_rounded;
      case PlatformType.android:
        return Icons.android_rounded;
      case PlatformType.windows:
        return Icons.window_rounded;
      case PlatformType.macos:
        return Icons.laptop_mac_rounded;
      case PlatformType.linux:
        return Icons.computer_rounded;
      case PlatformType.web:
        return Icons.language_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final devices = data.topDeviceModels.take(8).toList();

    if (devices.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'Нет данных по устройствам',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    final maxCount = devices.first.userCount;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Топ устройств',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            for (final device in devices) ...[
              _DeviceRow(
                device: device,
                maxCount: maxCount,
                color: _colorFor(device.platform),
                icon: _iconFor(device.platform),
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeviceRow extends StatelessWidget {
  final DeviceModelStatisticsEntry device;
  final int maxCount;
  final Color color;
  final IconData icon;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _DeviceRow({
    required this.device,
    required this.maxCount,
    required this.color,
    required this.icon,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final fraction = maxCount > 0 ? device.userCount / maxCount : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                device.deviceModel,
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${device.percentage.toStringAsFixed(1)}%',
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 5,
            backgroundColor: colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.6,
            ),
            valueColor: AlwaysStoppedAnimation<Color>(
              color.withValues(alpha: 0.75),
            ),
          ),
        ),
      ],
    );
  }
}
