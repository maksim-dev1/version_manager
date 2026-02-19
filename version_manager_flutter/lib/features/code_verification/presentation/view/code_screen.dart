import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:version_manager_flutter/features/code_verification/presentation/bloc/code_verification_bloc.dart';
import 'package:version_manager_flutter/features/code_verification/presentation/view/code_confirm_button.dart';

class CodeScreen extends StatefulWidget {
  final String email;
  const CodeScreen({super.key, required this.email});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _pinController = TextEditingController();
  int _remainingSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _remainingSeconds = 60);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    context.read<CodeVerificationBloc>().add(
      CodeVerificationEvent.resendCode(
        email: widget.email,
      ),
    );
    _startTimer();
  }

  void _submit() {
    final code = _pinController.text.trim();
    context.read<CodeVerificationBloc>().add(
      CodeVerificationEvent.verifyCode(
        email: widget.email,
        code: code,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 64,
      textStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline),
      ),
    );

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withValues(alpha: 0.05),
              colorScheme.secondary.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width < 600 ? 16 : 24,
              vertical: 24,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Stack(
                children: [
                  Card(
                    elevation: 8,
                    shadowColor: colorScheme.shadow.withValues(alpha: 0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colorScheme.surface,
                            colorScheme.surfaceContainerHighest,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.sizeOf(context).width < 600 ? 24 : 40,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: colorScheme.primaryContainer,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.verified_user_outlined,
                                    size: 40,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            Text(
                              'Подтвердите код',
                              style: textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),

                            Text(
                              'Введите код подтверждения, отправленный на ваш email: ${widget.email}',
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),

                            // Pinput
                            Center(
                              child:
                                  BlocBuilder<
                                    CodeVerificationBloc,
                                    CodeVerificationState
                                  >(
                                    builder: (context, state) {
                                      final isDisabled =
                                          state is CodeVerificationError &&
                                          state.isAttemptsExhausted;

                                      return Pinput(
                                        controller: _pinController,
                                        length: 6,
                                        enabled: !isDisabled,
                                        defaultPinTheme: defaultPinTheme,
                                        focusedPinTheme: defaultPinTheme
                                            .copyWith(
                                              decoration: defaultPinTheme
                                                  .decoration!
                                                  .copyWith(
                                                    border: Border.all(
                                                      color:
                                                          colorScheme.primary,
                                                      width: 2,
                                                    ),
                                                  ),
                                            ),
                                        disabledPinTheme: defaultPinTheme
                                            .copyWith(
                                              decoration: defaultPinTheme
                                                  .decoration!
                                                  .copyWith(
                                                    color: colorScheme
                                                        .surfaceContainerHighest,
                                                    border: Border.all(
                                                      color: colorScheme.outline
                                                          .withValues(
                                                            alpha: 0.3,
                                                          ),
                                                    ),
                                                  ),
                                              textStyle: defaultPinTheme
                                                  .textStyle
                                                  ?.copyWith(
                                                    color: colorScheme
                                                        .onSurfaceVariant
                                                        .withValues(alpha: 0.5),
                                                  ),
                                            ),
                                        errorPinTheme: defaultPinTheme.copyWith(
                                          decoration: defaultPinTheme
                                              .decoration!
                                              .copyWith(
                                                border: Border.all(
                                                  color: colorScheme.error,
                                                ),
                                              ),
                                        ),
                                        pinputAutovalidateMode:
                                            PinputAutovalidateMode.onSubmit,
                                        showCursor: true,
                                        onCompleted: (pin) =>
                                            isDisabled ? null : _submit(),
                                      );
                                    },
                                  ),
                            ),
                            const SizedBox(height: 32),
                            CodeConfirmButton(submit: _submit),
                            const SizedBox(height: 16),

                            // Кнопка "Запросить код снова"
                            TextButton(
                              onPressed: _remainingSeconds == 0
                                  ? _resendCode
                                  : null,
                              child: Text(
                                _remainingSeconds > 0
                                    ? 'Запросить код снова через $_remainingSecondsс'
                                    : 'Запросить код снова',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: colorScheme.onSurface,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
