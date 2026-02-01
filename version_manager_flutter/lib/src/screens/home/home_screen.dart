import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_manager_client/version_manager_client.dart';

import '../../services/auth_service.dart';

/// Главный экран после авторизации (заглушка)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Version Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: Consumer<AuthService>(
        builder: (context, authService, _) {
          final user = authService.currentUser;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Аватар
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    child: user?.avatarUrl != null
                        ? ClipOval(
                            child: Image.network(
                              user!.avatarUrl!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (_, e, st) =>
                                  _buildDefaultAvatar(context, user),
                            ),
                          )
                        : _buildDefaultAvatar(context, user),
                  ),

                  const SizedBox(height: 24),

                  // Имя пользователя
                  Text(
                    _getUserDisplayName(user),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Email
                  Text(
                    user?.email ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Статус верификации
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: (user?.isEmailVerified ?? false)
                          ? Colors.green.withValues(alpha: 0.1)
                          : Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          (user?.isEmailVerified ?? false)
                              ? Icons.verified
                              : Icons.warning_amber,
                          size: 20,
                          color: (user?.isEmailVerified ?? false)
                              ? Colors.green
                              : Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          (user?.isEmailVerified ?? false)
                              ? 'Email подтверждён'
                              : 'Email не подтверждён',
                          style: TextStyle(
                            color: (user?.isEmailVerified ?? false)
                                ? Colors.green.shade700
                                : Colors.orange.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Информация о сборке
                  Text(
                    'Добро пожаловать в Version Manager!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Здесь будет основной функционал приложения',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefaultAvatar(BuildContext context, dynamic user) {
    final initials = _getInitials(user);

    return Text(
      initials,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  String _getUserDisplayName(User? user) {
    if (user == null) return 'Пользователь';

    if (user.displayName != null && user.displayName!.isNotEmpty) {
      return user.displayName!;
    }

    final fullName = '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim();
    if (fullName.isNotEmpty) {
      return fullName;
    }

    return 'Пользователь';
  }

  String _getInitials(dynamic user) {
    if (user == null) return '?';

    final firstName = user.firstName as String?;
    final lastName = user.lastName as String?;
    final email = user.email as String?;

    if (firstName != null && firstName.isNotEmpty) {
      if (lastName != null && lastName.isNotEmpty) {
        return '${firstName[0]}${lastName[0]}'.toUpperCase();
      }
      return firstName[0].toUpperCase();
    }

    if (email != null && email.isNotEmpty) {
      return email[0].toUpperCase();
    }

    return '?';
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showLogoutOptions(context);
            },
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }

  void _showLogoutOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Выйти с этого устройства'),
                onTap: () {
                  Navigator.of(context).pop();
                  context.read<AuthService>().logout();
                },
              ),
              ListTile(
                leading: const Icon(Icons.devices),
                title: const Text('Выйти со всех устройств'),
                subtitle: const Text('Потребуется повторный вход везде'),
                onTap: () {
                  Navigator.of(context).pop();
                  context.read<AuthService>().logoutAll();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
