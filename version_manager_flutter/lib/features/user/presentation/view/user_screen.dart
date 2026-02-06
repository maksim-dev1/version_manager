import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:version_manager_flutter/features/session/presentation/bloc/session_bloc.dart'
    hide Initial;
import 'package:version_manager_flutter/features/session/presentation/session_provider.dart';
import 'package:version_manager_flutter/features/session/presentation/view/ui/session_card.dart';
import 'package:version_manager_flutter/features/session/presentation/view/ui/treminate_all_dialog.dart';
import 'package:version_manager_flutter/features/user/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:version_manager_flutter/features/user/presentation/user_provider.dart';
import 'package:version_manager_flutter/features/user/presentation/view/ui/account_status_card.dart';
import 'package:version_manager_flutter/features/user/presentation/view/ui/profile_header.dart';
import 'package:version_manager_flutter/features/user/presentation/view/ui/profile_info_card.dart';

/// Экран «Профиль» — единая страница с профилем и сессиями.
///
/// Собирает провайдеры двух независимых фичей:
/// - user (профиль)
/// - session (сессии)
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: SessionProvider(
        child: const _UserScreenContent(),
      ),
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
  const _UserScreenContent();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog(context);
              } else if (value == 'logoutAll') {
                _showLogoutAllDialog(context);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Выйти'),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              PopupMenuItem(
                value: 'logoutAll',
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: colorScheme.error,
                  ),
                  title: Text(
                    'Выйти со всех устройств',
                    style: TextStyle(color: colorScheme.error),
                  ),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ),
      body: const _ProfileAndSessionsBody(),
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

  void _showLogoutAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Выйти со всех устройств?'),
        content: const Text(
          'Все активные сессии будут завершены. '
          'Вам потребуется заново войти в аккаунт.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<AuthBloc>().add(const AuthEvent.logoutAll());
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Выйти со всех'),
          ),
        ],
      ),
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
        padding: const EdgeInsets.all(24),
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

/// Секция сессий: заголовок с количеством + список карточек.
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок с кнопкой
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Активные сессии',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${sessions.length} ${_pluralize(sessions.length)}',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            if (sessions.length > 1)
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

        // Список сессий
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sessions.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SessionCard(
              session: sessions[index],
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          ),
        ),
      ],
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
