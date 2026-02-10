// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApplicationEvent()';
}


}

/// @nodoc
class $ApplicationEventCopyWith<$Res>  {
$ApplicationEventCopyWith(ApplicationEvent _, $Res Function(ApplicationEvent) __);
}


/// Adds pattern-matching-related methods to [ApplicationEvent].
extension ApplicationEventPatterns on ApplicationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadApplications value)?  loadApplications,TResult Function( _CreateApplication value)?  createApplication,TResult Function( _UpdateApplication value)?  updateApplication,TResult Function( _DeleteApplication value)?  deleteApplication,TResult Function( _RequestApiKeyRegeneration value)?  requestApiKeyRegeneration,TResult Function( _FetchRegenerationEmail value)?  fetchRegenerationEmail,TResult Function( _RegenerateApiKey value)?  regenerateApiKey,TResult Function( _ToggleApplicationStatus value)?  toggleApplicationStatus,TResult Function( _TransferApplicationOwnership value)?  transferApplicationOwnership,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications(_that);case _CreateApplication() when createApplication != null:
return createApplication(_that);case _UpdateApplication() when updateApplication != null:
return updateApplication(_that);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that);case _RequestApiKeyRegeneration() when requestApiKeyRegeneration != null:
return requestApiKeyRegeneration(_that);case _FetchRegenerationEmail() when fetchRegenerationEmail != null:
return fetchRegenerationEmail(_that);case _RegenerateApiKey() when regenerateApiKey != null:
return regenerateApiKey(_that);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
return toggleApplicationStatus(_that);case _TransferApplicationOwnership() when transferApplicationOwnership != null:
return transferApplicationOwnership(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadApplications value)  loadApplications,required TResult Function( _CreateApplication value)  createApplication,required TResult Function( _UpdateApplication value)  updateApplication,required TResult Function( _DeleteApplication value)  deleteApplication,required TResult Function( _RequestApiKeyRegeneration value)  requestApiKeyRegeneration,required TResult Function( _FetchRegenerationEmail value)  fetchRegenerationEmail,required TResult Function( _RegenerateApiKey value)  regenerateApiKey,required TResult Function( _ToggleApplicationStatus value)  toggleApplicationStatus,required TResult Function( _TransferApplicationOwnership value)  transferApplicationOwnership,}){
final _that = this;
switch (_that) {
case _LoadApplications():
return loadApplications(_that);case _CreateApplication():
return createApplication(_that);case _UpdateApplication():
return updateApplication(_that);case _DeleteApplication():
return deleteApplication(_that);case _RequestApiKeyRegeneration():
return requestApiKeyRegeneration(_that);case _FetchRegenerationEmail():
return fetchRegenerationEmail(_that);case _RegenerateApiKey():
return regenerateApiKey(_that);case _ToggleApplicationStatus():
return toggleApplicationStatus(_that);case _TransferApplicationOwnership():
return transferApplicationOwnership(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadApplications value)?  loadApplications,TResult? Function( _CreateApplication value)?  createApplication,TResult? Function( _UpdateApplication value)?  updateApplication,TResult? Function( _DeleteApplication value)?  deleteApplication,TResult? Function( _RequestApiKeyRegeneration value)?  requestApiKeyRegeneration,TResult? Function( _FetchRegenerationEmail value)?  fetchRegenerationEmail,TResult? Function( _RegenerateApiKey value)?  regenerateApiKey,TResult? Function( _ToggleApplicationStatus value)?  toggleApplicationStatus,TResult? Function( _TransferApplicationOwnership value)?  transferApplicationOwnership,}){
final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications(_that);case _CreateApplication() when createApplication != null:
return createApplication(_that);case _UpdateApplication() when updateApplication != null:
return updateApplication(_that);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that);case _RequestApiKeyRegeneration() when requestApiKeyRegeneration != null:
return requestApiKeyRegeneration(_that);case _FetchRegenerationEmail() when fetchRegenerationEmail != null:
return fetchRegenerationEmail(_that);case _RegenerateApiKey() when regenerateApiKey != null:
return regenerateApiKey(_that);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
return toggleApplicationStatus(_that);case _TransferApplicationOwnership() when transferApplicationOwnership != null:
return transferApplicationOwnership(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadApplications,TResult Function( String namespace,  String name,  String? description,  String? iconUrl,  List<PlatformType> platforms,  OwnerType ownerType,  UuidValue? teamId,  List<StoreLinkEntry>? storeLinks)?  createApplication,TResult Function( UuidValue applicationId,  String? name,  String? description,  String? iconUrl,  List<PlatformType>? platforms,  List<StoreLinkEntry>? storeLinks)?  updateApplication,TResult Function( UuidValue applicationId,  String confirmationName)?  deleteApplication,TResult Function( UuidValue applicationId)?  requestApiKeyRegeneration,TResult Function( UuidValue applicationId)?  fetchRegenerationEmail,TResult Function( UuidValue applicationId,  String code)?  regenerateApiKey,TResult Function( UuidValue applicationId,  bool isActive)?  toggleApplicationStatus,TResult Function( UuidValue applicationId,  OwnerType newOwnerType,  UuidValue? newTeamId)?  transferApplicationOwnership,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications();case _CreateApplication() when createApplication != null:
return createApplication(_that.namespace,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.ownerType,_that.teamId,_that.storeLinks);case _UpdateApplication() when updateApplication != null:
return updateApplication(_that.applicationId,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.storeLinks);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that.applicationId,_that.confirmationName);case _RequestApiKeyRegeneration() when requestApiKeyRegeneration != null:
return requestApiKeyRegeneration(_that.applicationId);case _FetchRegenerationEmail() when fetchRegenerationEmail != null:
return fetchRegenerationEmail(_that.applicationId);case _RegenerateApiKey() when regenerateApiKey != null:
return regenerateApiKey(_that.applicationId,_that.code);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
return toggleApplicationStatus(_that.applicationId,_that.isActive);case _TransferApplicationOwnership() when transferApplicationOwnership != null:
return transferApplicationOwnership(_that.applicationId,_that.newOwnerType,_that.newTeamId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadApplications,required TResult Function( String namespace,  String name,  String? description,  String? iconUrl,  List<PlatformType> platforms,  OwnerType ownerType,  UuidValue? teamId,  List<StoreLinkEntry>? storeLinks)  createApplication,required TResult Function( UuidValue applicationId,  String? name,  String? description,  String? iconUrl,  List<PlatformType>? platforms,  List<StoreLinkEntry>? storeLinks)  updateApplication,required TResult Function( UuidValue applicationId,  String confirmationName)  deleteApplication,required TResult Function( UuidValue applicationId)  requestApiKeyRegeneration,required TResult Function( UuidValue applicationId)  fetchRegenerationEmail,required TResult Function( UuidValue applicationId,  String code)  regenerateApiKey,required TResult Function( UuidValue applicationId,  bool isActive)  toggleApplicationStatus,required TResult Function( UuidValue applicationId,  OwnerType newOwnerType,  UuidValue? newTeamId)  transferApplicationOwnership,}) {final _that = this;
switch (_that) {
case _LoadApplications():
return loadApplications();case _CreateApplication():
return createApplication(_that.namespace,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.ownerType,_that.teamId,_that.storeLinks);case _UpdateApplication():
return updateApplication(_that.applicationId,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.storeLinks);case _DeleteApplication():
return deleteApplication(_that.applicationId,_that.confirmationName);case _RequestApiKeyRegeneration():
return requestApiKeyRegeneration(_that.applicationId);case _FetchRegenerationEmail():
return fetchRegenerationEmail(_that.applicationId);case _RegenerateApiKey():
return regenerateApiKey(_that.applicationId,_that.code);case _ToggleApplicationStatus():
return toggleApplicationStatus(_that.applicationId,_that.isActive);case _TransferApplicationOwnership():
return transferApplicationOwnership(_that.applicationId,_that.newOwnerType,_that.newTeamId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadApplications,TResult? Function( String namespace,  String name,  String? description,  String? iconUrl,  List<PlatformType> platforms,  OwnerType ownerType,  UuidValue? teamId,  List<StoreLinkEntry>? storeLinks)?  createApplication,TResult? Function( UuidValue applicationId,  String? name,  String? description,  String? iconUrl,  List<PlatformType>? platforms,  List<StoreLinkEntry>? storeLinks)?  updateApplication,TResult? Function( UuidValue applicationId,  String confirmationName)?  deleteApplication,TResult? Function( UuidValue applicationId)?  requestApiKeyRegeneration,TResult? Function( UuidValue applicationId)?  fetchRegenerationEmail,TResult? Function( UuidValue applicationId,  String code)?  regenerateApiKey,TResult? Function( UuidValue applicationId,  bool isActive)?  toggleApplicationStatus,TResult? Function( UuidValue applicationId,  OwnerType newOwnerType,  UuidValue? newTeamId)?  transferApplicationOwnership,}) {final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications();case _CreateApplication() when createApplication != null:
return createApplication(_that.namespace,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.ownerType,_that.teamId,_that.storeLinks);case _UpdateApplication() when updateApplication != null:
return updateApplication(_that.applicationId,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.storeLinks);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that.applicationId,_that.confirmationName);case _RequestApiKeyRegeneration() when requestApiKeyRegeneration != null:
return requestApiKeyRegeneration(_that.applicationId);case _FetchRegenerationEmail() when fetchRegenerationEmail != null:
return fetchRegenerationEmail(_that.applicationId);case _RegenerateApiKey() when regenerateApiKey != null:
return regenerateApiKey(_that.applicationId,_that.code);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
return toggleApplicationStatus(_that.applicationId,_that.isActive);case _TransferApplicationOwnership() when transferApplicationOwnership != null:
return transferApplicationOwnership(_that.applicationId,_that.newOwnerType,_that.newTeamId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadApplications implements ApplicationEvent {
  const _LoadApplications();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadApplications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApplicationEvent.loadApplications()';
}


}




/// @nodoc


class _CreateApplication implements ApplicationEvent {
  const _CreateApplication({required this.namespace, required this.name, this.description, this.iconUrl, required final  List<PlatformType> platforms, required this.ownerType, this.teamId, final  List<StoreLinkEntry>? storeLinks}): _platforms = platforms,_storeLinks = storeLinks;
  

 final  String namespace;
 final  String name;
 final  String? description;
 final  String? iconUrl;
 final  List<PlatformType> _platforms;
 List<PlatformType> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

 final  OwnerType ownerType;
 final  UuidValue? teamId;
 final  List<StoreLinkEntry>? _storeLinks;
 List<StoreLinkEntry>? get storeLinks {
  final value = _storeLinks;
  if (value == null) return null;
  if (_storeLinks is EqualUnmodifiableListView) return _storeLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateApplicationCopyWith<_CreateApplication> get copyWith => __$CreateApplicationCopyWithImpl<_CreateApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateApplication&&(identical(other.namespace, namespace) || other.namespace == namespace)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&const DeepCollectionEquality().equals(other._storeLinks, _storeLinks));
}


@override
int get hashCode => Object.hash(runtimeType,namespace,name,description,iconUrl,const DeepCollectionEquality().hash(_platforms),ownerType,teamId,const DeepCollectionEquality().hash(_storeLinks));

@override
String toString() {
  return 'ApplicationEvent.createApplication(namespace: $namespace, name: $name, description: $description, iconUrl: $iconUrl, platforms: $platforms, ownerType: $ownerType, teamId: $teamId, storeLinks: $storeLinks)';
}


}

