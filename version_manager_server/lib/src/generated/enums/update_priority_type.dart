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

/// Приоритет обновления версии
///
/// Определяет степень важности обновления, которую клиентское
/// приложение может использовать для выбора стратегии уведомления:
/// - critical — полная блокировка, пользователь обязан обновиться
/// - high — серьёзные проблемы, настоятельно рекомендуется обновиться
/// - medium — полезные улучшения и исправления
/// - low — незначительные улучшения, обновление опционально
enum UpdatePriorityType implements _i1.SerializableModel {
  critical,
  high,
  medium,
  low;

  static UpdatePriorityType fromJson(String name) {
    switch (name) {
      case 'critical':
        return UpdatePriorityType.critical;
      case 'high':
        return UpdatePriorityType.high;
      case 'medium':
        return UpdatePriorityType.medium;
      case 'low':
        return UpdatePriorityType.low;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "UpdatePriorityType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
