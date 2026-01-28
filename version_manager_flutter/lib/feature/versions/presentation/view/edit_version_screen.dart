// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/feature/versions/presentation/bloc/version_bloc.dart';
// import 'package:version_manager_flutter/shared/ui/my_text_form_field.dart';
// import 'package:version_manager_flutter/shared/ui/store_link_card.dart';

// class EditVersionScreen extends StatefulWidget {
//   final AppVersion version;

//   const EditVersionScreen({super.key, required this.version});

//   @override
//   State<EditVersionScreen> createState() => _EditVersionScreenState();
// }

// class _EditVersionScreenState extends State<EditVersionScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late final TextEditingController _versionController;
//   late final TextEditingController _buildNumberController;
//   late final TextEditingController _changelogController;

//   late Platform _selectedPlatform;
//   late List<StoreLinks> _storeLinks;
//   late bool _isRecommendedUpdate;

//   @override
//   void initState() {
//     super.initState();
//     _versionController = TextEditingController(text: widget.version.version);
//     _buildNumberController = TextEditingController(
//       text: widget.version.buildNumber.toString(),
//     );
//     _changelogController = TextEditingController(
//       text: widget.version.changelog,
//     );
//     _selectedPlatform = widget.version.platform;
//     _storeLinks = List.from(widget.version.storeLinks);
//     _isRecommendedUpdate = widget.version.recommendedUpdate;
//   }

//   @override
//   void dispose() {
//     _versionController.dispose();
//     _buildNumberController.dispose();
//     _changelogController.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       final updatedVersion = AppVersion(
//         id: widget.version.id,
//         applicationId: widget.version.applicationId,
//         version: _versionController.text.trim(),
//         buildNumber: int.parse(_buildNumberController.text.trim()),
//         changelog: _changelogController.text.trim(),
//         platform: _selectedPlatform,
//         storeLinks: _storeLinks,
//         isBlocked: widget.version.isBlocked,
//         blockReason: widget.version.blockReason,
//         recommendedUpdate: _isRecommendedUpdate,
//         createdAt: widget.version.createdAt,
//         updatedAt: DateTime.now(),
//       );

//       context.read<VersionBloc>().add(
//         VersionEvent.updateVersion(appVersion: updatedVersion),
//       );

//       Navigator.of(context).pop();
//     }
//   }

