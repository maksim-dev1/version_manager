part of 'create_application_bloc.dart';

@freezed
sealed class CreateApplicationState with _$CreateApplicationState {
  const factory CreateApplicationState.initial() = CreateApplicationInitial;
  const factory CreateApplicationState.loading() = CreateApplicationLoading;
  const factory CreateApplicationState.success({
    required Application application,
    required String apiKey,
  }) = CreateApplicationSuccess;
  const factory CreateApplicationState.error({required String message}) =
      CreateApplicationError;
}
