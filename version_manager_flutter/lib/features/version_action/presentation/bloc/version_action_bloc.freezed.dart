// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_action_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VersionActionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionActionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionActionEvent()';
}


}

/// @nodoc
class $VersionActionEventCopyWith<$Res>  {
$VersionActionEventCopyWith(VersionActionEvent _, $Res Function(VersionActionEvent) __);
}


/// Adds pattern-matching-related methods to [VersionActionEvent].
extension VersionActionEventPatterns on VersionActionEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateVersion value)?  createVersion,TResult Function( _UpdateVersion value)?  updateVersion,TResult Function( _DeleteVersion value)?  deleteVersion,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateVersion() when createVersion != null:
return createVersion(_that);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that);case _DeleteVersion() when deleteVersion != null:
return deleteVersion(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateVersion value)  createVersion,required TResult Function( _UpdateVersion value)  updateVersion,required TResult Function( _DeleteVersion value)  deleteVersion,}){
final _that = this;
switch (_that) {
case _CreateVersion():
return createVersion(_that);case _UpdateVersion():
return updateVersion(_that);case _DeleteVersion():
return deleteVersion(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateVersion value)?  createVersion,TResult? Function( _UpdateVersion value)?  updateVersion,TResult? Function( _DeleteVersion value)?  deleteVersion,}){
final _that = this;
switch (_that) {
case _CreateVersion() when createVersion != null:
return createVersion(_that);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that);case _DeleteVersion() when deleteVersion != null:
return deleteVersion(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue applicationId,  String versionNumber,  int buildNumber,  String changelog)?  createVersion,TResult Function( UuidValue versionId,  String? versionNumber,  int? buildNumber,  String? changelog,  bool? isBlocked,  String? blockReason,  UuidValue? recommendedVersionId,  bool? clearRecommendation,  RecommendationFrequencyType? recommendationFrequency,  int? recommendationEveryNthLaunch,  int? recommendationPeriodHours)?  updateVersion,TResult Function( UuidValue versionId)?  deleteVersion,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateVersion() when createVersion != null:
return createVersion(_that.applicationId,_that.versionNumber,_that.buildNumber,_that.changelog);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that.versionId,_that.versionNumber,_that.buildNumber,_that.changelog,_that.isBlocked,_that.blockReason,_that.recommendedVersionId,_that.clearRecommendation,_that.recommendationFrequency,_that.recommendationEveryNthLaunch,_that.recommendationPeriodHours);case _DeleteVersion() when deleteVersion != null:
return deleteVersion(_that.versionId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue applicationId,  String versionNumber,  int buildNumber,  String changelog)  createVersion,required TResult Function( UuidValue versionId,  String? versionNumber,  int? buildNumber,  String? changelog,  bool? isBlocked,  String? blockReason,  UuidValue? recommendedVersionId,  bool? clearRecommendation,  RecommendationFrequencyType? recommendationFrequency,  int? recommendationEveryNthLaunch,  int? recommendationPeriodHours)  updateVersion,required TResult Function( UuidValue versionId)  deleteVersion,}) {final _that = this;
switch (_that) {
case _CreateVersion():
return createVersion(_that.applicationId,_that.versionNumber,_that.buildNumber,_that.changelog);case _UpdateVersion():
return updateVersion(_that.versionId,_that.versionNumber,_that.buildNumber,_that.changelog,_that.isBlocked,_that.blockReason,_that.recommendedVersionId,_that.clearRecommendation,_that.recommendationFrequency,_that.recommendationEveryNthLaunch,_that.recommendationPeriodHours);case _DeleteVersion():
return deleteVersion(_that.versionId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue applicationId,  String versionNumber,  int buildNumber,  String changelog)?  createVersion,TResult? Function( UuidValue versionId,  String? versionNumber,  int? buildNumber,  String? changelog,  bool? isBlocked,  String? blockReason,  UuidValue? recommendedVersionId,  bool? clearRecommendation,  RecommendationFrequencyType? recommendationFrequency,  int? recommendationEveryNthLaunch,  int? recommendationPeriodHours)?  updateVersion,TResult? Function( UuidValue versionId)?  deleteVersion,}) {final _that = this;
switch (_that) {
case _CreateVersion() when createVersion != null:
return createVersion(_that.applicationId,_that.versionNumber,_that.buildNumber,_that.changelog);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that.versionId,_that.versionNumber,_that.buildNumber,_that.changelog,_that.isBlocked,_that.blockReason,_that.recommendedVersionId,_that.clearRecommendation,_that.recommendationFrequency,_that.recommendationEveryNthLaunch,_that.recommendationPeriodHours);case _DeleteVersion() when deleteVersion != null:
return deleteVersion(_that.versionId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateVersion implements VersionActionEvent {
  const _CreateVersion({required this.applicationId, required this.versionNumber, required this.buildNumber, required this.changelog});
  

 final  UuidValue applicationId;
 final  String versionNumber;
 final  int buildNumber;
 final  String changelog;

/// Create a copy of VersionActionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateVersionCopyWith<_CreateVersion> get copyWith => __$CreateVersionCopyWithImpl<_CreateVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateVersion&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.changelog, changelog) || other.changelog == changelog));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,versionNumber,buildNumber,changelog);

@override
String toString() {
  return 'VersionActionEvent.createVersion(applicationId: $applicationId, versionNumber: $versionNumber, buildNumber: $buildNumber, changelog: $changelog)';
}


}

/// @nodoc
abstract mixin class _$CreateVersionCopyWith<$Res> implements $VersionActionEventCopyWith<$Res> {
  factory _$CreateVersionCopyWith(_CreateVersion value, $Res Function(_CreateVersion) _then) = __$CreateVersionCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, String versionNumber, int buildNumber, String changelog
});




}
/// @nodoc
class __$CreateVersionCopyWithImpl<$Res>
    implements _$CreateVersionCopyWith<$Res> {
  __$CreateVersionCopyWithImpl(this._self, this._then);

  final _CreateVersion _self;
  final $Res Function(_CreateVersion) _then;

/// Create a copy of VersionActionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? versionNumber = null,Object? buildNumber = null,Object? changelog = null,}) {
  return _then(_CreateVersion(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int,changelog: null == changelog ? _self.changelog : changelog // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateVersion implements VersionActionEvent {
  const _UpdateVersion({required this.versionId, this.versionNumber, this.buildNumber, this.changelog, this.isBlocked, this.blockReason, this.recommendedVersionId, this.clearRecommendation, this.recommendationFrequency, this.recommendationEveryNthLaunch, this.recommendationPeriodHours});
  

 final  UuidValue versionId;
 final  String? versionNumber;
 final  int? buildNumber;
 final  String? changelog;
 final  bool? isBlocked;
 final  String? blockReason;
 final  UuidValue? recommendedVersionId;
 final  bool? clearRecommendation;
 final  RecommendationFrequencyType? recommendationFrequency;
 final  int? recommendationEveryNthLaunch;
 final  int? recommendationPeriodHours;

/// Create a copy of VersionActionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateVersionCopyWith<_UpdateVersion> get copyWith => __$UpdateVersionCopyWithImpl<_UpdateVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVersion&&(identical(other.versionId, versionId) || other.versionId == versionId)&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.changelog, changelog) || other.changelog == changelog)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.blockReason, blockReason) || other.blockReason == blockReason)&&(identical(other.recommendedVersionId, recommendedVersionId) || other.recommendedVersionId == recommendedVersionId)&&(identical(other.clearRecommendation, clearRecommendation) || other.clearRecommendation == clearRecommendation)&&(identical(other.recommendationFrequency, recommendationFrequency) || other.recommendationFrequency == recommendationFrequency)&&(identical(other.recommendationEveryNthLaunch, recommendationEveryNthLaunch) || other.recommendationEveryNthLaunch == recommendationEveryNthLaunch)&&(identical(other.recommendationPeriodHours, recommendationPeriodHours) || other.recommendationPeriodHours == recommendationPeriodHours));
}


@override
int get hashCode => Object.hash(runtimeType,versionId,versionNumber,buildNumber,changelog,isBlocked,blockReason,recommendedVersionId,clearRecommendation,recommendationFrequency,recommendationEveryNthLaunch,recommendationPeriodHours);

@override
String toString() {
  return 'VersionActionEvent.updateVersion(versionId: $versionId, versionNumber: $versionNumber, buildNumber: $buildNumber, changelog: $changelog, isBlocked: $isBlocked, blockReason: $blockReason, recommendedVersionId: $recommendedVersionId, clearRecommendation: $clearRecommendation, recommendationFrequency: $recommendationFrequency, recommendationEveryNthLaunch: $recommendationEveryNthLaunch, recommendationPeriodHours: $recommendationPeriodHours)';
}


}

/// @nodoc
abstract mixin class _$UpdateVersionCopyWith<$Res> implements $VersionActionEventCopyWith<$Res> {
  factory _$UpdateVersionCopyWith(_UpdateVersion value, $Res Function(_UpdateVersion) _then) = __$UpdateVersionCopyWithImpl;
@useResult
$Res call({
 UuidValue versionId, String? versionNumber, int? buildNumber, String? changelog, bool? isBlocked, String? blockReason, UuidValue? recommendedVersionId, bool? clearRecommendation, RecommendationFrequencyType? recommendationFrequency, int? recommendationEveryNthLaunch, int? recommendationPeriodHours
});




}
/// @nodoc
class __$UpdateVersionCopyWithImpl<$Res>
    implements _$UpdateVersionCopyWith<$Res> {
  __$UpdateVersionCopyWithImpl(this._self, this._then);

  final _UpdateVersion _self;
  final $Res Function(_UpdateVersion) _then;

/// Create a copy of VersionActionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? versionId = null,Object? versionNumber = freezed,Object? buildNumber = freezed,Object? changelog = freezed,Object? isBlocked = freezed,Object? blockReason = freezed,Object? recommendedVersionId = freezed,Object? clearRecommendation = freezed,Object? recommendationFrequency = freezed,Object? recommendationEveryNthLaunch = freezed,Object? recommendationPeriodHours = freezed,}) {
  return _then(_UpdateVersion(
versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as UuidValue,versionNumber: freezed == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as String?,buildNumber: freezed == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int?,changelog: freezed == changelog ? _self.changelog : changelog // ignore: cast_nullable_to_non_nullable
as String?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,blockReason: freezed == blockReason ? _self.blockReason : blockReason // ignore: cast_nullable_to_non_nullable
as String?,recommendedVersionId: freezed == recommendedVersionId ? _self.recommendedVersionId : recommendedVersionId // ignore: cast_nullable_to_non_nullable
as UuidValue?,clearRecommendation: freezed == clearRecommendation ? _self.clearRecommendation : clearRecommendation // ignore: cast_nullable_to_non_nullable
as bool?,recommendationFrequency: freezed == recommendationFrequency ? _self.recommendationFrequency : recommendationFrequency // ignore: cast_nullable_to_non_nullable
as RecommendationFrequencyType?,recommendationEveryNthLaunch: freezed == recommendationEveryNthLaunch ? _self.recommendationEveryNthLaunch : recommendationEveryNthLaunch // ignore: cast_nullable_to_non_nullable
as int?,recommendationPeriodHours: freezed == recommendationPeriodHours ? _self.recommendationPeriodHours : recommendationPeriodHours // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _DeleteVersion implements VersionActionEvent {
  const _DeleteVersion({required this.versionId});
  

 final  UuidValue versionId;

/// Create a copy of VersionActionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteVersionCopyWith<_DeleteVersion> get copyWith => __$DeleteVersionCopyWithImpl<_DeleteVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteVersion&&(identical(other.versionId, versionId) || other.versionId == versionId));
}


@override
int get hashCode => Object.hash(runtimeType,versionId);

@override
String toString() {
  return 'VersionActionEvent.deleteVersion(versionId: $versionId)';
}


}

/// @nodoc
abstract mixin class _$DeleteVersionCopyWith<$Res> implements $VersionActionEventCopyWith<$Res> {
  factory _$DeleteVersionCopyWith(_DeleteVersion value, $Res Function(_DeleteVersion) _then) = __$DeleteVersionCopyWithImpl;
@useResult
$Res call({
 UuidValue versionId
});




}
/// @nodoc
class __$DeleteVersionCopyWithImpl<$Res>
    implements _$DeleteVersionCopyWith<$Res> {
  __$DeleteVersionCopyWithImpl(this._self, this._then);

  final _DeleteVersion _self;
  final $Res Function(_DeleteVersion) _then;

/// Create a copy of VersionActionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? versionId = null,}) {
  return _then(_DeleteVersion(
versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc
mixin _$VersionActionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionActionState()';
}


}

/// @nodoc
class $VersionActionStateCopyWith<$Res>  {
$VersionActionStateCopyWith(VersionActionState _, $Res Function(VersionActionState) __);
}


/// Adds pattern-matching-related methods to [VersionActionState].
extension VersionActionStatePatterns on VersionActionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VersionActionInitial value)?  initial,TResult Function( VersionActionLoading value)?  loading,TResult Function( VersionActionSuccess value)?  success,TResult Function( VersionActionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VersionActionInitial() when initial != null:
return initial(_that);case VersionActionLoading() when loading != null:
return loading(_that);case VersionActionSuccess() when success != null:
return success(_that);case VersionActionError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VersionActionInitial value)  initial,required TResult Function( VersionActionLoading value)  loading,required TResult Function( VersionActionSuccess value)  success,required TResult Function( VersionActionError value)  error,}){
final _that = this;
switch (_that) {
case VersionActionInitial():
return initial(_that);case VersionActionLoading():
return loading(_that);case VersionActionSuccess():
return success(_that);case VersionActionError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VersionActionInitial value)?  initial,TResult? Function( VersionActionLoading value)?  loading,TResult? Function( VersionActionSuccess value)?  success,TResult? Function( VersionActionError value)?  error,}){
final _that = this;
switch (_that) {
case VersionActionInitial() when initial != null:
return initial(_that);case VersionActionLoading() when loading != null:
return loading(_that);case VersionActionSuccess() when success != null:
return success(_that);case VersionActionError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VersionActionInitial() when initial != null:
return initial();case VersionActionLoading() when loading != null:
return loading();case VersionActionSuccess() when success != null:
return success(_that.message);case VersionActionError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case VersionActionInitial():
return initial();case VersionActionLoading():
return loading();case VersionActionSuccess():
return success(_that.message);case VersionActionError():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case VersionActionInitial() when initial != null:
return initial();case VersionActionLoading() when loading != null:
return loading();case VersionActionSuccess() when success != null:
return success(_that.message);case VersionActionError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VersionActionInitial implements VersionActionState {
  const VersionActionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionActionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionActionState.initial()';
}


}




/// @nodoc


class VersionActionLoading implements VersionActionState {
  const VersionActionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionActionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionActionState.loading()';
}


}




