import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Фильтр периода для статистики.
class StatisticsFilterBar extends StatelessWidget {
  final StatisticsFilter filter;
  final ValueChanged<StatisticsFilter> onFilterChanged;

  const StatisticsFilterBar({
    super.key,
    required this.filter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentPeriod = _getCurrentPeriod();
    final isCustom =
        currentPeriod == null &&
        filter.dateFrom != null &&
        filter.dateTo != null;

    return Row(
      children: [
        Expanded(
          child: SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 1, label: Text('Сег', maxLines: 1)),
              ButtonSegment(value: 7, label: Text('7дн', maxLines: 1)),
              ButtonSegment(value: 30, label: Text('30дн', maxLines: 1)),
              ButtonSegment(value: 90, label: Text('3мес', maxLines: 1)),
              ButtonSegment(value: 180, label: Text('6мес', maxLines: 1)),
            ],
            selected: currentPeriod != null ? {currentPeriod} : <int>{},
            onSelectionChanged: (selected) {
              if (selected.isNotEmpty) _setPeriod(selected.first);
            },
            emptySelectionAllowed: true,
            showSelectedIcon: false,
            style: const ButtonStyle(
              visualDensity: VisualDensity.compact,
            ),
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: () => _openCustomPeriodSheet(context),
          icon: Icon(
            Icons.date_range_rounded,
            size: 16,
            color: isCustom ? colorScheme.primary : null,
          ),
          label: Text(
            isCustom ? _formatDateRange() : 'Период',
            style: TextStyle(
              color: isCustom ? colorScheme.primary : null,
              fontSize: 13,
            ),
          ),
          style: OutlinedButton.styleFrom(
            visualDensity: VisualDensity.compact,
            side: BorderSide(
              color: isCustom ? colorScheme.primary : colorScheme.outline,
            ),
          ),
        ),
      ],
    );
  }

  int? _getCurrentPeriod() {
    if (filter.dateFrom == null || filter.dateTo == null) return null;
    final diff = filter.dateTo!.difference(filter.dateFrom!).inDays;
    if (diff <= 1) return 1;
    if ((diff - 7).abs() <= 1) return 7;
    if ((diff - 30).abs() <= 1) return 30;
    if ((diff - 90).abs() <= 1) return 90;
    if ((diff - 180).abs() <= 1) return 180;
    return null;
  }

  void _setPeriod(int days) {
    final now = DateTime.now();
    final from = days == 1
        ? DateTime(now.year, now.month, now.day)
        : now.subtract(Duration(days: days));
    onFilterChanged(
      StatisticsFilter(
        applicationId: filter.applicationId,
        dateFrom: from,
        dateTo: now,
      ),
    );
  }

  String _formatDateRange() {
    final from = filter.dateFrom;
    final to = filter.dateTo;
    if (from == null || to == null) return 'Выбрать';
    return '${_fmtDate(from)} — ${_fmtDate(to)}';
  }

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';

  Future<void> _openCustomPeriodSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _CustomPeriodSheet(
        initialFrom: filter.dateFrom,
        initialTo: filter.dateTo,
        onApply: (from, to) {
          onFilterChanged(
            StatisticsFilter(
              applicationId: filter.applicationId,
              dateFrom: from,
              dateTo: to,
            ),
          );
        },
      ),
    );
  }
}

// ── Custom period bottom sheet ─────────────────────────────────────

class _CustomPeriodSheet extends StatefulWidget {
  final DateTime? initialFrom;
  final DateTime? initialTo;
  final void Function(DateTime from, DateTime to) onApply;

  const _CustomPeriodSheet({
    required this.initialFrom,
    required this.initialTo,
    required this.onApply,
  });

  @override
  State<_CustomPeriodSheet> createState() => _CustomPeriodSheetState();
}

class _CustomPeriodSheetState extends State<_CustomPeriodSheet> {
  late DateTime? _from;
  late DateTime? _to;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _from = widget.initialFrom ?? now.subtract(const Duration(days: 30));
    _to = widget.initialTo ?? now;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final canApply = _from != null && _to != null && !_to!.isBefore(_from!);
    final days = (_from != null && _to != null)
        ? _to!.difference(_from!).inDays + 1
        : 0;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Выбор периода',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // From date
                _DateField(
                  label: 'Начало периода',
                  icon: Icons.calendar_today_rounded,
                  date: _from,
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate:
                          _from ?? now.subtract(const Duration(days: 30)),
                      firstDate: DateTime(2024),
                      lastDate: _to ?? now,
                    );
                    if (picked != null) setState(() => _from = picked);
                  },
                ),
                const SizedBox(height: 12),

                // To date
                _DateField(
                  label: 'Конец периода',
                  icon: Icons.event_rounded,
                  date: _to,
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _to ?? now,
                      firstDate: _from ?? DateTime(2024),
                      lastDate: now,
                    );
                    if (picked != null) setState(() => _to = picked);
                  },
                ),

                // Duration badge
                if (canApply && days > 0) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.45,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timelapse_rounded,
                          size: 14,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '$days ${_daysLabel(days)}',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Отмена'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: canApply
                            ? () {
                                widget.onApply(_from!, _to!);
                                Navigator.pop(context);
                              }
                            : null,
                        child: const Text('Применить'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _daysLabel(int n) {
    if (n % 10 == 1 && n % 100 != 11) return 'день';
    if (n % 10 >= 2 && n % 10 <= 4 && (n % 100 < 10 || n % 100 >= 20)) {
      return 'дня';
    }
    return 'дней';
  }
}

// ── Date field ────────────────────────────────────────────────────

class _DateField extends StatelessWidget {
  final String label;
  final IconData icon;
  final DateTime? date;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.icon,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final dateStr = date != null
        ? '${date!.day.toString().padLeft(2, '0')}.${date!.month.toString().padLeft(2, '0')}.${date!.year}'
        : 'Не выбрано';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dateStr,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: date != null
                            ? colorScheme.onSurface
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.edit_calendar_rounded,
                size: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
