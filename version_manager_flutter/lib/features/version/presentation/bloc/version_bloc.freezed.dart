// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VersionEvent {

 UuidValue get applicationId;
/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionEventCopyWith<VersionEvent> get copyWith => _$VersionEventCopyWithImpl<VersionEvent>(this as VersionEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionEvent&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'VersionEvent(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class $VersionEventCopyWith<$Res>  {
  factory $VersionEventCopyWith(VersionEvent value, $Res Function(VersionEvent) _then) = _$VersionEventCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class _$VersionEventCopyWithImpl<$Res>
    implements $VersionEventCopyWith<$Res> {
  _$VersionEventCopyWithImpl(this._self, this._then);

  final VersionEvent _self;
  final $Res Function(VersionEvent) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}

}


/// Adds pattern-matching-related methods to [VersionEvent].
extension VersionEventPatterns on VersionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadVersions value)?  loadVersions,TResult Function( _ToggleVersionBlock value)?  toggleVersionBlock,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadVersions() when loadVersions != null:
return loadVersions(_that);case _ToggleVersionBlock() when toggleVersionBlock != null:
return toggleVersionBlock(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadVersions value)  loadVersions,required TResult Function( _ToggleVersionBlock value)  toggleVersionBlock,}){
final _that = this;
switch (_that) {
case _LoadVersions():
return loadVersions(_that);case _ToggleVersionBlock():
return toggleVersionBlock(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadVersions value)?  loadVersions,TResult? Function( _ToggleVersionBlock value)?  toggleVersionBlock,}){
final _that = this;
switch (_that) {
case _LoadVersions() when loadVersions != null:
return loadVersions(_that);case _ToggleVersionBlock() when toggleVersionBlock != null:
return toggleVersionBlock(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue applicationId)?  loadVersions,TResult Function( UuidValue versionId,  bool isBlocked,  UuidValue applicationId,  String? blockReason)?  toggleVersionBlock,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadVersions() when loadVersions != null:
return loadVersions(_that.applicationId);case _ToggleVersionBlock() when toggleVersionBlock != null:
return toggleVersionBlock(_that.versionId,_that.isBlocked,_that.applicationId,_that.blockReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue applicationId)  loadVersions,required TResult Function( UuidValue versionId,  bool isBlocked,  UuidValue applicationId,  String? blockReason)  toggleVersionBlock,}) {final _that = this;
switch (_that) {
case _LoadVersions():
return loadVersions(_that.applicationId);case _ToggleVersionBlock():
return toggleVersionBlock(_that.versionId,_that.isBlocked,_that.applicationId,_that.blockReason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue applicationId)?  loadVersions,TResult? Function( UuidValue versionId,  bool isBlocked,  UuidValue applicationId,  String? blockReason)?  toggleVersionBlock,}) {final _that = this;
switch (_that) {
case _LoadVersions() when loadVersions != null:
return loadVersions(_that.applicationId);case _ToggleVersionBlock() when toggleVersionBlock != null:
return toggleVersionBlock(_that.versionId,_that.isBlocked,_that.applicationId,_that.blockReason);case _:
  return null;

}
}

}

/// @nodoc


class _LoadVersions implements VersionEvent {
  const _LoadVersions({required this.applicationId});
  

@override final  UuidValue applicationId;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadVersionsCopyWith<_LoadVersions> get copyWith => __$LoadVersionsCopyWithImpl<_LoadVersions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadVersions&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'VersionEvent.loadVersions(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class _$LoadVersionsCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$LoadVersionsCopyWith(_LoadVersions value, $Res Function(_LoadVersions) _then) = __$LoadVersionsCopyWithImpl;
@override @useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class __$LoadVersionsCopyWithImpl<$Res>
    implements _$LoadVersionsCopyWith<$Res> {
  __$LoadVersionsCopyWithImpl(this._self, this._then);

  final _LoadVersions _self;
  final $Res Function(_LoadVersions) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,}) {
  return _then(_LoadVersions(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _ToggleVersionBlock implements VersionEvent {
  const _ToggleVersionBlock({required this.versionId, required this.isBlocked, required this.applicationId, this.blockReason});
  

 final  UuidValue versionId;
 final  bool isBlocked;
@override final  UuidValue applicationId;
 final  String? blockReason;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleVersionBlockCopyWith<_ToggleVersionBlock> get copyWith => __$ToggleVersionBlockCopyWithImpl<_ToggleVersionBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleVersionBlock&&(identical(other.versionId, versionId) || other.versionId == versionId)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.blockReason, blockReason) || other.blockReason == blockReason));
}


@override
int get hashCode => Object.hash(runtimeType,versionId,isBlocked,applicationId,blockReason);

@override
String toString() {
  return 'VersionEvent.toggleVersionBlock(versionId: $versionId, isBlocked: $isBlocked, applicationId: $applicationId, blockReason: $blockReason)';
}


}

