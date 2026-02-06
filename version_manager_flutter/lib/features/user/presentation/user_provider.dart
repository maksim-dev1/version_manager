import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/user/data/repository/user_repository_impl.dart';
import 'package:version_manager_flutter/features/user/domain/repository/user_repository.dart';
import 'package:version_manager_flutter/features/user/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

/// Провайдер фичи «Пользователь».
///
/// Создаёт и предоставляет:
/// - [UserRepository]
/// - [UserProfileBloc]
class UserProvider extends StatelessWidget {
  final Widget child;

  const UserProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<UserRepository>(
      create: (_) => UserRepositoryImpl(
        authEndpoint: clientService.auth,
      ),
      child: BlocProvider(
        create: (context) => UserProfileBloc(
          userRepository: context.read<UserRepository>(),
        )..add(const UserProfileEvent.loadProfile()),
        child: child,
      ),
    );
  }
}
