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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionEvent()';
}


}

/// @nodoc
class $VersionEventCopyWith<$Res>  {
$VersionEventCopyWith(VersionEvent _, $Res Function(VersionEvent) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddVersion value)?  addVersion,TResult Function( _GetAllVersions value)?  getAllVersions,TResult Function( _GetVersionsByFilters value)?  getVersionsByFilters,TResult Function( _UpdateVersion value)?  updateVersion,TResult Function( _BlockUnblockVersion value)?  blockUnblockVersion,TResult Function( _DeleteVersion value)?  deleteVersion,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddVersion() when addVersion != null:
return addVersion(_that);case _GetAllVersions() when getAllVersions != null:
return getAllVersions(_that);case _GetVersionsByFilters() when getVersionsByFilters != null:
return getVersionsByFilters(_that);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that);case _BlockUnblockVersion() when blockUnblockVersion != null:
return blockUnblockVersion(_that);case _DeleteVersion() when deleteVersion != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddVersion value)  addVersion,required TResult Function( _GetAllVersions value)  getAllVersions,required TResult Function( _GetVersionsByFilters value)  getVersionsByFilters,required TResult Function( _UpdateVersion value)  updateVersion,required TResult Function( _BlockUnblockVersion value)  blockUnblockVersion,required TResult Function( _DeleteVersion value)  deleteVersion,}){
final _that = this;
switch (_that) {
case _AddVersion():
return addVersion(_that);case _GetAllVersions():
return getAllVersions(_that);case _GetVersionsByFilters():
return getVersionsByFilters(_that);case _UpdateVersion():
return updateVersion(_that);case _BlockUnblockVersion():
return blockUnblockVersion(_that);case _DeleteVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddVersion value)?  addVersion,TResult? Function( _GetAllVersions value)?  getAllVersions,TResult? Function( _GetVersionsByFilters value)?  getVersionsByFilters,TResult? Function( _UpdateVersion value)?  updateVersion,TResult? Function( _BlockUnblockVersion value)?  blockUnblockVersion,TResult? Function( _DeleteVersion value)?  deleteVersion,}){
final _that = this;
switch (_that) {
case _AddVersion() when addVersion != null:
return addVersion(_that);case _GetAllVersions() when getAllVersions != null:
return getAllVersions(_that);case _GetVersionsByFilters() when getVersionsByFilters != null:
return getVersionsByFilters(_that);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that);case _BlockUnblockVersion() when blockUnblockVersion != null:
return blockUnblockVersion(_that);case _DeleteVersion() when deleteVersion != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue applicationId,  String version,  int buildNumber,  String changelog,  List<Platform>? platforms,  List<StoreLinks>? storeLinks)?  addVersion,TResult Function()?  getAllVersions,TResult Function( UuidValue applicationId,  Platform? platform)?  getVersionsByFilters,TResult Function( AppVersion appVersion)?  updateVersion,TResult Function( UuidValue id,  bool isBlocked,  String reason)?  blockUnblockVersion,TResult Function( AppVersion version)?  deleteVersion,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddVersion() when addVersion != null:
return addVersion(_that.applicationId,_that.version,_that.buildNumber,_that.changelog,_that.platforms,_that.storeLinks);case _GetAllVersions() when getAllVersions != null:
return getAllVersions();case _GetVersionsByFilters() when getVersionsByFilters != null:
return getVersionsByFilters(_that.applicationId,_that.platform);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that.appVersion);case _BlockUnblockVersion() when blockUnblockVersion != null:
return blockUnblockVersion(_that.id,_that.isBlocked,_that.reason);case _DeleteVersion() when deleteVersion != null:
return deleteVersion(_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue applicationId,  String version,  int buildNumber,  String changelog,  List<Platform>? platforms,  List<StoreLinks>? storeLinks)  addVersion,required TResult Function()  getAllVersions,required TResult Function( UuidValue applicationId,  Platform? platform)  getVersionsByFilters,required TResult Function( AppVersion appVersion)  updateVersion,required TResult Function( UuidValue id,  bool isBlocked,  String reason)  blockUnblockVersion,required TResult Function( AppVersion version)  deleteVersion,}) {final _that = this;
switch (_that) {
case _AddVersion():
return addVersion(_that.applicationId,_that.version,_that.buildNumber,_that.changelog,_that.platforms,_that.storeLinks);case _GetAllVersions():
return getAllVersions();case _GetVersionsByFilters():
return getVersionsByFilters(_that.applicationId,_that.platform);case _UpdateVersion():
return updateVersion(_that.appVersion);case _BlockUnblockVersion():
return blockUnblockVersion(_that.id,_that.isBlocked,_that.reason);case _DeleteVersion():
return deleteVersion(_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue applicationId,  String version,  int buildNumber,  String changelog,  List<Platform>? platforms,  List<StoreLinks>? storeLinks)?  addVersion,TResult? Function()?  getAllVersions,TResult? Function( UuidValue applicationId,  Platform? platform)?  getVersionsByFilters,TResult? Function( AppVersion appVersion)?  updateVersion,TResult? Function( UuidValue id,  bool isBlocked,  String reason)?  blockUnblockVersion,TResult? Function( AppVersion version)?  deleteVersion,}) {final _that = this;
switch (_that) {
case _AddVersion() when addVersion != null:
return addVersion(_that.applicationId,_that.version,_that.buildNumber,_that.changelog,_that.platforms,_that.storeLinks);case _GetAllVersions() when getAllVersions != null:
return getAllVersions();case _GetVersionsByFilters() when getVersionsByFilters != null:
return getVersionsByFilters(_that.applicationId,_that.platform);case _UpdateVersion() when updateVersion != null:
return updateVersion(_that.appVersion);case _BlockUnblockVersion() when blockUnblockVersion != null:
return blockUnblockVersion(_that.id,_that.isBlocked,_that.reason);case _DeleteVersion() when deleteVersion != null:
return deleteVersion(_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _AddVersion implements VersionEvent {
  const _AddVersion({required this.applicationId, required this.version, required this.buildNumber, required this.changelog, final  List<Platform>? platforms, final  List<StoreLinks>? storeLinks}): _platforms = platforms,_storeLinks = storeLinks;
  

 final  UuidValue applicationId;
 final  String version;
 final  int buildNumber;
 final  String changelog;
 final  List<Platform>? _platforms;
 List<Platform>? get platforms {
  final value = _platforms;
  if (value == null) return null;
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<StoreLinks>? _storeLinks;
 List<StoreLinks>? get storeLinks {
  final value = _storeLinks;
  if (value == null) return null;
  if (_storeLinks is EqualUnmodifiableListView) return _storeLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVersionCopyWith<_AddVersion> get copyWith => __$AddVersionCopyWithImpl<_AddVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVersion&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.changelog, changelog) || other.changelog == changelog)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&const DeepCollectionEquality().equals(other._storeLinks, _storeLinks));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,version,buildNumber,changelog,const DeepCollectionEquality().hash(_platforms),const DeepCollectionEquality().hash(_storeLinks));

@override
String toString() {
  return 'VersionEvent.addVersion(applicationId: $applicationId, version: $version, buildNumber: $buildNumber, changelog: $changelog, platforms: $platforms, storeLinks: $storeLinks)';
}


}

/// @nodoc
abstract mixin class _$AddVersionCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$AddVersionCopyWith(_AddVersion value, $Res Function(_AddVersion) _then) = __$AddVersionCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, String version, int buildNumber, String changelog, List<Platform>? platforms, List<StoreLinks>? storeLinks
});




}
/// @nodoc
class __$AddVersionCopyWithImpl<$Res>
    implements _$AddVersionCopyWith<$Res> {
  __$AddVersionCopyWithImpl(this._self, this._then);

  final _AddVersion _self;
  final $Res Function(_AddVersion) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? version = null,Object? buildNumber = null,Object? changelog = null,Object? platforms = freezed,Object? storeLinks = freezed,}) {
  return _then(_AddVersion(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int,changelog: null == changelog ? _self.changelog : changelog // ignore: cast_nullable_to_non_nullable
as String,platforms: freezed == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<Platform>?,storeLinks: freezed == storeLinks ? _self._storeLinks : storeLinks // ignore: cast_nullable_to_non_nullable
as List<StoreLinks>?,
  ));
}


}

