import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/features/application/presentation/application_provider.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/features/application/presentation/view/ui/application_card.dart';
import 'package:version_manager_flutter/features/create_application/presentation/bloc/create_application_bloc.dart';
import 'package:version_manager_flutter/features/create_application/presentation/view/create_application_dialog.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';

/// Экран «Приложения» — отдельная страница навигации.
///
/// Оборачивает содержимое в [ApplicationProvider] и предоставляет
/// собственный AppBar.
class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationProvider(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Приложения'),
          elevation: 0,
        ),
        body: const _ApplicationsScreenBody(),
      ),
    );
  }
}

class _ApplicationsScreenBody extends StatelessWidget {
  const _ApplicationsScreenBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        switch (state) {
          case ApplicationError(:final message):
            NotificationService.showError(context, message);
          default:
            break;
        }
      },
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) => switch (state) {
          ApplicationLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          ApplicationLoaded(:final applications, :final teams) =>
            _ApplicationsContent(
              applications: applications,
              teams: teams,
            ),
          ApplicationError(:final message) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                const SizedBox(height: 16),
                Text(message, style: textTheme.bodyLarge),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => context.read<ApplicationBloc>().add(
                    const ApplicationEvent.loadApplications(),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Повторить'),
                ),
              ],
            ),
          ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}

class _ApplicationsContent extends StatefulWidget {
  final List<Application> applications;
  final List<Team> teams;

  const _ApplicationsContent({
    required this.applications,
    required this.teams,
  });

  @override
  State<_ApplicationsContent> createState() => _ApplicationsContentState();
}

class _ApplicationsContentState extends State<_ApplicationsContent> {
  final _collapsedTeamIds = <UuidValue>{};

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Разделяем на личные и командные (группируем по ID команды)
    final personalApps = <Application>[];
    final teamApps = <UuidValue, List<Application>>{};

    for (final app in widget.applications) {
      if (app.ownerType == OwnerType.user) {
        personalApps.add(app);
      } else if (app.ownerTeam != null) {
        final teamId = app.ownerTeam!.id!;
        teamApps.putIfAbsent(teamId, () => []).add(app);
      }
    }

    // Все команды, отсортированные по алфавиту
    final sortedTeams = List<Team>.from(widget.teams)
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ApplicationBloc>().add(
          const ApplicationEvent.loadApplications(),
        );
      },
      child: CustomScrollView(
        slivers: _buildSlivers(
          textTheme: textTheme,
          colorScheme: colorScheme,
          personalApps: personalApps,
          sortedTeams: sortedTeams,
          teamApps: teamApps,
        ),
      ),
    );
  }

  List<Widget> _buildSlivers({
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    required List<Application> personalApps,
    required List<Team> sortedTeams,
    required Map<UuidValue, List<Application>> teamApps,
  }) {
    final slivers = <Widget>[
      _SectionHeader(
        title: 'Личные приложения',
        icon: Icons.person_outlined,
        textTheme: textTheme,
      ),
      _ApplicationsGrid(
        applications: personalApps,
        colorScheme: colorScheme,
        textTheme: textTheme,
        showCreateCard: true,
      ),
    ];

    for (var i = 0; i < sortedTeams.length; i++) {
      final team = sortedTeams[i];
      slivers.add(
        _SectionHeader(
          title: team.name,
          icon: Icons.groups_outlined,
          textTheme: textTheme,
          isCollapsed: _collapsedTeamIds.contains(team.id),
          onToggle: () {
            setState(() {
              if (_collapsedTeamIds.contains(team.id)) {
                _collapsedTeamIds.remove(team.id);
              } else {
                _collapsedTeamIds.add(team.id!);
              }
            });
          },
        ),
      );
      if (!_collapsedTeamIds.contains(team.id)) {
        slivers.add(
          _ApplicationsGrid(
            applications: teamApps[team.id] ?? [],
            colorScheme: colorScheme,
            textTheme: textTheme,
            showCreateCard: true,
            team: team,
          ),
        );
      }
    }

    slivers.add(const SliverPadding(padding: EdgeInsets.only(bottom: 24)));
    return slivers;
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextTheme textTheme;
  final bool isCollapsed;
  final VoidCallback? onToggle;

  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.textTheme,
    this.isCollapsed = false,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final padding = MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0;

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(padding, 24, padding, 12),
      sliver: SliverToBoxAdapter(
        child: GestureDetector(
          onTap: onToggle,
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (onToggle != null)
                Icon(
                  isCollapsed
                      ? Icons.expand_more_rounded
                      : Icons.expand_less_rounded,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplicationsGrid extends StatelessWidget {
  final List<Application> applications;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final bool showCreateCard;
  final Team? team;

  const _ApplicationsGrid({
    required this.applications,
    required this.colorScheme,
    required this.textTheme,
    required this.showCreateCard,
    this.team,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = applications.length + (showCreateCard ? 1 : 0);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final padding = screenWidth < 600 ? 16.0 : 24.0;
    final isCompact = screenWidth < 600;

    if (itemCount == 0) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        sliver: SliverToBoxAdapter(
          child: Text(
            'Нет приложений',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: isCompact ? 160 : 200,
          mainAxisSpacing: isCompact ? 8 : 12,
          crossAxisSpacing: isCompact ? 8 : 12,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (showCreateCard && index == applications.length) {
              return _CreateApplicationCard(
                colorScheme: colorScheme,
                textTheme: textTheme,
                team: team,
              );
            }
            return ApplicationCard(
              application: applications[index],
              colorScheme: colorScheme,
              textTheme: textTheme,
            );
          },
          childCount: itemCount,
        ),
      ),
    );
  }
}

/// Карточка «Создать приложение» — такого же размера как карточки приложений.
class _CreateApplicationCard extends StatelessWidget {
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final Team? team;

  const _CreateApplicationCard({
    required this.colorScheme,
    required this.textTheme,
    this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          final appBloc = context.read<ApplicationBloc>();
          final repo = context.read<ApplicationRepository>();
          showDialog(
            context: context,
            builder: (_) => RepositoryProvider.value(
              value: repo,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: appBloc),
                  BlocProvider(
                    create: (context) => CreateApplicationBloc(
                      applicationRepository: context
                          .read<ApplicationRepository>(),
                    ),
                  ),
                ],
                child: CreateApplicationDialog(preselectedTeam: team),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: DashedBorderPainter(
          color: colorScheme.outlineVariant,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_rounded,
                  size: 36,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 8),
                Text(
                  'Создать',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Виджет с пунктирной рамкой.
class DashedBorderPainter extends StatelessWidget {
  final Widget child;
  final Color color;

  const DashedBorderPainter({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedPainter(color: color),
      child: child,
    );
  }
}

class _DashedPainter extends CustomPainter {
  final Color color;

  _DashedPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(12),
    );

    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().first;
    var distance = 0.0;

    while (distance < metrics.length) {
      final start = distance;
      final end = (distance + dashWidth).clamp(0.0, metrics.length);
      canvas.drawPath(
        metrics.extractPath(start, end),
        paint,
      );
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedPainter oldDelegate) =>
      color != oldDelegate.color;
}
