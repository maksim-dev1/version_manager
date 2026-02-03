import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/login/data/repository/login_repository_impl.dart';
import 'package:version_manager_flutter/features/login/domain/repository/login_repository.dart';
import 'package:version_manager_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';
import 'package:version_manager_flutter/shared/services/storage_service.dart';

class LoginProvider extends StatelessWidget {
  final Widget child;
  const LoginProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<LoginRepository>(
      create: (context) => LoginRepositoryImpl(
        authEndpoint: context.read<ClientService>().auth,
        storageService: context.read<StorageService>(),
      ),
      child: BlocProvider(
        create: (context) => LoginBloc(
          loginRepository: context.read<LoginRepository>(),
        ),
        child: child,
      ),
    );
  }
}
