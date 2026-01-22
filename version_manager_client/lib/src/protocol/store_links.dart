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
import 'enums/store.dart' as _i2;

abstract class StoreLinks implements _i1.SerializableModel {
  StoreLinks._({
    _i2.Store? store,
    required this.url,
  }) : store = store ?? _i2.Store.unknown;

  factory StoreLinks({
    _i2.Store? store,
    required String url,
  }) = _StoreLinksImpl;

  factory StoreLinks.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoreLinks(
      store: jsonSerialization['store'] == null
          ? null
          : _i2.Store.fromJson((jsonSerialization['store'] as String)),
      url: jsonSerialization['url'] as String,
    );
  }

  /// Магазин приложений
  _i2.Store store;

  /// Ссылка на магазин приложений
  String url;

  /// Returns a shallow copy of this [StoreLinks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoreLinks copyWith({
    _i2.Store? store,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoreLinks',
      'store': store.toJson(),
      'url': url,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StoreLinksImpl extends StoreLinks {
  _StoreLinksImpl({
    _i2.Store? store,
    required String url,
  }) : super._(
         store: store,
         url: url,
       );

  /// Returns a shallow copy of this [StoreLinks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoreLinks copyWith({
    _i2.Store? store,
    String? url,
  }) {
    return StoreLinks(
      store: store ?? this.store,
      url: url ?? this.url,
    );
  }
}