/// @nodoc
abstract mixin class _$CreateApplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$CreateApplicationCopyWith(_CreateApplication value, $Res Function(_CreateApplication) _then) = __$CreateApplicationCopyWithImpl;
@useResult
$Res call({
 String namespace, String name, String? description, String? iconUrl, List<PlatformType> platforms, OwnerType ownerType, UuidValue? teamId, List<StoreLinkEntry>? storeLinks
});




}
/// @nodoc
class __$CreateApplicationCopyWithImpl<$Res>
    implements _$CreateApplicationCopyWith<$Res> {
  __$CreateApplicationCopyWithImpl(this._self, this._then);

  final _CreateApplication _self;
  final $Res Function(_CreateApplication) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? namespace = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,Object? platforms = null,Object? ownerType = null,Object? teamId = freezed,Object? storeLinks = freezed,}) {
  return _then(_CreateApplication(
namespace: null == namespace ? _self.namespace : namespace // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformType>,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as OwnerType,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue?,storeLinks: freezed == storeLinks ? _self._storeLinks : storeLinks // ignore: cast_nullable_to_non_nullable
as List<StoreLinkEntry>?,
  ));
}


}

/// @nodoc


class _UpdateApplication implements ApplicationEvent {
  const _UpdateApplication({required this.applicationId, this.name, this.description, this.iconUrl, final  List<PlatformType>? platforms, final  List<StoreLinkEntry>? storeLinks}): _platforms = platforms,_storeLinks = storeLinks;
  