/// @nodoc
abstract mixin class _$ToggleVersionBlockCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$ToggleVersionBlockCopyWith(_ToggleVersionBlock value, $Res Function(_ToggleVersionBlock) _then) = __$ToggleVersionBlockCopyWithImpl;
@override @useResult
$Res call({
 UuidValue versionId, bool isBlocked, UuidValue applicationId, String? blockReason
});




}
/// @nodoc
class __$ToggleVersionBlockCopyWithImpl<$Res>
    implements _$ToggleVersionBlockCopyWith<$Res> {
  __$ToggleVersionBlockCopyWithImpl(this._self, this._then);

  final _ToggleVersionBlock _self;
  final $Res Function(_ToggleVersionBlock) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versionId = null,Object? isBlocked = null,Object? applicationId = null,Object? blockReason = freezed,}) {
  return _then(_ToggleVersionBlock(
versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as UuidValue,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,blockReason: freezed == blockReason ? _self.blockReason : blockReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$VersionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionState()';
}


}

/// @nodoc
class $VersionStateCopyWith<$Res>  {
$VersionStateCopyWith(VersionState _, $Res Function(VersionState) __);
}


/// Adds pattern-matching-related methods to [VersionState].
extension VersionStatePatterns on VersionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VersionInitial value)?  initial,TResult Function( VersionLoading value)?  loading,TResult Function( VersionLoaded value)?  loaded,TResult Function( VersionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VersionInitial() when initial != null:
return initial(_that);case VersionLoading() when loading != null:
return loading(_that);case VersionLoaded() when loaded != null:
return loaded(_that);case VersionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VersionInitial value)  initial,required TResult Function( VersionLoading value)  loading,required TResult Function( VersionLoaded value)  loaded,required TResult Function( VersionError value)  error,}){
final _that = this;
switch (_that) {
case VersionInitial():
return initial(_that);case VersionLoading():
return loading(_that);case VersionLoaded():
return loaded(_that);case VersionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VersionInitial value)?  initial,TResult? Function( VersionLoading value)?  loading,TResult? Function( VersionLoaded value)?  loaded,TResult? Function( VersionError value)?  error,}){
final _that = this;
switch (_that) {
case VersionInitial() when initial != null:
return initial(_that);case VersionLoading() when loading != null:
return loading(_that);case VersionLoaded() when loaded != null:
return loaded(_that);case VersionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Application application,  List<VersionListItem> versions)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VersionInitial() when initial != null:
return initial();case VersionLoading() when loading != null:
return loading();case VersionLoaded() when loaded != null:
return loaded(_that.application,_that.versions);case VersionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Application application,  List<VersionListItem> versions)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case VersionInitial():
return initial();case VersionLoading():
return loading();case VersionLoaded():
return loaded(_that.application,_that.versions);case VersionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Application application,  List<VersionListItem> versions)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case VersionInitial() when initial != null:
return initial();case VersionLoading() when loading != null:
return loading();case VersionLoaded() when loaded != null:
return loaded(_that.application,_that.versions);case VersionError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VersionInitial implements VersionState {
  const VersionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionState.initial()';
}


}




/// @nodoc


class VersionLoading implements VersionState {
  const VersionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionState.loading()';
}


}




/// @nodoc


class VersionLoaded implements VersionState {
  const VersionLoaded({required this.application, required final  List<VersionListItem> versions}): _versions = versions;
  

 final  Application application;
 final  List<VersionListItem> _versions;
 List<VersionListItem> get versions {
  if (_versions is EqualUnmodifiableListView) return _versions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_versions);
}


/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionLoadedCopyWith<VersionLoaded> get copyWith => _$VersionLoadedCopyWithImpl<VersionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionLoaded&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other._versions, _versions));
}


@override
int get hashCode => Object.hash(runtimeType,application,const DeepCollectionEquality().hash(_versions));

@override
String toString() {
  return 'VersionState.loaded(application: $application, versions: $versions)';
}


}

/// @nodoc
abstract mixin class $VersionLoadedCopyWith<$Res> implements $VersionStateCopyWith<$Res> {
  factory $VersionLoadedCopyWith(VersionLoaded value, $Res Function(VersionLoaded) _then) = _$VersionLoadedCopyWithImpl;
@useResult
$Res call({
 Application application, List<VersionListItem> versions
});




}
/// @nodoc
class _$VersionLoadedCopyWithImpl<$Res>
    implements $VersionLoadedCopyWith<$Res> {
  _$VersionLoadedCopyWithImpl(this._self, this._then);

  final VersionLoaded _self;
  final $Res Function(VersionLoaded) _then;

/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,Object? versions = null,}) {
  return _then(VersionLoaded(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,versions: null == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as List<VersionListItem>,
  ));
}


}

/// @nodoc


class VersionError implements VersionState {
  const VersionError({required this.message});
  

 final  String message;

/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionErrorCopyWith<VersionError> get copyWith => _$VersionErrorCopyWithImpl<VersionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VersionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $VersionErrorCopyWith<$Res> implements $VersionStateCopyWith<$Res> {
  factory $VersionErrorCopyWith(VersionError value, $Res Function(VersionError) _then) = _$VersionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VersionErrorCopyWithImpl<$Res>
    implements $VersionErrorCopyWith<$Res> {
  _$VersionErrorCopyWithImpl(this._self, this._then);

  final VersionError _self;
  final $Res Function(VersionError) _then;

/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VersionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
