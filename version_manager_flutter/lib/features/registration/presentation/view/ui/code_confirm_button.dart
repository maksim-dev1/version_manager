import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:version_manager_flutter/features/registration/presentation/view/password_screen.dart';
import 'package:version_manager_flutter/shared/services/notification_service.dart';

class CodeConfirmButton extends StatelessWidget {
  final VoidCallback submit;
  const CodeConfirmButton({super.key, required this.submit});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) => switch (state) {
        CodeConfirmated(:final email) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordScreen(email: email),
          ),
        ),

        AttemptsExhausted(:final message) => NotificationService.showError(
          context,
          message,
        ),

        RegistrationError(:final message) => NotificationService.showError(
          context,
          message,
        ),
        _ => null,
      },
      builder: (context, state) => switch (state) {
        RegistrationLoading() => FilledButton(
          onPressed: null,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colorScheme.onPrimary,
            ),
          ),
        ),
        AttemptsExhausted() => FilledButton(
          onPressed: null,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: colorScheme.surfaceContainerHighest,
          ),
          child: Text(
            'Попытки исчерпаны',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        _ => FilledButton(
          onPressed: submit,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Подтвердить',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      },
    );
  }
}
