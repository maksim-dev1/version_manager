import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

/// Главный экран авторизации
class AuthScreen extends StatefulWidget {
  final Client client;

  const AuthScreen({super.key, required this.client});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthStep _currentStep = AuthStep.checkEmail;
  String _email = '';
  UuidValue? _verificationId;
  bool _isLoading = false;
  String? _errorMessage;
  int? _retryAfterSeconds;
  int? _attemptsLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.purple.shade50,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(32),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 450),
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 32),
                    _buildCurrentStep(),
                    if (_errorMessage != null) ...[
                      SizedBox(height: 16),
                      _buildErrorMessage(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.rocket_launch,
            size: 48,
            color: Colors.blue.shade700,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Version Manager',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          _getStepTitle(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  String _getStepTitle() {
    switch (_currentStep) {
      case AuthStep.checkEmail:
        return 'Введите email для продолжения';
      case AuthStep.login:
        return 'Вход в аккаунт';
      case AuthStep.registerCode:
        return 'Проверьте почту';
      case AuthStep.registerPassword:
        return 'Создайте пароль';
    }
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case AuthStep.checkEmail:
        return _CheckEmailForm(
          isLoading: _isLoading,
          onSubmit: _handleCheckEmail,
        );
      case AuthStep.login:
        return _LoginForm(
          email: _email,
          isLoading: _isLoading,
          onSubmit: _handleLogin,
          onBack: () => setState(() {
            _currentStep = AuthStep.checkEmail;
            _errorMessage = null;
          }),
        );
      case AuthStep.registerCode:
        return _RegisterCodeForm(
          email: _email,
          isLoading: _isLoading,
          retryAfterSeconds: _retryAfterSeconds,
          attemptsLeft: _attemptsLeft,
          onSubmit: _handleVerifyCode,
          onResend: _handleResendCode,
          onBack: () => setState(() {
            _currentStep = AuthStep.checkEmail;
            _errorMessage = null;
          }),
        );
      case AuthStep.registerPassword:
        return _RegisterPasswordForm(
          email: _email,
          verificationId: _verificationId!,
          isLoading: _isLoading,
          onSubmit: _handleSetPassword,
        );
    }
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }

  // Handlers

  Future<void> _handleCheckEmail(String email) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _email = email;
    });

    try {
      final response = await widget.client.auth.checkEmail(
        CheckEmailRequest(email: email),
      );

      if (response.exists) {
        // Переход на вход
        setState(() {
          _currentStep = AuthStep.login;
        });
      } else {
        // Отправка кода регистрации
        await _handleSendCode();
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleSendCode() async {
    setState(() => _isLoading = true);

    try {
      final response = await widget.client.auth.registerSendCode(
        RegisterSendCodeRequest(email: _email),
      );

      if (response.success) {
        setState(() {
          _currentStep = AuthStep.registerCode;
          _retryAfterSeconds = null;
        });
      } else {
        setState(() {
          _retryAfterSeconds = response.retryAfterSeconds;
          _errorMessage = 'Подождите ${response.retryAfterSeconds} секунд';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка отправки кода: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleResendCode() async {
    await _handleSendCode();
  }

  Future<void> _handleVerifyCode(String code) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await widget.client.auth.registerVerifyCode(
        RegisterVerifyCodeRequest(email: _email, code: code),
      );

      if (response.success && response.verificationId != null) {
        setState(() {
          _verificationId = response.verificationId;
          _currentStep = AuthStep.registerPassword;
        });
      } else {
        setState(() {
          _attemptsLeft = response.attemptsLeft;
          _errorMessage = response.message ?? 'Неверный код';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleSetPassword(String password) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await widget.client.auth.registerSetPassword(
        RegisterSetPasswordRequest(
          email: _email,
          verificationId: _verificationId!,
          password: password,
        ),
      );

      // Сохраняем токены и переходим в приложение
      await _saveTokensAndNavigate(response);
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleLogin(String password) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await widget.client.auth.login(
        LoginRequest(email: _email, password: password),
      );

      await _saveTokensAndNavigate(response);
    } catch (e) {
      setState(() {
        _errorMessage = 'Неверный пароль или email';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveTokensAndNavigate(AuthResponse response) async {
    // TODO: Сохраните токены в secure storage
    print('Access Token: ${response.accessToken}');
    print('Refresh Token: ${response.refreshToken}');
    print('User: ${response.user.email}');

    // TODO: Навигация на главный экран
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Добро пожаловать, ${response.user.email}!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

// Enum для шагов авторизации
enum AuthStep {
  checkEmail,
  login,
  registerCode,
  registerPassword,
}

// Форма проверки email
class _CheckEmailForm extends StatefulWidget {
  final bool isLoading;
  final Function(String) onSubmit;

  const _CheckEmailForm({
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<_CheckEmailForm> createState() => _CheckEmailFormState();
}

class _CheckEmailFormState extends State<_CheckEmailForm> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            enabled: !widget.isLoading,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'example@mail.com',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите email';
              }
              if (!value.contains('@')) {
                return 'Некорректный email';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit(_controller.text.trim());
                      }
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Продолжить', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

// Форма входа
class _LoginForm extends StatefulWidget {
  final String email;
  final bool isLoading;
  final Function(String) onSubmit;
  final VoidCallback onBack;

  const _LoginForm({
    required this.email,
    required this.isLoading,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: widget.email,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _controller,
            enabled: !widget.isLoading,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Пароль',
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите пароль';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit(_controller.text);
                      }
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Войти', style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(height: 12),
          TextButton.icon(
            onPressed: widget.isLoading ? null : widget.onBack,
            icon: Icon(Icons.arrow_back),
            label: Text('Другой email'),
          ),
        ],
      ),
    );
  }
}

// Форма ввода кода
class _RegisterCodeForm extends StatefulWidget {
  final String email;
  final bool isLoading;
  final int? retryAfterSeconds;
  final int? attemptsLeft;
  final Function(String) onSubmit;
  final VoidCallback onResend;
  final VoidCallback onBack;

  const _RegisterCodeForm({
    required this.email,
    required this.isLoading,
    required this.retryAfterSeconds,
    required this.attemptsLeft,
    required this.onSubmit,
    required this.onResend,
    required this.onBack,
  });

  @override
  State<_RegisterCodeForm> createState() => _RegisterCodeFormState();
}

class _RegisterCodeFormState extends State<_RegisterCodeForm> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Код отправлен на',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          SizedBox(height: 4),
          Text(
            widget.email,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: _controller,
            enabled: !widget.isLoading,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, letterSpacing: 8),
            maxLength: 6,
            decoration: InputDecoration(
              labelText: 'Код из письма',
              hintText: '000000',
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите код';
              }
              if (value.length != 6) {
                return 'Код состоит из 6 цифр';
              }
              return null;
            },
          ),
          if (widget.attemptsLeft != null) ...[
            SizedBox(height: 8),
            Text(
              'Осталось попыток: ${widget.attemptsLeft}',
              style: TextStyle(
                color: widget.attemptsLeft! > 2 ? Colors.orange : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit(_controller.text);
                      }
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Подтвердить', style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(height: 12),
          if (widget.retryAfterSeconds != null)
            Text(
              'Повторная отправка через ${widget.retryAfterSeconds}с',
              style: TextStyle(color: Colors.grey.shade600),
            )
          else
            TextButton.icon(
              onPressed: widget.isLoading ? null : widget.onResend,
              icon: Icon(Icons.refresh),
              label: Text('Отправить код снова'),
            ),
          TextButton.icon(
            onPressed: widget.isLoading ? null : widget.onBack,
            icon: Icon(Icons.arrow_back),
            label: Text('Назад'),
          ),
        ],
      ),
    );
  }
}

// Форма создания пароля
class _RegisterPasswordForm extends StatefulWidget {
  final String email;
  final UuidValue verificationId;
  final bool isLoading;
  final Function(String) onSubmit;

  const _RegisterPasswordForm({
    required this.email,
    required this.verificationId,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<_RegisterPasswordForm> createState() => _RegisterPasswordFormState();
}

class _RegisterPasswordFormState extends State<_RegisterPasswordForm> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _passwordController,
            enabled: !widget.isLoading,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Пароль',
              hintText: 'Минимум 8 символов',
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите пароль';
              }
              if (value.length < 8) {
                return 'Минимум 8 символов';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _confirmController,
            enabled: !widget.isLoading,
            obscureText: _obscureConfirm,
            decoration: InputDecoration(
              labelText: 'Повторите пароль',
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirm ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => _obscureConfirm = !_obscureConfirm);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value != _passwordController.text) {
                return 'Пароли не совпадают';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit(_passwordController.text);
                      }
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Создать аккаунт', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

