// import 'package:flutter/material.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/services/api_service.dart';

// class AddAppModal extends StatefulWidget {
//   const AddAppModal({super.key});

//   @override
//   State<AddAppModal> createState() => _AddAppModalState();
// }

// class _AddAppModalState extends State<AddAppModal> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _packageNameController = TextEditingController();
//   final TextEditingController _appNameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _iconUrlController = TextEditingController();
//   bool _isActive = true;

//   @override
//   void dispose() {
//     _packageNameController.dispose();
//     _appNameController.dispose();
//     _descriptionController.dispose();
//     _iconUrlController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Добавить приложение'),
//       content: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: _packageNameController,
//                 decoration: const InputDecoration(labelText: 'Package Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a package name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _appNameController,
//                 decoration: const InputDecoration(labelText: 'App Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an app name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: const InputDecoration(labelText: 'Description'),
//               ),
//               TextFormField(
//                 controller: _iconUrlController,
//                 decoration: const InputDecoration(labelText: 'Icon URL'),
//               ),
//               SwitchListTile(
//                 title: const Text('Is Active'),
//                 value: _isActive,
//                 onChanged: (bool value) {
//                   setState(() {
//                     _isActive = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('Отмена'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               // Логика сохранения
//               ApiService.client.application.addAplication(
//                 application: Application(
//                   packageName: _packageNameController.text,
//                   appName: _appNameController.text,
//                   description: _descriptionController.text,
//                   iconUrl: _iconUrlController.text,
//                   createdAt: DateTime.now(),
//                   updatedAt: DateTime.now(),
//                 ),
//               );
//               Navigator.of(context).pop();
//             }
//           },
//           child: const Text('Сохранить'),
//         ),
//       ],
//     );
//   }
// }
