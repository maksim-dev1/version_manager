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

/// Информация о ссылке на магазин приложений.
///
/// Легковесная DTO-версия StoreLink, содержащая только данные,
/// необходимые клиентскому приложению для открытия страницы обновления.
abstract class StoreLinkInfo
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StoreLinkInfo._({
    required this.platform,
    required this.storeName,
    required this.url,
  });

  factory StoreLinkInfo({
    required _i2.PlatformType platform,
    required String storeName,
    required String url,
  }) = _StoreLinkInfoImpl;

  factory StoreLinkInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoreLinkInfo(
      platform: _i2.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      storeName: jsonSerialization['storeName'] as String,
      url: jsonSerialization['url'] as String,
    );
  }

  /// Платформа (ios, android и т.д.)
  _i2.PlatformType platform;

  /// Название магазина (App Store, Google Play и т.д.)
  String storeName;

  /// URL для открытия страницы приложения в магазине
  String url;

  /// Returns a shallow copy of this [StoreLinkInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoreLinkInfo copyWith({
    _i2.PlatformType? platform,
    String? storeName,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoreLinkInfo',
      'platform': platform.toJson(),
      'storeName': storeName,
      'url': url,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StoreLinkInfo',
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

class _StoreLinkInfoImpl extends StoreLinkInfo {
  _StoreLinkInfoImpl({
    required _i2.PlatformType platform,
    required String storeName,
    required String url,
  }) : super._(
         platform: platform,
         storeName: storeName,
         url: url,
       );

  /// Returns a shallow copy of this [StoreLinkInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoreLinkInfo copyWith({
    _i2.PlatformType? platform,
    String? storeName,
    String? url,
  }) {
    return StoreLinkInfo(
      platform: platform ?? this.platform,
      storeName: storeName ?? this.storeName,
      url: url ?? this.url,
    );
  }
}
