import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:version_manager_flutter/features/login/presentation/view/ui/login_button.dart';

class LoginScreen extends StatefulWidget {
  final String email;
  const LoginScreen({super.key, required this.email});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите пароль';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
        LoginEvent.login(
          email: widget.email,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Иконка
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
                                      Icons.login_outlined,
                                      size: 40,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Заголовок
                              Text(
                                'Вход в систему',
                                style: textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),

                              // Подзаголовок с email
                              Text(
                                'Введите пароль для входа в аккаунт\n${widget.email}',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 32),

                              // Поле пароля
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.done,
                                validator: _validatePassword,
                                onFieldSubmitted: (_) => _submit(),
                                decoration: InputDecoration(
                                  labelText: 'Пароль',
                                  hintText: 'Введите ваш пароль',
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: colorScheme.primary,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: colorScheme.surface,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.outline,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.outline,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.primary,
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.error,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.error,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Кнопка "Забыли пароль?"
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // TODO: Восстановление пароля
                                  },
                                  child: Text(
                                    'Забыли пароль?',
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Кнопка входа
                              LoginButton(
                                submit: _submit,
                              ),
                            ],
                          ),
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
