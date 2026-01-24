import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:version_manager_flutter/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/shared/services/api_client_service.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInWidget(client: context.read<ApiClientService>().client,
      onAuthenticated: () => context.read<AuthBloc>().add(const AuthEvent.checkAuthentication()),

      onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка аутентификации: $error')),
        );
      },
      ),
    );
  }
}