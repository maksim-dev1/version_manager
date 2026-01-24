import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/feature/applications/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/shared/ui/my_text_form_field.dart';

class AddApplicationScreen extends StatefulWidget {
  final Application? application;
  const AddApplicationScreen({super.key, this.application});

  @override
  State<AddApplicationScreen> createState() => _AddApplicationScreenState();
}

class _AddApplicationScreenState extends State<AddApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _packageNameController = TextEditingController();
  final _appNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _iconUrlController = TextEditingController();

  bool _isDialogShowing = false; // Флаг открытия диалога

  @override
  void initState() {
    super.initState();
    if (widget.application != null) {
      _packageNameController.text = widget.application!.packageName;
      _appNameController.text = widget.application!.appName;
      _descriptionController.text = widget.application!.description;
      _iconUrlController.text = widget.application!.iconUrl;
    }
  }

  @override
  void dispose() {
    _packageNameController.dispose();
    _appNameController.dispose();
    _descriptionController.dispose();
    _iconUrlController.dispose();
    super.dispose();
  }

  void _addApp() {
    if (_formKey.currentState?.validate() ?? false) {
      final application = Application(
        packageName: _packageNameController.text.trim(),
        appName: _appNameController.text.trim(),
        description: _descriptionController.text.trim(),
        iconUrl: _iconUrlController.text.trim(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      context.read<ApplicationBloc>().add(
        ApplicationEvent.addAplication(application: application),
      );
    }
  }

  // TODO: Добавить проверку на изменения данных
  void _editApp() {
    if (_formKey.currentState?.validate() ?? false) {
      final application = Application(
        packageName: _packageNameController.text.trim(),
        appName: _appNameController.text.trim(),
        description: _descriptionController.text.trim(),
        iconUrl: _iconUrlController.text.trim(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      context.read<ApplicationBloc>().add(
        ApplicationEvent.editApplication(
          changeablePackageName: widget.application!.packageName,
          application: application,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocListener<ApplicationBloc, ApplicationState>(
      listener: (context, state) => switch (state) {
        ApplicationLoading() => {
          _isDialogShowing = true,
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        },
        ApplicationLoaded() => {
          if (_isDialogShowing)
            {
              Navigator.of(context).pop(),
              _isDialogShowing = false,
            },
          Navigator.of(context).pop(),
        },
        ApplicationError(:final message) => {
          if (_isDialogShowing)
            {
              Navigator.of(context).pop(),
              _isDialogShowing = false,
            },
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colorScheme.error,
              content: Text(
                'Ошибка: $message',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onError,
                ),
              ),
            ),
          ),
        },
        _ => null,
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: const Text('Добавить приложение'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Заголовок с иконкой
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.add_box_rounded,
                                  color: colorScheme.onPrimaryContainer,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Новое приложение',
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Заполните информацию о приложении',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Package Name
                          MyTextFormField(
                            controller: _packageNameController,
                            labelText: 'Package Name',
                            prefixIcon: Icons.code_rounded,
                            hintText: 'com.example.app',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Введите package name';
                              }
                              if (!RegExp(
                                r'^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$',
                              ).hasMatch(value.trim())) {
                                return 'Неверный формат (пример: com.example.app)';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // App Name
                          MyTextFormField(
                            controller: _appNameController,
                            labelText: 'Название приложения',
                            prefixIcon: Icons.apps_rounded,
                            hintText: 'Мое приложение',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Введите название';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // Description
                          MyTextFormField(
                            controller: _descriptionController,
                            labelText: 'Описание',
                            prefixIcon: Icons.description_rounded,
                            hintText: 'Краткое описание приложения',
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Введите описание';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // Icon URL
                          MyTextFormField(
                            controller: _iconUrlController,
                            labelText: 'URL иконки',
                            prefixIcon: Icons.image_rounded,
                            hintText: 'https://example.com/icon.png',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Введите URL иконки';
                              }
                              final uri = Uri.tryParse(value.trim());
                              if (uri == null || !uri.hasScheme) {
                                return 'Неверный формат URL';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),

                          // Submit Button
                          FilledButton.icon(
                            onPressed: widget.application != null
                                ? _editApp
                                : _addApp,
                            icon: const Icon(Icons.check_rounded),
                            label: Text(
                              widget.application != null
                                  ? 'Редактировать приложение'
                                  : 'Добавить приложение',
                            ),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
