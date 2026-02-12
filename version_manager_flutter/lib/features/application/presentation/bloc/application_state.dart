part of 'application_bloc.dart';

/// Состояния для ApplicationBloc.
@freezed
sealed class ApplicationState with _$ApplicationState {
  /// Начальное состояние.
  const factory ApplicationState.initial() = ApplicationInitial;

  /// Загрузка.
  const factory ApplicationState.loading() = ApplicationLoading;

  /// Приложения загружены.
  const factory ApplicationState.loaded({
    required List<Application> applications,
    required List<Team> teams,
  }) = ApplicationLoaded;

  /// Ошибка загрузки.
  const factory ApplicationState.error({required String message}) =
      ApplicationError;
}