 final  UuidValue applicationId;
 final  String? name;
 final  String? description;
 final  String? iconUrl;
 final  List<PlatformType>? _platforms;
 List<PlatformType>? get platforms {
  final value = _platforms;
  if (value == null) return null;
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<StoreLinkEntry>? _storeLinks;
 List<StoreLinkEntry>? get storeLinks {
  final value = _storeLinks;
  if (value == null) return null;
  if (_storeLinks is EqualUnmodifiableListView) return _storeLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateApplicationCopyWith<_UpdateApplication> get copyWith => __$UpdateApplicationCopyWithImpl<_UpdateApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateApplication&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&const DeepCollectionEquality().equals(other._storeLinks, _storeLinks));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,name,description,iconUrl,const DeepCollectionEquality().hash(_platforms),const DeepCollectionEquality().hash(_storeLinks));

@override
String toString() {
  return 'ApplicationEvent.updateApplication(applicationId: $applicationId, name: $name, description: $description, iconUrl: $iconUrl, platforms: $platforms, storeLinks: $storeLinks)';
}


}

/// @nodoc
abstract mixin class _$UpdateApplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$UpdateApplicationCopyWith(_UpdateApplication value, $Res Function(_UpdateApplication) _then) = __$UpdateApplicationCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, String? name, String? description, String? iconUrl, List<PlatformType>? platforms, List<StoreLinkEntry>? storeLinks
});




}
/// @nodoc
class __$UpdateApplicationCopyWithImpl<$Res>
    implements _$UpdateApplicationCopyWith<$Res> {
  __$UpdateApplicationCopyWithImpl(this._self, this._then);

  final _UpdateApplication _self;
  final $Res Function(_UpdateApplication) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? name = freezed,Object? description = freezed,Object? iconUrl = freezed,Object? platforms = freezed,Object? storeLinks = freezed,}) {
  return _then(_UpdateApplication(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,platforms: freezed == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformType>?,storeLinks: freezed == storeLinks ? _self._storeLinks : storeLinks // ignore: cast_nullable_to_non_nullable
as List<StoreLinkEntry>?,
  ));
}


}

