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
import '../enums/platform_type.dart' as _i2;

/// Запись ссылки на магазин (DTO, без таблицы)
abstract class StoreLinkEntry
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StoreLinkEntry._({
    required this.platform,
    required this.storeName,
    required this.url,
  });

  factory StoreLinkEntry({
    required _i2.PlatformType platform,
    required String storeName,
    required String url,
  }) = _StoreLinkEntryImpl;

  factory StoreLinkEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoreLinkEntry(
      platform: _i2.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      storeName: jsonSerialization['storeName'] as String,
      url: jsonSerialization['url'] as String,
    );
  }

  _i2.PlatformType platform;

  String storeName;

  String url;

  /// Returns a shallow copy of this [StoreLinkEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoreLinkEntry copyWith({
    _i2.PlatformType? platform,
    String? storeName,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoreLinkEntry',
      'platform': platform.toJson(),
      'storeName': storeName,
      'url': url,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StoreLinkEntry',
      'platform': platform.toJson(),
      'storeName': storeName,
      'url': url,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StoreLinkEntryImpl extends StoreLinkEntry {
  _StoreLinkEntryImpl({
    required _i2.PlatformType platform,
    required String storeName,
    required String url,
  }) : super._(
         platform: platform,
         storeName: storeName,
         url: url,
       );

  /// Returns a shallow copy of this [StoreLinkEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoreLinkEntry copyWith({
    _i2.PlatformType? platform,
    String? storeName,
    String? url,
  }) {
    return StoreLinkEntry(
      platform: platform ?? this.platform,
      storeName: storeName ?? this.storeName,
      url: url ?? this.url,
    );
  }
}
