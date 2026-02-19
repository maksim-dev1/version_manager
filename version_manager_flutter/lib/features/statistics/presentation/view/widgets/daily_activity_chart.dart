import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// График активности по дням. При выборе периода «Сегодня» (1 запись)
/// переключается в почасовой режим на основе данных тепловой карты.
class DailyActivityChart extends StatelessWidget {
  final DailyActiveUsersResponse data;

  /// Данные тепловой карты (используются для почасового режима).
  final TimeAnalyticsResponse? timeData;

  const DailyActivityChart({
    super.key,
    required this.data,
    this.timeData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (data.entries.isEmpty) {
      return _EmptyChart(message: 'Нет данных об активности');
    }

    final entries = List<DailyActiveUsersEntry>.from(data.entries)
      ..sort((a, b) => a.date.compareTo(b.date));

    // ── Почасовой режим при выборе «Сегодня» ──────────────────────
    if (entries.length == 1 && timeData != null) {
      return _buildHourlyView(
        colorScheme,
        textTheme,
        entries.first,
        timeData!,
      );
    }

    // ── Многодневный режим ─────────────────────────────────────────
    final avgUsers =
        (entries.fold(0, (s, e) => s + e.totalUsers) / entries.length).round();
    final maxY = entries.fold(0, (m, e) => e.totalUsers > m ? e.totalUsers : m);

    final checksSpots = <FlSpot>[
      for (int i = 0; i < entries.length; i++)
        FlSpot(i.toDouble(), entries[i].totalUsers.toDouble()),
    ];
    final activeSpots = <FlSpot>[
      for (int i = 0; i < entries.length; i++)
        FlSpot(i.toDouble(), entries[i].activeUsers.toDouble()),
    ];

    String fmtDate(int idx) {
      if (idx < 0 || idx >= entries.length) return '';
      final d = entries[idx].date;
      return '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}';
    }

    final n = entries.length;
    final step = n <= 7
        ? 1
        : n <= 14
        ? 2
        : n <= 31
        ? 5
        : (n / 6).ceil();

    final peakIdx = entries.indexWhere((e) => e.totalUsers == maxY);
    final half = (n / 2).ceil().clamp(1, n);
    final firstHalfTotal = entries
        .take(half)
        .fold(0, (s, e) => s + e.totalUsers);
    final lastHalfTotal = entries
        .skip(n - half)
        .fold(0, (s, e) => s + e.totalUsers);
    final trendPct = firstHalfTotal > 0
        ? ((lastHalfTotal - firstHalfTotal) / firstHalfTotal * 100).round()
        : 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (trendPct != 0)
                  _TrendBadge(
                    trendPct: trendPct,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                const Spacer(),
                Text(
                  'Пик ${fmtDate(peakIdx)} — ${_fmt(maxY)}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: maxY > 0 ? (maxY / 4) : 1,
                    getDrawingHorizontalLine: (value) {
                      final isAvg = (value - avgUsers).abs() < (maxY / 8);
                      return FlLine(
                        color: isAvg
                            ? colorScheme.primary.withValues(alpha: 0.25)
                            : colorScheme.outlineVariant.withValues(
                                alpha: 0.25,
                              ),
                        strokeWidth: isAvg ? 1.2 : 0.6,
                        dashArray: isAvg ? [6, 4] : null,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (n - 1).toDouble(),
                  minY: 0,
                  maxY: maxY > 0 ? maxY * 1.22 : 10,
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx % step != 0 && idx != n - 1) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              fmtDate(idx),
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => colorScheme.inverseSurface,
                      tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      getTooltipItems: (spots) {
                        return spots.asMap().entries.map((e) {
                          if (e.key != 0) return null;
                          final idx = e.value.x.toInt();
                          final entry = idx < entries.length
                              ? entries[idx]
                              : null;
                          if (entry == null) return null;
                          final prev = idx > 0 ? entries[idx - 1] : null;
                          final delta = prev != null
                              ? entry.totalUsers - prev.totalUsers
                              : 0;
                          final deltaStr = delta == 0
                              ? ''
                              : delta > 0
                              ? '  ↑${_fmt(delta)}'
                              : '  ↓${_fmt(delta.abs())}';
                          return LineTooltipItem(
                            '${fmtDate(idx)}\n'
                            '${_fmt(entry.totalUsers)} пользователей$deltaStr\n'
                            '${_fmt(entry.activeUsers)} акт.  •  ${_fmt(entry.newUsers)} новых',
                            TextStyle(
                              color: colorScheme.onInverseSurface,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: activeSpots,
                      isCurved: true,
                      preventCurveOverShooting: true,
                      curveSmoothness: 0.35,
                      color: colorScheme.tertiary.withValues(alpha: 0.6),
                      barWidth: 1.5,
                      dashArray: [5, 4],
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: checksSpots,
                      isCurved: true,
                      preventCurveOverShooting: true,
                      curveSmoothness: 0.35,
                      color: colorScheme.primary,
                      barWidth: 2.5,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, pct, bar, idx) {
                          final isPeak = idx == peakIdx;
                          if (!isPeak && n > 10) {
                            return FlDotCirclePainter(
                              radius: 0,
                              color: Colors.transparent,
                              strokeWidth: 0,
                              strokeColor: Colors.transparent,
                            );
                          }
                          return FlDotCirclePainter(
                            radius: isPeak ? 5.0 : 3.5,
                            color: isPeak
                                ? colorScheme.primary
                                : colorScheme.surface,
                            strokeWidth: 2,
                            strokeColor: isPeak
                                ? colorScheme.surface
                                : colorScheme.primary,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.6, 1.0],
                          colors: [
                            colorScheme.primary.withValues(alpha: 0.30),
                            colorScheme.primary.withValues(alpha: 0.08),
                            colorScheme.primary.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: avgUsers.toDouble(),
                        color: colorScheme.primary.withValues(alpha: 0.35),
                        strokeWidth: 1,
                        dashArray: [6, 4],
                        label: HorizontalLineLabel(
                          show: true,
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(right: 4, bottom: 2),
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                          labelResolver: (_) => 'ср. ${_fmt(avgUsers)}',
                        ),
                      ),
                    ],
                    verticalLines: [
                      VerticalLine(
                        x: peakIdx.toDouble(),
                        color: colorScheme.primary.withValues(alpha: 0.18),
                        strokeWidth: 1.5,
                        dashArray: [4, 3],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 4,
              children: [
                _LegendItem(
                  color: colorScheme.primary,
                  label: 'Пользователей в день',
                ),
                _LegendItem(
                  color: colorScheme.tertiary,
                  label: 'Активных устройств',
                  dashed: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── Почасовой вид ───────────────────────────────────────────────

  Widget _buildHourlyView(
    ColorScheme colorScheme,
    TextTheme textTheme,
    DailyActiveUsersEntry today,
    TimeAnalyticsResponse timeData,
  ) {
    final todayDow = DateTime.now().weekday; // 1=Пн … 7=Вс

    // Собираем 24 ячейки из тепловой карты для текущего дня недели
    final hourCounts = List.filled(24, 0);
    for (final e in timeData.heatmap) {
      if (e.dayOfWeek == todayDow && e.hour >= 0 && e.hour < 24) {
        hourCounts[e.hour] = e.count;
      }
    }

    final maxCount = hourCounts.reduce((a, b) => a > b ? a : b);

    // Нет почасовых данных — показываем сводку дня
    if (maxCount == 0) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Сегодня',
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _fmt(today.totalUsers),
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'пользователей',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Пиковый час
    int peakHour = 0;
    for (int h = 1; h < 24; h++) {
      if (hourCounts[h] > hourCounts[peakHour]) peakHour = h;
    }

    final barGroups = <BarChartGroupData>[
      for (int h = 0; h < 24; h++)
        BarChartGroupData(
          x: h,
          barRods: [
            BarChartRodData(
              toY: hourCounts[h].toDouble(),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: h == peakHour
                    ? [
                        colorScheme.primary,
                        colorScheme.primary.withValues(alpha: 0.85),
                      ]
                    : [
                        colorScheme.primary.withValues(alpha: 0.55),
                        colorScheme.primary.withValues(alpha: 0.75),
                      ],
              ),
              width: 9,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(3),
              ),
            ),
          ],
        ),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Шапка ────────────────────────────────────────────
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Сегодня · ${_weekdayName(todayDow)}',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${_fmt(today.totalUsers)} польз.',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${_fmt(today.newUsers)} новых',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ── Bar chart ─────────────────────────────────────────
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  maxY: maxCount * 1.25,
                  barGroups: barGroups,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: maxCount > 0
                        ? (maxCount / 4).ceilToDouble()
                        : 1,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.25),
                      strokeWidth: 0.6,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final h = value.toInt();
                          if (h < 0 || h > 23) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              h.toString(),
                              style: textTheme.bodySmall?.copyWith(
                                color: h == peakHour
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant,
                                fontSize: 9,
                                fontWeight: h == peakHour
                                    ? FontWeight.w700
                                    : FontWeight.normal,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => colorScheme.inverseSurface,
                      tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      getTooltipItem: (group, groupIdx, rod, rodIdx) {
                        final h = group.x;
                        final count = rod.toY.toInt();
                        return BarTooltipItem(
                          '${h.toString().padLeft(2, '0')}:00–${(h + 1).toString().padLeft(2, '0')}:00\n'
                          '${_fmt(count)} обращений',
                          TextStyle(
                            color: colorScheme.onInverseSurface,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),

            // ── Пиковый час ───────────────────────────────────────
            Row(
              children: [
                Icon(
                  Icons.schedule_rounded,
                  size: 13,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 5),
                Text(
                  'Пик активности: ${peakHour.toString().padLeft(2, '0')}:00–${(peakHour + 1).toString().padLeft(2, '0')}:00',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String _weekdayName(int dow) {
    const names = [
      '',
      'Понедельник',
      'Вторник',
      'Среда',
      'Четверг',
      'Пятница',
      'Суббота',
      'Воскресенье',
    ];
    return dow >= 1 && dow <= 7 ? names[dow] : '';
  }

  static String _fmt(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toString();
  }
}

// ── Trend badge ───────────────────────────────────────────────────

class _TrendBadge extends StatelessWidget {
  final int trendPct;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _TrendBadge({
    required this.trendPct,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isUp = trendPct > 0;
    final color = isUp ? const Color(0xFF27AE60) : colorScheme.error;
    final label = '${isUp ? '+' : ''}$trendPct%';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isUp ? Icons.trending_up_rounded : Icons.trending_down_rounded,
            size: 13,
            color: color,
          ),
          const SizedBox(width: 3),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Legend item ───────────────────────────────────────────────

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final bool dashed;

  const _LegendItem({
    required this.color,
    required this.label,
    this.dashed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 22,
          height: 12,
          child: CustomPaint(
            painter: _DashLinePainter(color: color, dashed: dashed),
          ),
        ),
        const SizedBox(width: 6),
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

class _DashLinePainter extends CustomPainter {
  final Color color;
  final bool dashed;

  _DashLinePainter({required this.color, required this.dashed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final y = size.height / 2;
    if (dashed) {
      double x = 0;
      while (x < size.width) {
        final end = (x + 4).clamp(0, size.width).toDouble();
        canvas.drawLine(Offset(x, y), Offset(end, y), paint);
        x += 8;
      }
    } else {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_DashLinePainter old) =>
      old.color != color || old.dashed != dashed;
}

// ── Empty state ───────────────────────────────────────────────────

class _EmptyChart extends StatelessWidget {
  final String message;
  const _EmptyChart({required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
