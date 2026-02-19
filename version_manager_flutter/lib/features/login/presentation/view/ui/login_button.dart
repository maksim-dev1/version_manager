import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';
import 'package:version_manager_flutter/version_manager_app.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback submit;
  const LoginButton({
    super.key,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) => switch (state) {
        LoginSuccess() => () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VersionManagerApp(),
            ),
          );
        }(),
        LoginError(:final message) => NotificationService.showError(
          context,
          message,
        ),
        _ => null,
      },
      builder: (context, state) => switch (state) {
        LoginLoading() => FilledButton(
          onPressed: null,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colorScheme.onPrimary,
            ),
          ),
        ),
        _ => FilledButton(
          onPressed: submit,
          child: const Text('Войти'),
        ),
      },
    );
  }
}
