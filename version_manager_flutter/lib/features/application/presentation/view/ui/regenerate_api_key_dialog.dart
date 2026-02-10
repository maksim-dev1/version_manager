import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';

/// Диалог регенерации API ключа с подтверждением через email.
///
/// 2-шаговый процесс:
/// 1. Подтверждение и отправка кода на email
/// 2. Ввод 6-значного кода → регенерация
class RegenerateApiKeyDialog extends StatefulWidget {
  final Application application;

  const RegenerateApiKeyDialog({super.key, required this.application});

  @override
  State<RegenerateApiKeyDialog> createState() => _RegenerateApiKeyDialogState();
}

enum _DialogStep { confirm, enterCode, loading, success }

class _RegenerateApiKeyDialogState extends State<RegenerateApiKeyDialog> {
  _DialogStep _step = _DialogStep.confirm;
  final _codeController = TextEditingController();
  String? _errorText;
  bool _isSending = false;
  int _retryAfterSeconds = 0;
  Timer? _retryTimer;
  String? _newApiKey;
  String? _maskedEmail;
  bool _isLoadingEmail = true;

  @override
  void initState() {
    super.initState();
    context.read<ApplicationBloc>().add(
      ApplicationEvent.fetchRegenerationEmail(
        applicationId: widget.application.id!,
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    _retryTimer?.cancel();
    super.dispose();
  }

  void _startRetryTimer(int seconds) {
    _retryAfterSeconds = seconds;
    _retryTimer?.cancel();
    _retryTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _retryAfterSeconds--;
        if (_retryAfterSeconds <= 0) {
          timer.cancel();
        }
      });
    });
  }

  void _sendCode() {
    setState(() {
      _isSending = true;
      _errorText = null;
    });
    context.read<ApplicationBloc>().add(
      ApplicationEvent.requestApiKeyRegeneration(
        applicationId: widget.application.id!,
      ),
    );
  }

  void _submitCode() {
    final code = _codeController.text.trim();
    if (code.length != 6) {
      setState(() => _errorText = 'Введите 6-значный код');
      return;
    }
    setState(() {
      _step = _DialogStep.loading;
      _errorText = null;
    });
    context.read<ApplicationBloc>().add(
      ApplicationEvent.regenerateApiKey(
        applicationId: widget.application.id!,
        code: code,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        if (state is ApplicationRegenerationEmailLoaded) {
          setState(() {
            _maskedEmail = state.maskedEmail;
            _isLoadingEmail = false;
          });
        } else if (state is ApplicationApiKeyRegenerationCodeSent) {
          setState(() {
            _isSending = false;
            _step = _DialogStep.enterCode;
            if (state.maskedEmail != null) {
              _maskedEmail = state.maskedEmail;
            }
          });
          if (state.retryAfterSeconds != null) {
            _startRetryTimer(state.retryAfterSeconds!);
          }
        } else if (state is ApplicationApiKeyRegenerated) {
          setState(() {
            _newApiKey = state.apiKey;
            _step = _DialogStep.success;
          });
        } else if (state is ApplicationError) {
          setState(() {
            _isSending = false;
            if (_step == _DialogStep.loading) {
              _step = _DialogStep.enterCode;
            }
            _errorText = state.message.contains('code')
                ? 'Неверный или истёкший код'
                : state.message;
          });
        }
      },
      child: AlertDialog(
        title: Row(
          children: [
            Icon(Icons.key, color: colorScheme.primary),
            const SizedBox(width: 8),
            const Expanded(child: Text('Регенерировать API ключ')),
          ],
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: switch (_step) {
              _DialogStep.confirm => _buildConfirmStep(colorScheme, textTheme),
              _DialogStep.enterCode => _buildCodeStep(colorScheme, textTheme),
              _DialogStep.loading => _buildLoadingStep(textTheme),
              _DialogStep.success => _buildSuccessStep(colorScheme, textTheme),
            },
          ),
        ),
        actions: switch (_step) {
          _DialogStep.confirm => [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            FilledButton(
              onPressed: (_isSending || _isLoadingEmail) ? null : _sendCode,
              child: _isSending
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Отправить код'),
            ),
          ],
          _DialogStep.enterCode => [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: _retryAfterSeconds > 0 ? null : _sendCode,
              child: Text(
                _retryAfterSeconds > 0
                    ? 'Повторно (${_retryAfterSeconds}с)'
                    : 'Отправить повторно',
              ),
            ),
            FilledButton(
              onPressed: _submitCode,
              child: const Text('Подтвердить'),
            ),
          ],
          _DialogStep.loading => [],
          _DialogStep.success => [
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Закрыть'),
            ),
          ],
        },
      ),
    );
  }

  Widget _buildConfirmStep(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.errorContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 20,
                    color: colorScheme.onErrorContainer,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Внимание',
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Текущий API ключ для «${widget.application.name}» будет аннулирован. '
                'Все интеграции, использующие старый ключ, перестанут работать.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onErrorContainer,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (_isLoadingEmail)
          Row(
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 8),
              Text(
                'Определение почты владельца...',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          )
        else
          Text(
            'Код верификации будет отправлен на $_maskedEmail',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }

  Widget _buildCodeStep(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.email_outlined, size: 20, color: colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _maskedEmail != null
                      ? 'Код отправлен на $_maskedEmail'
                      : 'Код подтверждения отправлен на почту владельца',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _codeController,
          decoration: InputDecoration(
            labelText: 'Код подтверждения',
            hintText: '000000',
            errorText: _errorText,
            prefixIcon: const Icon(Icons.lock_outline),
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          maxLength: 6,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall?.copyWith(
            fontFamily: 'monospace',
            letterSpacing: 8,
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onSubmitted: (_) => _submitCode(),
          autofocus: true,
        ),
        const SizedBox(height: 8),
        Text(
          'Код действителен 10 минут. Максимум 5 попыток ввода.',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingStep(TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          'Регенерация API ключа...',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSuccessStep(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.check_circle, size: 20, color: colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'API ключ успешно регенерирован!',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              Expanded(
                child: SelectableText(
                  _newApiKey ?? '',
                  style: textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _newApiKey ?? ''));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('API ключ скопирован'),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.copy, size: 20),
                tooltip: 'Скопировать',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Сохраните этот ключ — он больше не будет показан!',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.error,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Диалог отображения API ключа (после создания / регенерации).
///
/// Показывается один раз, ключ можно скопировать.
class ApiKeyDisplayDialog extends StatelessWidget {
  final String apiKey;
  final String title;

  const ApiKeyDisplayDialog({
    super.key,
    required this.apiKey,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.key, color: colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(title)),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Сохраните этот ключ — он показывается только один раз!',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Ключ
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      apiKey,
                      style: textTheme.bodyMedium?.copyWith(
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: apiKey));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('API ключ скопирован'),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 20),
                    tooltip: 'Скопировать',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Закрыть'),
        ),
      ],
    );
  }
}
