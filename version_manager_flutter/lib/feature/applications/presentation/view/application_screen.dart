// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:version_manager_client/version_manager_client.dart';
// import 'package:version_manager_flutter/feature/applications/presentation/bloc/application_bloc.dart';
// import 'package:version_manager_flutter/feature/applications/presentation/view/add_application_screen.dart';
// import 'package:version_manager_flutter/feature/applications/presentation/view/ui/application_card.dart';

// class ApplicationScreen extends StatelessWidget {
//   const ApplicationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Приложения'),
//         actions: [],
//       ),
//       body: BlocBuilder<ApplicationBloc, ApplicationState>(
//         builder: (context, state) => switch (state) {
//           ApplicationLoading() => Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const CircularProgressIndicator(),
//                 const SizedBox(height: 16),
//                 Text(
//                   'Загрузка приложений...',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     color: colorScheme.onSurfaceVariant,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ApplicationLoaded(:final applications) => Builder(
//             builder: (context) {
//               if (applications.isEmpty) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.app_shortcut_rounded,
//                         size: 80,
//                         color: colorScheme.onSurfaceVariant.withOpacity(0.5),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Нет приложений',
//                         style: Theme.of(context).textTheme.headlineSmall
//                             ?.copyWith(
//                               color: colorScheme.onSurfaceVariant,
//                             ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Добавьте ваше первое приложение',
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               return ApplicationList(applications: applications);
//             },
//           ),
//           ApplicationError(:final message) => Center(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline_rounded,
//                     size: 80,
//                     color: colorScheme.error,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Ошибка',
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                       color: colorScheme.error,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     message,
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 24),
//                   FilledButton.icon(
//                     onPressed: () {
//                       context.read<ApplicationBloc>().add(
//                         const ApplicationEvent.getAllApplications(),
//                       );
//                     },
//                     icon: const Icon(Icons.refresh_rounded),
//                     label: const Text('Повторить'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           _ => const SizedBox.shrink(),
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         heroTag: 'fab_applications',
//         onPressed: () {
//           final bloc = context.read<ApplicationBloc>();
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => BlocProvider.value(
//                 value: bloc,
//                 child: const AddApplicationScreen(),
//               ),
//             ),
//           );
//         },
//         label: const Text('Добавить приложение'),
//         icon: const Icon(Icons.add_rounded),
//       ),
//     );
//   }
// }

// class ApplicationList extends StatelessWidget {
//   final List<Application> applications;
//   const ApplicationList({super.key, required this.applications});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemCount: applications.length,
//       itemBuilder: (context, index) {
//         final app = applications[index];
//         return ApplicationCard(application: app);
//       },
//     );
//   }
// }
