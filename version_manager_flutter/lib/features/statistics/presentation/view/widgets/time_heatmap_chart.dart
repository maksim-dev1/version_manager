import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Тепловая карта активности: день недели × час суток.
class TimeHeatmapChart extends StatelessWidget {
  final TimeAnalyticsResponse data;

  const TimeHeatmapChart({super.key, required this.data});

  static const _dayLabels = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  static const _dayFullLabels = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  // Cell width including horizontal margin (24 + 2*1.5 = 27)
  static const double _cellW = 27.0;
  static const double _cellH = 22.0;
  static const double _dayLabelW = 28.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (data.heatmap.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'Нет данных для тепловой карты',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    // Build 7×24 matrix — сервер хранит UTC, конвертируем в локальное время
    final matrix = List.generate(7, (_) => List.filled(24, 0));
    final tzOffsetMinutes = DateTime.now().timeZoneOffset.inMinutes;
    for (final entry in data.heatmap) {
      final utcDayIdx = entry.dayOfWeek - 1;
      if (utcDayIdx < 0 || utcDayIdx >= 7 || entry.hour < 0 || entry.hour >= 24)
        continue;
      final utcMinutes = utcDayIdx * 24 * 60 + entry.hour * 60;
      final localMinutes = utcMinutes + tzOffsetMinutes;
      final localDayIdx = ((localMinutes ~/ (24 * 60)) % 7 + 7) % 7;
      final localHour = ((localMinutes ~/ 60) % 24 + 24) % 24;
      matrix[localDayIdx][localHour] += entry.count;
    }
    int maxCount = 0;
    for (final row in matrix) {
      for (final v in row) {
        if (v > maxCount) maxCount = v;
      }
    }

    // Peak day and peak hour
    final dayTotals = List.generate(7, (d) {
      return List.generate(24, (h) => matrix[d][h]).fold(0, (a, b) => a + b);
    });
    final hourTotals = List.generate(24, (h) {
      return List.generate(7, (d) => matrix[d][h]).fold(0, (a, b) => a + b);
    });
    final maxDay = dayTotals.reduce((a, b) => a > b ? a : b);
    final maxHour = hourTotals.reduce((a, b) => a > b ? a : b);
    final peakDayIdx = dayTotals.indexOf(maxDay);
    final peakHourIdx = hourTotals.indexOf(maxHour);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Title ─────────────────────────────────────
            Text(
              'Когда активны пользователи',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'Чем ярче клетка — тем больше проверок в этот час',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 11,
              ),
            ),

