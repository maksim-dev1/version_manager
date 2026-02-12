part of 'version_action_bloc.dart';

@freezed
sealed class VersionActionState with _$VersionActionState {
  const factory VersionActionState.initial() = VersionActionInitial;
  const factory VersionActionState.loading() = VersionActionLoading;
  const factory VersionActionState.success({required String message}) =
      VersionActionSuccess;
  const factory VersionActionState.error({required String message}) =
      VersionActionError;
}
