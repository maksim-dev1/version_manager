// import 'package:flutter/material.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/shared/ui/platform_chip.dart';
// import 'package:version_manager_flutter/shared/ui/store_link_card.dart';

// class DetailsDialog extends StatelessWidget {
//   final AppVersion? version;
//   final Application? application;

//   const DetailsDialog({super.key, this.version, this.application});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;
//     return Dialog(
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxHeight: 600,
//           maxWidth: 700,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: colorScheme.primaryContainer,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(28),
//                     topRight: Radius.circular(28),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.info_outline_rounded,
//                         color: colorScheme.onPrimaryContainer,
//                         size: 32,
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,

//                           children: [
//                             Text(
//                               application != null
//                                   ? application!.appName
//                                   : 'Версия ${version!.version}',
//                               style: theme.textTheme.headlineSmall?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: colorScheme.onPrimaryContainer,
//                               ),
//                             ),
//                             Text(
//                               application != null
//                                   ? application!.packageName
//                                   : 'Build ${version!.buildNumber}',
//                               style: theme.textTheme.bodyMedium?.copyWith(
//                                 color: colorScheme.onPrimaryContainer,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () => Navigator.of(context).pop(),
//                         icon: Icon(
//                           Icons.close_rounded,
//                           color: colorScheme.onPrimaryContainer,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Builder(
//               builder: (context) {
//                 if (application != null) {
//                   return Expanded(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.all(24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 width: 98,
//                                 height: 98,
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     color: colorScheme.primaryContainer,
//                                     borderRadius: BorderRadius.circular(12),
//                                     image: application!.iconUrl.isNotEmpty
//                                         ? DecorationImage(
//                                             image: NetworkImage(
//                                               application!.iconUrl,
//                                             ),
//                                             fit: BoxFit.cover,
//                                           )
//                                         : null,
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               if (!application!.isActive)
//                                 Chip(
//                                   avatar: Icon(
//                                     Icons.app_blocking_outlined,
//                                     size: 18,
//                                     color: colorScheme.error,
//                                   ),
//                                   label: const Text('Приложение не активно'),
//                                   backgroundColor: colorScheme.errorContainer,
//                                 ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           HeaderText(title: 'Название приложения'),
//                           Text(
//                             application!.appName,
//                             style: theme.textTheme.bodyMedium,
//                           ),
//                           const SizedBox(height: 16),
//                           HeaderText(title: 'Название пакета'),
//                           Text(
//                             application!.packageName,
//                             style: theme.textTheme.bodyMedium,
//                           ),
//                           const SizedBox(height: 16),
//                           HeaderText(title: 'Описание'),
//                           Text(
//                             application!.description.isNotEmpty
//                                 ? application!.description
//                                 : 'Описание не указано',
//                             style: theme.textTheme.bodyMedium,
//                           ),
//                           const SizedBox(height: 16),

//                           HeaderText(title: 'Информация'),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.calendar_today_rounded,
//                                 size: 16,
//                                 color: colorScheme.onSurfaceVariant,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 'Создано: ${application!.createdAt.toLocal().toString().split('.').first}',
//                                 style: theme.textTheme.bodyMedium,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.update_rounded,
//                                 size: 16,
//                                 color: colorScheme.onSurfaceVariant,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 'Обновлено: ${application!.updatedAt.toLocal().toString().split('.').first}',
//                                 style: theme.textTheme.bodyMedium,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//                 return Expanded(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(24),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,

//                       children: [
//                         if (version!.isBlocked || version!.recommendedUpdate)
//                           HeaderText(title: 'Статусы'),
//                         Wrap(
//                           spacing: 8,
//                           runSpacing: 8,
//                           children: [
//                             if (version!.isBlocked)
//                               Chip(
//                                 avatar: Icon(
//                                   Icons.block_rounded,
//                                   size: 18,
//                                   color: colorScheme.error,
//                                 ),
//                                 label: const Text('Заблокирована'),
//                                 backgroundColor: colorScheme.errorContainer,
//                               ),
//                             if (version!.recommendedUpdate)
//                               Chip(
//                                 avatar: Icon(
//                                   Icons.star_rounded,
//                                   size: 18,
//                                   color: colorScheme.primary,
//                                 ),
//                                 label: const Text('Рекомендуемая'),
//                                 backgroundColor: colorScheme.primaryContainer,
//                               ),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         if (version!.isBlocked)
//                           HeaderText(title: 'Причина блокировки'),
//                         if (version!.isBlocked)
//                           Text(
//                             version!.blockReason ?? 'Причина не указана',
//                             style: theme.textTheme.bodyMedium,
//                           ),
//                         const SizedBox(height: 16),
//                         HeaderText(title: 'Платформа'),
//                         PlatformChip(platform: version!.platform),
//                         const SizedBox(height: 16),
//                         HeaderText(title: 'Список изменений'),
//                         SizedBox(
//                           width: double.infinity,
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color: colorScheme.surfaceContainerHighest,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(16),
//                               child: Text(
//                                 version!.changelog,
//                                 style: theme.textTheme.bodyMedium,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         if (version!.storeLinks.isNotEmpty)
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               HeaderText(title: 'Ссылки на магазины'),
//                               ListView.separated(
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {

//                                   final link = version!.storeLinks[index];
//                                   return StoreLinkCard(storeLink: link);
//                                 },
//                                 separatorBuilder: (context, index) {
//                                   return const SizedBox(height: 8);
//                                 },
//                                 itemCount: version!.storeLinks.length,
//                               ),
//                               const SizedBox(height: 16),
//                             ],
//                           ),
//                         HeaderText(title: 'Информация'),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.calendar_today_rounded,
//                               size: 16,
//                               color: colorScheme.onSurfaceVariant,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               'Создано: ${version!.createdAt.toLocal().toString().split('.').first}',
//                               style: theme.textTheme.bodyMedium,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.update_rounded,
//                               size: 16,
//                               color: colorScheme.onSurfaceVariant,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               'Обновлено: ${version!.updatedAt.toLocal().toString().split('.').first}',
//                               style: theme.textTheme.bodyMedium,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HeaderText extends StatelessWidget {
//   final String title;
//   const HeaderText({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(
//         title,
//         style: Theme.of(context).textTheme.titleMedium?.copyWith(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