/// @nodoc


class _GetAllVersions implements VersionEvent {
  const _GetAllVersions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllVersions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionEvent.getAllVersions()';
}


}




/// @nodoc


class _GetVersionsByFilters implements VersionEvent {
  const _GetVersionsByFilters({required this.applicationId, this.platform});
  

 final  UuidValue applicationId;
 final  Platform? platform;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetVersionsByFiltersCopyWith<_GetVersionsByFilters> get copyWith => __$GetVersionsByFiltersCopyWithImpl<_GetVersionsByFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetVersionsByFilters&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.platform, platform) || other.platform == platform));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,platform);

@override
String toString() {
  return 'VersionEvent.getVersionsByFilters(applicationId: $applicationId, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$GetVersionsByFiltersCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$GetVersionsByFiltersCopyWith(_GetVersionsByFilters value, $Res Function(_GetVersionsByFilters) _then) = __$GetVersionsByFiltersCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, Platform? platform
});




}
/// @nodoc
class __$GetVersionsByFiltersCopyWithImpl<$Res>
    implements _$GetVersionsByFiltersCopyWith<$Res> {
  __$GetVersionsByFiltersCopyWithImpl(this._self, this._then);

  final _GetVersionsByFilters _self;
  final $Res Function(_GetVersionsByFilters) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? platform = freezed,}) {
  return _then(_GetVersionsByFilters(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as Platform?,
  ));
}


}

