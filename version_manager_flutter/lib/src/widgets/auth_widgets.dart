import 'package:flutter/material.dart';

/// Общие UI компоненты для экранов авторизации

/// Виджет загрузки поверх контента
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black26,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

/// Поле ввода email
class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const EmailTextField({
    super.key,
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'your@email.com',
        prefixIcon: const Icon(Icons.email_outlined),
        errorText: errorText,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}

/// Поле ввода пароля
class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.label = 'Пароль',
    this.hintText,
    this.errorText,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      enabled: widget.enabled,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock_outline),
        errorText: widget.errorText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
    );
  }
}

/// Поле ввода кода верификации
class VerificationCodeField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const VerificationCodeField({
    super.key,
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 6,
      enabled: enabled,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 8,
      ),
      decoration: InputDecoration(
        labelText: 'Код подтверждения',
        hintText: '000000',
        errorText: errorText,
        counterText: '',
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}

/// Заголовок экрана авторизации
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (icon != null) ...[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
        ],
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Сообщение об ошибке
class ErrorMessage extends StatelessWidget {
  final String? message;

  const ErrorMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null || message!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Таймер повторной отправки кода
class ResendCodeTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;

  const ResendCodeTimer({
    super.key,
    this.seconds = 60,
    required this.onResend,
  });

  @override
  State<ResendCodeTimer> createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
        _startTimer();
      }
    });
  }

  void _handleResend() {
    widget.onResend();
    setState(() {
      _remainingSeconds = widget.seconds;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingSeconds > 0) {
      return Text(
        'Отправить код повторно через $_remainingSeconds сек.',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
        ),
      );
    }

    return TextButton(
      onPressed: _handleResend,
      child: const Text('Отправить код повторно'),
    );
  }
}
