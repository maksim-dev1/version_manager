import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:version_manager_flutter/theme/snow_ui/snow_colors.dart';

/// Тип уведомления.
enum AppNotificationType { success, error, info, warning, loading }

/// Данные одного уведомления.
class _NotificationEntry {
  final String message;
  final AppNotificationType type;
  final Duration duration;

  const _NotificationEntry({
    required this.message,
    required this.type,
    required this.duration,
  });
}

/// Сервис для отображения уведомлений пользователю.
///
/// Централизует логику показа уведомлений.
/// - На вебе: использует Overlay-based уведомления (AppNotification)
/// - На мобилке: использует SnackBar (NotificationService)
class NotificationService {
  /// Показывает сообщение об ошибке
  static void showError(BuildContext context, String message) {
    if (_isWeb) {
      _AppNotification.showError(context, message);
    } else {
      _SnackNotification.showError(context, message);
    }
  }

  /// Показывает успешное сообщение
  static void showSuccess(BuildContext context, String message) {
    if (_isWeb) {
      _AppNotification.showSuccess(context, message);
    } else {
      _SnackNotification.showSuccess(context, message);
    }
  }

  /// Показывает информационное сообщение
  static void showInfo(BuildContext context, String message) {
    if (_isWeb) {
      _AppNotification.showInfo(context, message);
    } else {
      _SnackNotification.showInfo(context, message);
    }
  }

  /// Показывает предупреждение
  static void showWarning(BuildContext context, String message) {
    if (_isWeb) {
      _AppNotification.showWarning(context, message);
    } else {
      _SnackNotification.showWarning(context, message);
    }
  }

  /// Показывает индикатор загрузки. Скрывается при показе следующего уведомления
  static void showLoading(BuildContext context, String message) {
    if (_isWeb) {
      _AppNotification.showLoading(context, message);
    } else {
      _SnackNotification.showLoading(context, message);
    }
  }

  /// Скрыть текущее уведомление
  static void hide(BuildContext context) {
    if (_isWeb) {
      _AppNotification.hide();
    } else {
      _SnackNotification.hide(context);
    }
  }

  static bool get _isWeb => kIsWeb;
}

/// Overlay-based сервис уведомлений для веба.
///
/// Рендерит уведомления поверх всего (включая модальные окна).
/// Использует [Overlay] виджета [MaterialApp], поэтому всегда находится
/// выше любых Route/Dialog/BottomSheet.
class _AppNotification {
  static OverlayEntry? _currentEntry;
  static Timer? _dismissTimer;

  /// Показывает сообщение об ошибке.
  static void showError(BuildContext context, String message) =>
      _show(context, message, AppNotificationType.error);

  /// Показывает успешное сообщение.
  static void showSuccess(BuildContext context, String message) =>
      _show(context, message, AppNotificationType.success);

  /// Показывает информационное сообщение.
  static void showInfo(BuildContext context, String message) =>
      _show(context, message, AppNotificationType.info);

  /// Показывает предупреждение.
  static void showWarning(BuildContext context, String message) =>
      _show(context, message, AppNotificationType.warning);

  /// Показывает индикатор загрузки. Скрывается вручную через [hide].
  static void showLoading(BuildContext context, String message) => _show(
    context,
    message,
    AppNotificationType.loading,
    duration: const Duration(days: 1),
  );

  /// Скрывает текущее уведомление.
  static void hide() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _removeCurrentEntry();
  }

  static void _show(
    BuildContext context,
    String message,
    AppNotificationType type, {
    Duration duration = const Duration(seconds: 4),
  }) {
    final entry = _NotificationEntry(
      message: message,
      type: type,
      duration: duration,
    );

    // Если уже показывается — заменяем мгновенно.
    if (_currentEntry != null) {
      _dismissTimer?.cancel();
      _removeCurrentEntry();
    }

    _present(context, entry);
  }

  static void _present(BuildContext context, _NotificationEntry entry) {
    final overlay = Overlay.of(context, rootOverlay: true);

    late final OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (_) => _NotificationWidget(
        entry: entry,
        onDismissed: () {
          if (_currentEntry == overlayEntry) {
            _removeCurrentEntry();
          }
        },
      ),
    );

    _currentEntry = overlayEntry;
    overlay.insert(overlayEntry);

    if (entry.type != AppNotificationType.loading) {
      _dismissTimer = Timer(entry.duration, () {
        _removeCurrentEntry();
      });
    }
  }

  static void _removeCurrentEntry() {
    _currentEntry?.remove();
    _currentEntry = null;
  }
}

/// Виджет одного уведомления с анимацией.
class _NotificationWidget extends StatefulWidget {
  final _NotificationEntry entry;
  final VoidCallback onDismissed;

  const _NotificationWidget({
    required this.entry,
    required this.onDismissed,
  });

