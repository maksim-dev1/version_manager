// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:version_manager_flutter/feature/applications/presentation/view/application_screen.dart';
// import 'package:version_manager_flutter/feature/applications/presentation/application_provider.dart';
// import 'package:version_manager_flutter/feature/auth/presentation/auth_provider.dart';
// import 'package:version_manager_flutter/feature/auth/presentation/bloc/auth_bloc.dart';
// import 'package:version_manager_flutter/feature/auth/presentation/view/sign_in_screen.dart';
// import 'package:version_manager_flutter/feature/versions/presentation/version_provider.dart';
// import 'package:version_manager_flutter/feature/versions/presentation/view/versions_screen.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Version Manager',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF6750A4),
//           brightness: Brightness.light,
//         ),
//         useMaterial3: true,
//         cardTheme: CardThemeData(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//         appBarTheme: const AppBarTheme(
//           centerTitle: true,
//           elevation: 0,
//         ),
//         filledButtonTheme: FilledButtonThemeData(
//           style: FilledButton.styleFrom(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//         floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(16)),
//           ),
//         ),
//       ),
//       darkTheme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF6750A4),
//           brightness: Brightness.dark,
//         ),
//         useMaterial3: true,
//         cardTheme: CardThemeData(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//         appBarTheme: const AppBarTheme(
//           centerTitle: true,
//           elevation: 0,
//         ),
//         filledButtonTheme: FilledButtonThemeData(
//           style: FilledButton.styleFrom(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//         floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(16)),
//           ),
//         ),
//       ),
//       // home: ApplicationProvider(
//       //   child: const ApplicationScreen(),
//       // ),
//       home: AuthProvider(
//         child: BlocBuilder<AuthBloc, AuthState>(
//           builder: (context, state) => switch (state) {
//             Loading() => const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             ),
//             Authenticated() => ApplicationProvider(
//               child: VersionProvider(
//                 child: MainScreen(),
//               ),
//             ),
//             Unauthenticated() => SignInScreen(),
//           },
//         ),
//       ),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           NavigationRail(
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             labelType: NavigationRailLabelType.all,
//             destinations: const [
//               NavigationRailDestination(
//                 icon: Icon(Icons.apps_outlined),
//                 selectedIcon: Icon(Icons.apps),
//                 label: Text('Приложения'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.commit_outlined),
//                 selectedIcon: Icon(Icons.commit),
//                 label: Text('Версии'),
//               ),
//             ],

//             trailing: Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12.0),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.logout_outlined),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const VerticalDivider(thickness: 1, width: 1),

//           // IndexedStack сохраняет состояние всех страниц
//           Expanded(
//             child: IndexedStack(
//               index: _selectedIndex,
//               children: const [
//                 ApplicationScreen(),
//                 VersionsScreen(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
