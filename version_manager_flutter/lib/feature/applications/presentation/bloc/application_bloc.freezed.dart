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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddAplication value)?  addAplication,TResult Function( _GetAllApplications value)?  getAllApplications,TResult Function( _EditApplication value)?  editApplication,TResult Function( _DeactivateApplication value)?  deactivateApplication,TResult Function( _DeleteApplication value)?  deleteApplication,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddAplication() when addAplication != null:
return addAplication(_that);case _GetAllApplications() when getAllApplications != null:
return getAllApplications(_that);case _EditApplication() when editApplication != null:
return editApplication(_that);case _DeactivateApplication() when deactivateApplication != null:
return deactivateApplication(_that);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddAplication value)  addAplication,required TResult Function( _GetAllApplications value)  getAllApplications,required TResult Function( _EditApplication value)  editApplication,required TResult Function( _DeactivateApplication value)  deactivateApplication,required TResult Function( _DeleteApplication value)  deleteApplication,}){
final _that = this;
switch (_that) {
case _AddAplication():
return addAplication(_that);case _GetAllApplications():
return getAllApplications(_that);case _EditApplication():
return editApplication(_that);case _DeactivateApplication():
return deactivateApplication(_that);case _DeleteApplication():
return deleteApplication(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddAplication value)?  addAplication,TResult? Function( _GetAllApplications value)?  getAllApplications,TResult? Function( _EditApplication value)?  editApplication,TResult? Function( _DeactivateApplication value)?  deactivateApplication,TResult? Function( _DeleteApplication value)?  deleteApplication,}){
final _that = this;
switch (_that) {
case _AddAplication() when addAplication != null:
return addAplication(_that);case _GetAllApplications() when getAllApplications != null:
return getAllApplications(_that);case _EditApplication() when editApplication != null:
return editApplication(_that);case _DeactivateApplication() when deactivateApplication != null:
return deactivateApplication(_that);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Application application)?  addAplication,TResult Function()?  getAllApplications,TResult Function( String changeablePackageName,  Application application)?  editApplication,TResult Function( String packageName,  bool isActive)?  deactivateApplication,TResult Function( String packageName)?  deleteApplication,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddAplication() when addAplication != null:
return addAplication(_that.application);case _GetAllApplications() when getAllApplications != null:
return getAllApplications();case _EditApplication() when editApplication != null:
return editApplication(_that.changeablePackageName,_that.application);case _DeactivateApplication() when deactivateApplication != null:
return deactivateApplication(_that.packageName,_that.isActive);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that.packageName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Application application)  addAplication,required TResult Function()  getAllApplications,required TResult Function( String changeablePackageName,  Application application)  editApplication,required TResult Function( String packageName,  bool isActive)  deactivateApplication,required TResult Function( String packageName)  deleteApplication,}) {final _that = this;
switch (_that) {
case _AddAplication():
return addAplication(_that.application);case _GetAllApplications():
return getAllApplications();case _EditApplication():
return editApplication(_that.changeablePackageName,_that.application);case _DeactivateApplication():
return deactivateApplication(_that.packageName,_that.isActive);case _DeleteApplication():
return deleteApplication(_that.packageName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Application application)?  addAplication,TResult? Function()?  getAllApplications,TResult? Function( String changeablePackageName,  Application application)?  editApplication,TResult? Function( String packageName,  bool isActive)?  deactivateApplication,TResult? Function( String packageName)?  deleteApplication,}) {final _that = this;
switch (_that) {
case _AddAplication() when addAplication != null:
return addAplication(_that.application);case _GetAllApplications() when getAllApplications != null:
return getAllApplications();case _EditApplication() when editApplication != null:
return editApplication(_that.changeablePackageName,_that.application);case _DeactivateApplication() when deactivateApplication != null:
return deactivateApplication(_that.packageName,_that.isActive);case _DeleteApplication() when deleteApplication != null:
return deleteApplication(_that.packageName);case _:
  return null;

}
}

}

/// @nodoc


class _AddAplication implements ApplicationEvent {
  const _AddAplication({required this.application});
  

 final  Application application;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddAplicationCopyWith<_AddAplication> get copyWith => __$AddAplicationCopyWithImpl<_AddAplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddAplication&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode => Object.hash(runtimeType,application);

@override
String toString() {
  return 'ApplicationEvent.addAplication(application: $application)';
}


}

/// @nodoc
abstract mixin class _$AddAplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$AddAplicationCopyWith(_AddAplication value, $Res Function(_AddAplication) _then) = __$AddAplicationCopyWithImpl;
@useResult
$Res call({
 Application application
});




}
/// @nodoc
class __$AddAplicationCopyWithImpl<$Res>
    implements _$AddAplicationCopyWith<$Res> {
  __$AddAplicationCopyWithImpl(this._self, this._then);

  final _AddAplication _self;
  final $Res Function(_AddAplication) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,}) {
  return _then(_AddAplication(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,
  ));
}


}

/// @nodoc