//   void _addStoreLink() {
//     showDialog(
//       context: context,
//       builder: (context) => _AddStoreLinkDialog(
//         onAdd: (storeLink) {
//           setState(() {
//             _storeLinks.add(storeLink);
//           });
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Scaffold(
//       backgroundColor: colorScheme.surface,
//       appBar: AppBar(
//         title: const Text('Редактировать версию'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 600),
//               child: Card(
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(32.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         // Заголовок
//                         Row(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(12),
//                               decoration: BoxDecoration(
//                                 color: colorScheme.primaryContainer,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Icon(
//                                 Icons.edit_rounded,
//                                 color: colorScheme.onPrimaryContainer,
//                                 size: 32,
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Редактирование',
//                                     style: theme.textTheme.headlineSmall
//                                         ?.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     'Версия ${widget.version.version}',
//                                     style: theme.textTheme.bodyMedium?.copyWith(
//                                       color: colorScheme.onSurfaceVariant,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 32),

//                         // Версия
//                         MyTextFormField(
//                           controller: _versionController,
//                           labelText: 'Версия',
//                           prefixIcon: Icons.numbers_rounded,
//                           hintText: '1.0.0',
//                           validator: (value) {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Введите версию';
//                             }
//                             if (!RegExp(
//                               r'^\d+\.\d+\.\d+$',
//                             ).hasMatch(value.trim())) {
//                               return 'Формат: X.Y.Z (например: 1.0.0)';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 20),

//                         // Build Number
//                         MyTextFormField(
//                           controller: _buildNumberController,
//                           labelText: 'Номер сборки',
//                           prefixIcon: Icons.tag_rounded,
//                           hintText: '1',
//                           keyboardType: TextInputType.number,
//                           validator: (value) {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Введите номер сборки';
//                             }
//                             if (int.tryParse(value.trim()) == null) {
//                               return 'Введите целое число';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 20),

//                         // Платформа
//                         Text(
//                           'Платформа',
//                           style: theme.textTheme.titleSmall?.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Wrap(
//                           spacing: 8,
//                           children: Platform.values
//                               .where((p) => p != Platform.unknown)
//                               .map(
//                                 (platform) => ChoiceChip(
//                                   label: Text(_getPlatformName(platform)),
//                                   avatar: Icon(
//                                     _getPlatformIcon(platform),
//                                     size: 18,
//                                   ),
//                                   selected: _selectedPlatform == platform,
//                                   onSelected: (selected) {
//                                     if (selected) {
//                                       setState(() {
//                                         _selectedPlatform = platform;
//                                       });
//                                     }
//                                   },
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                         const SizedBox(height: 20),

//                         // Changelog
//                         MyTextFormField(
//                           controller: _changelogController,
//                           labelText: 'Список изменений',
//                           prefixIcon: Icons.description_rounded,
//                           hintText: 'Что нового в этой версии?',
//                           maxLines: 5,
//                           validator: (value) {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Введите список изменений';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 20),

//                         // Рекомендуемое обновление
//                         SwitchListTile(
//                           title: const Text('Рекомендуемое обновление'),
//                           subtitle: const Text(
//                             'Пользователям будет предложено обновить приложение',
//                           ),
//                           value: _isRecommendedUpdate,
//                           onChanged: (value) {
//                             setState(() {
//                               _isRecommendedUpdate = value;
//                             });
//                           },
//                         ),
//                         const SizedBox(height: 20),

//                         // Ссылки на магазины
//                         Row(
//                           children: [
//                             Text(
//                               'Ссылки на магазины',
//                               style: theme.textTheme.titleSmall?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const Spacer(),
//                             IconButton(
//                               onPressed: _addStoreLink,
//                               icon: const Icon(Icons.add_rounded),
//                               tooltip: 'Добавить ссылку',
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         if (_storeLinks.isEmpty)
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: colorScheme.surfaceContainerHighest,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'Нет ссылок на магазины',
//                                 style: theme.textTheme.bodySmall?.copyWith(
//                                   color: colorScheme.onSurfaceVariant,
//                                 ),
//                               ),
//                             ),
//                           )
//                         else
//                           ..._storeLinks.map(
//                             (link) => StoreLinkCard(
//                               storeLink: link,
//                               onDelete: () {
//                                 setState(() {
//                                   _storeLinks.remove(link);
//                                 });
//                               },
//                             ),
//                           ),
//                         const SizedBox(height: 32),

//                         // Submit Button
//                         FilledButton.icon(
//                           onPressed: _submit,
//                           icon: const Icon(Icons.check_rounded),
//                           label: const Text('Сохранить изменения'),
//                           style: FilledButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String _getPlatformName(Platform platform) {
//     return switch (platform) {
//       Platform.android => 'Android',
//       Platform.ios => 'iOS',
//       Platform.unknown => 'Неизвестно',
//     };
//   }

//   IconData _getPlatformIcon(Platform platform) {
//     return switch (platform) {
//       Platform.android => Icons.android_rounded,
//       Platform.ios => Icons.apple_rounded,
//       Platform.unknown => Icons.question_mark_rounded,
//     };
//   }
// }

// class _AddStoreLinkDialog extends StatefulWidget {
//   final Function(StoreLinks) onAdd;

//   const _AddStoreLinkDialog({required this.onAdd});

//   @override
//   State<_AddStoreLinkDialog> createState() => _AddStoreLinkDialogState();
// }

// class _AddStoreLinkDialogState extends State<_AddStoreLinkDialog> {
//   final _formKey = GlobalKey<FormState>();
//   final _urlController = TextEditingController();
//   Store _selectedStore = Store.google_play;

//   @override
//   void dispose() {
//     _urlController.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       widget.onAdd(
//         StoreLinks(
//           store: _selectedStore,
//           url: _urlController.text.trim(),
//         ),
//       );
//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Добавить ссылку на магазин'),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             DropdownButtonFormField<Store>(
//               decoration: InputDecoration(
//                 labelText: 'Магазин',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//               ),
//               value: _selectedStore,
//               items: Store.values
//                   .where((s) => s != Store.unknown)
//                   .map(
//                     (store) => DropdownMenuItem(
//                       value: store,
//                       child: Text(_getStoreName(store)),
//                     ),
//                   )
//                   .toList(),
//               onChanged: (value) {
//                 if (value != null) {
//                   setState(() {
//                     _selectedStore = value;
//                   });
//                 }
//               },
//             ),
//             const SizedBox(height: 16),
//             TextFormField(
//               controller: _urlController,
//               decoration: InputDecoration(
//                 labelText: 'URL',
//                 hintText: 'https://play.google.com/store/apps/details?id=...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//               ),
//               validator: (value) {
//                 if (value == null || value.trim().isEmpty) {
//                   return 'Введите URL';
//                 }
//                 final uri = Uri.tryParse(value.trim());
//                 if (uri == null || !uri.hasScheme) {
//                   return 'Неверный формат URL';
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
//           onPressed: _submit,
//           child: const Text('Добавить'),
//         ),
//       ],
//     );
//   }

//   String _getStoreName(Store store) {
//     return switch (store) {
//       Store.google_play => 'Google Play',
//       Store.app_store => 'App Store',
//       Store.ru_store => 'RuStore',
//       Store.unknown => 'Неизвестно',
//     };
//   }
// }
