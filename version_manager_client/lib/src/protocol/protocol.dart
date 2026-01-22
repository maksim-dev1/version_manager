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
import 'app_version.dart' as _i2;
import 'application.dart' as _i3;
import 'enums/platform.dart' as _i4;
import 'enums/store.dart' as _i5;
import 'greetings/greeting.dart' as _i6;
import 'store_links.dart' as _i7;
import 'package:version_manager_client/src/protocol/application.dart' as _i8;
import 'package:version_manager_client/src/protocol/app_version.dart' as _i9;
import 'package:version_manager_client/src/protocol/enums/platform.dart'
    as _i10;
import 'package:version_manager_client/src/protocol/store_links.dart' as _i11;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i12;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i13;
export 'app_version.dart';
export 'application.dart';
export 'enums/platform.dart';
export 'enums/store.dart';
export 'greetings/greeting.dart';
export 'store_links.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

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

    if (t == _i2.AppVersion) {
      return _i2.AppVersion.fromJson(data) as T;
    }
    if (t == _i3.Application) {
      return _i3.Application.fromJson(data) as T;
    }
    if (t == _i4.Platform) {
      return _i4.Platform.fromJson(data) as T;
    }
    if (t == _i5.Store) {
      return _i5.Store.fromJson(data) as T;
    }
    if (t == _i6.Greeting) {
      return _i6.Greeting.fromJson(data) as T;
    }
    if (t == _i7.StoreLinks) {
      return _i7.StoreLinks.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AppVersion?>()) {
      return (data != null ? _i2.AppVersion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Application?>()) {
      return (data != null ? _i3.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Platform?>()) {
      return (data != null ? _i4.Platform.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Store?>()) {
      return (data != null ? _i5.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Greeting?>()) {
      return (data != null ? _i6.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.StoreLinks?>()) {
      return (data != null ? _i7.StoreLinks.fromJson(data) : null) as T;
    }
    if (t == List<_i7.StoreLinks>) {
      return (data as List).map((e) => deserialize<_i7.StoreLinks>(e)).toList()
          as T;
    }
    if (t == List<_i8.Application>) {
      return (data as List).map((e) => deserialize<_i8.Application>(e)).toList()
          as T;
    }
    if (t == List<_i9.AppVersion>) {
      return (data as List).map((e) => deserialize<_i9.AppVersion>(e)).toList()
          as T;
    }
    if (t == List<_i10.Platform>) {
      return (data as List).map((e) => deserialize<_i10.Platform>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i10.Platform>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i10.Platform>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i11.StoreLinks>) {
      return (data as List).map((e) => deserialize<_i11.StoreLinks>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i11.StoreLinks>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i11.StoreLinks>(e))
                    .toList()
              : null)
          as T;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AppVersion => 'AppVersion',
      _i3.Application => 'Application',
      _i4.Platform => 'Platform',
      _i5.Store => 'Store',
      _i6.Greeting => 'Greeting',
      _i7.StoreLinks => 'StoreLinks',
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
      case _i2.AppVersion():
        return 'AppVersion';
      case _i3.Application():
        return 'Application';
      case _i4.Platform():
        return 'Platform';
      case _i5.Store():
        return 'Store';
      case _i6.Greeting():
        return 'Greeting';
      case _i7.StoreLinks():
        return 'StoreLinks';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i13.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'AppVersion') {
      return deserialize<_i2.AppVersion>(data['data']);
    }
    if (dataClassName == 'Application') {
      return deserialize<_i3.Application>(data['data']);
    }
    if (dataClassName == 'Platform') {
      return deserialize<_i4.Platform>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i5.Store>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i6.Greeting>(data['data']);
    }
    if (dataClassName == 'StoreLinks') {
      return deserialize<_i7.StoreLinks>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

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
      return _i12.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i13.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
