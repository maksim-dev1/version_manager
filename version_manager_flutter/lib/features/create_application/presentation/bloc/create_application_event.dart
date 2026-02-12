part of 'create_application_bloc.dart';

@freezed
sealed class CreateApplicationEvent with _$CreateApplicationEvent {
  /// Создать новое приложение.
  const factory CreateApplicationEvent.create({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<PlatformType> platforms,
    required OwnerType ownerType,
    UuidValue? teamId,
    List<StoreLinkEntry>? storeLinks,
  }) = _Create;
}
