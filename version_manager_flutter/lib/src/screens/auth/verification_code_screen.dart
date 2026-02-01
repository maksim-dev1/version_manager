import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../widgets/auth_widgets.dart';
import 'set_password_screen.dart';

/// Режим верификации
enum VerificationMode {
  registration,
  passwordReset,
}

/// Экран ввода кода верификации
class VerificationCodeScreen extends StatefulWidget {
  final String email;
  final int verificationId;
  final VerificationMode mode;
  final int cooldownSeconds;

  const VerificationCodeScreen({
    super.key,
    required this.email,
    required this.verificationId,
    required this.mode,
    this.cooldownSeconds = 60,
  });

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final _codeController = TextEditingController();

  String? _codeError;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  bool _validateCode() {
    final code = _codeController.text.trim();

    setState(() {
      _codeError = null;

      if (code.isEmpty) {
        _codeError = 'Введите код';
      } else if (code.length != 6) {
        _codeError = 'Код должен содержать 6 цифр';
      } else if (!RegExp(r'^\d{6}$').hasMatch(code)) {
        _codeError = 'Код должен содержать только цифры';
      }
    });

    return _codeError == null;
  }

  Future<void> _handleVerify() async {
    if (!_validateCode()) return;

    if (!mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SetPasswordScreen(
          email: widget.email,
          verificationId: widget.verificationId,
          code: _codeController.text.trim(),
          mode: widget.mode,
        ),
      ),
    );
  }

  Future<void> _handleResend() async {
    final authService = context.read<AuthService>();

    try {
      if (widget.mode == VerificationMode.registration) {
        await authService.startRegistration(widget.email);
      } else {
        await authService.startPasswordReset(widget.email);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Код отправлен повторно'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  String get _title {
    switch (widget.mode) {
      case VerificationMode.registration:
        return 'Подтверждение email';
      case VerificationMode.passwordReset:
        return 'Сброс пароля';
    }
  }

  String get _subtitle {
    return 'Введите код, отправленный на\n${widget.email}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<AuthService>(
        builder: (context, authService, _) {
          return LoadingOverlay(
            isLoading: authService.isLoading,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    AuthHeader(
                      icon: Icons.mark_email_read_outlined,
                      title: _title,
                      subtitle: _subtitle,
                    ),

                    const SizedBox(height: 40),

                    if (authService.error != null) ...[
                      ErrorMessage(message: authService.error),
                      const SizedBox(height: 16),
                    ],

                    VerificationCodeField(
                      controller: _codeController,
                      errorText: _codeError,
                      onChanged: (value) {
                        if (value.length == 6) {
                          _handleVerify();
                        }
                      },
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: authService.isLoading ? null : _handleVerify,
                      child: const Text('Подтвердить'),
                    ),

                    const SizedBox(height: 24),

                    Center(
                      child: ResendCodeTimer(
                        seconds: widget.cooldownSeconds,
                        onResend: _handleResend,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