/// @nodoc


class _DeleteApplication implements ApplicationEvent {
  const _DeleteApplication({required this.applicationId, required this.confirmationName});
  

 final  UuidValue applicationId;
 final  String confirmationName;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteApplicationCopyWith<_DeleteApplication> get copyWith => __$DeleteApplicationCopyWithImpl<_DeleteApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteApplication&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.confirmationName, confirmationName) || other.confirmationName == confirmationName));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,confirmationName);

@override
String toString() {
  return 'ApplicationEvent.deleteApplication(applicationId: $applicationId, confirmationName: $confirmationName)';
}


}

/// @nodoc
abstract mixin class _$DeleteApplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$DeleteApplicationCopyWith(_DeleteApplication value, $Res Function(_DeleteApplication) _then) = __$DeleteApplicationCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, String confirmationName
});




}
/// @nodoc
class __$DeleteApplicationCopyWithImpl<$Res>
    implements _$DeleteApplicationCopyWith<$Res> {
  __$DeleteApplicationCopyWithImpl(this._self, this._then);

  final _DeleteApplication _self;
  final $Res Function(_DeleteApplication) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? confirmationName = null,}) {
  return _then(_DeleteApplication(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,confirmationName: null == confirmationName ? _self.confirmationName : confirmationName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RequestApiKeyRegeneration implements ApplicationEvent {
  const _RequestApiKeyRegeneration({required this.applicationId});
  

 final  UuidValue applicationId;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestApiKeyRegenerationCopyWith<_RequestApiKeyRegeneration> get copyWith => __$RequestApiKeyRegenerationCopyWithImpl<_RequestApiKeyRegeneration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestApiKeyRegeneration&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'ApplicationEvent.requestApiKeyRegeneration(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class _$RequestApiKeyRegenerationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$RequestApiKeyRegenerationCopyWith(_RequestApiKeyRegeneration value, $Res Function(_RequestApiKeyRegeneration) _then) = __$RequestApiKeyRegenerationCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class __$RequestApiKeyRegenerationCopyWithImpl<$Res>
    implements _$RequestApiKeyRegenerationCopyWith<$Res> {
  __$RequestApiKeyRegenerationCopyWithImpl(this._self, this._then);

  final _RequestApiKeyRegeneration _self;
  final $Res Function(_RequestApiKeyRegeneration) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,}) {
  return _then(_RequestApiKeyRegeneration(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _FetchRegenerationEmail implements ApplicationEvent {
  const _FetchRegenerationEmail({required this.applicationId});
  

 final  UuidValue applicationId;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchRegenerationEmailCopyWith<_FetchRegenerationEmail> get copyWith => __$FetchRegenerationEmailCopyWithImpl<_FetchRegenerationEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRegenerationEmail&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'ApplicationEvent.fetchRegenerationEmail(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class _$FetchRegenerationEmailCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$FetchRegenerationEmailCopyWith(_FetchRegenerationEmail value, $Res Function(_FetchRegenerationEmail) _then) = __$FetchRegenerationEmailCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class __$FetchRegenerationEmailCopyWithImpl<$Res>
    implements _$FetchRegenerationEmailCopyWith<$Res> {
  __$FetchRegenerationEmailCopyWithImpl(this._self, this._then);

  final _FetchRegenerationEmail _self;
  final $Res Function(_FetchRegenerationEmail) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,}) {
  return _then(_FetchRegenerationEmail(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _RegenerateApiKey implements ApplicationEvent {
  const _RegenerateApiKey({required this.applicationId, required this.code});
  

 final  UuidValue applicationId;
 final  String code;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegenerateApiKeyCopyWith<_RegenerateApiKey> get copyWith => __$RegenerateApiKeyCopyWithImpl<_RegenerateApiKey>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegenerateApiKey&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,code);

@override
String toString() {
  return 'ApplicationEvent.regenerateApiKey(applicationId: $applicationId, code: $code)';
}


}

/// @nodoc
abstract mixin class _$RegenerateApiKeyCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$RegenerateApiKeyCopyWith(_RegenerateApiKey value, $Res Function(_RegenerateApiKey) _then) = __$RegenerateApiKeyCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, String code
});




}
/// @nodoc
class __$RegenerateApiKeyCopyWithImpl<$Res>
    implements _$RegenerateApiKeyCopyWith<$Res> {
  __$RegenerateApiKeyCopyWithImpl(this._self, this._then);

  final _RegenerateApiKey _self;
  final $Res Function(_RegenerateApiKey) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? code = null,}) {
  return _then(_RegenerateApiKey(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleApplicationStatus implements ApplicationEvent {
  const _ToggleApplicationStatus({required this.applicationId, required this.isActive});
  

 final  UuidValue applicationId;
 final  bool isActive;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleApplicationStatusCopyWith<_ToggleApplicationStatus> get copyWith => __$ToggleApplicationStatusCopyWithImpl<_ToggleApplicationStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleApplicationStatus&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,isActive);

@override
String toString() {
  return 'ApplicationEvent.toggleApplicationStatus(applicationId: $applicationId, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ToggleApplicationStatusCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$ToggleApplicationStatusCopyWith(_ToggleApplicationStatus value, $Res Function(_ToggleApplicationStatus) _then) = __$ToggleApplicationStatusCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, bool isActive
});




}
/// @nodoc
class __$ToggleApplicationStatusCopyWithImpl<$Res>
    implements _$ToggleApplicationStatusCopyWith<$Res> {
  __$ToggleApplicationStatusCopyWithImpl(this._self, this._then);

  final _ToggleApplicationStatus _self;
  final $Res Function(_ToggleApplicationStatus) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? isActive = null,}) {
  return _then(_ToggleApplicationStatus(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _TransferApplicationOwnership implements ApplicationEvent {
  const _TransferApplicationOwnership({required this.applicationId, required this.newOwnerType, this.newTeamId});
  

 final  UuidValue applicationId;
 final  OwnerType newOwnerType;
 final  UuidValue? newTeamId;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferApplicationOwnershipCopyWith<_TransferApplicationOwnership> get copyWith => __$TransferApplicationOwnershipCopyWithImpl<_TransferApplicationOwnership>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferApplicationOwnership&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.newOwnerType, newOwnerType) || other.newOwnerType == newOwnerType)&&(identical(other.newTeamId, newTeamId) || other.newTeamId == newTeamId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,newOwnerType,newTeamId);

@override
String toString() {
  return 'ApplicationEvent.transferApplicationOwnership(applicationId: $applicationId, newOwnerType: $newOwnerType, newTeamId: $newTeamId)';
}


}

/// @nodoc
abstract mixin class _$TransferApplicationOwnershipCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$TransferApplicationOwnershipCopyWith(_TransferApplicationOwnership value, $Res Function(_TransferApplicationOwnership) _then) = __$TransferApplicationOwnershipCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId, OwnerType newOwnerType, UuidValue? newTeamId
});




}
/// @nodoc
class __$TransferApplicationOwnershipCopyWithImpl<$Res>
    implements _$TransferApplicationOwnershipCopyWith<$Res> {
  __$TransferApplicationOwnershipCopyWithImpl(this._self, this._then);

  final _TransferApplicationOwnership _self;
  final $Res Function(_TransferApplicationOwnership) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? newOwnerType = null,Object? newTeamId = freezed,}) {
  return _then(_TransferApplicationOwnership(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,newOwnerType: null == newOwnerType ? _self.newOwnerType : newOwnerType // ignore: cast_nullable_to_non_nullable
as OwnerType,newTeamId: freezed == newTeamId ? _self.newTeamId : newTeamId // ignore: cast_nullable_to_non_nullable
as UuidValue?,
  ));
}


}

