import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Тепловая карта активности: часы по вертикали (строки), даты по горизонтали.
/// Ячейки отрисовываются через [CustomPainter] — без тысяч виджетов.
class TimeHeatmapChart extends StatelessWidget {
  final TimeAnalyticsResponse data;

  const TimeHeatmapChart({super.key, required this.data});

  static const _dayLabels = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

  // Ячейка: ширина = 1 день, высота = 1 час
  static const double _cellW = 30.0; // ширина ячейки (по дате)
  static const double _cellH = 18.0; // высота ячейки (по часу)
  static const double _hourLabelW = 44.0; // ширина колонки с подписью часа
  static const double _dateLabelH = 36.0; // высота строки с подписью даты
  // Pitch между рядами/столбцами
  static const double _colW = _cellW + 2.0; // ширина столбца (дата)
  static const double _rowH = _cellH + 2.0; // высота строки (час)

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

    // Build date × 24 matrix — сервер хранит UTC, конвертируем в локальное время
    final Map<DateTime, List<int>> dateMatrix = {};
    for (final entry in data.heatmap) {
      final utc = DateTime.utc(
        entry.date.year,
        entry.date.month,
        entry.date.day,
        entry.hour,
      );
      final local = utc.toLocal();
      final localDate = DateTime(local.year, local.month, local.day);
      final hours = dateMatrix.putIfAbsent(localDate, () => List.filled(24, 0));
      if (local.hour >= 0 && local.hour < 24) {
        hours[local.hour] += entry.count;
      }
    }

    final dates = dateMatrix.keys.toList()..sort();
    int maxCount = 0;
    for (final date in dates) {
      for (final v in dateMatrix[date]!) {
        if (v > maxCount) maxCount = v;
      }
    }

