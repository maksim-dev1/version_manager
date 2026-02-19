import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Распределение пользователей по версиям: горизонтальные бары.
class VersionStatisticsChart extends StatelessWidget {
  final VersionStatisticsResponse data;

  const VersionStatisticsChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (data.versions.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              'Нет данных по версиям',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    // Сортировка: сначала по убыванию пользователей
    final sorted = List.of(data.versions)
      ..sort((a, b) => b.userCount.compareTo(a.userCount));

    final display = sorted.length > 15 ? sorted.take(15).toList() : sorted;

    final maxCount = display.first.userCount;
    final hasBlocked = display.any((v) => v.isBlocked);

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Adoption banner ─────────────────────────────────
            if (data.latestVersionAdoptionRate > 0) ...[
              _AdoptionBanner(
                adoptionRate: data.latestVersionAdoptionRate,
                blockedPercentage: data.blockedVersionsPercentage,
                usersOnBlocked: data.usersOnBlockedVersions,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              const SizedBox(height: 16),
            ],

            // ── Header row ──────────────────────────────────────
            Row(
              children: [
                Text(
                  'Версия',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'Пользователей',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 44,
                  child: Text(
                    'Доля',
                    textAlign: TextAlign.right,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            const SizedBox(height: 8),

            // ── Version rows ────────────────────────────────────
            for (int i = 0; i < display.length; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              _VersionRow(
                entry: display[i],
                maxCount: maxCount,
                rank: i,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
            ],

            // ── Footer ──────────────────────────────────────────
            if (sorted.length > 15) ...[
              const SizedBox(height: 12),
              Text(
                'Показаны топ-15 из ${sorted.length} версий',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (hasBlocked) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.block_rounded, size: 12, color: colorScheme.error),
                  const SizedBox(width: 6),
                  Text(
                    'Версия заблокирована для обновлений',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Single version row ────────────────────────────────────────────

class _VersionRow extends StatelessWidget {
  final VersionStatisticsEntry entry;
  final int maxCount;
  final int rank;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _VersionRow({
    required this.entry,
    required this.maxCount,
    required this.rank,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final fraction = maxCount > 0 ? entry.userCount / maxCount : 0.0;
    final isTop = rank == 0;
    final barColor = entry.isBlocked
        ? colorScheme.error
        : isTop
        ? colorScheme.primary
        : colorScheme.primary.withValues(alpha: 0.55 + 0.15 * (1 - rank / 15));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Version label
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (entry.isBlocked) ...[
                  Icon(Icons.block_rounded, size: 11, color: colorScheme.error),
                  const SizedBox(width: 4),
                ],
                Text(
                  'v${entry.versionNumber}',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: isTop ? FontWeight.w700 : FontWeight.w500,
                    color: entry.isBlocked
                        ? colorScheme.error
                        : colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // User count
            Text(
              entry.userCount.toString(),
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: entry.isBlocked
                    ? colorScheme.error
                    : colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 8),
            // Percentage
            SizedBox(
              width: 44,
              child: Text(
                '${entry.percentage.toStringAsFixed(1)}%',
                textAlign: TextAlign.right,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: isTop ? 7 : 5,
            backgroundColor: colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
          ),
        ),
      ],
    );
  }
}

// ── Adoption banner ───────────────────────────────────────────────

class _AdoptionBanner extends StatelessWidget {
  final double adoptionRate;
  final double blockedPercentage;
  final int usersOnBlocked;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _AdoptionBanner({
    required this.adoptionRate,
    required this.blockedPercentage,
    required this.usersOnBlocked,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.verified_rounded, size: 18, color: colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${adoptionRate.toStringAsFixed(1)}%',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' пользователей на актуальной версии',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (blockedPercentage > 0) ...[
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${blockedPercentage.toStringAsFixed(1)}% заблок.',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
