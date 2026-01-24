import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/shared/services/api_client_service.dart';

class AuthProvider extends StatelessWidget {
  final Widget child;
  const AuthProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(apiClientService: context.read<ApiClientService>())..add(AuthEvent.checkAuthentication()),
      child: child,
    );
  }
}