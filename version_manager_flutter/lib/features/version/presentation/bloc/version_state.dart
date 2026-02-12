part of 'version_bloc.dart';

@freezed
sealed class VersionState with _$VersionState {
  const factory VersionState.initial() = VersionInitial;
  const factory VersionState.loading() = VersionLoading;

  const factory VersionState.loaded({
    required Application application,
    required List<VersionListItem> versions,
  }) = VersionLoaded;

  const factory VersionState.error({required String message}) = VersionError;
}
