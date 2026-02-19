import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Линейный график adoption timeline по версиям.
class VersionAdoptionTimelineChart extends StatelessWidget {
  final VersionStatisticsResponse data;

  const VersionAdoptionTimelineChart({super.key, required this.data});

  static const _lineColors = [
    Color(0xFF0984E3),
    Color(0xFF6C5CE7),
    Color(0xFF27AE60),
    Color(0xFFF39C12),
    Color(0xFFE74C3C),
    Color(0xFF3498DB),
    Color(0xFF9B59B6),
    Color(0xFF1ABC9C),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (data.adoptionTimeline.isEmpty) {
      return const SizedBox.shrink();
    }

    // Group by version
    final byVersion = <String, List<VersionAdoptionTimelineEntry>>{};
    for (final entry in data.adoptionTimeline) {
      final key = entry.versionNumber;
      byVersion.putIfAbsent(key, () => []).add(entry);
    }

    // Collect all unique dates, sorted
    final allDates = data.adoptionTimeline.map((e) => e.date).toSet().toList()
      ..sort();

    if (allDates.length < 2) return const SizedBox.shrink();

    final dateIndex = <DateTime, int>{};
    final dateLabels = <int, String>{};
    for (int i = 0; i < allDates.length; i++) {
      dateIndex[allDates[i]] = i;
      dateLabels[i] =
          '${allDates[i].day.toString().padLeft(2, '0')}.${allDates[i].month.toString().padLeft(2, '0')}';
    }

    final versionKeys = byVersion.keys.toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.timeline,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Adoption timeline',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: versionKeys.asMap().entries.map((e) {
                return _LegendItem(
                  color: _lineColors[e.key % _lineColors.length],
                  label: 'v${e.value}',
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: colorScheme.outlineVariant,
                      strokeWidth: 0.5,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value == meta.max) return const SizedBox.shrink();
                          return Text(
                            '${value.toInt()}%',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: allDates.length > 14
                            ? (allDates.length / 7).ceilToDouble()
                            : 1,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (!dateLabels.containsKey(idx)) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              dateLabels[idx]!,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 9,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (allDates.length - 1).toDouble(),
                  minY: 0,
                  maxY: 105,
                  lineBarsData: versionKeys.asMap().entries.map((e) {
                    final versionEntries = byVersion[e.value]!;
                    final spots =
                        versionEntries
                            .where((ve) => dateIndex.containsKey(ve.date))
                            .map(
                              (ve) => FlSpot(
                                dateIndex[ve.date]!.toDouble(),
                                ve.percentage,
                              ),
                            )
                            .toList()
                          ..sort((a, b) => a.x.compareTo(b.x));

                    return LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      curveSmoothness: 0.2,
                      color: _lineColors[e.key % _lineColors.length],
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                    );
                  }).toList(),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => colorScheme.inverseSurface,
                      getTooltipItems: (spots) => spots.map((spot) {
                        final versionName = versionKeys[spot.barIndex];
                        return LineTooltipItem(
                          'v$versionName: ${spot.y.toStringAsFixed(1)}%',
                          TextStyle(
                            color: colorScheme.onInverseSurface,
                            fontSize: 12,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
