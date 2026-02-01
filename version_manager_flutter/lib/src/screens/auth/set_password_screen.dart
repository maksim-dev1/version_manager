import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../widgets/auth_widgets.dart';
import 'verification_code_screen.dart';

/// Экран установки пароля (финальный шаг регистрации или сброса пароля)
class SetPasswordScreen extends StatefulWidget {
  final String email;
  final int verificationId;
  final String code;
  final VerificationMode mode;

  const SetPasswordScreen({
    super.key,
    required this.email,
    required this.verificationId,
    required this.code,
    required this.mode,
  });

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    bool isValid = true;

    setState(() {
      _passwordError = null;
      _confirmPasswordError = null;

      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      // Проверка пароля
      if (password.isEmpty) {
        _passwordError = 'Введите пароль';
        isValid = false;
      } else if (password.length < 8) {
        _passwordError = 'Пароль должен быть не менее 8 символов';
        isValid = false;
      } else if (!_hasUpperCase(password)) {
        _passwordError = 'Пароль должен содержать заглавную букву';
        isValid = false;
      } else if (!_hasLowerCase(password)) {
        _passwordError = 'Пароль должен содержать строчную букву';
        isValid = false;
      } else if (!_hasDigit(password)) {
        _passwordError = 'Пароль должен содержать цифру';
        isValid = false;
      }

      // Проверка подтверждения
      if (confirmPassword.isEmpty) {
        _confirmPasswordError = 'Подтвердите пароль';
        isValid = false;
      } else if (confirmPassword != password) {
        _confirmPasswordError = 'Пароли не совпадают';
        isValid = false;
      }
    });

    return isValid;
  }

  bool _hasUpperCase(String value) => value.contains(RegExp(r'[A-Z]'));
  bool _hasLowerCase(String value) => value.contains(RegExp(r'[a-z]'));
  bool _hasDigit(String value) => value.contains(RegExp(r'[0-9]'));

  Future<void> _handleSubmit() async {
    if (!_validateInputs()) return;

    final authService = context.read<AuthService>();

    bool success;

    if (widget.mode == VerificationMode.registration) {
      success = await authService.completeRegistration(
        verificationId: widget.verificationId,
        code: widget.code,
        password: _passwordController.text,
      );
    } else {
      success = await authService.completePasswordReset(
        verificationId: widget.verificationId,
        code: widget.code,
        newPassword: _passwordController.text,
      );
    }

    if (!mounted) return;

    if (success) {
      // Очищаем навигационный стек и возвращаемся к началу
      Navigator.of(context).popUntil((route) => route.isFirst);

      if (widget.mode == VerificationMode.passwordReset) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пароль успешно изменён. Войдите с новым паролем.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  String get _title {
    switch (widget.mode) {
      case VerificationMode.registration:
        return 'Создание аккаунта';
      case VerificationMode.passwordReset:
        return 'Новый пароль';
    }
  }

  String get _subtitle {
    switch (widget.mode) {
      case VerificationMode.registration:
        return 'Придумайте надёжный пароль для вашего аккаунта';
      case VerificationMode.passwordReset:
        return 'Придумайте новый пароль для вашего аккаунта';
    }
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
                      icon: widget.mode == VerificationMode.registration
                          ? Icons.person_add_outlined
                          : Icons.lock_reset_outlined,
                      title: _title,
                      subtitle: _subtitle,
                    ),

                    const SizedBox(height: 40),

                    if (authService.error != null) ...[
                      ErrorMessage(message: authService.error),
                      const SizedBox(height: 16),
                    ],

                    PasswordTextField(
                      controller: _passwordController,
                      label: widget.mode == VerificationMode.registration
                          ? 'Пароль'
                          : 'Новый пароль',
                      errorText: _passwordError,
                    ),

                    const SizedBox(height: 16),

                    PasswordTextField(
                      controller: _confirmPasswordController,
                      label: 'Подтвердите пароль',
                      errorText: _confirmPasswordError,
                      onSubmitted: (_) => _handleSubmit(),
                    ),

                    const SizedBox(height: 12),

                    // Подсказки по паролю
                    _buildPasswordHints(),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: authService.isLoading ? null : _handleSubmit,
                      child: Text(
                        widget.mode == VerificationMode.registration
                            ? 'Создать аккаунт'
                            : 'Сохранить пароль',
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

  Widget _buildPasswordHints() {
    final password = _passwordController.text;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Требования к паролю:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          _buildHintRow('Минимум 8 символов', password.length >= 8),
          _buildHintRow('Заглавная буква (A-Z)', _hasUpperCase(password)),
          _buildHintRow('Строчная буква (a-z)', _hasLowerCase(password)),
          _buildHintRow('Цифра (0-9)', _hasDigit(password)),
        ],
      ),
    );
  }

  Widget _buildHintRow(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.circle_outlined,
            size: 16,
            color: isValid ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isValid ? Colors.green.shade700 : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
