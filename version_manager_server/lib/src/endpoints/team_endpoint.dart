import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';

/// Эндпоинт для управления командами.
///
/// Предоставляет функционал для:
/// - Создания и редактирования команд
/// - Приглашения участников и управления ролями
/// - Принятия/отклонения приглашений
/// - Передачи владения командой
/// - Удаления команд с опциями сохранения приложений
///
/// Все методы требуют передачи валидного access token.
///
/// ## Роли и права доступа
/// - **owner** — полный доступ, включая удаление команды
/// - **admin** — управление участниками и приложениями
/// - **developer** — создание и редактирование версий
/// - **observer** — только просмотр
class TeamEndpoint extends Endpoint {
  final _authService = Services().authValidationService;
  final _emailService = Services().emailService;

  // ============================================================
  // СОЗДАНИЕ И РЕДАКТИРОВАНИЕ КОМАНД
  // ============================================================

  /// Создать новую команду.
  ///
  /// Создатель автоматически становится владельцем команды.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД
  /// - [accessToken] — access token текущего пользователя
  /// - [request] — данные для создания команды (название, описание)
  ///
  /// ### Возвращает
  /// Созданную [Team] с полной информацией.
  ///
  /// ### Исключения
  /// - [InvalidDataException] если название пустое или слишком короткое
  Future<Team> createTeam(
    Session session,
    String accessToken, {
    required CreateTeamRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'createTeam: создание команды "${request.name}" пользователем $userId',
      level: LogLevel.info,
    );

    // Валидация названия
    final name = request.name.trim();
    if (name.length < 2) {
      throw InvalidDataException(
        field: 'name',
        message: 'Название команды должно содержать минимум 2 символа',
      );
    }
    if (name.length > 100) {
      throw InvalidDataException(
        field: 'name',
        message: 'Название команды не должно превышать 100 символов',
      );
    }

    // Создаём команду
    final team = Team(
      name: name,
      description: request.description?.trim(),
      ownerId: userId,
    );

    final createdTeam = await Team.db.insertRow(session, team);

    session.log(
      'createTeam: команда создана с ID ${createdTeam.id}',
      level: LogLevel.info,
    );

    // Создаём запись участника для владельца
    final ownerMember = TeamMember(
      teamId: createdTeam.id!,
      userId: userId,
      role: TeamRoleType.owner,
      status: TeamMemberStatusType.active,
      joinedAt: DateTime.now(),
    );

    await TeamMember.db.insertRow(session, ownerMember);

    session.log(
      'createTeam: владелец добавлен как участник команды',
      level: LogLevel.info,
    );

    return createdTeam;
  }

  /// Обновить информацию о команде.
  ///
  /// Доступно только владельцу и администраторам команды.
  Future<Team> updateTeam(
    Session session,
    String accessToken, {
    required UpdateTeamRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'updateTeam: обновление команды ${request.teamId}',
      level: LogLevel.info,
    );

    // Проверяем права
    final member = await _getMemberWithRole(
      session,
      teamId: request.teamId,
      userId: userId,
      requiredRoles: [TeamRoleType.owner, TeamRoleType.admin],
    );

    if (member == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Недостаточно прав для редактирования команды',
      );
    }

