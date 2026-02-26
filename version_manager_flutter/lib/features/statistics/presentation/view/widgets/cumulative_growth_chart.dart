import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Линейный график кумулятивного роста пользователей.
class CumulativeGrowthChart extends StatelessWidget {
  final DailyActiveUsersResponse data;

  const CumulativeGrowthChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (data.cumulativeGrowth.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'Нет данных о росте',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    final entries = List<CumulativeUsersEntry>.from(data.cumulativeGrowth)
      ..sort((a, b) => a.date.compareTo(b.date));

    final checksSpots = <FlSpot>[];
    final usersSpots = <FlSpot>[];
    final dates = <int, String>{};

    for (int i = 0; i < entries.length; i++) {
      final e = entries[i];
      checksSpots.add(FlSpot(i.toDouble(), e.totalChecks.toDouble()));
      usersSpots.add(FlSpot(i.toDouble(), e.totalUniqueUsers.toDouble()));
      dates[i] =
          '${e.date.day.toString().padLeft(2, '0')}.${e.date.month.toString().padLeft(2, '0')}';
    }

    final maxY = entries.fold<int>(0, (m, e) {
      final localMax = e.totalChecks > e.totalUniqueUsers
          ? e.totalChecks
          : e.totalUniqueUsers;
      return localMax > m ? localMax : m;
    });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Кумулятивный рост',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              children: [
                _LegendItem(
                  color: colorScheme.primary,
                  label: 'Всего запросов',
                ),
                _LegendItem(
                  color: colorScheme.tertiary,
                  label: 'Уникальных пользователей',
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: maxY > 0
                        ? (maxY / 4).ceilToDouble()
                        : 1,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: colorScheme.outlineVariant,
                      strokeWidth: 0.5,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 44,
                        getTitlesWidget: (value, meta) {
                          if (value == meta.max) return const SizedBox.shrink();
                          return Text(
                            _formatAxisValue(value),
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
                        interval: entries.length > 14
                            ? (entries.length / 7).ceilToDouble()
                            : 1,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (!dates.containsKey(idx)) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              dates[idx]!,
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
                  maxX: (entries.length - 1).toDouble(),
                  minY: 0,
                  maxY: maxY > 0 ? maxY * 1.1 : 10,
                  lineBarsData: [
                    LineChartBarData(
                      spots: checksSpots,
                      isCurved: true,
                      curveSmoothness: 0.25,
                      color: colorScheme.primary,
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: colorScheme.primary.withValues(alpha: 0.08),
                      ),
                    ),
                    LineChartBarData(
                      spots: usersSpots,
                      isCurved: true,
                      curveSmoothness: 0.25,
                      color: colorScheme.tertiary,
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: colorScheme.tertiary.withValues(alpha: 0.08),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => colorScheme.inverseSurface,
                      getTooltipItems: (spots) => spots.map((spot) {
                        final label = spot.barIndex == 0
                            ? 'Запросов'
                            : 'Уникальных';
                        return LineTooltipItem(
                          '$label: ${spot.y.toInt()}',
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

  String _formatAxisValue(double value) {
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
    return value.toInt().toString();
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
