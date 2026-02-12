// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_application_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateApplicationEvent {

 String get namespace; String get name; String? get description; String? get iconUrl; List<PlatformType> get platforms; OwnerType get ownerType; UuidValue? get teamId; List<StoreLinkEntry>? get storeLinks;
/// Create a copy of CreateApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateApplicationEventCopyWith<CreateApplicationEvent> get copyWith => _$CreateApplicationEventCopyWithImpl<CreateApplicationEvent>(this as CreateApplicationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApplicationEvent&&(identical(other.namespace, namespace) || other.namespace == namespace)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other.platforms, platforms)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&const DeepCollectionEquality().equals(other.storeLinks, storeLinks));
}


@override
int get hashCode => Object.hash(runtimeType,namespace,name,description,iconUrl,const DeepCollectionEquality().hash(platforms),ownerType,teamId,const DeepCollectionEquality().hash(storeLinks));

@override
String toString() {
  return 'CreateApplicationEvent(namespace: $namespace, name: $name, description: $description, iconUrl: $iconUrl, platforms: $platforms, ownerType: $ownerType, teamId: $teamId, storeLinks: $storeLinks)';
}


}

/// @nodoc
abstract mixin class $CreateApplicationEventCopyWith<$Res>  {
  factory $CreateApplicationEventCopyWith(CreateApplicationEvent value, $Res Function(CreateApplicationEvent) _then) = _$CreateApplicationEventCopyWithImpl;
@useResult
$Res call({
 String namespace, String name, String? description, String? iconUrl, List<PlatformType> platforms, OwnerType ownerType, UuidValue? teamId, List<StoreLinkEntry>? storeLinks
});




}
/// @nodoc
class _$CreateApplicationEventCopyWithImpl<$Res>
    implements $CreateApplicationEventCopyWith<$Res> {
  _$CreateApplicationEventCopyWithImpl(this._self, this._then);

  final CreateApplicationEvent _self;
  final $Res Function(CreateApplicationEvent) _then;

/// Create a copy of CreateApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? namespace = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,Object? platforms = null,Object? ownerType = null,Object? teamId = freezed,Object? storeLinks = freezed,}) {
  return _then(_self.copyWith(
namespace: null == namespace ? _self.namespace : namespace // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformType>,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as OwnerType,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue?,storeLinks: freezed == storeLinks ? _self.storeLinks : storeLinks // ignore: cast_nullable_to_non_nullable
as List<StoreLinkEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateApplicationEvent].
extension CreateApplicationEventPatterns on CreateApplicationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String namespace,  String name,  String? description,  String? iconUrl,  List<PlatformType> platforms,  OwnerType ownerType,  UuidValue? teamId,  List<StoreLinkEntry>? storeLinks)?  create,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.namespace,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.ownerType,_that.teamId,_that.storeLinks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String namespace,  String name,  String? description,  String? iconUrl,  List<PlatformType> platforms,  OwnerType ownerType,  UuidValue? teamId,  List<StoreLinkEntry>? storeLinks)  create,}) {final _that = this;
switch (_that) {
case _Create():
return create(_that.namespace,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.ownerType,_that.teamId,_that.storeLinks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String namespace,  String name,  String? description,  String? iconUrl,  List<PlatformType> platforms,  OwnerType ownerType,  UuidValue? teamId,  List<StoreLinkEntry>? storeLinks)?  create,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.namespace,_that.name,_that.description,_that.iconUrl,_that.platforms,_that.ownerType,_that.teamId,_that.storeLinks);case _:
  return null;

}
}

}

/// @nodoc


class _Create implements CreateApplicationEvent {
  const _Create({required this.namespace, required this.name, this.description, this.iconUrl, required final  List<PlatformType> platforms, required this.ownerType, this.teamId, final  List<StoreLinkEntry>? storeLinks}): _platforms = platforms,_storeLinks = storeLinks;
  

@override final  String namespace;
@override final  String name;
@override final  String? description;
@override final  String? iconUrl;
 final  List<PlatformType> _platforms;
@override List<PlatformType> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

@override final  OwnerType ownerType;
@override final  UuidValue? teamId;
 final  List<StoreLinkEntry>? _storeLinks;
@override List<StoreLinkEntry>? get storeLinks {
  final value = _storeLinks;
  if (value == null) return null;
  if (_storeLinks is EqualUnmodifiableListView) return _storeLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.namespace, namespace) || other.namespace == namespace)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&const DeepCollectionEquality().equals(other._storeLinks, _storeLinks));
}


@override
int get hashCode => Object.hash(runtimeType,namespace,name,description,iconUrl,const DeepCollectionEquality().hash(_platforms),ownerType,teamId,const DeepCollectionEquality().hash(_storeLinks));

