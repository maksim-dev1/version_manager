part of 'application_bloc.dart';

@freezed
sealed class ApplicationEvent with _$ApplicationEvent {
  const factory ApplicationEvent.addAplication({
    required Application application,
  }) = _AddAplication;

  const factory ApplicationEvent.getAllApplications() = _GetAllApplications;

  const factory ApplicationEvent.editApplication({
    required String changeablePackageName,
    required Application application,
  }) = _EditApplication;

  const factory ApplicationEvent.deactivateApplication({
    required String packageName,
    required bool isActive,
  }) = _DeactivateApplication;

  const factory ApplicationEvent.deleteApplication({
    required String packageName,
  }) = _DeleteApplication;
}
