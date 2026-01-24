import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/feature/applications/domain/repository/application_repository.dart';

part 'application_event.dart';
part 'application_state.dart';
part 'application_bloc.freezed.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepository _applicationRepository;
  ApplicationBloc({required ApplicationRepository applicationRepository})
    : _applicationRepository = applicationRepository,
      super(ApplicationInitial()) {
    on<ApplicationEvent>(
      (event, emit) => switch (event) {
        _AddAplication(:final application) => _addApplication(
          emit: emit,
          application: application,
        ),
        _GetAllApplications() => _getAllApplications(emit: emit),
        _EditApplication(:final application, :final changeablePackageName) => _editApplication(
          emit: emit,
          changeablePackageName: changeablePackageName,
          application: application,
        ),
        _DeactivateApplication(:final packageName, :final isActive) =>
          _deactivateApplication(
            emit: emit,
            packageName: packageName,
            isActive: isActive,
          ),
        _DeleteApplication(:final packageName) => _deleteApplication(
          emit: emit,
          packageName: packageName,
        ),
      },
    );
  }

  Future<void> _addApplication({
    required Emitter<ApplicationState> emit,
    required Application application,
  }) async {
    emit(ApplicationState.loading());
    try {
      final applications = await _applicationRepository.addAplication(
        application: application,
      );
      emit(ApplicationState.loaded(applications: applications));
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  Future<void> _getAllApplications({
    required Emitter<ApplicationState> emit,
  }) async {
    emit(ApplicationState.loading());
    try {
      final applications = await _applicationRepository.getAllApplications();
      emit(ApplicationState.loaded(applications: applications));
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  Future<void> _editApplication({
    required Emitter<ApplicationState> emit,
    required String changeablePackageName,
    required Application application,
  }) async {
    emit(ApplicationState.loading());
    try {
      final applications = await _applicationRepository.editApplication(
        changeablePackageName: changeablePackageName,
        application: application,
      );

      emit(
        ApplicationState.loaded(applications: applications),
      );
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  Future<void> _deactivateApplication({
    required Emitter<ApplicationState> emit,
    required String packageName,
    required bool isActive,
  }) async {
    emit(ApplicationState.loading());
    try {
      final applications = await _applicationRepository.deactivateApplication(
        packageName: packageName,
        isActive: isActive,
      );
      emit(ApplicationState.loaded(applications: applications));
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }

  Future<void> _deleteApplication({
    required Emitter<ApplicationState> emit,
    required String packageName,
  }) async {
    emit(ApplicationState.loading());
    try {
      final applications = await _applicationRepository.deleteApplication(
        packageName: packageName,
      );
      emit(ApplicationState.loaded(applications: applications));
    } catch (e) {
      emit(ApplicationState.error(message: e.toString()));
    }
  }
}
