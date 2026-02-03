import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:version_manager_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:version_manager_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

class AuthProviedr extends StatelessWidget {
  final Widget child;
  const AuthProviedr({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        authEndpoint: context.read<ClientService>().auth,
        storageService: context.read<StorageService>(),
      ),
      child: BlocProvider(
        create: (context) =>
            AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(
              AuthEvent.checkAuth(),
            ),
        child: child,
      ),
    );
  }
}
