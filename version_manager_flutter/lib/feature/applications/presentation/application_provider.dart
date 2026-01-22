import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/feature/applications/data/repositories/application_repository_impl.dart';
import 'package:version_manager_flutter/feature/applications/domain/repository/application_repository.dart';
import 'package:version_manager_flutter/feature/applications/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/shared/services/api_service.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget child;
  const ApplicationProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ApplicationRepository>(
      create: (context) => ApplicationRepositoryImpl(
        apiService: context.read<ApiService>(),
      ),
      child: BlocProvider(
        create: (context) => ApplicationBloc(
          applicationRepository: context.read<ApplicationRepository>(),
        ),
        child: child,
      ),
    );
  }
}
