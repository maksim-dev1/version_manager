import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../widgets/auth_widgets.dart';
import 'register_screen.dart';
import 'password_reset_screen.dart';

/// Экран входа
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    bool isValid = true;

    setState(() {
      _emailError = null;
      _passwordError = null;

      final email = _emailController.text.trim();
      final password = _passwordController.text;

      if (email.isEmpty) {
        _emailError = 'Введите email';
        isValid = false;
      } else if (!_isValidEmail(email)) {
        _emailError = 'Неверный формат email';
        isValid = false;
      }

      if (password.isEmpty) {
        _passwordError = 'Введите пароль';
        isValid = false;
      }
    });

    return isValid;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _handleLogin() async {
    if (!_validateInputs()) return;

    final authService = context.read<AuthService>();

    final success = await authService.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (!success && mounted) {
      // Ошибка уже установлена в authService
    }
  }

  void _navigateToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
  }

  void _navigateToPasswordReset() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const PasswordResetScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SizedBox(height: 40),

                    const AuthHeader(
                      icon: Icons.lock_outline,
                      title: 'Вход',
                      subtitle: 'Войдите в свой аккаунт',
                    ),

                    const SizedBox(height: 40),

                    if (authService.error != null) ...[
                      ErrorMessage(message: authService.error),
                      const SizedBox(height: 16),
                    ],

                    EmailTextField(
                      controller: _emailController,
                      errorText: _emailError,
                      onSubmitted: (_) => _handleLogin(),
                    ),

                    const SizedBox(height: 16),

                    PasswordTextField(
                      controller: _passwordController,
                      errorText: _passwordError,
                      onSubmitted: (_) => _handleLogin(),
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _navigateToPasswordReset,
                        child: const Text('Забыли пароль?'),
                      ),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: authService.isLoading ? null : _handleLogin,
                      child: const Text('Войти'),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Нет аккаунта? ',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        TextButton(
                          onPressed: _navigateToRegister,
                          child: const Text('Зарегистрироваться'),
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
