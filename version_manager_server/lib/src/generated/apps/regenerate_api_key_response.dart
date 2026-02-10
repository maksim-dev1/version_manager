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

/// Ответ при регенерации API ключа
abstract class RegenerateApiKeyResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RegenerateApiKeyResponse._({
    required this.apiKey,
    required this.regeneratedAt,
  });

  factory RegenerateApiKeyResponse({
    required String apiKey,
    required DateTime regeneratedAt,
  }) = _RegenerateApiKeyResponseImpl;

  factory RegenerateApiKeyResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RegenerateApiKeyResponse(
      apiKey: jsonSerialization['apiKey'] as String,
      regeneratedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['regeneratedAt'],
      ),
    );
  }

  String apiKey;

  DateTime regeneratedAt;

  /// Returns a shallow copy of this [RegenerateApiKeyResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RegenerateApiKeyResponse copyWith({
    String? apiKey,
    DateTime? regeneratedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegenerateApiKeyResponse',
      'apiKey': apiKey,
      'regeneratedAt': regeneratedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegenerateApiKeyResponse',
      'apiKey': apiKey,
      'regeneratedAt': regeneratedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RegenerateApiKeyResponseImpl extends RegenerateApiKeyResponse {
  _RegenerateApiKeyResponseImpl({
    required String apiKey,
    required DateTime regeneratedAt,
  }) : super._(
         apiKey: apiKey,
         regeneratedAt: regeneratedAt,
       );

  /// Returns a shallow copy of this [RegenerateApiKeyResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RegenerateApiKeyResponse copyWith({
    String? apiKey,
    DateTime? regeneratedAt,
  }) {
    return RegenerateApiKeyResponse(
      apiKey: apiKey ?? this.apiKey,
      regeneratedAt: regeneratedAt ?? this.regeneratedAt,
    );
  }
}