/// @nodoc
mixin _$ApplicationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApplicationState()';
}


}

/// @nodoc
class $ApplicationStateCopyWith<$Res>  {
$ApplicationStateCopyWith(ApplicationState _, $Res Function(ApplicationState) __);
}


/// Adds pattern-matching-related methods to [ApplicationState].
extension ApplicationStatePatterns on ApplicationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplicationInitial value)?  initial,TResult Function( ApplicationLoading value)?  loading,TResult Function( ApplicationLoaded value)?  loaded,TResult Function( ApplicationError value)?  error,TResult Function( ApplicationCreated value)?  created,TResult Function( ApplicationApiKeyRegenerationCodeSent value)?  apiKeyRegenerationCodeSent,TResult Function( ApplicationRegenerationEmailLoaded value)?  regenerationEmailLoaded,TResult Function( ApplicationApiKeyRegenerated value)?  apiKeyRegenerated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial(_that);case ApplicationLoading() when loading != null:
return loading(_that);case ApplicationLoaded() when loaded != null:
return loaded(_that);case ApplicationError() when error != null:
return error(_that);case ApplicationCreated() when created != null:
return created(_that);case ApplicationApiKeyRegenerationCodeSent() when apiKeyRegenerationCodeSent != null:
return apiKeyRegenerationCodeSent(_that);case ApplicationRegenerationEmailLoaded() when regenerationEmailLoaded != null:
return regenerationEmailLoaded(_that);case ApplicationApiKeyRegenerated() when apiKeyRegenerated != null:
return apiKeyRegenerated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplicationInitial value)  initial,required TResult Function( ApplicationLoading value)  loading,required TResult Function( ApplicationLoaded value)  loaded,required TResult Function( ApplicationError value)  error,required TResult Function( ApplicationCreated value)  created,required TResult Function( ApplicationApiKeyRegenerationCodeSent value)  apiKeyRegenerationCodeSent,required TResult Function( ApplicationRegenerationEmailLoaded value)  regenerationEmailLoaded,required TResult Function( ApplicationApiKeyRegenerated value)  apiKeyRegenerated,}){
final _that = this;
switch (_that) {
case ApplicationInitial():
return initial(_that);case ApplicationLoading():
return loading(_that);case ApplicationLoaded():
return loaded(_that);case ApplicationError():
return error(_that);case ApplicationCreated():
return created(_that);case ApplicationApiKeyRegenerationCodeSent():
return apiKeyRegenerationCodeSent(_that);case ApplicationRegenerationEmailLoaded():
return regenerationEmailLoaded(_that);case ApplicationApiKeyRegenerated():
return apiKeyRegenerated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplicationInitial value)?  initial,TResult? Function( ApplicationLoading value)?  loading,TResult? Function( ApplicationLoaded value)?  loaded,TResult? Function( ApplicationError value)?  error,TResult? Function( ApplicationCreated value)?  created,TResult? Function( ApplicationApiKeyRegenerationCodeSent value)?  apiKeyRegenerationCodeSent,TResult? Function( ApplicationRegenerationEmailLoaded value)?  regenerationEmailLoaded,TResult? Function( ApplicationApiKeyRegenerated value)?  apiKeyRegenerated,}){
final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial(_that);case ApplicationLoading() when loading != null:
return loading(_that);case ApplicationLoaded() when loaded != null:
return loaded(_that);case ApplicationError() when error != null:
return error(_that);case ApplicationCreated() when created != null:
return created(_that);case ApplicationApiKeyRegenerationCodeSent() when apiKeyRegenerationCodeSent != null:
return apiKeyRegenerationCodeSent(_that);case ApplicationRegenerationEmailLoaded() when regenerationEmailLoaded != null:
return regenerationEmailLoaded(_that);case ApplicationApiKeyRegenerated() when apiKeyRegenerated != null:
return apiKeyRegenerated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Application> applications,  List<Team> teams)?  loaded,TResult Function( String message)?  error,TResult Function( Application application,  String apiKey)?  created,TResult Function( int? retryAfterSeconds,  String? maskedEmail)?  apiKeyRegenerationCodeSent,TResult Function( String maskedEmail)?  regenerationEmailLoaded,TResult Function( String apiKey,  DateTime regeneratedAt)?  apiKeyRegenerated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial();case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.applications,_that.teams);case ApplicationError() when error != null:
return error(_that.message);case ApplicationCreated() when created != null:
return created(_that.application,_that.apiKey);case ApplicationApiKeyRegenerationCodeSent() when apiKeyRegenerationCodeSent != null:
return apiKeyRegenerationCodeSent(_that.retryAfterSeconds,_that.maskedEmail);case ApplicationRegenerationEmailLoaded() when regenerationEmailLoaded != null:
return regenerationEmailLoaded(_that.maskedEmail);case ApplicationApiKeyRegenerated() when apiKeyRegenerated != null:
return apiKeyRegenerated(_that.apiKey,_that.regeneratedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Application> applications,  List<Team> teams)  loaded,required TResult Function( String message)  error,required TResult Function( Application application,  String apiKey)  created,required TResult Function( int? retryAfterSeconds,  String? maskedEmail)  apiKeyRegenerationCodeSent,required TResult Function( String maskedEmail)  regenerationEmailLoaded,required TResult Function( String apiKey,  DateTime regeneratedAt)  apiKeyRegenerated,}) {final _that = this;
switch (_that) {
case ApplicationInitial():
return initial();case ApplicationLoading():
return loading();case ApplicationLoaded():
return loaded(_that.applications,_that.teams);case ApplicationError():
return error(_that.message);case ApplicationCreated():
return created(_that.application,_that.apiKey);case ApplicationApiKeyRegenerationCodeSent():
return apiKeyRegenerationCodeSent(_that.retryAfterSeconds,_that.maskedEmail);case ApplicationRegenerationEmailLoaded():
return regenerationEmailLoaded(_that.maskedEmail);case ApplicationApiKeyRegenerated():
return apiKeyRegenerated(_that.apiKey,_that.regeneratedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Application> applications,  List<Team> teams)?  loaded,TResult? Function( String message)?  error,TResult? Function( Application application,  String apiKey)?  created,TResult? Function( int? retryAfterSeconds,  String? maskedEmail)?  apiKeyRegenerationCodeSent,TResult? Function( String maskedEmail)?  regenerationEmailLoaded,TResult? Function( String apiKey,  DateTime regeneratedAt)?  apiKeyRegenerated,}) {final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial();case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.applications,_that.teams);case ApplicationError() when error != null:
return error(_that.message);case ApplicationCreated() when created != null:
return created(_that.application,_that.apiKey);case ApplicationApiKeyRegenerationCodeSent() when apiKeyRegenerationCodeSent != null:
return apiKeyRegenerationCodeSent(_that.retryAfterSeconds,_that.maskedEmail);case ApplicationRegenerationEmailLoaded() when regenerationEmailLoaded != null:
return regenerationEmailLoaded(_that.maskedEmail);case ApplicationApiKeyRegenerated() when apiKeyRegenerated != null:
return apiKeyRegenerated(_that.apiKey,_that.regeneratedAt);case _:
  return null;

}
}

}