/// @nodoc


class VersionActionSuccess implements VersionActionState {
  const VersionActionSuccess({required this.message});
  

 final  String message;

/// Create a copy of VersionActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionActionSuccessCopyWith<VersionActionSuccess> get copyWith => _$VersionActionSuccessCopyWithImpl<VersionActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionActionSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VersionActionState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $VersionActionSuccessCopyWith<$Res> implements $VersionActionStateCopyWith<$Res> {
  factory $VersionActionSuccessCopyWith(VersionActionSuccess value, $Res Function(VersionActionSuccess) _then) = _$VersionActionSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VersionActionSuccessCopyWithImpl<$Res>
    implements $VersionActionSuccessCopyWith<$Res> {
  _$VersionActionSuccessCopyWithImpl(this._self, this._then);

  final VersionActionSuccess _self;
  final $Res Function(VersionActionSuccess) _then;

/// Create a copy of VersionActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VersionActionSuccess(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VersionActionError implements VersionActionState {
  const VersionActionError({required this.message});
  

 final  String message;

/// Create a copy of VersionActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionActionErrorCopyWith<VersionActionError> get copyWith => _$VersionActionErrorCopyWithImpl<VersionActionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionActionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VersionActionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $VersionActionErrorCopyWith<$Res> implements $VersionActionStateCopyWith<$Res> {
  factory $VersionActionErrorCopyWith(VersionActionError value, $Res Function(VersionActionError) _then) = _$VersionActionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VersionActionErrorCopyWithImpl<$Res>
    implements $VersionActionErrorCopyWith<$Res> {
  _$VersionActionErrorCopyWithImpl(this._self, this._then);

  final VersionActionError _self;
  final $Res Function(VersionActionError) _then;

/// Create a copy of VersionActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VersionActionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
