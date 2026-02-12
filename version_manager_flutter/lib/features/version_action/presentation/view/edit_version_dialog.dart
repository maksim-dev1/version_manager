import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version_action/presentation/bloc/version_action_bloc.dart';
import 'package:version_manager_flutter/features/version_detail/presentation/bloc/version_detail_bloc.dart';

/// Диалог редактирования версии с расширенными настройками.
class EditVersionDialog extends StatefulWidget {
  final VersionListItem version;
  final UuidValue applicationId;

  const EditVersionDialog({
    super.key,
    required this.version,
    required this.applicationId,
  });

  @override
  State<EditVersionDialog> createState() => _EditVersionDialogState();
}

class _EditVersionDialogState extends State<EditVersionDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _changelogController;
  late final TextEditingController _blockReasonController;

  // Основные поля
  bool _isBlocked = false;

  // Рекомендации
  bool _hasRecommendation = false;
  Version? _selectedRecommendedVersion;
  RecommendationFrequencyType _frequencyType =
      RecommendationFrequencyType.everyLaunch;
  final _nthLaunchController = TextEditingController(text: '5');
  int _periodHours = 24;

  // Данные из сервера
  VersionDetailResponse? _detail;
  bool _isLoading = true;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _changelogController = TextEditingController(
      text: widget.version.changelog,
    );
    _blockReasonController = TextEditingController(
      text: widget.version.blockReason ?? '',
    );
    _isBlocked = widget.version.isBlocked;
  }

  @override
  void dispose() {
    _changelogController.dispose();
    _blockReasonController.dispose();
    _nthLaunchController.dispose();
    super.dispose();
  }

  void _applyDetail(VersionDetailResponse detail) {
    setState(() {
      _detail = detail;
      _isLoading = false;
      _loadError = null;

      final version = detail.version;
      _isBlocked = version.isBlocked;
      _blockReasonController.text = version.blockReason ?? '';

      if (version.recommendedVersionId != null) {
        _hasRecommendation = true;
        _selectedRecommendedVersion = detail.newerVersions
            .where(
              (v) => v.id == version.recommendedVersionId,
            )
            .firstOrNull;
        _frequencyType =
            version.recommendationFrequency ??
            RecommendationFrequencyType.everyLaunch;
        _nthLaunchController.text = (version.recommendationEveryNthLaunch ?? 5)
            .toString();
        _periodHours = version.recommendationPeriodHours ?? 24;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VersionDetailBloc, VersionDetailState>(
      listener: (context, state) {
        switch (state) {
          case VersionDetailLoaded(:final detail):
            _applyDetail(detail);
          case VersionDetailError(:final message):
            if (_isLoading) {
              setState(() {
                _isLoading = false;
                _loadError = message;
              });
            }
          default:
            break;
        }
      },
      child: AlertDialog(
        title: Text('Версия ${widget.version.versionNumber}'),
        content: _isLoading
            ? const SizedBox(
                width: 480,
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              )
            : _loadError != null
            ? _ErrorContent(
                error: _loadError!,
                onRetry: () {
                  setState(() {
                    _isLoading = true;
                    _loadError = null;
                  });
                  context.read<VersionDetailBloc>().add(
                    VersionDetailEvent.loadDetail(
                      versionId: widget.version.id,
                    ),
                  );
                },
              )
            : _buildForm(context),
        actions: _isLoading || _loadError != null
            ? [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Закрыть'),
                ),
              ]
            : [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Отмена'),
                ),
                FilledButton.icon(
                  onPressed: _onSubmit,
                  icon: const Icon(Icons.save_outlined, size: 18),
                  label: const Text('Сохранить'),
                ),
              ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final detail = _detail!;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 480,
        maxWidth: 480,
        maxHeight: 600,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Информация о версии (read-only) ──
              _ReadOnlyField(
                label: 'Номер версии',
                value: detail.version.versionNumber,
              ),
              const SizedBox(height: 8),
              _ReadOnlyField(
                label: 'Номер сборки',
                value: '#${detail.version.buildNumber}',
              ),
              const SizedBox(height: 16),

              // ── Changelog ──
              TextFormField(
                controller: _changelogController,
                decoration: const InputDecoration(
                  labelText: 'Changelog',
                  helperText: 'От 10 до 2000 символов',
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                minLines: 2,
                maxLength: 2000,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Укажите описание изменений';
                  }
                  if (value.trim().length < 10) {
                    return 'Минимум 10 символов';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Divider(),
              const SizedBox(height: 12),

              // ── Блокировка ──
              if (!detail.isLatest) ...[
                Text(
                  'Блокировка',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  title: const Text('Заблокировать версию'),
                  subtitle: Text(
                    _isBlocked
                        ? 'Пользователи не смогут использовать эту версию'
                        : 'Версия доступна для использования',
                    style: textTheme.bodySmall,
                  ),
                  value: _isBlocked,
                  onChanged: (value) => setState(() => _isBlocked = value),
                  contentPadding: EdgeInsets.zero,
                ),
                if (_isBlocked) ...[
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _blockReasonController,
                    decoration: const InputDecoration(
                      labelText: 'Причина блокировки',
                      hintText: 'Минимум 10 символов',
                    ),
                    maxLines: 2,
                    maxLength: 500,
                    validator: (value) {
                      if (_isBlocked &&
                          (value == null || value.trim().length < 10)) {
                        return 'Укажите причину блокировки (минимум 10 символов)';
                      }
                      return null;
                    },
                  ),
                ],
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
              ] else ...[
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
                          'Это новейшая версия. Блокировка и рекомендации '
                          'обновления недоступны.',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // ── Рекомендация обновления ──
              if (!detail.isLatest) ...[
                Text(
                  'Рекомендация обновления',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                if (detail.newerVersions.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Нет доступных версий для рекомендации.',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else ...[
                  SwitchListTile(
                    title: const Text('Рекомендовать обновление'),
                    subtitle: Text(
                      _hasRecommendation
                          ? 'Пользователям будет предложено обновиться'
                          : 'Рекомендация обновления отключена',
                      style: textTheme.bodySmall,
                    ),
                    value: _hasRecommendation,
                    onChanged: (value) =>
                        setState(() => _hasRecommendation = value),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (_hasRecommendation) ...[
                    const SizedBox(height: 12),

                    // Целевая версия
                    DropdownButtonFormField<Version>(
                      decoration: const InputDecoration(
                        labelText: 'Целевая версия',
                        helperText:
                            'Версия, на которую рекомендуется обновиться',
                      ),
                      initialValue: _selectedRecommendedVersion,
                      items: detail.newerVersions
                          .map(
                            (v) => DropdownMenuItem(
                              value: v,
                              child: Text(
                                'v${v.versionNumber} (#${v.buildNumber})',
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() => _selectedRecommendedVersion = value);
                      },
                      validator: (value) {
                        if (_hasRecommendation && value == null) {
                          return 'Выберите целевую версию';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Частота показа
                    Text(
                      'Частота показа',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _FrequencySelector(
                      value: _frequencyType,
                      nthLaunchController: _nthLaunchController,
                      periodHours: _periodHours,
                      onFrequencyChanged: (type) =>
                          setState(() => _frequencyType = type),
                      onPeriodChanged: (hours) =>
                          setState(() => _periodHours = hours),
                    ),
                  ],
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final detail = _detail!;
    Navigator.pop(context);

    // Собираем параметры обновления
    final actionBloc = context.read<VersionActionBloc>();

    // Если рекомендация была, а теперь убрали — clearRecommendation
    final hadRecommendation = detail.version.recommendedVersionId != null;
    final clearRec = hadRecommendation && !_hasRecommendation;

    actionBloc.add(
      VersionActionEvent.updateVersion(
        versionId: widget.version.id,
        changelog: _changelogController.text.trim(),
        isBlocked: !detail.isLatest ? _isBlocked : null,
        blockReason: !detail.isLatest && _isBlocked
            ? _blockReasonController.text.trim()
            : null,
        recommendedVersionId: _hasRecommendation
            ? _selectedRecommendedVersion?.id
            : null,
        clearRecommendation: clearRec ? true : null,
        recommendationFrequency: _hasRecommendation ? _frequencyType : null,
        recommendationEveryNthLaunch:
            _hasRecommendation &&
                _frequencyType == RecommendationFrequencyType.everyNthLaunch
            ? int.tryParse(_nthLaunchController.text.trim())
            : null,
        recommendationPeriodHours:
            _hasRecommendation &&
                _frequencyType == RecommendationFrequencyType.oncePer
            ? _periodHours
            : null,
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────
// Вспомогательные виджеты
// ──────────────────────────────────────────────────────────────────

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Text(
          '$label: ',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ErrorContent extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorContent({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 480,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(
            error,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
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

class _FrequencySelector extends StatelessWidget {
  final RecommendationFrequencyType value;
  final TextEditingController nthLaunchController;
  final int periodHours;
  final ValueChanged<RecommendationFrequencyType> onFrequencyChanged;
  final ValueChanged<int> onPeriodChanged;

  const _FrequencySelector({
    required this.value,
    required this.nthLaunchController,
    required this.periodHours,
    required this.onFrequencyChanged,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Тип частоты
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FrequencyChip(
              label: 'Каждый запуск',
              selected: value == RecommendationFrequencyType.everyLaunch,
              onSelected: () => onFrequencyChanged(
                RecommendationFrequencyType.everyLaunch,
              ),
            ),
            _FrequencyChip(
              label: 'Каждый N-й запуск',
              selected: value == RecommendationFrequencyType.everyNthLaunch,
              onSelected: () => onFrequencyChanged(
                RecommendationFrequencyType.everyNthLaunch,
              ),
            ),
            _FrequencyChip(
              label: 'Раз в период',
              selected: value == RecommendationFrequencyType.oncePer,
              onSelected: () => onFrequencyChanged(
                RecommendationFrequencyType.oncePer,
              ),
            ),
            _FrequencyChip(
              label: 'Однократно',
              selected: value == RecommendationFrequencyType.once,
              onSelected: () => onFrequencyChanged(
                RecommendationFrequencyType.once,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Параметры для everyNthLaunch
        if (value == RecommendationFrequencyType.everyNthLaunch) ...[
          TextFormField(
            controller: nthLaunchController,
            decoration: const InputDecoration(
              labelText: 'Каждый N-й запуск',
              helperText: 'От 2 до 50',
            ),
            keyboardType: TextInputType.number,
            validator: (v) {
              final n = int.tryParse(v?.trim() ?? '');
              if (n == null || n < 2 || n > 50) {
                return 'Введите число от 2 до 50';
              }
              return null;
            },
          ),
        ],

        // Параметры для oncePer
        if (value == RecommendationFrequencyType.oncePer) ...[
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              labelText: 'Период показа',
            ),
            initialValue: periodHours,
            items: const [
              DropdownMenuItem(value: 24, child: Text('Раз в сутки')),
              DropdownMenuItem(value: 72, child: Text('Раз в 3 дня')),
              DropdownMenuItem(value: 168, child: Text('Раз в неделю')),
              DropdownMenuItem(value: 336, child: Text('Раз в 2 недели')),
              DropdownMenuItem(value: 720, child: Text('Раз в месяц')),
            ],
            onChanged: (v) {
              if (v != null) onPeriodChanged(v);
            },
          ),
        ],
      ],
    );
  }
}

class _FrequencyChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const _FrequencyChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
    );
  }
}