/// @nodoc


class ApplicationInitial implements ApplicationState {
  const ApplicationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApplicationState.initial()';
}


}




/// @nodoc


class ApplicationLoading implements ApplicationState {
  const ApplicationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApplicationState.loading()';
}


}




/// @nodoc


class ApplicationLoaded implements ApplicationState {
  const ApplicationLoaded({required final  List<Application> applications, required final  List<Team> teams}): _applications = applications,_teams = teams;
  

 final  List<Application> _applications;
 List<Application> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

 final  List<Team> _teams;
 List<Team> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}


/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationLoadedCopyWith<ApplicationLoaded> get copyWith => _$ApplicationLoadedCopyWithImpl<ApplicationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoaded&&const DeepCollectionEquality().equals(other._applications, _applications)&&const DeepCollectionEquality().equals(other._teams, _teams));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_applications),const DeepCollectionEquality().hash(_teams));

@override
String toString() {
  return 'ApplicationState.loaded(applications: $applications, teams: $teams)';
}


}

/// @nodoc
abstract mixin class $ApplicationLoadedCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationLoadedCopyWith(ApplicationLoaded value, $Res Function(ApplicationLoaded) _then) = _$ApplicationLoadedCopyWithImpl;
@useResult
$Res call({
 List<Application> applications, List<Team> teams
});




}
/// @nodoc
class _$ApplicationLoadedCopyWithImpl<$Res>
    implements $ApplicationLoadedCopyWith<$Res> {
  _$ApplicationLoadedCopyWithImpl(this._self, this._then);

  final ApplicationLoaded _self;
  final $Res Function(ApplicationLoaded) _then;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applications = null,Object? teams = null,}) {
  return _then(ApplicationLoaded(
applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<Application>,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<Team>,
  ));
}


}

