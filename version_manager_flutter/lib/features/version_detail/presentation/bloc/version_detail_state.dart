part of 'version_detail_bloc.dart';

@freezed
sealed class VersionDetailState with _$VersionDetailState {
  const factory VersionDetailState.initial() = VersionDetailInitial;
  const factory VersionDetailState.loading() = VersionDetailLoading;
  const factory VersionDetailState.loaded({
    required VersionDetailResponse detail,
  }) = VersionDetailLoaded;
  const factory VersionDetailState.error({required String message}) =
      VersionDetailError;
}