/// @nodoc


class _UpdateVersion implements VersionEvent {
  const _UpdateVersion({required this.appVersion});
  

 final  AppVersion appVersion;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateVersionCopyWith<_UpdateVersion> get copyWith => __$UpdateVersionCopyWithImpl<_UpdateVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVersion&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}


@override
int get hashCode => Object.hash(runtimeType,appVersion);

@override
String toString() {
  return 'VersionEvent.updateVersion(appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class _$UpdateVersionCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$UpdateVersionCopyWith(_UpdateVersion value, $Res Function(_UpdateVersion) _then) = __$UpdateVersionCopyWithImpl;
@useResult
$Res call({
 AppVersion appVersion
});




}
/// @nodoc
class __$UpdateVersionCopyWithImpl<$Res>
    implements _$UpdateVersionCopyWith<$Res> {
  __$UpdateVersionCopyWithImpl(this._self, this._then);

  final _UpdateVersion _self;
  final $Res Function(_UpdateVersion) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appVersion = null,}) {
  return _then(_UpdateVersion(
appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as AppVersion,
  ));
}


}

/// @nodoc


class _BlockUnblockVersion implements VersionEvent {
  const _BlockUnblockVersion({required this.id, required this.isBlocked, required this.reason});
  

 final  UuidValue id;
 final  bool isBlocked;
 final  String reason;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockUnblockVersionCopyWith<_BlockUnblockVersion> get copyWith => __$BlockUnblockVersionCopyWithImpl<_BlockUnblockVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockUnblockVersion&&(identical(other.id, id) || other.id == id)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,id,isBlocked,reason);

