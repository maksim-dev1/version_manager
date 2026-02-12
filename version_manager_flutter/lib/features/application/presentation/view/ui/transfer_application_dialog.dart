import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/presentation/bloc/application_bloc.dart';

/// Диалог передачи владения приложением.
///
/// Позволяет перенести приложение:
/// - из личного в команду
/// - из команды в личное
/// - из одной команды в другую
class TransferApplicationDialog extends StatefulWidget {
  final Application application;

  const TransferApplicationDialog({
    super.key,
    required this.application,
  });

  @override
  State<TransferApplicationDialog> createState() =>
      _TransferApplicationDialogState();
}

class _TransferApplicationDialogState extends State<TransferApplicationDialog> {
  late _TransferTarget _target;
  UuidValue? _selectedTeamId;

  @override
  void initState() {
    super.initState();
    // Если приложение личное — по умолчанию «в команду»,
    // если командное — по умолчанию «в личные»
    _target = widget.application.ownerType == OwnerType.user
        ? _TransferTarget.team
        : _TransferTarget.personal;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Берём список команд из BLoC-состояния
    final state = context.read<ApplicationBloc>().state;
    final teams = state is ApplicationLoaded ? state.teams : <Team>[];

    // Исключаем текущую команду-владельца (если передаём из команды)
    final availableTeams = teams
        .where((t) => t.id != widget.application.ownerTeamId)
        .toList();

    final isPersonal = widget.application.ownerType == OwnerType.user;
    final currentOwner = isPersonal
        ? 'Личное приложение'
        : 'Команда «${widget.application.ownerTeam?.name ?? '...'}»';

    return AlertDialog(
      title: const Text('Передать владение'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Текущий владелец
            _InfoRow(
              label: 'Приложение',
              value: widget.application.name,
              textTheme: textTheme,
            ),
            const SizedBox(height: 4),
            _InfoRow(
              label: 'Текущий владелец',
              value: currentOwner,
              textTheme: textTheme,
            ),
            const SizedBox(height: 20),

            // Куда передаём
            Text(
              'Передать',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            // Если приложение командное — показываем выбор «В личные» / «В другую команду»
            // Если личное — только «В команду»
            if (!isPersonal)
              _TransferTargetSelector(
                target: _target,
                onChanged: (target) {
                  setState(() {
                    _target = target;
                    _selectedTeamId = null;
                  });
                },
              ),

            // Выбор целевой команды
            if (_target == _TransferTarget.team)
              _TeamSelector(
                availableTeams: availableTeams,
                isPersonal: isPersonal,
                onChanged: (value) {
                  setState(() => _selectedTeamId = value);
                },
              ),

            const SizedBox(height: 16),

            // Предупреждение
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 20,
                    color: colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'После передачи управление приложением '
                      'перейдёт к новому владельцу.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: _canSubmit(availableTeams) ? _submit : null,
          child: const Text('Передать'),
        ),
      ],
    );
  }

  bool _canSubmit(List<Team> availableTeams) {
    if (_target == _TransferTarget.personal) return true;
    return _selectedTeamId != null && availableTeams.isNotEmpty;
  }

  void _submit() {
    final bloc = context.read<ApplicationBloc>();
    Navigator.pop(context);

    if (_target == _TransferTarget.personal) {
      bloc.add(
        ApplicationEvent.transferApplicationOwnership(
          applicationId: widget.application.id!,
          newOwnerType: OwnerType.user,
        ),
      );
    } else {
      bloc.add(
        ApplicationEvent.transferApplicationOwnership(
          applicationId: widget.application.id!,
          newOwnerType: OwnerType.team,
          newTeamId: _selectedTeamId,
        ),
      );
    }
  }
}

enum _TransferTarget { personal, team }

/// Переключатель «В личные» / «В команду».
class _TransferTargetSelector extends StatelessWidget {
  final _TransferTarget target;
  final ValueChanged<_TransferTarget> onChanged;

  const _TransferTargetSelector({
    required this.target,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SegmentedButton<_TransferTarget>(
          segments: const [
            ButtonSegment(
              value: _TransferTarget.personal,
              icon: Icon(Icons.person_outlined),
              label: Text('В личные'),
            ),
            ButtonSegment(
              value: _TransferTarget.team,
              icon: Icon(Icons.groups_outlined),
              label: Text('В команду'),
            ),
          ],
          selected: {target},
          onSelectionChanged: (selected) => onChanged(selected.first),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

/// Выбор целевой команды.
class _TeamSelector extends StatelessWidget {
  final List<Team> availableTeams;
  final bool isPersonal;
  final ValueChanged<UuidValue?> onChanged;

  const _TeamSelector({
    required this.availableTeams,
    required this.isPersonal,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (availableTeams.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          isPersonal
              ? 'У вас нет команд для передачи.'
              : 'Нет других команд для передачи.',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.error,
          ),
        ),
      );
    }

    return DropdownButtonFormField<UuidValue>(
      decoration: const InputDecoration(
        labelText: 'Целевая команда',
      ),
      items: List.generate(
        availableTeams.length,
        (index) => DropdownMenuItem(
          value: availableTeams[index].id,
          child: Text(availableTeams[index].name),
        ),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) return 'Выберите команду';
        return null;
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme textTheme;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Text(
          '$label: ',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