  @override
  State<_NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    _controller.reverse().then((_) {
      if (mounted) widget.onDismissed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isWide = mediaQuery.size.width > 600;

    return Positioned(
      top: mediaQuery.padding.top + 12,
      left: isWide ? null : 16,
      right: isWide ? 24 : 16,
      width: isWide ? 400 : null,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity != null &&
                  details.primaryVelocity! < -100) {
                _dismiss();
              }
            },
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              child: _NotificationCard(
                entry: widget.entry,
                onClose: _dismiss,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Карточка уведомления.
class _NotificationCard extends StatelessWidget {
  final _NotificationEntry entry;
  final VoidCallback onClose;

  const _NotificationCard({
    required this.entry,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final (bgColor, iconData, iconColor) = _style(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWeb = kIsWeb;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWeb ? 24 : 16,
        vertical: isWeb ? 20 : 14,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? SnowColors.backgroundDark2
            : SnowColors.backgroundLight1,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: iconColor.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.12),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _IconBadge(
            icon: iconData,
            color: iconColor,
            size: isWeb ? 48 : 36,
            iconSize: isWeb ? 28 : 20,
          ),
          SizedBox(width: isWeb ? 16 : 12),
          Expanded(
            child: Text(
              entry.message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: isWeb ? 16 : null,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (entry.type == AppNotificationType.loading) ...[
            SizedBox(width: isWeb ? 16 : 12),
            SizedBox(
              width: isWeb ? 20 : 16,
              height: isWeb ? 20 : 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(iconColor),
              ),
            ),
          ] else ...[
            SizedBox(width: isWeb ? 12 : 8),
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: isWeb ? 20 : 18,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }

  (Color bg, IconData icon, Color color) _style(BuildContext context) {
    return switch (entry.type) {
      AppNotificationType.success => (
        SnowColors.greenA.withValues(alpha: 0.1),
        Icons.check_circle_rounded,
        SnowColors.greenA,
      ),
      AppNotificationType.error => (
        SnowColors.red.withValues(alpha: 0.1),
        Icons.error_rounded,
        SnowColors.red,
      ),
      AppNotificationType.info => (
        SnowColors.blue.withValues(alpha: 0.1),
        Icons.info_rounded,
        SnowColors.blue,
      ),
      AppNotificationType.warning => (
        SnowColors.yellow.withValues(alpha: 0.1),
        Icons.warning_rounded,
        SnowColors.yellow,
      ),
      AppNotificationType.loading => (
        SnowColors.brand.withValues(alpha: 0.1),
        Icons.hourglass_top_rounded,
        SnowColors.brand,
      ),
    };
  }
}

/// Иконка в круглом бэджике.
class _IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final double iconSize;

  const _IconBadge({
    required this.icon,
    required this.color,
    this.size = 36,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color, size: iconSize),
    );
  }
}

/// SnackBar-based сервис уведомлений для мобильных устройств.
///
/// Использует стандартный SnackBar для совместимости с мобильными платформами.
class _SnackNotification {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
  _currentSnackBar;

  /// Показывает сообщение об ошибке.
  static void showError(BuildContext context, String message) =>
      _show(context, message, _SnackBarType.error);

  /// Показывает успешное сообщение.
  static void showSuccess(BuildContext context, String message) =>
      _show(context, message, _SnackBarType.success);

  /// Показывает информационное сообщение.
  static void showInfo(BuildContext context, String message) =>
      _show(context, message, _SnackBarType.info);

  /// Показывает предупреждение.
  static void showWarning(BuildContext context, String message) =>
      _show(context, message, _SnackBarType.warning);

  /// Показывает индикатор загрузки. Скрывается вручную через [hide].
  static void showLoading(BuildContext context, String message) => _show(
    context,
    message,
    _SnackBarType.loading,
    duration: const Duration(days: 1),
  );

  /// Скрывает текущее уведомление.
  static void hide(BuildContext context) {
    _currentSnackBar?.close();
    _currentSnackBar = null;
  }

  static void _show(
    BuildContext context,
    String message,
    _SnackBarType type, {
    Duration duration = const Duration(seconds: 4),
  }) {
    // Скрываем предыдущий, если есть
    _currentSnackBar?.close();

    final snackBar = SnackBar(
      content: Row(
        children: [
          _SnackBarIcon(type: type),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (type == _SnackBarType.loading) ...[
            const SizedBox(width: 12),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ],
        ],
      ),
      backgroundColor: _backgroundColor(type),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    _currentSnackBar = ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Color _backgroundColor(_SnackBarType type) {
    return switch (type) {
      _SnackBarType.success => SnowColors.greenA,
      _SnackBarType.error => SnowColors.red,
      _SnackBarType.info => SnowColors.blue,
      _SnackBarType.warning => SnowColors.yellow,
      _SnackBarType.loading => SnowColors.brand,
    };
  }
}

/// Типы SnackBar уведомлений.
enum _SnackBarType { success, error, info, warning, loading }

/// Иконка для SnackBar.
class _SnackBarIcon extends StatelessWidget {
  final _SnackBarType type;

  const _SnackBarIcon({required this.type});

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (type) {
      _SnackBarType.success => (Icons.check_circle_rounded, Colors.white),
      _SnackBarType.error => (Icons.error_rounded, Colors.white),
      _SnackBarType.info => (Icons.info_rounded, Colors.white),
      _SnackBarType.warning => (Icons.warning_rounded, Colors.white),
      _SnackBarType.loading => (Icons.hourglass_top_rounded, Colors.white),
    };

    return Icon(icon, color: color, size: 24);
  }
}
