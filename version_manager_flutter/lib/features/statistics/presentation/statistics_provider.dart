import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/statistics/data/repository/statistics_repository_impl.dart';
import 'package:version_manager_flutter/features/statistics/domain/repository/statistics_repository.dart';
import 'package:version_manager_flutter/features/statistics/presentation/bloc/statistics_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Статистика».
///
/// Создаёт и предоставляет:
/// - [StatisticsRepository]
/// - [StatisticsBloc]
///
/// Автоматически загружает статистику при создании.
class StatisticsProvider extends StatelessWidget {
  final UuidValue applicationId;
  final Widget child;

  const StatisticsProvider({
    super.key,
    required this.applicationId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<StatisticsRepository>(
      create: (_) => StatisticsRepositoryImpl(
        statisticsEndpoint: clientService.client.statistics,
      ),
      child: BlocProvider(
        create: (context) => StatisticsBloc(
          statisticsRepository: context.read<StatisticsRepository>(),
        )..add(StatisticsEvent.loadAll(applicationId: applicationId)),
        child: child,
      ),
    );
  }
}
