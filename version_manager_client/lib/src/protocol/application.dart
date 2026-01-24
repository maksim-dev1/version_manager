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

abstract class Application implements _i1.SerializableModel {
  Application._({
    this.id,
    required this.packageName,
    required this.appName,
    required this.description,
    required this.iconUrl,
    bool? isActive,
    required this.createdAt,
    required this.updatedAt,
  }) : isActive = isActive ?? true;

  factory Application({
    _i1.UuidValue? id,
    required String packageName,
    required String appName,
    required String description,
    required String iconUrl,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ApplicationImpl;

  factory Application.fromJson(Map<String, dynamic> jsonSerialization) {
    return Application(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      packageName: jsonSerialization['packageName'] as String,
      appName: jsonSerialization['appName'] as String,
      description: jsonSerialization['description'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String,
      isActive: jsonSerialization['isActive'] as bool?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// Уникальный идентификатор записи
  _i1.UuidValue? id;

  /// Уникальный идентификатор приложения (например: com.example.myapp)
  String packageName;

  /// Название приложения
  String appName;

  /// Описание
  String description;

  /// Иконка приложения (URL)
  String iconUrl;

  /// Активно ли приложение
  bool isActive;

  /// Дата и время создания записи
  DateTime createdAt;

  /// Дата и время последнего обновления записи
  DateTime updatedAt;

  /// Returns a shallow copy of this [Application]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Application copyWith({
    _i1.UuidValue? id,
    String? packageName,
    String? appName,
    String? description,
    String? iconUrl,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Application',
      if (id != null) 'id': id?.toJson(),
      'packageName': packageName,
      'appName': appName,
      'description': description,
      'iconUrl': iconUrl,
      'isActive': isActive,
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

class _ApplicationImpl extends Application {
  _ApplicationImpl({
    _i1.UuidValue? id,
    required String packageName,
    required String appName,
    required String description,
    required String iconUrl,
    bool? isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         packageName: packageName,
         appName: appName,
         description: description,
         iconUrl: iconUrl,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Application]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Application copyWith({
    Object? id = _Undefined,
    String? packageName,
    String? appName,
    String? description,
    String? iconUrl,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Application(
      id: id is _i1.UuidValue? ? id : this.id,
      packageName: packageName ?? this.packageName,
      appName: appName ?? this.appName,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
