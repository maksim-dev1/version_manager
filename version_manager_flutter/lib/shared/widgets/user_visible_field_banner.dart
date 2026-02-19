import 'package:flutter/material.dart';

/// Информационный баннер-предупреждение о том, что текст поля
/// будет виден конечным пользователям в клиентском приложении.
///
/// Используется рядом с полями, содержимое которых отправляется клиентам:
/// changelog, причина блокировки, названия магазинов и т.д.
class UserVisibleFieldBanner extends StatelessWidget {
  /// Текст подсказки. Если не передан — используется текст по умолчанию.
  final String? message;

  const UserVisibleFieldBanner({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.tertiary.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.visibility_outlined,
            size: 16,
            color: colorScheme.tertiary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message ??
                  'Этот текст увидят пользователи в приложении — '
                      'заполняйте внимательно',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
