import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Четыре ключевых метрики в виде плиток.
class StatisticsOverviewCards extends StatelessWidget {
  final StatisticsOverviewResponse overview;

  const StatisticsOverviewCards({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    final tiles = [
      _Tile(
        icon: Icons.people_alt_rounded,
        label: 'Пользователей за период',
        value: overview.totalUsersInPeriod.toString(),
        color: const Color(0xFF0984E3),
      ),
      _Tile(
        icon: Icons.wb_sunny_outlined,
        label: 'Сегодня',
        value: overview.dailyUsers.toString(),
        color: const Color(0xFF27AE60),
      ),
      _Tile(
        icon: Icons.calendar_month_rounded,
        label: 'За месяц',
        value: overview.monthlyUsers.toString(),
        color: const Color(0xFF6C5CE7),
      ),
      _Tile(
        icon: Icons.storage_rounded,
        label: 'Всего пользователей',
        value: overview.totalUsers.toString(),
        color: const Color(0xFFF39C12),
      ),
    ];

    final grid = isCompact
        ? GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.3,
            children: tiles.map((t) => _TileCard(tile: t)).toList(),
          )
        : Row(
            children: [
              for (int i = 0; i < tiles.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(child: _TileCard(tile: tiles[i])),
              ],
            ],
          );

    return grid;
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
            const Spacer(),
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
