/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'enums/platform.dart' as _i2;
import 'store_links.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

abstract class AppVersion implements _i1.SerializableModel {
  AppVersion._({
    this.id,
    required this.applicationId,
    required this.version,
    required this.buildNumber,
    _i2.Platform? platform,
    required this.changelog,
    bool? isBlocked,
    this.blockReason,
    bool? recommendedUpdate,
    required this.storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : platform = platform ?? _i2.Platform.unknown,
       isBlocked = isBlocked ?? false,
       recommendedUpdate = recommendedUpdate ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AppVersion({
    int? id,
    required _i1.UuidValue applicationId,
    required String version,
    required int buildNumber,
    _i2.Platform? platform,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    bool? recommendedUpdate,
    required List<_i3.StoreLinks> storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AppVersionImpl;

  factory AppVersion.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppVersion(
      id: jsonSerialization['id'] as int?,
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      version: jsonSerialization['version'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      platform: jsonSerialization['platform'] == null
          ? null
          : _i2.Platform.fromJson((jsonSerialization['platform'] as String)),
      changelog: jsonSerialization['changelog'] as String,
      isBlocked: jsonSerialization['isBlocked'] as bool?,
      blockReason: jsonSerialization['blockReason'] as String?,
      recommendedUpdate: jsonSerialization['recommendedUpdate'] as bool?,
      storeLinks: _i4.Protocol().deserialize<List<_i3.StoreLinks>>(
        jsonSerialization['storeLinks'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Serverpod автоматически добавит поле id: UuidValue
  /// Идентификатор приложения (внешний ключ к таблице applications)
  _i1.UuidValue applicationId;

  /// Версия приложения (например: 1.0.0)
  String version;

  /// Номер сборки приложения
  int buildNumber;

  /// Платформа (например: android, ios)
  _i2.Platform platform;

  /// Описание изменений в этой версии
  String changelog;

  /// Заблокирована ли эта версия для установки
  bool isBlocked;

  /// Причина блокировки версии
  String? blockReason;

  /// Предлагать эту версию для обновления
  bool recommendedUpdate;

  /// Ссылки на магазины приложений
  List<_i3.StoreLinks> storeLinks;

  /// Дата и время создания записи
  DateTime createdAt;

  /// Дата и время последнего обновления записи
  DateTime updatedAt;

  /// Returns a shallow copy of this [AppVersion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppVersion copyWith({
    int? id,
    _i1.UuidValue? applicationId,
    String? version,
    int? buildNumber,
    _i2.Platform? platform,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    bool? recommendedUpdate,
    List<_i3.StoreLinks>? storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppVersion',
      if (id != null) 'id': id,
      'applicationId': applicationId.toJson(),
      'version': version,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      'recommendedUpdate': recommendedUpdate,
      'storeLinks': storeLinks.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppVersionImpl extends AppVersion {
  _AppVersionImpl({
    int? id,
    required _i1.UuidValue applicationId,
    required String version,
    required int buildNumber,
    _i2.Platform? platform,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    bool? recommendedUpdate,
    required List<_i3.StoreLinks> storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         version: version,
         buildNumber: buildNumber,
         platform: platform,
         changelog: changelog,
         isBlocked: isBlocked,
         blockReason: blockReason,
         recommendedUpdate: recommendedUpdate,
         storeLinks: storeLinks,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AppVersion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppVersion copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    String? version,
    int? buildNumber,
    _i2.Platform? platform,
    String? changelog,
    bool? isBlocked,
    Object? blockReason = _Undefined,
    bool? recommendedUpdate,
    List<_i3.StoreLinks>? storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppVersion(
      id: id is int? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
      platform: platform ?? this.platform,
      changelog: changelog ?? this.changelog,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      recommendedUpdate: recommendedUpdate ?? this.recommendedUpdate,
      storeLinks:
          storeLinks ?? this.storeLinks.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
