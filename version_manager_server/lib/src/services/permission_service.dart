import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

/// Сервис проверки прав доступа на основе ролей в команде.
///
/// Роли и их права (TeamRoleType):
/// - owner: полный доступ ко всему, включая удаление команды
/// - admin: управление приложениями, версиями, API ключами, участниками (без удаления приложений/команды)
/// - developer: создание/редактирование версий, блокировка, статистика
/// - observer: только просмотр
///
/// Важно:
/// - Роли влияют только на КОМАНДНЫЕ приложения
/// - Все могут создавать ЛИЧНЫЕ приложения
/// - Приглашенные (не active) пользователи не имеют доступа
class PermissionService {
  /// Матрица прав доступа: роль -> список разрешений
  static final Map<TeamRoleType, Set<Permission>> _rolePermissions = {
    // Владелец — полный доступ ко всему
    TeamRoleType.owner: {
      // Команда
      Permission.viewTeam,
      Permission.editTeam,
      Permission.deleteTeam,
      Permission.transferOwnership,
      // Участники
      Permission.viewMembers,
      Permission.inviteMembers,
      Permission.removeMembers,
      Permission.changeRoles,
      // Приложения
      Permission.viewApps,
      Permission.createApps,
      Permission.editApps,
      Permission.deleteApps,
      // Версии
      Permission.viewVersions,
      Permission.createVersions,
      Permission.editVersions,
      Permission.blockVersions,
      Permission.deleteVersions,
      // API ключи
      Permission.viewApiKeys,
      Permission.manageApiKeys,
      // Статистика
      Permission.viewStats,
    },

    // Администратор — управление без удаления приложений/команды
    TeamRoleType.admin: {
      // Команда
      Permission.viewTeam,
      Permission.editTeam,
      // НЕТ: deleteTeam, transferOwnership
      // Участники
      Permission.viewMembers,
      Permission.inviteMembers,
      Permission.removeMembers,
      Permission.changeRoles,
      // Приложения
      Permission.viewApps,
      Permission.createApps,
      Permission.editApps,
      // НЕТ: deleteApps
      // Версии
      Permission.viewVersions,
      Permission.createVersions,
      Permission.editVersions,
      Permission.blockVersions,
      Permission.deleteVersions,
      // API ключи
      Permission.viewApiKeys,
      // НЕТ: manageApiKeys (только просмотр)
      // Статистика
      Permission.viewStats,
    },

    // Разработчик — работа с версиями и статистика
    TeamRoleType.developer: {
      // Команда
      Permission.viewTeam,
      // Участники
      Permission.viewMembers,
      // Приложения
      Permission.viewApps,
      // НЕТ: createApps, editApps, deleteApps (для командных)
      // Версии
      Permission.viewVersions,
      Permission.createVersions,
      Permission.editVersions,
      Permission.blockVersions,
      // НЕТ: deleteVersions
      // Статистика
      Permission.viewStats,
    },

    // Наблюдатель — только просмотр
    TeamRoleType.observer: {
      // Команда
      Permission.viewTeam,
      // Участники
      Permission.viewMembers,
      // Приложения
      Permission.viewApps,
      // Версии
      Permission.viewVersions,
      // Статистика
      Permission.viewStats,
    },
  };

  /// Проверяет, имеет ли роль указанное разрешение.
  static bool hasPermission(TeamRoleType role, Permission permission) {
    return _rolePermissions[role]?.contains(permission) ?? false;
  }

  /// Проверяет, имеет ли участник команды указанное разрешение.
  ///
  /// Возвращает false если:
  /// - Участник не активен (invited или suspended)
  /// - Роль не имеет данного разрешения
  static bool memberHasPermission(
    TeamMember member,
    Permission permission,
  ) {
    // Только активные участники имеют права
    if (member.status != TeamMemberStatusType.active) {
      return false;
    }

    return hasPermission(member.role, permission);
  }

  /// Возвращает все разрешения для роли.
  static Set<Permission> getPermissionsForRole(TeamRoleType role) {
    return _rolePermissions[role] ?? {};
  }

  /// Проверяет, может ли пользователь с одной ролью изменить роль другого пользователя.
  ///
  /// Правила:
  /// - Только owner и admin могут менять роли
  /// - Нельзя назначить роль выше своей
  /// - Нельзя понизить роль того, кто выше или равен
  static bool canChangeRole(
    TeamRoleType actorRole,
    TeamRoleType targetCurrentRole,
    TeamRoleType targetNewRole,
  ) {
    // Только owner и admin могут менять роли
    if (!hasPermission(actorRole, Permission.changeRoles)) {
      return false;
    }

    final roleHierarchy = [
      TeamRoleType.observer,
      TeamRoleType.developer,
      TeamRoleType.admin,
      TeamRoleType.owner,
    ];

    final actorLevel = roleHierarchy.indexOf(actorRole);
    final targetCurrentLevel = roleHierarchy.indexOf(targetCurrentRole);
    final targetNewLevel = roleHierarchy.indexOf(targetNewRole);

    // Нельзя изменять роль тех, кто выше или равен по уровню
    if (targetCurrentLevel >= actorLevel) {
      return false;
    }

    // Нельзя назначить роль выше или равную своей
    if (targetNewLevel >= actorLevel) {
      return false;
    }

    return true;
  }

  /// Проверяет, может ли пользователь удалить другого участника из команды.
  static bool canRemoveMember(TeamRoleType actorRole, TeamRoleType targetRole) {
    if (!hasPermission(actorRole, Permission.removeMembers)) {
      return false;
    }

    final roleHierarchy = [
      TeamRoleType.observer,
      TeamRoleType.developer,
      TeamRoleType.admin,
      TeamRoleType.owner,
    ];

    final actorLevel = roleHierarchy.indexOf(actorRole);
    final targetLevel = roleHierarchy.indexOf(targetRole);

    // Нельзя удалить того, кто выше или равен
    return targetLevel < actorLevel;
  }

  /// Проверяет, является ли это личное приложение пользователя.
  ///
  /// Личные приложения имеют ownerType == OwnerType.user
  /// и доступны только владельцу приложения.
  static bool isPersonalApp(Application app) {
    return app.ownerType == OwnerType.user;
  }

  /// Проверяет доступ пользователя к приложению.
  ///
  /// [userAuthId] - UUID пользователя из AuthUser
  /// [app] - приложение
  /// [teamMember] - участие пользователя в команде (если приложение командное)
  /// [permission] - требуемое разрешение
  ///
  /// Возвращает true если:
  /// - Это личное приложение пользователя (он владелец)
  /// - Это командное приложение и пользователь имеет нужное разрешение
  static bool hasAppAccess({
    required UuidValue userAuthId,
    required Application app,
    TeamMember? teamMember,
    required Permission permission,
  }) {
    // Личное приложение - полный доступ только владельцу
    if (isPersonalApp(app)) {
      return app.ownerUserId == userAuthId;
    }

    // Командное приложение - проверяем роль в команде
    if (teamMember == null) {
      return false;
    }

    return memberHasPermission(teamMember, permission);
  }
}