@override
String toString() {
  return 'CreateApplicationEvent.create(namespace: $namespace, name: $name, description: $description, iconUrl: $iconUrl, platforms: $platforms, ownerType: $ownerType, teamId: $teamId, storeLinks: $storeLinks)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $CreateApplicationEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@override @useResult
$Res call({
 String namespace, String name, String? description, String? iconUrl, List<PlatformType> platforms, OwnerType ownerType, UuidValue? teamId, List<StoreLinkEntry>? storeLinks
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of CreateApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? namespace = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,Object? platforms = null,Object? ownerType = null,Object? teamId = freezed,Object? storeLinks = freezed,}) {
  return _then(_Create(
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
mixin _$CreateApplicationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApplicationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateApplicationState()';
}


}

/// @nodoc
class $CreateApplicationStateCopyWith<$Res>  {
$CreateApplicationStateCopyWith(CreateApplicationState _, $Res Function(CreateApplicationState) __);
}


/// Adds pattern-matching-related methods to [CreateApplicationState].
extension CreateApplicationStatePatterns on CreateApplicationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateApplicationInitial value)?  initial,TResult Function( CreateApplicationLoading value)?  loading,TResult Function( CreateApplicationSuccess value)?  success,TResult Function( CreateApplicationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateApplicationInitial() when initial != null:
return initial(_that);case CreateApplicationLoading() when loading != null:
return loading(_that);case CreateApplicationSuccess() when success != null:
return success(_that);case CreateApplicationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateApplicationInitial value)  initial,required TResult Function( CreateApplicationLoading value)  loading,required TResult Function( CreateApplicationSuccess value)  success,required TResult Function( CreateApplicationError value)  error,}){
final _that = this;
switch (_that) {
case CreateApplicationInitial():
return initial(_that);case CreateApplicationLoading():
return loading(_that);case CreateApplicationSuccess():
return success(_that);case CreateApplicationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateApplicationInitial value)?  initial,TResult? Function( CreateApplicationLoading value)?  loading,TResult? Function( CreateApplicationSuccess value)?  success,TResult? Function( CreateApplicationError value)?  error,}){
final _that = this;
switch (_that) {
case CreateApplicationInitial() when initial != null:
return initial(_that);case CreateApplicationLoading() when loading != null:
return loading(_that);case CreateApplicationSuccess() when success != null:
return success(_that);case CreateApplicationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Application application,  String apiKey)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateApplicationInitial() when initial != null:
return initial();case CreateApplicationLoading() when loading != null:
return loading();case CreateApplicationSuccess() when success != null:
return success(_that.application,_that.apiKey);case CreateApplicationError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Application application,  String apiKey)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CreateApplicationInitial():
return initial();case CreateApplicationLoading():
return loading();case CreateApplicationSuccess():
return success(_that.application,_that.apiKey);case CreateApplicationError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Application application,  String apiKey)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CreateApplicationInitial() when initial != null:
return initial();case CreateApplicationLoading() when loading != null:
return loading();case CreateApplicationSuccess() when success != null:
return success(_that.application,_that.apiKey);case CreateApplicationError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CreateApplicationInitial implements CreateApplicationState {
  const CreateApplicationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApplicationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateApplicationState.initial()';
}


}




/// @nodoc


class CreateApplicationLoading implements CreateApplicationState {
  const CreateApplicationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApplicationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateApplicationState.loading()';
}


}




/// @nodoc


class CreateApplicationSuccess implements CreateApplicationState {
  const CreateApplicationSuccess({required this.application, required this.apiKey});
  

 final  Application application;
 final  String apiKey;

/// Create a copy of CreateApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateApplicationSuccessCopyWith<CreateApplicationSuccess> get copyWith => _$CreateApplicationSuccessCopyWithImpl<CreateApplicationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApplicationSuccess&&(identical(other.application, application) || other.application == application)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey));
}


@override
int get hashCode => Object.hash(runtimeType,application,apiKey);

@override
String toString() {
  return 'CreateApplicationState.success(application: $application, apiKey: $apiKey)';
}


}

/// @nodoc
abstract mixin class $CreateApplicationSuccessCopyWith<$Res> implements $CreateApplicationStateCopyWith<$Res> {
  factory $CreateApplicationSuccessCopyWith(CreateApplicationSuccess value, $Res Function(CreateApplicationSuccess) _then) = _$CreateApplicationSuccessCopyWithImpl;
@useResult
$Res call({
 Application application, String apiKey
});




}
/// @nodoc
class _$CreateApplicationSuccessCopyWithImpl<$Res>
    implements $CreateApplicationSuccessCopyWith<$Res> {
  _$CreateApplicationSuccessCopyWithImpl(this._self, this._then);

  final CreateApplicationSuccess _self;
  final $Res Function(CreateApplicationSuccess) _then;

/// Create a copy of CreateApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,Object? apiKey = null,}) {
  return _then(CreateApplicationSuccess(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateApplicationError implements CreateApplicationState {
  const CreateApplicationError({required this.message});
  

 final  String message;

/// Create a copy of CreateApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateApplicationErrorCopyWith<CreateApplicationError> get copyWith => _$CreateApplicationErrorCopyWithImpl<CreateApplicationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateApplicationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateApplicationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateApplicationErrorCopyWith<$Res> implements $CreateApplicationStateCopyWith<$Res> {
  factory $CreateApplicationErrorCopyWith(CreateApplicationError value, $Res Function(CreateApplicationError) _then) = _$CreateApplicationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateApplicationErrorCopyWithImpl<$Res>
    implements $CreateApplicationErrorCopyWith<$Res> {
  _$CreateApplicationErrorCopyWithImpl(this._self, this._then);

  final CreateApplicationError _self;
  final $Res Function(CreateApplicationError) _then;

/// Create a copy of CreateApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateApplicationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
