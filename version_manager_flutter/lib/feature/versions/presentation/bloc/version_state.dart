part of 'version_bloc.dart';

@freezed
sealed class VersionState with _$VersionState {
  const factory VersionState.versionLoading() = VersionLoading;
  const factory VersionState.versionLoaded({required List<AppVersion> versions}) =
      VersionLoaded;
  const factory VersionState.versionError({required String message}) = VersionError;
}