            // ── Peak summary chips ─────────────────────────
            if (maxCount > 0) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _PeakChip(
                    icon: Icons.calendar_today_rounded,
                    label: 'Самый активный день',
                    value: _dayFullLabels[peakDayIdx],
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                  _PeakChip(
                    icon: Icons.access_time_rounded,
                    label: 'Самый активный час',
                    value:
                        '${peakHourIdx.toString().padLeft(2, '0')}:00–'
                        '${(peakHourIdx + 1).toString().padLeft(2, '0')}:00',
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),

            // ── Grid ──────────────────────────────────────
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Time-of-day section labels
                  _TimeSectionRow(
                    dayLabelW: _dayLabelW,
                    cellW: _cellW,
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 2),
                  // Hour axis (every 3 hours)
                  _HourAxisRow(
                    dayLabelW: _dayLabelW,
                    cellW: _cellW,
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 4),
                  // Day rows
                  for (int d = 0; d < 7; d++) ...[
                    if (d == 5) const SizedBox(height: 4),
                    _HeatRow(
                      dayLabel: _dayLabels[d],
                      dayFullLabel: _dayFullLabels[d],
                      hours: matrix[d],
                      maxCount: maxCount,
                      dayLabelW: _dayLabelW,
                      cellW: _cellW,
                      cellH: _cellH,
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                      isPeakDay: d == peakDayIdx,
                      isCurrentDay: d == DateTime.now().weekday - 1,
                      currentHour: DateTime.now().hour,
                      isWeekend: d >= 5,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ── Legend ────────────────────────────────────
            _GradientLegend(colorScheme: colorScheme, textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}

// ── Peak chip ─────────────────────────────────────────────────────

class _PeakChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _PeakChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: colorScheme.primary),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
              Text(
                value,
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Time section row ──────────────────────────────────────────────

class _TimeSectionRow extends StatelessWidget {
  final double dayLabelW;
  final double cellW;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _TimeSectionRow({
    required this.dayLabelW,
    required this.cellW,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    const sections = [
      (label: 'Ночь', hours: '0–5', icon: '🌙'),
      (label: 'Утро', hours: '6–11', icon: '🌅'),
      (label: 'День', hours: '12–17', icon: '☀️'),
      (label: 'Вечер', hours: '18–23', icon: '🌆'),
    ];
    return Row(
      children: [
        SizedBox(width: dayLabelW),
        ...sections.map(
          (s) => SizedBox(
            width: 6 * cellW,
            child: Text(
              '${s.icon} ${s.label}',
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Hour axis row ─────────────────────────────────────────────────

class _HourAxisRow extends StatelessWidget {
  final double dayLabelW;
  final double cellW;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _HourAxisRow({
    required this.dayLabelW,
    required this.cellW,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: dayLabelW),
        for (int h = 0; h < 24; h++)
          SizedBox(
            width: cellW,
            child: Text(
              h % 3 == 0 ? '$h' : '',
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 9,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}

// ── Single heatmap row ────────────────────────────────────────────

class _HeatRow extends StatelessWidget {
  final String dayLabel;
  final String dayFullLabel;
  final List<int> hours;
  final int maxCount;
  final double dayLabelW;
  final double cellW;
  final double cellH;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final bool isPeakDay;
  final bool isCurrentDay;
  final int currentHour;
  final bool isWeekend;

  const _HeatRow({
    required this.dayLabel,
    required this.dayFullLabel,
    required this.hours,
    required this.maxCount,
    required this.dayLabelW,
    required this.cellW,
    required this.cellH,
    required this.colorScheme,
    required this.textTheme,
    required this.isPeakDay,
    required this.isCurrentDay,
    required this.currentHour,
    required this.isWeekend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        children: [
          SizedBox(
            width: dayLabelW,
            child: Text(
              dayLabel,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 10,
                fontWeight: isPeakDay ? FontWeight.w800 : FontWeight.w500,
                color: isPeakDay
                    ? colorScheme.primary
                    : isWeekend
                    ? colorScheme.onSurface.withValues(alpha: 0.6)
                    : null,
              ),
            ),
          ),
          for (int h = 0; h < 24; h++)
            Tooltip(
              message:
                  '$dayFullLabel, ${h.toString().padLeft(2, '0')}:00 — '
                  '${hours[h]} проверок',
              child: Container(
                width: cellW - 3,
                height: cellH,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                decoration: BoxDecoration(
                  color: _heatColor(hours[h], maxCount, colorScheme),
                  borderRadius: BorderRadius.circular(3),
                  border: isCurrentDay && h == currentHour
                      ? Border.all(
                          color: Colors.orange,
                          width: 2,
                        )
                      : null,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _heatColor(int count, int maxCount, ColorScheme colorScheme) {
    if (maxCount == 0 || count == 0) {
      return colorScheme.outlineVariant.withValues(alpha: 0.25);
    }
    final intensity = count / maxCount;
    return Color.lerp(
      colorScheme.primary.withValues(alpha: 0.12),
      colorScheme.primary,
      intensity,
    )!;
  }
}

// ── Legend ────────────────────────────────────────────────────────

class _GradientLegend extends StatelessWidget {
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _GradientLegend({
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Меньше',
          style: textTheme.bodySmall?.copyWith(
            fontSize: 10,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            width: 80,
            height: 12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary.withValues(alpha: 0.12),
                  colorScheme.primary,
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          'Больше',
          style: textTheme.bodySmall?.copyWith(
            fontSize: 10,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
