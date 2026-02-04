import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/email_check/data/repository/email_check_repository_impl.dart';
import 'package:version_manager_flutter/features/email_check/domain/repository/email_check_repository.dart';
import 'package:version_manager_flutter/features/email_check/presentation/bloc/email_check_bloc.dart';
import 'package:version_manager_flutter/shared/services/client_service.dart';

class EmailCheckProvider extends StatelessWidget {
  final Widget child;
  const EmailCheckProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<EmailCheckRepository>(
      create: (context) => EmailCheckRepositoryImpl(
        authEndpoint: context.read<ClientService>().auth,
      ),
      child: BlocProvider(
        create: (context) => EmailCheckBloc(
          emailCheckRepository: context.read<EmailCheckRepository>(),
        ),
        child: child,
      ),
    );
  }
}
