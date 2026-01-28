// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/feature/versions/presentation/bloc/version_bloc.dart';
// import 'package:version_manager_flutter/shared/ui/action_sheet.dart';
// import 'package:version_manager_flutter/shared/ui/details_dialog.dart';

// class VersionCard extends StatelessWidget {
//   final AppVersion version;
//   const VersionCard({super.key, required this.version});

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final theme = Theme.of(context);

//     return Card(
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           showDialog(
//             context: context,
//             builder: (context) => DetailsDialog(
//               version: version,
//             ),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Заголовок с версией и статусом
//               Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.android_rounded,
//                           color: colorScheme.primary,
//                           size: 28,
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Версия ${version.version}',
//                               style: theme.textTheme.titleMedium?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               'Build ${version.buildNumber}',
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 color: colorScheme.onSurfaceVariant,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (version.isBlocked)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: colorScheme.errorContainer,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.block_rounded,
//                             size: 16,
//                             color: colorScheme.onErrorContainer,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             'Заблокирована',
//                             style: theme.textTheme.labelSmall?.copyWith(
//                               color: colorScheme.onErrorContainer,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   if (version.recommendedUpdate && !version.isBlocked)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: colorScheme.primaryContainer,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.star_rounded,
//                             size: 16,
//                             color: colorScheme.onPrimaryContainer,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             'Рекомендуемая',
//                             style: theme.textTheme.labelSmall?.copyWith(
//                               color: colorScheme.onPrimaryContainer,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               // Changelog
//               if (version.changelog.isNotEmpty)
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Что нового:',
//                         style: theme.textTheme.labelMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         version.changelog,
//                         style: theme.textTheme.bodySmall,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 12),

//               // Дата выпуска и действия
//               Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_today_rounded,
//                     size: 16,
//                     color: colorScheme.onSurfaceVariant,
//                   ),
//                   const SizedBox(width: 6),
//                   Text(
//                     version.createdAt.toLocal().toString().split(' ').first,
//                     style: theme.textTheme.bodySmall?.copyWith(
//                       color: colorScheme.onSurfaceVariant,
//                     ),
//                   ),
//                   const Spacer(),
//                   // IconButton(
//                   //   onPressed: () => showDialog(
//                   //     context: context,
//                   //     builder: (context) => DetailsDialog(
//                   //       version: version,
//                   //     ),
//                   //   ),
//                   //   icon: const Icon(Icons.info_outline_rounded),
//                   //   tooltip: 'Подробнее',
//                   // ),
//                   IconButton(
//                     onPressed: () => showModalBottomSheet(
//                       context: context,
//                       builder: (_) => ActionSheet(
//                         onEdit: () {
//                           print('Version edit action');
//                         },
//                         onDelete: () {
                         
//                         },
//                         onToggleActive: () {
//                            context.read<VersionBloc>().add(
//                             VersionEvent.blockUnblockVersion(
//                               id: version.id!,
//                               isBlocked: !version.isBlocked,
//                               reason: 'test',
//                             ),
//                           );
//                         },
//                         title: 'Действия с версией ${version.version}',
//                         isBlocked: version.isBlocked,
//                       ),
//                     ),
//                     icon: const Icon(Icons.more_vert_rounded),
//                     tooltip: 'Действия',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
