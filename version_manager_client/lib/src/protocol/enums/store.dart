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

enum Store implements _i1.SerializableModel {
  unknown,
  google_play,
  app_store,
  ru_store;

  static Store fromJson(String name) {
    switch (name) {
      case 'unknown':
        return Store.unknown;
      case 'google_play':
        return Store.google_play;
      case 'app_store':
        return Store.app_store;
      case 'ru_store':
        return Store.ru_store;
      default:
        return Store.unknown;
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
