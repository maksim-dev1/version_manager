import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/statistics/presentation/bloc/statistics_bloc.dart';
import 'package:version_manager_flutter/features/statistics/presentation/view/widgets/daily_activity_chart.dart';
import 'package:version_manager_flutter/features/statistics/presentation/view/widgets/platform_statistics_chart.dart';
import 'package:version_manager_flutter/features/statistics/presentation/view/widgets/statistics_filter_bar.dart';
import 'package:version_manager_flutter/features/statistics/presentation/view/widgets/statistics_overview_cards.dart';
import 'package:version_manager_flutter/features/statistics/presentation/view/widgets/time_heatmap_chart.dart';
import 'package:version_manager_flutter/features/statistics/presentation/view/widgets/version_statistics_chart.dart';

/// Экран статистики приложения.
class StatisticsScreen extends StatelessWidget {
  final Application application;

  const StatisticsScreen({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;

    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        return switch (state) {
          StatisticsInitial() || StatisticsLoading() => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Загружаем статистику…'),
              ],
            ),
          ),
          StatisticsError(:final message) => _ErrorView(
            message: message,
            onRetry: () => context.read<StatisticsBloc>().add(
              StatisticsEvent.loadAll(applicationId: application.id!),
            ),
          ),
          StatisticsLoaded(
            :final overview,
            :final dailyUsers,
            :final versions,
            :final platforms,
            :final timeAnalytics,
            :final filter,
          ) =>
            RefreshIndicator(
              onRefresh: () async {
                context.read<StatisticsBloc>().add(
                  StatisticsEvent.loadAll(
                    applicationId: application.id!,
                    dateFrom: filter.dateFrom,
                    dateTo: filter.dateTo,
                    platform: filter.platform,
                  ),
                );
              },
              child: ListView(
                padding: EdgeInsets.all(padding),
                children: [
                  // ── Фильтр ────────────────────────────────────
                  StatisticsFilterBar(
                    filter: filter,
                    onFilterChanged: (newFilter) {
                      context.read<StatisticsBloc>().add(
                        StatisticsEvent.updateFilter(
                          dateFrom: newFilter.dateFrom,
                          dateTo: newFilter.dateTo,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // ── Метрики ───────────────────────────────────
                  StatisticsOverviewCards(overview: overview),
                  const SizedBox(height: 28),

                  // ── Активность ────────────────────────────────
                  const _SectionHeader(
                    icon: Icons.show_chart_rounded,
                    title: 'Активность',
                  ),
                  const SizedBox(height: 10),
                  DailyActivityChart(
                    data: dailyUsers,
                    timeData: timeAnalytics,
                  ),
                  const SizedBox(height: 28),

                  // ── Версии ────────────────────────────────────
                  const _SectionHeader(
                    icon: Icons.layers_outlined,
                    title: 'Версии',
                  ),
                  const SizedBox(height: 10),
                  VersionStatisticsChart(data: versions),
                  const SizedBox(height: 28),

                  // ── Платформы ─────────────────────────────────
                  const _SectionHeader(
                    icon: Icons.devices_outlined,
                    title: 'Платформы',
                  ),
                  const SizedBox(height: 10),
                  PlatformStatisticsChart(data: platforms),
                  const SizedBox(height: 28),

                  // ── Когда активны ─────────────────────────────
                  const _SectionHeader(
                    icon: Icons.access_time_rounded,
                    title: 'Когда активны',
                  ),
                  const SizedBox(height: 10),
                  TimeHeatmapChart(data: timeAnalytics),
                  const SizedBox(height: 32),
                ],
              ),
            ),
        };
      },
    );
  }
}

// ── Section header ─────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionHeader({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: colorScheme.primary),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Error view ────────────────────────────────────────────────────

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                size: 32,
                color: colorScheme.error,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Не удалось загрузить статистику',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Попробовать снова'),
            ),
          ],
        ),
      ),
    );
  }
}