class _GetAllApplications implements ApplicationEvent {
  const _GetAllApplications();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllApplications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApplicationEvent.getAllApplications()';
}


}




/// @nodoc


class _EditApplication implements ApplicationEvent {
  const _EditApplication({required this.changeablePackageName, required this.application});
  

 final  String changeablePackageName;
 final  Application application;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditApplicationCopyWith<_EditApplication> get copyWith => __$EditApplicationCopyWithImpl<_EditApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditApplication&&(identical(other.changeablePackageName, changeablePackageName) || other.changeablePackageName == changeablePackageName)&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode => Object.hash(runtimeType,changeablePackageName,application);

@override
String toString() {
  return 'ApplicationEvent.editApplication(changeablePackageName: $changeablePackageName, application: $application)';
}


}

/// @nodoc
abstract mixin class _$EditApplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$EditApplicationCopyWith(_EditApplication value, $Res Function(_EditApplication) _then) = __$EditApplicationCopyWithImpl;
@useResult
$Res call({
 String changeablePackageName, Application application
});




}
/// @nodoc
class __$EditApplicationCopyWithImpl<$Res>
    implements _$EditApplicationCopyWith<$Res> {
  __$EditApplicationCopyWithImpl(this._self, this._then);

  final _EditApplication _self;
  final $Res Function(_EditApplication) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? changeablePackageName = null,Object? application = null,}) {
  return _then(_EditApplication(
changeablePackageName: null == changeablePackageName ? _self.changeablePackageName : changeablePackageName // ignore: cast_nullable_to_non_nullable
as String,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as Application,
  ));
}


}

/// @nodoc


class _DeactivateApplication implements ApplicationEvent {
  const _DeactivateApplication({required this.packageName, required this.isActive});
  

 final  String packageName;
 final  bool isActive;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeactivateApplicationCopyWith<_DeactivateApplication> get copyWith => __$DeactivateApplicationCopyWithImpl<_DeactivateApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeactivateApplication&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,isActive);

@override
String toString() {
  return 'ApplicationEvent.deactivateApplication(packageName: $packageName, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$DeactivateApplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$DeactivateApplicationCopyWith(_DeactivateApplication value, $Res Function(_DeactivateApplication) _then) = __$DeactivateApplicationCopyWithImpl;
@useResult
$Res call({
 String packageName, bool isActive
});




}
/// @nodoc
class __$DeactivateApplicationCopyWithImpl<$Res>
    implements _$DeactivateApplicationCopyWith<$Res> {
  __$DeactivateApplicationCopyWithImpl(this._self, this._then);

  final _DeactivateApplication _self;
  final $Res Function(_DeactivateApplication) _then;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? isActive = null,}) {
  return _then(_DeactivateApplication(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _DeleteApplication implements ApplicationEvent {
  const _DeleteApplication({required this.packageName});
  

 final  String packageName;

/// Create a copy of ApplicationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteApplicationCopyWith<_DeleteApplication> get copyWith => __$DeleteApplicationCopyWithImpl<_DeleteApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteApplication&&(identical(other.packageName, packageName) || other.packageName == packageName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName);

@override
String toString() {
  return 'ApplicationEvent.deleteApplication(packageName: $packageName)';
}


}

/// @nodoc
abstract mixin class _$DeleteApplicationCopyWith<$Res> implements $ApplicationEventCopyWith<$Res> {
  factory _$DeleteApplicationCopyWith(_DeleteApplication value, $Res Function(_DeleteApplication) _then) = __$DeleteApplicationCopyWithImpl;
@useResult
$Res call({
 String packageName
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
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,}) {
  return _then(_DeleteApplication(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Application> applications)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial();case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.applications);case ApplicationError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Application> applications)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ApplicationInitial():
return initial();case ApplicationLoading():
return loading();case ApplicationLoaded():
return loaded(_that.applications);case ApplicationError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Application> applications)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ApplicationInitial() when initial != null:
return initial();case ApplicationLoading() when loading != null:
return loading();case ApplicationLoaded() when loaded != null:
return loaded(_that.applications);case ApplicationError() when error != null:
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
  const ApplicationLoaded({required final  List<Application> applications}): _applications = applications;
  

 final  List<Application> _applications;
 List<Application> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}


/// Create a copy of ApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationLoadedCopyWith<ApplicationLoaded> get copyWith => _$ApplicationLoadedCopyWithImpl<ApplicationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationLoaded&&const DeepCollectionEquality().equals(other._applications, _applications));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_applications));

@override
String toString() {
  return 'ApplicationState.loaded(applications: $applications)';
}


}

/// @nodoc
abstract mixin class $ApplicationLoadedCopyWith<$Res> implements $ApplicationStateCopyWith<$Res> {
  factory $ApplicationLoadedCopyWith(ApplicationLoaded value, $Res Function(ApplicationLoaded) _then) = _$ApplicationLoadedCopyWithImpl;
@useResult
$Res call({
 List<Application> applications
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
@pragma('vm:prefer-inline') $Res call({Object? applications = null,}) {
  return _then(ApplicationLoaded(
applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<Application>,
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
