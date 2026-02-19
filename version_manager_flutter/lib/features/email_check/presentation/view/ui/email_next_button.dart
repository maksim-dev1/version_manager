import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/email_check/presentation/bloc/email_check_bloc.dart';
import 'package:version_manager_flutter/features/login/presentation/login_provider.dart';
import 'package:version_manager_flutter/features/login/presentation/view/login_screen.dart';
import 'package:version_manager_flutter/features/registration/presentation/registration_provider.dart';
import 'package:version_manager_flutter/features/code_verification/presentation/view/code_screen.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';

class EmailNextButton extends StatelessWidget {
  final VoidCallback handleSubmit;
  const EmailNextButton({super.key, required this.handleSubmit});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocConsumer<EmailCheckBloc, EmailCheckState>(
      listener: (context, state) => switch (state) {
        EmailCheckSuccess(
          :final emailExists,
          :final email,
        ) =>
          {
            if (emailExists)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginProvider(
                      child: LoginScreen(
                        email: email,
                      ),
                    ),
                  ),
                ),
              }
            else
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationProvider(
                      child: CodeScreen(
                        email: email,
                      ),
                    ),
                  ),
                ),
              },
          },
        EmailCheckError(:final message) => NotificationService.showError(
          context,
          message,
        ),

        _ => null,
      },
      builder: (context, state) => switch (state) {
        EmailCheckLoading() => FilledButton(
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
          onPressed: handleSubmit,
          child: const Text('Продолжить'),
        ),
      },
    );
  }
}
