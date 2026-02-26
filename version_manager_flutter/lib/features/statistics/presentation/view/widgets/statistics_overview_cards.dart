import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Ключевые метрики: уникальные пользователи + общее количество запросов.
class StatisticsOverviewCards extends StatelessWidget {
  final StatisticsOverviewResponse overview;

  const StatisticsOverviewCards({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // ── Уникальные пользователи ──
    final userTiles = [
      _Tile(
        icon: Icons.people_alt_rounded,
        label: 'Уникальных за период',
        value: _fmt(overview.totalUsersInPeriod),
        color: const Color(0xFF0984E3),
      ),
      _Tile(
        icon: Icons.wb_sunny_outlined,
        label: 'Сегодня (DAU)',
        value: _fmt(overview.dailyUsers),
        color: const Color(0xFF27AE60),
      ),
      _Tile(
        icon: Icons.calendar_month_rounded,
        label: 'За месяц (MAU)',
        value: _fmt(overview.monthlyUsers),
        color: const Color(0xFF6C5CE7),
      ),
      _Tile(
        icon: Icons.storage_rounded,
        label: 'Всего пользователей',
        value: _fmt(overview.totalUsers),
        color: const Color(0xFFF39C12),
      ),
    ];

    // ── Общее количество запросов (входов) ──
    final checkTiles = [
      _Tile(
        icon: Icons.sync_rounded,
        label: 'Запросов за период',
        value: _fmt(overview.totalChecksInPeriod),
        color: const Color(0xFF00B894),
      ),
      _Tile(
        icon: Icons.today_rounded,
        label: 'Запросов сегодня',
        value: _fmt(overview.dailyChecks),
        color: const Color(0xFF00CEC9),
      ),
      _Tile(
        icon: Icons.date_range_rounded,
        label: 'Запросов за месяц',
        value: _fmt(overview.monthlyChecks),
        color: const Color(0xFFE17055),
      ),
      _Tile(
        icon: Icons.all_inclusive_rounded,
        label: 'Всего запросов',
        value: _fmt(overview.totalChecks),
        color: const Color(0xFFD63031),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(
          icon: Icons.person_outline_rounded,
          label: 'Уникальные пользователи',
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 8),
        _buildGrid(isCompact, userTiles),
        const SizedBox(height: 16),
        _SectionLabel(
          icon: Icons.swap_vert_rounded,
          label: 'Всего входов (запросов)',
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 8),
        _buildGrid(isCompact, checkTiles),
      ],
    );
  }

  Widget _buildGrid(bool isCompact, List<_Tile> tiles) {
    if (isCompact) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.3,
        children: tiles.map((t) => _TileCard(tile: t)).toList(),
      );
    }
    return IntrinsicHeight(
      child: Row(
        children: [
          for (int i = 0; i < tiles.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(child: _TileCard(tile: tiles[i])),
          ],
        ],
      ),
    );
  }

  static String _fmt(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toString();
  }
}

class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _SectionLabel({
    required this.icon,
    required this.label,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 6),
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _Tile {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _Tile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}

class _TileCard extends StatelessWidget {
  final _Tile tile;

  const _TileCard({required this.tile});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: tile.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(tile.icon, size: 16, color: tile.color),
            ),
            const Flexible(child: SizedBox(height: 12)),
            Text(
              tile.value,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              tile.label,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 11,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
