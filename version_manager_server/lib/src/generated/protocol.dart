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
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'app_check_request.dart' as _i5;
import 'app_check_response.dart' as _i6;
import 'app_version.dart' as _i7;
import 'application.dart' as _i8;
import 'enums/platform.dart' as _i9;
import 'enums/store.dart' as _i10;
import 'greetings/greeting.dart' as _i11;
import 'store_links.dart' as _i12;
import 'package:version_manager_server/src/generated/application.dart' as _i13;
import 'package:version_manager_server/src/generated/app_version.dart' as _i14;
import 'package:version_manager_server/src/generated/enums/platform.dart'
    as _i15;
import 'package:version_manager_server/src/generated/store_links.dart' as _i16;
export 'app_check_request.dart';
export 'app_check_response.dart';
export 'app_version.dart';
export 'application.dart';
export 'enums/platform.dart';
export 'enums/store.dart';
export 'greetings/greeting.dart';
export 'store_links.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_versions',
      dartName: 'AppVersion',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'buildNumber',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Platform',
          columnDefault: '\'unknown\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'changelog',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isBlocked',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'blockReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'recommendedUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'storeLinks',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:StoreLinks>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_versions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'applications',
      dartName: 'Application',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'packageName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'appName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'iconUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'applications_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.AppCheckRequest) {
      return _i5.AppCheckRequest.fromJson(data) as T;
    }
    if (t == _i6.AppCheckResponse) {
      return _i6.AppCheckResponse.fromJson(data) as T;
    }
    if (t == _i7.AppVersion) {
      return _i7.AppVersion.fromJson(data) as T;
    }
    if (t == _i8.Application) {
      return _i8.Application.fromJson(data) as T;
    }
    if (t == _i9.Platform) {
      return _i9.Platform.fromJson(data) as T;
    }
    if (t == _i10.Store) {
      return _i10.Store.fromJson(data) as T;
    }
    if (t == _i11.Greeting) {
      return _i11.Greeting.fromJson(data) as T;
    }
    if (t == _i12.StoreLinks) {
      return _i12.StoreLinks.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.AppCheckRequest?>()) {
      return (data != null ? _i5.AppCheckRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AppCheckResponse?>()) {
      return (data != null ? _i6.AppCheckResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AppVersion?>()) {
      return (data != null ? _i7.AppVersion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Application?>()) {
      return (data != null ? _i8.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Platform?>()) {
      return (data != null ? _i9.Platform.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Store?>()) {
      return (data != null ? _i10.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Greeting?>()) {
      return (data != null ? _i11.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.StoreLinks?>()) {
      return (data != null ? _i12.StoreLinks.fromJson(data) : null) as T;
    }
    if (t == List<_i12.StoreLinks>) {
      return (data as List).map((e) => deserialize<_i12.StoreLinks>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i12.StoreLinks>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i12.StoreLinks>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i13.Application>) {
      return (data as List)
              .map((e) => deserialize<_i13.Application>(e))
              .toList()
          as T;
    }
    if (t == List<_i14.AppVersion>) {
      return (data as List).map((e) => deserialize<_i14.AppVersion>(e)).toList()
          as T;
    }
    if (t == List<_i15.Platform>) {
      return (data as List).map((e) => deserialize<_i15.Platform>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.Platform>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i15.Platform>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.StoreLinks>) {
      return (data as List).map((e) => deserialize<_i16.StoreLinks>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.StoreLinks>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.StoreLinks>(e))
                    .toList()
              : null)
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.AppCheckRequest => 'AppCheckRequest',
      _i6.AppCheckResponse => 'AppCheckResponse',
      _i7.AppVersion => 'AppVersion',
      _i8.Application => 'Application',
      _i9.Platform => 'Platform',
      _i10.Store => 'Store',
      _i11.Greeting => 'Greeting',
      _i12.StoreLinks => 'StoreLinks',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'version_manager.',
        '',
      );
    }

    switch (data) {
      case _i5.AppCheckRequest():
        return 'AppCheckRequest';
      case _i6.AppCheckResponse():
        return 'AppCheckResponse';
      case _i7.AppVersion():
        return 'AppVersion';
      case _i8.Application():
        return 'Application';
      case _i9.Platform():
        return 'Platform';
      case _i10.Store():
        return 'Store';
      case _i11.Greeting():
        return 'Greeting';
      case _i12.StoreLinks():
        return 'StoreLinks';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AppCheckRequest') {
      return deserialize<_i5.AppCheckRequest>(data['data']);
    }
    if (dataClassName == 'AppCheckResponse') {
      return deserialize<_i6.AppCheckResponse>(data['data']);
    }
    if (dataClassName == 'AppVersion') {
      return deserialize<_i7.AppVersion>(data['data']);
    }
    if (dataClassName == 'Application') {
      return deserialize<_i8.Application>(data['data']);
    }
    if (dataClassName == 'Platform') {
      return deserialize<_i9.Platform>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i10.Store>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i11.Greeting>(data['data']);
    }
    if (dataClassName == 'StoreLinks') {
      return deserialize<_i12.StoreLinks>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i7.AppVersion:
        return _i7.AppVersion.t;
      case _i8.Application:
        return _i8.Application.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'version_manager';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
