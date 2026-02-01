import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../widgets/auth_widgets.dart';
import 'verification_code_screen.dart';

/// Экран регистрации
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();

  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _validateEmail() {
    final email = _emailController.text.trim();

    setState(() {
      _emailError = null;

      if (email.isEmpty) {
        _emailError = 'Введите email';
      } else if (!_isValidEmail(email)) {
        _emailError = 'Неверный формат email';
      }
    });

    return _emailError == null;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _handleContinue() async {
    if (!_validateEmail()) return;

    final authService = context.read<AuthService>();
    final email = _emailController.text.trim();

    try {
      // Проверяем, не занят ли email
      final checkResult = await authService.checkEmail(email);

      if (!mounted) return;

      if (checkResult.exists) {
        setState(() {
          _emailError = 'Этот email уже зарегистрирован';
        });
        return;
      }

      // Отправляем код верификации
      final result = await authService.startRegistration(email);

      if (!mounted) return;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => VerificationCodeScreen(
            email: email,
            verificationId: result.verificationId,
            mode: VerificationMode.registration,
            cooldownSeconds: 60,
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        _showError('Произошла ошибка. Попробуйте позже.');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
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

                    const AuthHeader(
                      icon: Icons.person_add_outlined,
                      title: 'Регистрация',
                      subtitle: 'Введите email для создания аккаунта',
                    ),

                    const SizedBox(height: 40),

                    if (authService.error != null) ...[
                      ErrorMessage(message: authService.error),
                      const SizedBox(height: 16),
                    ],

                    EmailTextField(
                      controller: _emailController,
                      errorText: _emailError,
                      onSubmitted: (_) => _handleContinue(),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: authService.isLoading ? null : _handleContinue,
                      child: const Text('Продолжить'),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Уже есть аккаунт? ',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Войти'),
                        ),
                      ],
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
