// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:version_manager_flutter/feature/versions/data/repository/version_repository_impl.dart';
// import 'package:version_manager_flutter/feature/versions/domain/repository/version_repository.dart';
// import 'package:version_manager_flutter/feature/versions/presentation/bloc/version_bloc.dart';
// import 'package:version_manager_flutter/shared/services/api_client_service.dart';

// class VersionProvider extends StatelessWidget {
//   final Widget child;
//   const VersionProvider({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider<VersionRepository>(
//       create: (context) =>
//           VersionRepositoryImpl(apiService: context.read<ApiClientService>()),
//       child: BlocProvider(
//         create: (context) =>
//             VersionBloc(versionRepository: context.read<VersionRepository>()),
//         child: child,
//       ),
//     );
//   }
// }
