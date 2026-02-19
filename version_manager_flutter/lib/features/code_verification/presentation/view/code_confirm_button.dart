import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/code_verification/presentation/bloc/code_verification_bloc.dart';
import 'package:version_manager_flutter/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:version_manager_flutter/features/registration/presentation/view/create_password_screen.dart';
import 'package:version_manager_flutter/shared/services/app_notification.dart';

class CodeConfirmButton extends StatelessWidget {
  final VoidCallback submit;
  const CodeConfirmButton({super.key, required this.submit});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<CodeVerificationBloc, CodeVerificationState>(
      listener: (context, state) => switch (state) {
        CodeVerificationVerified(:final email) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<RegistrationBloc>(),
              child: CreatePasswordScreen(email: email),
            ),
          ),
        ),

        CodeVerificationError(:final message, :final isAttemptsExhausted) =>
          isAttemptsExhausted
              ? NotificationService.showError(context, message)
              : NotificationService.showError(context, message),

        _ => null,
      },
      builder: (context, state) => switch (state) {
        CodeVerificationLoading() => FilledButton(
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
        CodeVerificationError(:final isAttemptsExhausted)
            when isAttemptsExhausted =>
          FilledButton(
            onPressed: null,
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.surfaceContainerHighest,
            ),
            child: Text(
              'Попытки исчерпаны',
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
          ),
        _ => FilledButton(
          onPressed: submit,
          child: const Text('Подтвердить'),
        ),
      },
    );
  }
}
