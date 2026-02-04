import 'package:flutter/material.dart';

/// Сервис для отображения уведомлений пользователю.
///
/// Централизует логику показа снекбаров и других уведомлений.
class NotificationService {
  /// Показывает сообщение об ошибке
  static void showError(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: colorScheme.error,
      ),
    );
  }

  /// Показывает успешное сообщение
  static void showSuccess(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: colorScheme.primary,
      ),
    );
  }

  /// Показывает информационное сообщение
  static void showInfo(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: colorScheme.surfaceContainerHighest,
      ),
    );
  }

  /// Показывает предупреждение
  static void showWarning(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: colorScheme.tertiary,
      ),
    );
  }
}
