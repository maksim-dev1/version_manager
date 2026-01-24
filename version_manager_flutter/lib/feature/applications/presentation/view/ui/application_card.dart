import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/feature/applications/presentation/bloc/application_bloc.dart';
import 'package:version_manager_flutter/feature/applications/presentation/view/add_application_screen.dart';
import 'package:version_manager_flutter/shared/ui/action_sheet.dart';
import 'package:version_manager_flutter/shared/ui/confirmation_dialog.dart';
import 'package:version_manager_flutter/shared/ui/details_dialog.dart';

class ApplicationCard extends StatelessWidget {
  final Application application;
  const ApplicationCard({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: application.isActive ? null : colorScheme.errorContainer,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => VersionsScreen(
          //       application: application,
          //     ),
          //   ),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(
                width: 56,
                height: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                    image: application.iconUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(application.iconUrl),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application.appName,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        //             ),
                      ),
                      Text(
                        application.packageName,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              if (!application.isActive)
                Tooltip(
                  message: 'Приложение не активно',
                  child: Icon(
                    Icons.app_blocking_outlined,
                  ),
                ),
              SizedBox(width: 12),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        DetailsDialog(application: application),
                  );
                },
                icon: const Icon(Icons.info_outline_rounded),
              ),
              SizedBox(width: 12),
              IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => ActionSheet(
                    onEdit: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<ApplicationBloc>(),
                            child: AddApplicationScreen(
                              application: application,
                            ),
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (_) => ConfirmationDialog(
                          title: 'Удалить приложение',
                          content: 'Вы уверенны что хотете удалить приложение?',
                          onConfirm: () {
                            context.read<ApplicationBloc>().add(
                              ApplicationEvent.deleteApplication(
                                packageName: application.packageName,
                              ),
                            );
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    onToggleActive: () {
                      if (application.isActive) {
                        showDialog(
                          context: context,
                          builder: (_) => ConfirmationDialog(
                            title: 'Блокировка приложения',
                            content:
                                'Вы уверенны что хотете заблокировать приложение?',
                            onConfirm: () {
                              context.read<ApplicationBloc>().add(
                                ApplicationEvent.deactivateApplication(
                                  packageName: application.packageName,
                                  isActive: !application.isActive,
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),
                        );
                      } else {
                        context.read<ApplicationBloc>().add(
                          ApplicationEvent.deactivateApplication(
                            packageName: application.packageName,
                            isActive: !application.isActive,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    title: 'Действия с приложением ${application.appName}',
                    isBlocked: !application.isActive,
                  ),
                ),
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
