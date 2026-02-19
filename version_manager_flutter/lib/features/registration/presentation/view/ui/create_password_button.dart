import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';
import 'package:version_manager_flutter/version_manager_app.dart';

class CreatePasswordButton extends StatelessWidget {
  final VoidCallback submit;
  final bool isPasswordValid;
  final bool passwordsMatch;
  const CreatePasswordButton({
    super.key,
    required this.submit,
    required this.isPasswordValid,
    required this.passwordsMatch,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) => switch (state) {
        RegistrationSuccess() => () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VersionManagerApp(),
            ),
          );
        }(),
        RegistrationError(:final message) => NotificationService.showError(
          context,
          message,
        ),
        _ => null,
      },
      builder: (context, state) => switch (state) {
        RegistrationLoading() => FilledButton(
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
          onPressed: (isPasswordValid && passwordsMatch) ? submit : null,
          child: const Text('Создать пароль'),
        ),
      },
    );
  }
}
