import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/session/data/repository/session_repository_impl.dart';
import 'package:version_manager_flutter/features/session/domain/repository/session_repository.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Сессии».
///
/// Создаёт и предоставляет:
/// - [SessionRepository]
/// - [SessionBloc]
class SessionProvider extends StatelessWidget {
  final Widget child;

  const SessionProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<SessionRepository>(
      create: (_) => SessionRepositoryImpl(
        sessionEndpoint: clientService.client.session,
      ),
      child: BlocProvider(
        create: (context) => SessionBloc(
          sessionRepository: context.read<SessionRepository>(),
        )..add(const SessionEvent.loadSessions()),
        child: child,
      ),
    );
  }
}
