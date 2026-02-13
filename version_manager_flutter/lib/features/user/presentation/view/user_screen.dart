import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart'
    hide Initial;
import 'package:version_manager_flutter/features/session/presentation/view/ui/session_card.dart';
import 'package:version_manager_flutter/features/session/presentation/view/ui/treminate_all_dialog.dart';
import 'package:version_manager_flutter/features/user/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:version_manager_flutter/features/user/presentation/view/ui/account_status_card.dart';
import 'package:version_manager_flutter/features/user/presentation/view/ui/profile_header.dart';
import 'package:version_manager_flutter/features/user/presentation/view/ui/profile_info_card.dart';

/// Экран «Профиль» — единая страница с профилем и сессиями.
///
/// Провайдеры [UserProvider] и [SessionProvider] предоставляются
/// на уровне [HomeScreen].
class UserScreen extends StatelessWidget {
  final ThemeMode? themeMode;
  final VoidCallback? onThemeToggle;

  const UserScreen({
    super.key,
    this.themeMode,
    this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return _UserScreenContent(
      themeMode: themeMode,
      onThemeToggle: onThemeToggle,
    );
  }
}

String _pluralize(int count) {
  if (count % 10 == 1 && count % 100 != 11) return 'сессия';
  if (count % 10 >= 2 &&
      count % 10 <= 4 &&
      (count % 100 < 10 || count % 100 >= 20)) {
    return 'сессии';
  }
  return 'сессий';
}

class _UserScreenContent extends StatelessWidget {
  final ThemeMode? themeMode;
  final VoidCallback? onThemeToggle;

  const _UserScreenContent({
    this.themeMode,
    this.onThemeToggle,
  });

  IconData _getThemeIcon() {
    return switch (themeMode) {
      ThemeMode.light => Icons.light_mode,
      ThemeMode.dark => Icons.dark_mode,
      _ => Icons.brightness_auto,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        elevation: 0,
        actions: [
          if (themeMode != null && onThemeToggle != null)
            IconButton(
              icon: Icon(_getThemeIcon()),
              tooltip: 'Переключить тему',
              onPressed: onThemeToggle,
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: const _ProfileAndSessionsBody(),
    );
  }
}

/// Тело экрана — профиль + список сессий на одной странице.
class _ProfileAndSessionsBody extends StatelessWidget {
  const _ProfileAndSessionsBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserProfileBloc>().add(
          const UserProfileEvent.loadProfile(),
        );
        context.read<SessionBloc>().add(
          const SessionEvent.loadSessions(),
        );
      },
      child: ListView(
        padding: EdgeInsets.all(
          MediaQuery.sizeOf(context).width < 600 ? 16.0 : 24.0,
        ),
        children: [
          // --- Секция «Профиль» ---
          BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) => switch (state) {
              Initial() || UserProfileLoading() => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator()),
              ),
              UserProfileLoaded(:final user) => _ProfileSection(
                user: user,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              UserProfileError(:final message) => _ErrorSection(
                message: message,
                onRetry: () => context.read<UserProfileBloc>().add(
                  const UserProfileEvent.loadProfile(),
                ),
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
            },
          ),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // --- Секция «Сессии» ---
          BlocBuilder<SessionBloc, SessionState>(
            builder: (context, state) => switch (state) {
              SessionLoading() => const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator()),
              ),
              SessionLoaded(:final sessions) => _SessionsSection(
                sessions: sessions,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              SessionError(:final message) => _ErrorSection(
                message: message,
                onRetry: () => context.read<SessionBloc>().add(
                  const SessionEvent.loadSessions(),
                ),
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}

/// Секция профиля: аватар, карточки информации и статуса.
class _ProfileSection extends StatelessWidget {
  final UserPublic user;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _ProfileSection({
    required this.user,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(
          user: user,
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
        const SizedBox(height: 24),
        ProfileInfoCard(
          user: user,
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
        const SizedBox(height: 16),
        AccountStatusCard(
          user: user,
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
      ],
    );
  }
}

/// Секция сессий: текущая сессия в отдельном блоке + остальные сессии.
class _SessionsSection extends StatelessWidget {
  final List<SessionInfo> sessions;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _SessionsSection({
    required this.sessions,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final currentSession = sessions.where((s) => s.isCurrent).firstOrNull;
    final otherSessions = sessions.where((s) => !s.isCurrent).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Текущая сессия ---
        if (currentSession != null) ...[
          Text(
            'Текущая сессия',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SessionCard(
            session: currentSession,
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _showLogoutDialog(context),
              icon: Icon(Icons.logout, color: colorScheme.error),
              label: Text(
                'Выйти из аккаунта',
                style: TextStyle(color: colorScheme.error),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: colorScheme.error),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],

        // --- Другие сессии ---
        if (otherSessions.isNotEmpty) ...[
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Другие сессии',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${otherSessions.length} ${_pluralize(otherSessions.length)}',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              if (otherSessions.length > 1)
                OutlinedButton.icon(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<SessionBloc>(),
                      child: TerminateAllDialog(),
                    ),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text('Завершить все'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.error,
                    side: BorderSide(color: colorScheme.error),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: otherSessions.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SessionCard(
                session: otherSessions[index],
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Выйти из аккаунта?'),
        content: const Text('Вы будете перенаправлены на экран входа.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }
}

/// Виджет ошибки с кнопкой повтора.
class _ErrorSection extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _ErrorSection({
    required this.message,
    required this.onRetry,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(message, style: textTheme.bodyLarge),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
