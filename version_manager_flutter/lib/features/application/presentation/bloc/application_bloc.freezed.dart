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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadApplications value)?  loadApplications,TResult Function( _UpdateApplication value)?  updateApplication,TResult Function( _DeleteApplication value)?  deleteApplication,TResult Function( _ToggleApplicationStatus value)?  toggleApplicationStatus,TResult Function( _TransferApplicationOwnership value)?  transferApplicationOwnership,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications(_that);case _UpdateApplication() when updateApplication != null:
return updateApplication(_that);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadApplications value)  loadApplications,required TResult Function( _UpdateApplication value)  updateApplication,required TResult Function( _DeleteApplication value)  deleteApplication,required TResult Function( _ToggleApplicationStatus value)  toggleApplicationStatus,required TResult Function( _TransferApplicationOwnership value)  transferApplicationOwnership,}){
final _that = this;
switch (_that) {
case _LoadApplications():
return loadApplications(_that);case _UpdateApplication():
return updateApplication(_that);case _DeleteApplication():
return deleteApplication(_that);case _ToggleApplicationStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadApplications value)?  loadApplications,TResult? Function( _UpdateApplication value)?  updateApplication,TResult? Function( _DeleteApplication value)?  deleteApplication,TResult? Function( _ToggleApplicationStatus value)?  toggleApplicationStatus,TResult? Function( _TransferApplicationOwnership value)?  transferApplicationOwnership,}){
final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications(_that);case _UpdateApplication() when updateApplication != null:
return updateApplication(_that);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadApplications,TResult Function( UuidValue applicationId,  String? name,  String? description,  String? iconUrl,  List<PlatformType>? platforms,  List<StoreLinkEntry>? storeLinks)?  updateApplication,TResult Function( UuidValue applicationId,  String confirmationName)?  deleteApplication,TResult Function( UuidValue applicationId,  bool isActive)?  toggleApplicationStatus,TResult Function( UuidValue applicationId,  OwnerType newOwnerType,  UuidValue? newTeamId)?  transferApplicationOwnership,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications();case _UpdateApplication() when updateApplication != null:
return updateApplication(_that.applicationId,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.storeLinks);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that.applicationId,_that.confirmationName);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadApplications,required TResult Function( UuidValue applicationId,  String? name,  String? description,  String? iconUrl,  List<PlatformType>? platforms,  List<StoreLinkEntry>? storeLinks)  updateApplication,required TResult Function( UuidValue applicationId,  String confirmationName)  deleteApplication,required TResult Function( UuidValue applicationId,  bool isActive)  toggleApplicationStatus,required TResult Function( UuidValue applicationId,  OwnerType newOwnerType,  UuidValue? newTeamId)  transferApplicationOwnership,}) {final _that = this;
switch (_that) {
case _LoadApplications():
return loadApplications();case _UpdateApplication():
return updateApplication(_that.applicationId,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.storeLinks);case _DeleteApplication():
return deleteApplication(_that.applicationId,_that.confirmationName);case _ToggleApplicationStatus():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadApplications,TResult? Function( UuidValue applicationId,  String? name,  String? description,  String? iconUrl,  List<PlatformType>? platforms,  List<StoreLinkEntry>? storeLinks)?  updateApplication,TResult? Function( UuidValue applicationId,  String confirmationName)?  deleteApplication,TResult? Function( UuidValue applicationId,  bool isActive)?  toggleApplicationStatus,TResult? Function( UuidValue applicationId,  OwnerType newOwnerType,  UuidValue? newTeamId)?  transferApplicationOwnership,}) {final _that = this;
switch (_that) {
case _LoadApplications() when loadApplications != null:
return loadApplications();case _UpdateApplication() when updateApplication != null:
return updateApplication(_that.applicationId,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.storeLinks);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that.applicationId,_that.confirmationName);case _ToggleApplicationStatus() when toggleApplicationStatus != null:
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplicationInitial value)?  initial,TResult Function( ApplicationLoading value)?  loading,TResult Function( ApplicationLoaded value)?  loaded,TResult Function( ApplicationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial(_that);case ApplicationLoading() when loading != null:
return loading(_that);case ApplicationLoaded() when loaded != null:
return loaded(_that);case ApplicationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplicationInitial value)  initial,required TResult Function( ApplicationLoading value)  loading,required TResult Function( ApplicationLoaded value)  loaded,required TResult Function( ApplicationError value)  error,}){
final _that = this;
switch (_that) {
case ApplicationInitial():
return initial(_that);case ApplicationLoading():
return loading(_that);case ApplicationLoaded():
return loaded(_that);case ApplicationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplicationInitial value)?  initial,TResult? Function( ApplicationLoading value)?  loading,TResult? Function( ApplicationLoaded value)?  loaded,TResult? Function( ApplicationError value)?  error,}){
final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial(_that);case ApplicationLoading() when loading != null:
return loading(_that);case ApplicationLoaded() when loaded != null:
return loaded(_that);case ApplicationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Application> applications,  List<Team> teams)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial();case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.applications,_that.teams);case ApplicationError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Application> applications,  List<Team> teams)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ApplicationInitial():
return initial();case ApplicationLoading():
return loading();case ApplicationLoaded():
return loaded(_that.applications,_that.teams);case ApplicationError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Application> applications,  List<Team> teams)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial();case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.applications,_that.teams);case ApplicationError() when error != null:
return error(_that.message);case _:
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

// dart format on
