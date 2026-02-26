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
    final now = DateTime.now();
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: now,
      initialDateRange: (filter.dateFrom != null && filter.dateTo != null)
          ? DateTimeRange(start: filter.dateFrom!, end: filter.dateTo!)
          : null,
      locale: const Locale('ru'),
      helpText: 'Выберите период',
      cancelText: 'Отмена',
      confirmText: 'Применить',
      saveText: 'Применить',
      // Показываем как компактный диалог, а не на весь экран
      builder: (context, child) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420, maxHeight: 580),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: child!,
          ),
        ),
      ),
    );
    if (result != null) {
      // result.end — полночь выбранного дня, устанавливаем 23:59:59
      // чтобы весь выбранный день попал в диапазон фильтра на сервере
      final endOfDay = DateTime(
        result.end.year,
        result.end.month,
        result.end.day,
        23,
        59,
        59,
      );
      onFilterChanged(
        StatisticsFilter(
          applicationId: filter.applicationId,
          dateFrom: result.start,
          dateTo: endOfDay,
        ),
      );
    }
  }
}
