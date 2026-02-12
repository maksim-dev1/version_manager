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
import '../enums/response_status_type.dart' as _i2;
import '../enums/update_priority_type.dart' as _i3;
import '../api/recommended_version_info.dart' as _i4;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i5;

/// Ответ на проверку версии мобильного приложения.
///
/// Возвращается клиентскому SDK с информацией о статусе текущей версии,
/// необходимости обновления, приоритете и ссылках на магазины.
///
/// Варианты ответов:
/// 1. blocked — версия заблокирована, обязательное обновление
/// 2. update_available — рекомендуется обновление
/// 3. active — версия актуальна, обновлений нет
abstract class CheckVersionResponse implements _i1.SerializableModel {
  CheckVersionResponse._({
    required this.status,
    required this.isBlocked,
    this.blockReason,
    this.updatePriority,
    this.recommendedVersion,
    required this.message,
    required this.currentVersion,
    required this.currentBuildNumber,
    required this.serverTimestamp,
  });

  factory CheckVersionResponse({
    required _i2.ResponseStatusType status,
    required bool isBlocked,
    String? blockReason,
    _i3.UpdatePriorityType? updatePriority,
    _i4.RecommendedVersionInfo? recommendedVersion,
    required String message,
    required String currentVersion,
    required int currentBuildNumber,
    required DateTime serverTimestamp,
  }) = _CheckVersionResponseImpl;

  factory CheckVersionResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CheckVersionResponse(
      status: _i2.ResponseStatusType.fromJson(
        (jsonSerialization['status'] as String),
      ),
      isBlocked: jsonSerialization['isBlocked'] as bool,
      blockReason: jsonSerialization['blockReason'] as String?,
      updatePriority: jsonSerialization['updatePriority'] == null
          ? null
          : _i3.UpdatePriorityType.fromJson(
              (jsonSerialization['updatePriority'] as String),
            ),
      recommendedVersion: jsonSerialization['recommendedVersion'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.RecommendedVersionInfo>(
              jsonSerialization['recommendedVersion'],
            ),
      message: jsonSerialization['message'] as String,
      currentVersion: jsonSerialization['currentVersion'] as String,
      currentBuildNumber: jsonSerialization['currentBuildNumber'] as int,
      serverTimestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['serverTimestamp'],
      ),
    );
  }

  /// Статус текущей версии:
  /// - blocked: версия заблокирована, приложение не должно работать
  /// - update_available: доступно обновление
  /// - active: версия актуальна
  _i2.ResponseStatusType status;

  /// Заблокирована ли текущая версия.
  /// Если true — клиент должен показать полноэкранный блокирующий диалог.
  bool isBlocked;

  /// Причина блокировки (только если isBlocked == true).
  /// Отображается пользователю для объяснения причины.
  String? blockReason;

  /// Приоритет обновления:
  /// - critical: версия заблокирована, обновление обязательно
  /// - high: серьёзные проблемы, рекомендуется обновиться немедленно
  /// - medium: полезные улучшения и исправления
  /// - low: незначительные улучшения
  /// null — если версия актуальна (status == active)
  _i3.UpdatePriorityType? updatePriority;

  /// Информация о рекомендуемой версии для обновления.
  /// null — если нет рекомендованной версии или версия актуальна.
  _i4.RecommendedVersionInfo? recommendedVersion;

  /// Сообщение для отображения пользователю.
  /// Локализованное сообщение с информацией о статусе версии.
  String message;

  /// Текущий номер версии приложения (echo для подтверждения)
  String currentVersion;

  /// Текущий номер сборки (echo для подтверждения)
  int currentBuildNumber;

  /// Время обработки запроса на сервере (для мониторинга)
  DateTime serverTimestamp;

  /// Returns a shallow copy of this [CheckVersionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CheckVersionResponse copyWith({
    _i2.ResponseStatusType? status,
    bool? isBlocked,
    String? blockReason,
    _i3.UpdatePriorityType? updatePriority,
    _i4.RecommendedVersionInfo? recommendedVersion,
    String? message,
    String? currentVersion,
    int? currentBuildNumber,
    DateTime? serverTimestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CheckVersionResponse',
      'status': status.toJson(),
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (updatePriority != null) 'updatePriority': updatePriority?.toJson(),
      if (recommendedVersion != null)
        'recommendedVersion': recommendedVersion?.toJson(),
      'message': message,
      'currentVersion': currentVersion,
      'currentBuildNumber': currentBuildNumber,
      'serverTimestamp': serverTimestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CheckVersionResponseImpl extends CheckVersionResponse {
  _CheckVersionResponseImpl({
    required _i2.ResponseStatusType status,
    required bool isBlocked,
    String? blockReason,
    _i3.UpdatePriorityType? updatePriority,
    _i4.RecommendedVersionInfo? recommendedVersion,
    required String message,
    required String currentVersion,
    required int currentBuildNumber,
    required DateTime serverTimestamp,
  }) : super._(
         status: status,
         isBlocked: isBlocked,
         blockReason: blockReason,
         updatePriority: updatePriority,
         recommendedVersion: recommendedVersion,
         message: message,
         currentVersion: currentVersion,
         currentBuildNumber: currentBuildNumber,
         serverTimestamp: serverTimestamp,
       );

  /// Returns a shallow copy of this [CheckVersionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CheckVersionResponse copyWith({
    _i2.ResponseStatusType? status,
    bool? isBlocked,
    Object? blockReason = _Undefined,
    Object? updatePriority = _Undefined,
    Object? recommendedVersion = _Undefined,
    String? message,
    String? currentVersion,
    int? currentBuildNumber,
    DateTime? serverTimestamp,
  }) {
    return CheckVersionResponse(
      status: status ?? this.status,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      updatePriority: updatePriority is _i3.UpdatePriorityType?
          ? updatePriority
          : this.updatePriority,
      recommendedVersion: recommendedVersion is _i4.RecommendedVersionInfo?
          ? recommendedVersion
          : this.recommendedVersion?.copyWith(),
      message: message ?? this.message,
      currentVersion: currentVersion ?? this.currentVersion,
      currentBuildNumber: currentBuildNumber ?? this.currentBuildNumber,
      serverTimestamp: serverTimestamp ?? this.serverTimestamp,
    );
  }
}
