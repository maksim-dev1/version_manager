// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationEvent {

 String get email; String get password;
/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationEventCopyWith<RegistrationEvent> get copyWith => _$RegistrationEventCopyWithImpl<RegistrationEvent>(this as RegistrationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'RegistrationEvent(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $RegistrationEventCopyWith<$Res>  {
  factory $RegistrationEventCopyWith(RegistrationEvent value, $Res Function(RegistrationEvent) _then) = _$RegistrationEventCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._self, this._then);

  final RegistrationEvent _self;
  final $Res Function(RegistrationEvent) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationEvent].
extension RegistrationEventPatterns on RegistrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Register value)?  register,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Register() when register != null:
return register(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Register value)  register,}){
final _that = this;
switch (_that) {
case _Register():
return register(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Register value)?  register,}){
final _that = this;
switch (_that) {
case _Register() when register != null:
return register(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  register,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Register() when register != null:
return register(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  register,}) {final _that = this;
switch (_that) {
case _Register():
return register(_that.email,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  register,}) {final _that = this;
switch (_that) {
case _Register() when register != null:
return register(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _Register implements RegistrationEvent {
  const _Register({required this.email, required this.password});
  

@override final  String email;
@override final  String password;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'RegistrationEvent.register(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Register(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RegistrationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationState()';
}


}

/// @nodoc
class $RegistrationStateCopyWith<$Res>  {
$RegistrationStateCopyWith(RegistrationState _, $Res Function(RegistrationState) __);
}


/// Adds pattern-matching-related methods to [RegistrationState].
extension RegistrationStatePatterns on RegistrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( RegistrationLoading value)?  registrationLoading,TResult Function( RegistrationSuccess value)?  registrationsuccess,TResult Function( RegistrationError value)?  registrationError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case RegistrationLoading() when registrationLoading != null:
return registrationLoading(_that);case RegistrationSuccess() when registrationsuccess != null:
return registrationsuccess(_that);case RegistrationError() when registrationError != null:
return registrationError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( RegistrationLoading value)  registrationLoading,required TResult Function( RegistrationSuccess value)  registrationsuccess,required TResult Function( RegistrationError value)  registrationError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case RegistrationLoading():
return registrationLoading(_that);case RegistrationSuccess():
return registrationsuccess(_that);case RegistrationError():
return registrationError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( RegistrationLoading value)?  registrationLoading,TResult? Function( RegistrationSuccess value)?  registrationsuccess,TResult? Function( RegistrationError value)?  registrationError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case RegistrationLoading() when registrationLoading != null:
return registrationLoading(_that);case RegistrationSuccess() when registrationsuccess != null:
return registrationsuccess(_that);case RegistrationError() when registrationError != null:
return registrationError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  registrationLoading,TResult Function( UserPublic user,  String accessToken,  String refreshToken)?  registrationsuccess,TResult Function( String message,  String? field)?  registrationError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case RegistrationLoading() when registrationLoading != null:
return registrationLoading();case RegistrationSuccess() when registrationsuccess != null:
return registrationsuccess(_that.user,_that.accessToken,_that.refreshToken);case RegistrationError() when registrationError != null:
return registrationError(_that.message,_that.field);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  registrationLoading,required TResult Function( UserPublic user,  String accessToken,  String refreshToken)  registrationsuccess,required TResult Function( String message,  String? field)  registrationError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case RegistrationLoading():
return registrationLoading();case RegistrationSuccess():
return registrationsuccess(_that.user,_that.accessToken,_that.refreshToken);case RegistrationError():
return registrationError(_that.message,_that.field);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  registrationLoading,TResult? Function( UserPublic user,  String accessToken,  String refreshToken)?  registrationsuccess,TResult? Function( String message,  String? field)?  registrationError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case RegistrationLoading() when registrationLoading != null:
return registrationLoading();case RegistrationSuccess() when registrationsuccess != null:
return registrationsuccess(_that.user,_that.accessToken,_that.refreshToken);case RegistrationError() when registrationError != null:
return registrationError(_that.message,_that.field);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RegistrationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationState.initial()';
}


}




/// @nodoc


class RegistrationLoading implements RegistrationState {
  const RegistrationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationState.registrationLoading()';
}


}




/// @nodoc


class RegistrationSuccess implements RegistrationState {
  const RegistrationSuccess({required this.user, required this.accessToken, required this.refreshToken});
  

 final  UserPublic user;
 final  String accessToken;
 final  String refreshToken;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationSuccessCopyWith<RegistrationSuccess> get copyWith => _$RegistrationSuccessCopyWithImpl<RegistrationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationSuccess&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken);

@override
String toString() {
  return 'RegistrationState.registrationsuccess(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RegistrationSuccessCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationSuccessCopyWith(RegistrationSuccess value, $Res Function(RegistrationSuccess) _then) = _$RegistrationSuccessCopyWithImpl;
@useResult
$Res call({
 UserPublic user, String accessToken, String refreshToken
});




}
/// @nodoc
class _$RegistrationSuccessCopyWithImpl<$Res>
    implements $RegistrationSuccessCopyWith<$Res> {
  _$RegistrationSuccessCopyWithImpl(this._self, this._then);

  final RegistrationSuccess _self;
  final $Res Function(RegistrationSuccess) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(RegistrationSuccess(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserPublic,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegistrationError implements RegistrationState {
  const RegistrationError({required this.message, this.field});
  

 final  String message;
 final  String? field;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationErrorCopyWith<RegistrationError> get copyWith => _$RegistrationErrorCopyWithImpl<RegistrationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationError&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode => Object.hash(runtimeType,message,field);

@override
String toString() {
  return 'RegistrationState.registrationError(message: $message, field: $field)';
}


}

/// @nodoc
abstract mixin class $RegistrationErrorCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationErrorCopyWith(RegistrationError value, $Res Function(RegistrationError) _then) = _$RegistrationErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? field
});




}
/// @nodoc
class _$RegistrationErrorCopyWithImpl<$Res>
    implements $RegistrationErrorCopyWith<$Res> {
  _$RegistrationErrorCopyWithImpl(this._self, this._then);

  final RegistrationError _self;
  final $Res Function(RegistrationError) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? field = freezed,}) {
  return _then(RegistrationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