    // Находим команду
    final team = await Team.db.findById(session, request.teamId);
    if (team == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Команда не найдена',
      );
    }

    // Валидация названия
    final name = request.name.trim();
    if (name.length < 2) {
      throw InvalidDataException(
        field: 'name',
        message: 'Название команды должно содержать минимум 2 символа',
      );
    }
    if (name.length > 100) {
      throw InvalidDataException(
        field: 'name',
        message: 'Название команды не должно превышать 100 символов',
      );
    }

    // Обновляем
    team.name = name;
    team.description = request.description?.trim();
    team.updatedAt = DateTime.now();

    await Team.db.updateRow(session, team);

    session.log(
      'updateTeam: команда ${request.teamId} успешно обновлена',
      level: LogLevel.info,
    );

    return team;
  }

  /// Получить команду по ID.
  ///
  /// Доступно только активным участникам команды.
  Future<Team> getTeam(
    Session session,
    String accessToken, {
    required UuidValue teamId,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    // Проверяем, что пользователь — активный участник
    final member = await _getActiveMember(
      session,
      teamId: teamId,
      userId: userId,
    );
    if (member == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Команда не найдена или нет доступа',
      );
    }

    final team = await Team.db.findById(session, teamId);
    if (team == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Команда не найдена',
      );
    }

    return team;
  }

  /// Получить список всех команд пользователя.
  ///
  /// Возвращает команды, где пользователь является активным участником.
  /// Команды с приглашениями (status = invited) не включаются.
  Future<List<Team>> getMyTeams(Session session, String accessToken) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'getMyTeams: получение команд пользователя $userId',
      level: LogLevel.info,
    );

    // Находим все активные членства
    final memberships = await TeamMember.db.find(
      session,
      where: (t) =>
          (t.userId.equals(userId)) &
          (t.status.equals(TeamMemberStatusType.active)),
    );

    if (memberships.isEmpty) {
      return [];
    }

    // Получаем команды
    final teamIds = memberships.map((m) => m.teamId).toList();
    final teams = await Team.db.find(
      session,
      where: (t) => t.id.inSet(teamIds.toSet()),
      orderBy: (t) => t.name,
    );

    session.log(
      'getMyTeams: найдено ${teams.length} команд',
      level: LogLevel.info,
    );

    return teams;
  }

  // ============================================================
  // ПРИГЛАШЕНИЯ
  // ============================================================

  /// Пригласить участника в команду.
  ///
  /// Отправляет приглашение пользователю по email.
  /// Доступно владельцу и администраторам.
  Future<SuccessResponse> inviteMember(
    Session session,
    String accessToken, {
    required InviteTeamMemberRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'inviteMember: приглашение ${request.email} в команду ${request.teamId}',
      level: LogLevel.info,
    );

    // Проверяем права
    final inviter = await _getMemberWithRole(
      session,
      teamId: request.teamId,
      userId: userId,
      requiredRoles: [TeamRoleType.owner, TeamRoleType.admin],
    );

    if (inviter == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Недостаточно прав для приглашения участников',
      );
    }

    // Нельзя назначать роль выше своей
    if (inviter.role != TeamRoleType.owner &&
        request.role == TeamRoleType.owner) {
      throw InvalidDataException(
        field: 'role',
        message: 'Нельзя назначить роль владельца',
      );
    }
    if (inviter.role == TeamRoleType.admin &&
        request.role == TeamRoleType.admin) {
      throw InvalidDataException(
        field: 'role',
        message: 'Администратор не может назначать других администраторов',
      );
    }

    // Находим пользователя по email
    final invitee = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(request.email.trim().toLowerCase()),
    );

    if (invitee == null) {
      throw InvalidDataException(
        field: 'email',
        message: 'Пользователь с таким email не зарегистрирован',
      );
    }

    // Проверяем, не является ли уже участником
    final existingMember = await TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(request.teamId)) & (t.userId.equals(invitee.id!)),
    );

    if (existingMember != null) {
      if (existingMember.status == TeamMemberStatusType.active) {
        throw InvalidDataException(
          field: 'email',
          message: 'Пользователь уже является участником команды',
        );
      } else {
        throw InvalidDataException(
          field: 'email',
          message: 'Пользователю уже отправлено приглашение',
        );
      }
    }

    // Получаем информацию о команде
    final team = await Team.db.findById(session, request.teamId);

    // Создаём приглашение
    final member = TeamMember(
      teamId: request.teamId,
      userId: invitee.id!,
      role: request.role,
      status: TeamMemberStatusType.invited,
      invitedById: userId,
      invitedAt: DateTime.now(),
      invitationExpiresAt: DateTime.now().add(const Duration(days: 7)),
    );

    await TeamMember.db.insertRow(session, member);

    // Отправляем уведомление на email
    try {
      await _emailService.sendNotification(
        email: invitee.email,
        title: 'Приглашение в команду "${team?.name ?? 'Команда'}"',
        message:
            'Вы получили приглашение присоединиться к команде. '
            'Роль: ${_getRoleDisplayName(request.role)}. '
            'Для принятия приглашения войдите в Version Manager и перейдите в раздел "Приглашения". '
            'Приглашение действительно 7 дней.',
        icon: '👥',
        appName: 'Version Manager',
      );
    } catch (e) {
      session.log(
        'inviteMember: ошибка отправки email: $e',
        level: LogLevel.warning,
      );
    }

    session.log(
      'inviteMember: приглашение отправлено пользователю ${invitee.id}',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Приглашение успешно отправлено',
    );
  }

  /// Получить список приглашений для текущего пользователя.
  ///
  /// Возвращает все активные приглашения в команды.
  Future<List<TeamMember>> getMyInvitations(
    Session session,
    String accessToken,
  ) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'getMyInvitations: получение приглашений для $userId',
      level: LogLevel.info,
    );

    final invitations = await TeamMember.db.find(
      session,
      where: (t) =>
          (t.userId.equals(userId)) &
          (t.status.equals(TeamMemberStatusType.invited)),
      include: TeamMember.include(
        team: Team.include(),
        invitedBy: User.include(),
      ),
    );

    // Фильтруем просроченные приглашения
    final now = DateTime.now();
    final validInvitations = invitations.where((inv) {
      if (inv.invitationExpiresAt == null) return true;
      return inv.invitationExpiresAt!.isAfter(now);
    }).toList();

    session.log(
      'getMyInvitations: найдено ${validInvitations.length} активных приглашений',
      level: LogLevel.info,
    );

    return validInvitations;
  }

  /// Принять или отклонить приглашение в команду.
  Future<SuccessResponse> respondToInvitation(
    Session session,
    String accessToken, {
    required RespondToInvitationRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'respondToInvitation: ответ на приглашение в команду ${request.teamId}, accept=${request.accept}',
      level: LogLevel.info,
    );

    // Находим приглашение
    final invitation = await TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(request.teamId)) &
          (t.userId.equals(userId)) &
          (t.status.equals(TeamMemberStatusType.invited)),
    );

    if (invitation == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Приглашение не найдено',
      );
    }

    // Проверяем срок действия
    if (invitation.invitationExpiresAt != null &&
        invitation.invitationExpiresAt!.isBefore(DateTime.now())) {
      // Удаляем просроченное приглашение
      await TeamMember.db.deleteRow(session, invitation);
      throw InvalidDataException(
        field: 'teamId',
        message: 'Приглашение истекло',
      );
    }

    if (request.accept) {
      // Принимаем приглашение
      invitation.status = TeamMemberStatusType.active;
      invitation.joinedAt = DateTime.now();
      await TeamMember.db.updateRow(session, invitation);

      session.log(
        'respondToInvitation: приглашение принято',
        level: LogLevel.info,
      );

      return SuccessResponse(
        success: true,
        message: 'Вы присоединились к команде',
      );
    } else {
      // Отклоняем — удаляем запись
      await TeamMember.db.deleteRow(session, invitation);

      session.log(
        'respondToInvitation: приглашение отклонено',
        level: LogLevel.info,
      );

      return SuccessResponse(
        success: true,
        message: 'Приглашение отклонено',
      );
    }
  }

  /// Отозвать приглашение.
  ///
  /// Доступно владельцу и администраторам.
  Future<SuccessResponse> revokeInvitation(
    Session session,
    String accessToken, {
    required RevokeInvitationRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'revokeInvitation: отзыв приглашения ${request.memberId}',
      level: LogLevel.info,
    );

    // Находим приглашение
    final invitation = await TeamMember.db.findById(session, request.memberId);

    if (invitation == null ||
        invitation.status != TeamMemberStatusType.invited) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Приглашение не найдено',
      );
    }

    // Проверяем права
    final actor = await _getMemberWithRole(
      session,
      teamId: invitation.teamId,
      userId: userId,
      requiredRoles: [TeamRoleType.owner, TeamRoleType.admin],
    );

    if (actor == null) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Недостаточно прав для отзыва приглашения',
      );
    }

    // Удаляем приглашение
    await TeamMember.db.deleteRow(session, invitation);

    session.log(
      'revokeInvitation: приглашение отозвано',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Приглашение отозвано',
    );
  }

  // ============================================================
  // УПРАВЛЕНИЕ УЧАСТНИКАМИ
  // ============================================================

  /// Получить список участников команды.
  ///
  /// Возвращает всех участников (активных и приглашённых).
  /// Доступно всем активным участникам команды.
  Future<List<TeamMember>> getTeamMembers(
    Session session,
    String accessToken, {
    required UuidValue teamId,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'getTeamMembers: получение участников команды $teamId',
      level: LogLevel.info,
    );

    // Проверяем, что пользователь — активный участник
    final actor = await _getActiveMember(
      session,
      teamId: teamId,
      userId: userId,
    );
    if (actor == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Нет доступа к команде',
      );
    }

    final members = await TeamMember.db.find(
      session,
      where: (t) => t.teamId.equals(teamId),
      include: TeamMember.include(user: User.include()),
      orderBy: (t) => t.joinedAt,
    );

    session.log(
      'getTeamMembers: найдено ${members.length} участников',
      level: LogLevel.info,
    );

    return members;
  }

  /// Изменить роль участника команды.
  ///
  /// Доступно владельцу и администраторам (с ограничениями).
  Future<SuccessResponse> updateMemberRole(
    Session session,
    String accessToken, {
    required UpdateMemberRoleRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'updateMemberRole: изменение роли участника ${request.memberId}',
      level: LogLevel.info,
    );

    // Находим участника
    final member = await TeamMember.db.findById(session, request.memberId);

    if (member == null || member.status != TeamMemberStatusType.active) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Участник не найден',
      );
    }

    // Нельзя изменить роль владельца
    if (member.role == TeamRoleType.owner) {
      throw InvalidDataException(
        field: 'memberId',
        message:
            'Нельзя изменить роль владельца. Используйте передачу владения.',
      );
    }

    // Нельзя назначить владельца
    if (request.newRole == TeamRoleType.owner) {
      throw InvalidDataException(
        field: 'newRole',
        message:
            'Нельзя назначить роль владельца. Используйте передачу владения.',
      );
    }

    // Нельзя изменить свою роль
    if (member.userId == userId) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Нельзя изменить свою роль',
      );
    }

    // Проверяем права
    final actor = await _getMemberWithRole(
      session,
      teamId: member.teamId,
      userId: userId,
      requiredRoles: [TeamRoleType.owner, TeamRoleType.admin],
    );

    if (actor == null) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Недостаточно прав для изменения ролей',
      );
    }

    // Администратор не может назначать администраторов
    if (actor.role == TeamRoleType.admin &&
        request.newRole == TeamRoleType.admin) {
      throw InvalidDataException(
        field: 'newRole',
        message: 'Администратор не может назначать других администраторов',
      );
    }

    // Обновляем роль
    member.role = request.newRole;
    await TeamMember.db.updateRow(session, member);

    session.log(
      'updateMemberRole: роль изменена на ${request.newRole}',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Роль участника изменена',
    );
  }

  /// Удалить участника из команды.
  ///
  /// Доступно владельцу и администраторам.
  Future<SuccessResponse> removeMember(
    Session session,
    String accessToken, {
    required RemoveMemberRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'removeMember: удаление участника ${request.memberId}',
      level: LogLevel.info,
    );

    // Находим участника
    final member = await TeamMember.db.findById(session, request.memberId);

    if (member == null) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Участник не найден',
      );
    }

    // Нельзя удалить владельца
    if (member.role == TeamRoleType.owner) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Нельзя удалить владельца команды',
      );
    }

    // Нельзя удалить себя (для этого есть leaveTeam)
    if (member.userId == userId) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Используйте "Покинуть команду" для выхода',
      );
    }

    // Проверяем права
    final actor = await _getMemberWithRole(
      session,
      teamId: member.teamId,
      userId: userId,
      requiredRoles: [TeamRoleType.owner, TeamRoleType.admin],
    );

    if (actor == null) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Недостаточно прав для удаления участников',
      );
    }

    // Администратор не может удалять других администраторов
    if (actor.role == TeamRoleType.admin && member.role == TeamRoleType.admin) {
      throw InvalidDataException(
        field: 'memberId',
        message: 'Администратор не может удалять других администраторов',
      );
    }

    // Удаляем
    await TeamMember.db.deleteRow(session, member);

    session.log(
      'removeMember: участник удалён',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Участник удалён из команды',
    );
  }

  /// Покинуть команду.
  ///
  /// Владелец не может покинуть команду — нужно сначала передать владение.
  Future<SuccessResponse> leaveTeam(
    Session session,
    String accessToken, {
    required LeaveTeamRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'leaveTeam: выход из команды ${request.teamId}',
      level: LogLevel.info,
    );

    // Находим членство
    final member = await TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(request.teamId)) &
          (t.userId.equals(userId)) &
          (t.status.equals(TeamMemberStatusType.active)),
    );

    if (member == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Вы не являетесь участником этой команды',
      );
    }

    // Владелец не может покинуть команду
    if (member.role == TeamRoleType.owner) {
      throw InvalidDataException(
        field: 'teamId',
        message:
            'Владелец не может покинуть команду. Сначала передайте владение или удалите команду.',
      );
    }

    // Удаляем членство
    await TeamMember.db.deleteRow(session, member);

    session.log(
      'leaveTeam: пользователь покинул команду',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Вы покинули команду',
    );
  }

  // ============================================================
  // ПЕРЕДАЧА ВЛАДЕНИЯ И УДАЛЕНИЕ
  // ============================================================

  /// Передать владение командой другому активному участнику.
  ///
  /// Доступно только владельцу.
  /// После передачи бывший владелец становится администратором.
  Future<SuccessResponse> transferOwnership(
    Session session,
    String accessToken, {
    required TransferTeamOwnershipRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'transferOwnership: передача владения командой ${request.teamId}',
      level: LogLevel.info,
    );

    // Проверяем, что текущий пользователь — владелец
    final currentOwner = await TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(request.teamId)) &
          (t.userId.equals(userId)) &
          (t.role.equals(TeamRoleType.owner)),
    );

    if (currentOwner == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Только владелец может передать владение',
      );
    }

    // Находим нового владельца
    final newOwner = await TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(request.teamId)) &
          (t.userId.equals(request.newOwnerId)) &
          (t.status.equals(TeamMemberStatusType.active)),
    );

    if (newOwner == null) {
      throw InvalidDataException(
        field: 'newOwnerId',
        message: 'Пользователь не является активным участником команды',
      );
    }

    if (newOwner.userId == userId) {
      throw InvalidDataException(
        field: 'newOwnerId',
        message: 'Вы уже являетесь владельцем',
      );
    }

    // Обновляем команду
    final team = await Team.db.findById(session, request.teamId);
    if (team != null) {
      team.ownerId = request.newOwnerId;
      team.updatedAt = DateTime.now();
      await Team.db.updateRow(session, team);
    }

    // Меняем роли
    currentOwner.role = TeamRoleType.admin;
    await TeamMember.db.updateRow(session, currentOwner);

    newOwner.role = TeamRoleType.owner;
    await TeamMember.db.updateRow(session, newOwner);

    session.log(
      'transferOwnership: владение передано пользователю ${request.newOwnerId}',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Владение командой передано',
    );
  }

  /// Удалить команду.
  ///
  /// Доступно только владельцу.
  /// Позволяет выбрать: удалить все приложения или забрать себе.
  ///
  /// ### Параметры
  /// - [request.teamId] — ID команды
  /// - [request.transferAppsToOwner] — true = забрать приложения, false = удалить
  /// - [request.confirmationName] — название команды для подтверждения
  Future<SuccessResponse> deleteTeam(
    Session session,
    String accessToken, {
    required DeleteTeamRequest request,
  }) async {
    final userId = await _authService.getUserId(session, accessToken);

    session.log(
      'deleteTeam: удаление команды ${request.teamId}',
      level: LogLevel.info,
    );

    // Проверяем, что текущий пользователь — владелец
    final owner = await TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(request.teamId)) &
          (t.userId.equals(userId)) &
          (t.role.equals(TeamRoleType.owner)),
    );

    if (owner == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Только владелец может удалить команду',
      );
    }

    // Находим команду
    final team = await Team.db.findById(session, request.teamId);
    if (team == null) {
      throw InvalidDataException(
        field: 'teamId',
        message: 'Команда не найдена',
      );
    }

    // Проверяем подтверждение
    if (request.confirmationName.trim() != team.name) {
      throw InvalidDataException(
        field: 'confirmationName',
        message: 'Название команды не совпадает',
      );
    }

    // Находим приложения команды
    final apps = await Application.db.find(
      session,
      where: (t) =>
          (t.ownerType.equals(OwnerType.team)) &
          (t.ownerTeamId.equals(request.teamId)),
    );

    if (request.transferAppsToOwner) {
      // Передаём приложения владельцу
      for (var app in apps) {
        app.ownerType = OwnerType.user;
        app.ownerUserId = userId;
        app.ownerTeamId = null;
        app.updatedAt = DateTime.now();
        await Application.db.updateRow(session, app);
      }

      session.log(
        'deleteTeam: ${apps.length} приложений передано владельцу',
        level: LogLevel.info,
      );
    } else {
      // Удаляем приложения (каскадно удалятся версии и т.д.)
      for (var app in apps) {
        await Application.db.deleteRow(session, app);
      }

      session.log(
        'deleteTeam: ${apps.length} приложений удалено',
        level: LogLevel.info,
      );
    }

    // Удаляем всех участников
    final members = await TeamMember.db.find(
      session,
      where: (t) => t.teamId.equals(request.teamId),
    );
    for (var member in members) {
      await TeamMember.db.deleteRow(session, member);
    }

    // Удаляем команду
    await Team.db.deleteRow(session, team);

    session.log(
      'deleteTeam: команда успешно удалена',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: request.transferAppsToOwner
          ? 'Команда удалена, приложения сохранены в вашем личном кабинете'
          : 'Команда и все приложения удалены',
    );
  }

  // ============================================================
  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ============================================================

  /// Получить активного участника команды.
  Future<TeamMember?> _getActiveMember(
    Session session, {
    required UuidValue teamId,
    required UuidValue userId,
  }) async {
    return TeamMember.db.findFirstRow(
      session,
      where: (t) =>
          (t.teamId.equals(teamId)) &
          (t.userId.equals(userId)) &
          (t.status.equals(TeamMemberStatusType.active)),
    );
  }

  /// Получить участника с проверкой роли.
  Future<TeamMember?> _getMemberWithRole(
    Session session, {
    required UuidValue teamId,
    required UuidValue userId,
    required List<TeamRoleType> requiredRoles,
  }) async {
    final member = await _getActiveMember(
      session,
      teamId: teamId,
      userId: userId,
    );

    if (member == null) return null;
    if (!requiredRoles.contains(member.role)) return null;

    return member;
  }

  /// Получить отображаемое название роли.
  String _getRoleDisplayName(TeamRoleType role) {
    switch (role) {
      case TeamRoleType.owner:
        return 'Владелец';
      case TeamRoleType.admin:
        return 'Администратор';
      case TeamRoleType.developer:
        return 'Разработчик';
      case TeamRoleType.observer:
        return 'Наблюдатель';
    }
  }
}
