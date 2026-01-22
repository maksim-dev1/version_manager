part of 'application_bloc.dart';

@freezed
sealed class ApplicationState with _$ApplicationState {
  const factory ApplicationState.initial() = ApplicationInitial;
  const factory ApplicationState.loading() = ApplicationLoading;
  const factory ApplicationState.loaded({
    required List<Application> applications,
  }) = ApplicationLoaded;
  const factory ApplicationState.updatedApplication({
    required Application application,
  }) = UpdatedApplication;
  const factory ApplicationState.error({required String message}) =
      ApplicationError;
}
