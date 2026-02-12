import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';

part 'create_application_bloc.freezed.dart';
part 'create_application_event.dart';
part 'create_application_state.dart';

/// BLoC для создания приложения.
///
/// Выделен из ApplicationBloc, так как операция создания
/// возвращает уникальные данные (application + apiKey),
/// которые не относятся к списковому состоянию.
class CreateApplicationBloc
    extends Bloc<CreateApplicationEvent, CreateApplicationState> {
  final ApplicationRepository _applicationRepository;

  CreateApplicationBloc({
    required ApplicationRepository applicationRepository,
  }) : _applicationRepository = applicationRepository,
       super(const CreateApplicationState.initial()) {
    on<CreateApplicationEvent>(
      (event, emit) => switch (event) {
        _Create(
          :final namespace,
          :final name,
          :final description,
          :final iconUrl,
          :final platforms,
          :final ownerType,
          :final teamId,
          :final storeLinks,
        ) =>
          _onCreate(
            namespace: namespace,
            name: name,
            description: description,
            iconUrl: iconUrl,
            platforms: platforms,
            ownerType: ownerType,
            teamId: teamId,
            storeLinks: storeLinks,
            emit: emit,
          ),
      },
    );
  }

  Future<void> _onCreate({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<PlatformType> platforms,
    required OwnerType ownerType,
    UuidValue? teamId,
    List<StoreLinkEntry>? storeLinks,
    required Emitter<CreateApplicationState> emit,
  }) async {
    emit(const CreateApplicationState.loading());
    try {
      final response = await _applicationRepository.createApplication(
        namespace: namespace,
        name: name,
        description: description,
        iconUrl: iconUrl,
        platforms: platforms,
        ownerType: ownerType,
        teamId: teamId,
        storeLinks: storeLinks,
      );
      emit(
        CreateApplicationState.success(
          application: response.application,
          apiKey: response.apiKey,
        ),
      );
    } catch (e) {
      emit(CreateApplicationState.error(message: e.toString()));
    }
  }
}
