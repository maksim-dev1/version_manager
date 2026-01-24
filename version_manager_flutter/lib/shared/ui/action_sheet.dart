import 'package:flutter/material.dart';
import 'package:version_manager_client/version_manager_client.dart';

class ActionSheet extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleActive;
  final String title;
  final bool isBlocked;

  const ActionSheet({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleActive,
    required this.title,
    required this.isBlocked,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            // Заголовок
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    title,
                    // app != null
                    //     ? 'Действия с приложением ${app!.appName}'
                    //     : 'Действия с версией ${version!.version}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Редактировать
            ListTile(
              leading: Icon(
                Icons.edit_rounded,
                color: colorScheme.primary,
              ),
              title: const Text('Редактировать'),
              onTap: onEdit,
              // onTap: app != null
              //     ? () {
              //         Navigator.pop(context);
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => AddApplicationScreen(
              //               application: app,
              //             ),
              //           ),
              //         );
              //       }
              //     : () {
              //         print('Version edit action');
              //       },
            ),
            // Заблокировать/Разблокировать
              ListTile(
                leading: Icon(
                  isBlocked
                      ? Icons.lock_open_rounded
                      : Icons.lock_outline_rounded,
                  color: isBlocked ? Colors.green : colorScheme.error,
                ),
                title: Text(
                  isBlocked ? 'Разблокировать' : 'Заблокировать',
                ),
                onTap: onToggleActive,
                // onTap: () async {
                // Navigator.of(context).pop();
                // if (version!.isBlocked) {
                //   // Разблокировать
                //   final confirmed = await ConfirmationDialog.show(
                //     context: context,
                //     title: 'Разблокировать версию?',
                //     content:
                //         'Версия ${version!.version} будет доступна пользователям.',
                //     confirmText: 'Разблокировать',
                //   );

                //   if (confirmed == true && context.mounted) {
                //     context.read<VersionBloc>().add(
                //       VersionEvent.blockUnblockVersion(
                //         id: version!.id!,
                //         isBlocked: false,
                //         reason: '',
                //       ),
                //     );
                //   }
                // } else {
                //   // Заблокировать
                //   showDialog(
                //     context: context,
                //     builder: (context) =>
                //         BlockReasonDialog(version: version!.version),
                //   );
                // }
                // },
              ),

            // Удалить
            ListTile(
              leading: Icon(
                Icons.delete_rounded,
                color: colorScheme.error,
              ),
              title: Text(
                'Удалить',
                style: TextStyle(color: colorScheme.error),
              ),
              onTap: onDelete,
              // onTap: () async {
              // Navigator.of(context).pop();
              // final confirmed = await ConfirmationDialog.show(
              //   context: context,
              //   title: 'Удалить версию?',
              //   content:
              //       'Версия ${version!.version} будет удалена без возможности восстановления.',
              //   confirmText: 'Удалить',
              // );

              // if (confirmed == true && context.mounted) {
              //   context.read<VersionBloc>().add(
              //     VersionEvent.deleteVersion(version: version!),
              //   );
              // }
              // },
            ),
          ],
        ),
      ),
    );
  }

  // void _showBlockReasonDialog(BuildContext context) {
  //   final reasonController = TextEditingController();
  //   final formKey = GlobalKey<FormState>();

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Блокировка версии'),
  //       content: Form(
  //         key: formKey,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Укажите причину блокировки версии ${version!.version}:',
  //               style: Theme.of(context).textTheme.bodyMedium,
  //             ),
  //             const SizedBox(height: 16),
  //             TextFormField(
  //               controller: reasonController,
  //               decoration: InputDecoration(
  //                 labelText: 'Причина блокировки',
  //                 hintText: 'Например: критическая ошибка',
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //                 filled: true,
  //               ),
  //               maxLines: 3,
  //               validator: (value) {
  //                 if (value == null || value.trim().isEmpty) {
  //                   return 'Укажите причину блокировки';
  //                 }
  //                 return null;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: const Text('Отмена'),
  //         ),
  //         FilledButton(
  //           onPressed: () {
  //             if (formKey.currentState?.validate() ?? false) {
  //               Navigator.of(context).pop();
  //               context.read<VersionBloc>().add(
  //                 VersionEvent.blockUnblockVersion(
  //                   id: version!.id!,
  //                   isBlocked: true,
  //                   reason: reasonController.text.trim(),
  //                 ),
  //               );
  //             }
  //           },
  //           child: const Text('Заблокировать'),
  //         ),

  //       ],
  //     ),
  //   );
  // }
}
