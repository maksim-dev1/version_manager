// import 'package:flutter/material.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/screens/login_screen.dart';
// import 'package:version_manager_flutter/services/api_service.dart';
// import 'package:version_manager_flutter/widgets/add_app_modal.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   List<Application> _applications = [];

//   @override
//   void initState() {
//     super.initState();

//     _loadApplications();
//   }

//   void _loadApplications() async {
//     final apps = await ApiService.client.application.getAllApplications();
//     setState(() {
//       _applications = apps;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Version Manager'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             tooltip: 'Выйти',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LoginScreen(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Builder(
//         builder: (context) {
//           if (_applications.isNotEmpty) {
//             return ListView.builder(
//               itemCount: _applications.length,
//               itemBuilder: (context, index) {
//                 final app = _applications[index];
//                 return ListTile(
//                   leading: const Icon(Icons.apps),
//                   title: Text(app.appName),
//                   subtitle: Text('Package: ${app.packageName}'),
//                 );
//               },
//             );
//           }
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.check_circle_outline,
//                   size: 100,
//                   color: Theme.of(context).primaryColor,
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   'Добро пожаловать!',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   'Добавьте приложение',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => AddAppModal(),
//           );
//         },
//         tooltip: 'Добавить приложение',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
