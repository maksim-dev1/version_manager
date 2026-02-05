import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:version_manager_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:version_manager_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

class AuthProviedr extends StatelessWidget {
  final Widget child;
  const AuthProviedr({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        authEndpoint: clientService.auth,
        authKeyProvider: clientService.authKeyProvider,
      ),
      child: BlocProvider(
        create: (context) {
          final authRepository = context.read<AuthRepository>();
          final authBloc = AuthBloc(authRepository: authRepository);

          // Устанавливаем callback для обработки ошибок аутентификации
          // (когда refresh token истёк)
          authRepository.setOnAuthenticationFailed(() {
            authBloc.add(const AuthEvent.logout());
          });

          // Проверяем начальное состояние авторизации
          authBloc.add(const AuthEvent.checkAuth());

          return authBloc;
        },
        child: child,
      ),
    );
  }
}