    // Peak day and peak hour
    final dayTotals = dates
        .map((d) => dateMatrix[d]!.fold(0, (a, b) => a + b))
        .toList();
    final hourTotals = List.generate(
      24,
      (h) => dates.fold(0, (sum, d) => sum + dateMatrix[d]![h]),
    );
    final maxDay = dayTotals.isEmpty
        ? 0
        : dayTotals.reduce((a, b) => a > b ? a : b);
    final maxHour = hourTotals.isEmpty
        ? 0
        : hourTotals.reduce((a, b) => a > b ? a : b);
    final peakDayIdx = dayTotals.isEmpty ? -1 : dayTotals.indexOf(maxDay);
    final peakHourIdx = hourTotals.isEmpty ? 0 : hourTotals.indexOf(maxHour);

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
            if (maxCount > 0 && peakDayIdx >= 0) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _PeakChip(
                    icon: Icons.calendar_today_rounded,
                    label: 'Самый активный день',
                    value: _formatFullDate(dates[peakDayIdx]),
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

            // ── Grid (часы слева, даты сверху) ────────────
            _HeatmapGrid(
              dates: dates,
              dateMatrix: dateMatrix,
              maxCount: maxCount,
              cellW: _cellW,
              cellH: _cellH,
              colW: _colW,
              rowH: _rowH,
              hourLabelW: _hourLabelW,
              dateLabelH: _dateLabelH,
              colorScheme: colorScheme,
              textTheme: textTheme,
              peakDayIdx: peakDayIdx,
              peakHourIdx: peakHourIdx,
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

// ── Optimised heatmap grid ────────────────────────────────────────
//
// Раскладка: 24 строки (часы) × N столбцов (даты).
// Слева — фиксированная колонка с подписями часов.
// Сверху — строка с подписями дат (скроллируется вместе с ячейками).
// Два CustomPainter:
//   • _HourLabelsPainter  — подписи часов слева (статика)
//   • _CellsPainter       — ячейки (перерисовка только при смене hover)

class _HeatmapGrid extends StatefulWidget {
  final List<DateTime> dates;
  final Map<DateTime, List<int>> dateMatrix;
  final int maxCount;
  final double cellW;
  final double cellH;
  final double colW;
  final double rowH;
  final double hourLabelW;
  final double dateLabelH;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final int peakDayIdx;
  final int peakHourIdx;

  const _HeatmapGrid({
    required this.dates,
    required this.dateMatrix,
    required this.maxCount,
    required this.cellW,
    required this.cellH,
    required this.colW,
    required this.rowH,
    required this.hourLabelW,
    required this.dateLabelH,
    required this.colorScheme,
    required this.textTheme,
    required this.peakDayIdx,
    required this.peakHourIdx,
  });

  @override
  State<_HeatmapGrid> createState() => _HeatmapGridState();
}

class _HeatmapGridState extends State<_HeatmapGrid> {
  int? _hoveredDayIdx;
  int? _hoveredHour;

  final ScrollController _scrollController = ScrollController();

  // Кешированные TextPainter для подписей часов (слева)
  late List<TextPainter> _hourLabelPainters;
  // Кешированные TextPainter для подписями дат (сверху, 2 строки: дата + день недели)
  late List<List<TextPainter>> _dateLabelPainters; // [dateIdx][line 0..1]

  @override
  void initState() {
    super.initState();
    _buildPainters();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToToday());
  }

  @override
  void didUpdateWidget(_HeatmapGrid old) {
    super.didUpdateWidget(old);
    final datesChanged = old.dates != widget.dates;
    if (datesChanged ||
        old.colorScheme != widget.colorScheme ||
        old.peakDayIdx != widget.peakDayIdx ||
        old.peakHourIdx != widget.peakHourIdx) {
      _buildPainters();
    }
    if (datesChanged) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToToday());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Прокручивает горизонтально так, чтобы текущий день оказался
  /// в правой трети видимой области (с контекстом слева).
  void _scrollToToday() {
    if (!_scrollController.hasClients) return;
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final idx = widget.dates.indexWhere(
      (d) =>
          d.year == todayDate.year &&
          d.month == todayDate.month &&
          d.day == todayDate.day,
    );
    if (idx < 0) return; // текущий день не в периоде

    final viewport = _scrollController.position.viewportDimension;
    // Целевая позиция: сдвигаем так, чтобы текущий день был в правой трети
    final target = (idx * widget.colW - viewport * 0.65).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.jumpTo(target);
  }

  void _buildPainters() {
    // Часы 0–23
    final nowHour = DateTime.now().hour;
    _hourLabelPainters = List.generate(24, (h) {
      final isCurrent = h == nowHour;
      return TextPainter(
        text: TextSpan(
          text: '${h.toString().padLeft(2, '0')}:00',
          style: TextStyle(
            fontSize: 9,
            fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w400,
            color: isCurrent
                ? widget.colorScheme.primary
                : widget.colorScheme.onSurface.withValues(alpha: 0.55),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: widget.hourLabelW);
    });

    // Даты: 2 строки — "26.02" и "Чт"
    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);
    _dateLabelPainters = List.generate(widget.dates.length, (i) {
      final d = widget.dates[i];
      final isToday = d == todayDate;
      final color = isToday
          ? widget.colorScheme.primary
          : widget.colorScheme.onSurface.withValues(alpha: 0.7);

      final dd = d.day.toString().padLeft(2, '0');
      final mm = d.month.toString().padLeft(2, '0');
      final dow = TimeHeatmapChart._dayLabels[d.weekday - 1];

      return [
        TextPainter(
          text: TextSpan(
            text: '$dd.$mm',
            style: TextStyle(
              fontSize: 9,
              fontWeight: isToday ? FontWeight.w800 : FontWeight.w500,
              color: color,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: widget.colW),
        TextPainter(
          text: TextSpan(
            text: dow,
            style: TextStyle(
              fontSize: 9,
              fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
              color: isToday
                  ? widget.colorScheme.primary
                  : widget.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: widget.colW),
      ];
    });
  }

  void _updateHover(Offset pos) {
    // pos — локальные координаты внутри области ячеек (без hourLabel и dateLabel)
    final di = (pos.dx / widget.colW).floor();
    final hi = (pos.dy / widget.rowH).floor();

    int? newDay;
    int? newHour;
    if (di >= 0 && di < widget.dates.length && hi >= 0 && hi < 24) {
      newDay = di;
      newHour = hi;
    }

    if (newDay != _hoveredDayIdx || newHour != _hoveredHour) {
      setState(() {
        _hoveredDayIdx = newDay;
        _hoveredHour = newHour;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final n = widget.dates.length;

    // Полная ширина области ячеек (без hourLabel)
    final cellsW = n * widget.colW;
    final cellsH = 24 * widget.rowH;

    final dayIdx = _hoveredDayIdx;
    final hourIdx = _hoveredHour;

    String? tipText;
    double tipLeft = 0;
    double tipTop = 0;
    if (dayIdx != null && hourIdx != null) {
      final d = widget.dates[dayIdx];
      final count = widget.dateMatrix[d]![hourIdx];
      tipText =
          '${_formatFullDate(d)}, '
          '${hourIdx.toString().padLeft(2, '0')}:00 — '
          '$count проверок';
      // позиция подсказки: чуть ниже ячейки, выровнена по столбцу
      final maxTipLeft = (cellsW - 200.0).clamp(0.0, double.maxFinite);
      tipLeft = (dayIdx * widget.colW - 10.0).clamp(0.0, maxTipLeft);
      tipTop = hourIdx == 0 ? widget.rowH + 2 : hourIdx * widget.rowH - 30;
    }

    // Колонка с часами фиксирована слева, правая часть скроллируется горизонтально.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Фиксированная колонка с подписями часов ────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Угловой отступ под высоту строки с датами
            SizedBox(height: widget.dateLabelH + 4),
            RepaintBoundary(
              child: CustomPaint(
                size: Size(widget.hourLabelW, cellsH),
                painter: _HourLabelsPainter(
                  painters: _hourLabelPainters,
                  rowH: widget.rowH,
                  cellH: widget.cellH,
                ),
              ),
            ),
          ],
        ),

        // ── Скроллируемая область: даты + ячейки ───────────
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Заголовки дат
                SizedBox(
                  width: cellsW,
                  height: widget.dateLabelH,
                  child: RepaintBoundary(
                    child: CustomPaint(
                      size: Size(cellsW, widget.dateLabelH),
                      painter: _DateLabelsPainter(
                        painters: _dateLabelPainters,
                        colW: widget.colW,
                        totalH: widget.dateLabelH,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Интерактивная область ячеек
                MouseRegion(
                  onHover: (e) => _updateHover(e.localPosition),
                  onExit: (_) {
                    if (_hoveredDayIdx != null || _hoveredHour != null) {
                      setState(() {
                        _hoveredDayIdx = null;
                        _hoveredHour = null;
                      });
                    }
                  },
                  child: SizedBox(
                    width: cellsW,
                    height: cellsH,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        RepaintBoundary(
                          child: CustomPaint(
                            size: Size(cellsW, cellsH),
                            painter: _CellsPainter(
                              dates: widget.dates,
                              dateMatrix: widget.dateMatrix,
                              maxCount: widget.maxCount,
                              colW: widget.colW,
                              cellW: widget.cellW,
                              rowH: widget.rowH,
                              cellH: widget.cellH,
                              colorScheme: widget.colorScheme,
                              hoveredDayIdx: _hoveredDayIdx,
                              hoveredHour: _hoveredHour,
                              today: today,
                            ),
                          ),
                        ),
                        if (tipText != null)
                          Positioned(
                            left: tipLeft,
                            top: tipTop,
                            child: IgnorePointer(
                              child: _TooltipBubble(
                                text: tipText,
                                colorScheme: widget.colorScheme,
                                textTheme: widget.textTheme,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Date labels painter (top axis) ───────────────────────────────

class _DateLabelsPainter extends CustomPainter {
  final List<List<TextPainter>> painters; // [dateIdx][0=date, 1=dow]
  final double colW;
  final double totalH;

  const _DateLabelsPainter({
    required this.painters,
    required this.colW,
    required this.totalH,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < painters.length; i++) {
      final x = i * colW;
      final tp0 = painters[i][0]; // "26.02"
      final tp1 = painters[i][1]; // "Чт"
      // Две строки по центру столбца
      tp0.paint(canvas, Offset(x + (colW - tp0.width) / 2, 0));
      tp1.paint(
        canvas,
        Offset(x + (colW - tp1.width) / 2, tp0.height + 2),
      );
    }
  }

  @override
  bool shouldRepaint(_DateLabelsPainter old) =>
      old.painters != painters || old.colW != colW;
}

// ── Hour labels painter (left axis) ──────────────────────────────

class _HourLabelsPainter extends CustomPainter {
  final List<TextPainter> painters;
  final double rowH;
  final double cellH;

  const _HourLabelsPainter({
    required this.painters,
    required this.rowH,
    required this.cellH,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int h = 0; h < painters.length; h++) {
      final tp = painters[h];
      tp.paint(
        canvas,
        Offset(0, h * rowH + (cellH - tp.height) / 2),
      );
    }
  }

  @override
  bool shouldRepaint(_HourLabelsPainter old) =>
      old.painters != painters || old.rowH != rowH;
}

// ── Cells painter ─────────────────────────────────────────────────
// Столбцы = даты, строки = часы (0..23)

class _CellsPainter extends CustomPainter {
  final List<DateTime> dates;
  final Map<DateTime, List<int>> dateMatrix;
  final int maxCount;
  final double colW;
  final double cellW;
  final double rowH;
  final double cellH;
  final ColorScheme colorScheme;
  final int? hoveredDayIdx;
  final int? hoveredHour;
  final DateTime today;

  _CellsPainter({
    required this.dates,
    required this.dateMatrix,
    required this.maxCount,
    required this.colW,
    required this.cellW,
    required this.rowH,
    required this.cellH,
    required this.colorScheme,
    this.hoveredDayIdx,
    this.hoveredHour,
    required this.today,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    for (int i = 0; i < dates.length; i++) {
      final date = dates[i];
      final hours = dateMatrix[date]!;
      final isToday =
          date.year == today.year &&
          date.month == today.month &&
          date.day == today.day;
      final x = i * colW;

      for (int h = 0; h < 24; h++) {
        final isHovered = i == hoveredDayIdx && h == hoveredHour;
        final isCurrentHour = isToday && h == today.hour;
        final y = h * rowH;

        final cellRect = RRect.fromLTRBR(
          x + 1.0,
          y + 1.0,
          x + cellW + 1.0,
          y + cellH + 1.0,
          const Radius.circular(3),
        );

        // Fill
        Color cellColor;
        if (maxCount == 0 || hours[h] == 0) {
          cellColor = colorScheme.outlineVariant.withValues(alpha: 0.25);
        } else {
          final t = (hours[h] / maxCount).clamp(0.0, 1.0);
          cellColor = Color.lerp(
            colorScheme.primary.withValues(alpha: 0.12),
            colorScheme.primary,
            t,
          )!;
        }
        if (isHovered) {
          cellColor = Color.lerp(cellColor, Colors.white, 0.25)!;
        }

        paint
          ..color = cellColor
          ..style = PaintingStyle.fill;
        canvas.drawRRect(cellRect, paint);

        // Current-hour border
        if (isCurrentHour) {
          paint
            ..color = Colors.white.withValues(alpha: 0.85)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0;
          canvas.drawRRect(cellRect, paint);
          paint.style = PaintingStyle.fill;
        }

        // Hover border
        if (isHovered) {
          paint
            ..color = colorScheme.primary.withValues(alpha: 0.6)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5;
          canvas.drawRRect(cellRect, paint);
          paint.style = PaintingStyle.fill;
        }
      }
    }
  }

  @override
  bool shouldRepaint(_CellsPainter old) =>
      old.hoveredDayIdx != hoveredDayIdx ||
      old.hoveredHour != hoveredHour ||
      old.maxCount != maxCount ||
      old.dates.length != dates.length ||
      old.colorScheme != colorScheme;
}

// ── Tooltip bubble ────────────────────────────────────────────────

class _TooltipBubble extends StatelessWidget {
  final String text;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _TooltipBubble({
    required this.text,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: textTheme.bodySmall?.copyWith(
          color: colorScheme.onInverseSurface,
          fontSize: 11,
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

String _formatFullDate(DateTime date) {
  final dd = date.day.toString().padLeft(2, '0');
  final mm = date.month.toString().padLeft(2, '0');
  final yyyy = date.year.toString();
  final dow = TimeHeatmapChart._dayLabels[date.weekday - 1];
  return '$dd.$mm.$yyyy ($dow)';
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