@override
String toString() {
  return 'VersionEvent.blockUnblockVersion(id: $id, isBlocked: $isBlocked, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BlockUnblockVersionCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$BlockUnblockVersionCopyWith(_BlockUnblockVersion value, $Res Function(_BlockUnblockVersion) _then) = __$BlockUnblockVersionCopyWithImpl;
@useResult
$Res call({
 UuidValue id, bool isBlocked, String reason
});




}
/// @nodoc
class __$BlockUnblockVersionCopyWithImpl<$Res>
    implements _$BlockUnblockVersionCopyWith<$Res> {
  __$BlockUnblockVersionCopyWithImpl(this._self, this._then);

  final _BlockUnblockVersion _self;
  final $Res Function(_BlockUnblockVersion) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isBlocked = null,Object? reason = null,}) {
  return _then(_BlockUnblockVersion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteVersion implements VersionEvent {
  const _DeleteVersion({required this.version});
  

 final  AppVersion version;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteVersionCopyWith<_DeleteVersion> get copyWith => __$DeleteVersionCopyWithImpl<_DeleteVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteVersion&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'VersionEvent.deleteVersion(version: $version)';
}


}

/// @nodoc
abstract mixin class _$DeleteVersionCopyWith<$Res> implements $VersionEventCopyWith<$Res> {
  factory _$DeleteVersionCopyWith(_DeleteVersion value, $Res Function(_DeleteVersion) _then) = __$DeleteVersionCopyWithImpl;
@useResult
$Res call({
 AppVersion version
});




}
/// @nodoc
class __$DeleteVersionCopyWithImpl<$Res>
    implements _$DeleteVersionCopyWith<$Res> {
  __$DeleteVersionCopyWithImpl(this._self, this._then);

  final _DeleteVersion _self;
  final $Res Function(_DeleteVersion) _then;

/// Create a copy of VersionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(_DeleteVersion(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as AppVersion,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VersionLoading value)?  versionLoading,TResult Function( VersionLoaded value)?  versionLoaded,TResult Function( VersionError value)?  versionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VersionLoading() when versionLoading != null:
return versionLoading(_that);case VersionLoaded() when versionLoaded != null:
return versionLoaded(_that);case VersionError() when versionError != null:
return versionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VersionLoading value)  versionLoading,required TResult Function( VersionLoaded value)  versionLoaded,required TResult Function( VersionError value)  versionError,}){
final _that = this;
switch (_that) {
case VersionLoading():
return versionLoading(_that);case VersionLoaded():
return versionLoaded(_that);case VersionError():
return versionError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VersionLoading value)?  versionLoading,TResult? Function( VersionLoaded value)?  versionLoaded,TResult? Function( VersionError value)?  versionError,}){
final _that = this;
switch (_that) {
case VersionLoading() when versionLoading != null:
return versionLoading(_that);case VersionLoaded() when versionLoaded != null:
return versionLoaded(_that);case VersionError() when versionError != null:
return versionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  versionLoading,TResult Function( List<AppVersion> versions)?  versionLoaded,TResult Function( String message)?  versionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VersionLoading() when versionLoading != null:
return versionLoading();case VersionLoaded() when versionLoaded != null:
return versionLoaded(_that.versions);case VersionError() when versionError != null:
return versionError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  versionLoading,required TResult Function( List<AppVersion> versions)  versionLoaded,required TResult Function( String message)  versionError,}) {final _that = this;
switch (_that) {
case VersionLoading():
return versionLoading();case VersionLoaded():
return versionLoaded(_that.versions);case VersionError():
return versionError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  versionLoading,TResult? Function( List<AppVersion> versions)?  versionLoaded,TResult? Function( String message)?  versionError,}) {final _that = this;
switch (_that) {
case VersionLoading() when versionLoading != null:
return versionLoading();case VersionLoaded() when versionLoaded != null:
return versionLoaded(_that.versions);case VersionError() when versionError != null:
return versionError(_that.message);case _:
  return null;

}
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
  return 'VersionState.versionLoading()';
}


}




/// @nodoc


class VersionLoaded implements VersionState {
  const VersionLoaded({required final  List<AppVersion> versions}): _versions = versions;
  

 final  List<AppVersion> _versions;
 List<AppVersion> get versions {
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionLoaded&&const DeepCollectionEquality().equals(other._versions, _versions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_versions));

@override
String toString() {
  return 'VersionState.versionLoaded(versions: $versions)';
}


}

/// @nodoc
abstract mixin class $VersionLoadedCopyWith<$Res> implements $VersionStateCopyWith<$Res> {
  factory $VersionLoadedCopyWith(VersionLoaded value, $Res Function(VersionLoaded) _then) = _$VersionLoadedCopyWithImpl;
@useResult
$Res call({
 List<AppVersion> versions
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
@pragma('vm:prefer-inline') $Res call({Object? versions = null,}) {
  return _then(VersionLoaded(
versions: null == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as List<AppVersion>,
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
  return 'VersionState.versionError(message: $message)';
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