/// @nodoc


class ApplicationError implements ApplicationState {
  const ApplicationError({required this.message});
  

 final  String message;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationErrorCopyWith<ApplicationError> get copyWith => _$ApplicationErrorCopyWithImpl<ApplicationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApplicationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ApplicationErrorCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationErrorCopyWith(ApplicationError value, $Res Function(ApplicationError) _then) = _$ApplicationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ApplicationErrorCopyWithImpl<$Res>
    implements $ApplicationErrorCopyWith<$Res> {
  _$ApplicationErrorCopyWithImpl(this._self, this._then);

  final ApplicationError _self;
  final $Res Function(ApplicationError) _then;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ApplicationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ApplicationCreated implements ApplicationState {
  const ApplicationCreated({required this.application, required this.apiKey});
  

 final  Application application;
 final  String apiKey;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationCreatedCopyWith<ApplicationCreated> get copyWith => _$ApplicationCreatedCopyWithImpl<ApplicationCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationCreated&&(identical(other.application, application) || other.application == application)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey));
}


@override
int get hashCode => Object.hash(runtimeType,application,apiKey);

@override
String toString() {
  return 'ApplicationState.created(application: $application, apiKey: $apiKey)';
}


}

/// @nodoc
abstract mixin class $ApplicationCreatedCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationCreatedCopyWith(ApplicationCreated value, $Res Function(ApplicationCreated) _then) = _$ApplicationCreatedCopyWithImpl;
@useResult
$Res call({
 Application application, String apiKey
});




}
/// @nodoc
class _$ApplicationCreatedCopyWithImpl<$Res>
    implements $ApplicationCreatedCopyWith<$Res> {
  _$ApplicationCreatedCopyWithImpl(this._self, this._then);

  final ApplicationCreated _self;
  final $Res Function(ApplicationCreated) _then;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,Object? apiKey = null,}) {
  return _then(ApplicationCreated(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ApplicationApiKeyRegenerationCodeSent implements ApplicationState {
  const ApplicationApiKeyRegenerationCodeSent({this.retryAfterSeconds, this.maskedEmail});
  

 final  int? retryAfterSeconds;
 final  String? maskedEmail;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationApiKeyRegenerationCodeSentCopyWith<ApplicationApiKeyRegenerationCodeSent> get copyWith => _$ApplicationApiKeyRegenerationCodeSentCopyWithImpl<ApplicationApiKeyRegenerationCodeSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationApiKeyRegenerationCodeSent&&(identical(other.retryAfterSeconds, retryAfterSeconds) || other.retryAfterSeconds == retryAfterSeconds)&&(identical(other.maskedEmail, maskedEmail) || other.maskedEmail == maskedEmail));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfterSeconds,maskedEmail);

@override
String toString() {
  return 'ApplicationState.apiKeyRegenerationCodeSent(retryAfterSeconds: $retryAfterSeconds, maskedEmail: $maskedEmail)';
}


}

/// @nodoc
abstract mixin class $ApplicationApiKeyRegenerationCodeSentCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationApiKeyRegenerationCodeSentCopyWith(ApplicationApiKeyRegenerationCodeSent value, $Res Function(ApplicationApiKeyRegenerationCodeSent) _then) = _$ApplicationApiKeyRegenerationCodeSentCopyWithImpl;
@useResult
$Res call({
 int? retryAfterSeconds, String? maskedEmail
});




}
/// @nodoc
class _$ApplicationApiKeyRegenerationCodeSentCopyWithImpl<$Res>
    implements $ApplicationApiKeyRegenerationCodeSentCopyWith<$Res> {
  _$ApplicationApiKeyRegenerationCodeSentCopyWithImpl(this._self, this._then);

  final ApplicationApiKeyRegenerationCodeSent _self;
  final $Res Function(ApplicationApiKeyRegenerationCodeSent) _then;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? retryAfterSeconds = freezed,Object? maskedEmail = freezed,}) {
  return _then(ApplicationApiKeyRegenerationCodeSent(
retryAfterSeconds: freezed == retryAfterSeconds ? _self.retryAfterSeconds : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,maskedEmail: freezed == maskedEmail ? _self.maskedEmail : maskedEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ApplicationRegenerationEmailLoaded implements ApplicationState {
  const ApplicationRegenerationEmailLoaded({required this.maskedEmail});
  

 final  String maskedEmail;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationRegenerationEmailLoadedCopyWith<ApplicationRegenerationEmailLoaded> get copyWith => _$ApplicationRegenerationEmailLoadedCopyWithImpl<ApplicationRegenerationEmailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationRegenerationEmailLoaded&&(identical(other.maskedEmail, maskedEmail) || other.maskedEmail == maskedEmail));
}


@override
int get hashCode => Object.hash(runtimeType,maskedEmail);

@override
String toString() {
  return 'ApplicationState.regenerationEmailLoaded(maskedEmail: $maskedEmail)';
}


}

/// @nodoc
abstract mixin class $ApplicationRegenerationEmailLoadedCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationRegenerationEmailLoadedCopyWith(ApplicationRegenerationEmailLoaded value, $Res Function(ApplicationRegenerationEmailLoaded) _then) = _$ApplicationRegenerationEmailLoadedCopyWithImpl;
@useResult
$Res call({
 String maskedEmail
});




}
/// @nodoc
class _$ApplicationRegenerationEmailLoadedCopyWithImpl<$Res>
    implements $ApplicationRegenerationEmailLoadedCopyWith<$Res> {
  _$ApplicationRegenerationEmailLoadedCopyWithImpl(this._self, this._then);

  final ApplicationRegenerationEmailLoaded _self;
  final $Res Function(ApplicationRegenerationEmailLoaded) _then;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maskedEmail = null,}) {
  return _then(ApplicationRegenerationEmailLoaded(
maskedEmail: null == maskedEmail ? _self.maskedEmail : maskedEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ApplicationApiKeyRegenerated implements ApplicationState {
  const ApplicationApiKeyRegenerated({required this.apiKey, required this.regeneratedAt});
  

 final  String apiKey;
 final  DateTime regeneratedAt;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationApiKeyRegeneratedCopyWith<ApplicationApiKeyRegenerated> get copyWith => _$ApplicationApiKeyRegeneratedCopyWithImpl<ApplicationApiKeyRegenerated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationApiKeyRegenerated&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.regeneratedAt, regeneratedAt) || other.regeneratedAt == regeneratedAt));
}


@override
int get hashCode => Object.hash(runtimeType,apiKey,regeneratedAt);

@override
String toString() {
  return 'ApplicationState.apiKeyRegenerated(apiKey: $apiKey, regeneratedAt: $regeneratedAt)';
}


}

/// @nodoc
abstract mixin class $ApplicationApiKeyRegeneratedCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationApiKeyRegeneratedCopyWith(ApplicationApiKeyRegenerated value, $Res Function(ApplicationApiKeyRegenerated) _then) = _$ApplicationApiKeyRegeneratedCopyWithImpl;
@useResult
$Res call({
 String apiKey, DateTime regeneratedAt
});




}
/// @nodoc
class _$ApplicationApiKeyRegeneratedCopyWithImpl<$Res>
    implements $ApplicationApiKeyRegeneratedCopyWith<$Res> {
  _$ApplicationApiKeyRegeneratedCopyWithImpl(this._self, this._then);

  final ApplicationApiKeyRegenerated _self;
  final $Res Function(ApplicationApiKeyRegenerated) _then;

/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiKey = null,Object? regeneratedAt = null,}) {
  return _then(ApplicationApiKeyRegenerated(
apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,regeneratedAt: null == regeneratedAt ? _self.regeneratedAt : regeneratedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
