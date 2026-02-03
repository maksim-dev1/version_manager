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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent()';
}


}

/// @nodoc
class $RegistrationEventCopyWith<$Res>  {
$RegistrationEventCopyWith(RegistrationEvent _, $Res Function(RegistrationEvent) __);
}



/// @nodoc


class _VerifyCode implements RegistrationEvent {
  const _VerifyCode({required this.email, required this.code});
  

 final  String email;
 final  String code;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyCodeCopyWith<_VerifyCode> get copyWith => __$VerifyCodeCopyWithImpl<_VerifyCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyCode&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,email,code);

@override
String toString() {
  return 'RegistrationEvent._verifyCode(email: $email, code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyCodeCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$VerifyCodeCopyWith(_VerifyCode value, $Res Function(_VerifyCode) _then) = __$VerifyCodeCopyWithImpl;
@useResult
$Res call({
 String email, String code
});




}
/// @nodoc
class __$VerifyCodeCopyWithImpl<$Res>
    implements _$VerifyCodeCopyWith<$Res> {
  __$VerifyCodeCopyWithImpl(this._self, this._then);

  final _VerifyCode _self;
  final $Res Function(_VerifyCode) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,}) {
  return _then(_VerifyCode(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResendCode implements RegistrationEvent {
  const _ResendCode({required this.email});
  

 final  String email;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendCodeCopyWith<_ResendCode> get copyWith => __$ResendCodeCopyWithImpl<_ResendCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendCode&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'RegistrationEvent._resendCode(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ResendCodeCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$ResendCodeCopyWith(_ResendCode value, $Res Function(_ResendCode) _then) = __$ResendCodeCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ResendCodeCopyWithImpl<$Res>
    implements _$ResendCodeCopyWith<$Res> {
  __$ResendCodeCopyWithImpl(this._self, this._then);

  final _ResendCode _self;
  final $Res Function(_ResendCode) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ResendCode(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Register implements RegistrationEvent {
  const _Register({required this.email, required this.code, required this.password});
  

 final  String email;
 final  String code;
 final  String password;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,code,password);

@override
String toString() {
  return 'RegistrationEvent._register(email: $email, code: $code, password: $password)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@useResult
$Res call({
 String email, String code, String password
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
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,Object? password = null,}) {
  return _then(_Register(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements RegistrationEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent._reset()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _RegistrationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _RegistrationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _RegistrationError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _RegistrationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _RegistrationError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _RegistrationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? email,  String? verifiedCode,  bool codeResent,  int? retryAfterSeconds)?  initial,TResult Function()?  loading,TResult Function( UserPublic user,  String accessToken,  String refreshToken)?  success,TResult Function( String message,  String? field,  String? email,  String? verifiedCode)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.email,_that.verifiedCode,_that.codeResent,_that.retryAfterSeconds);case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.user,_that.accessToken,_that.refreshToken);case _RegistrationError() when error != null:
return error(_that.message,_that.field,_that.email,_that.verifiedCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? email,  String? verifiedCode,  bool codeResent,  int? retryAfterSeconds)  initial,required TResult Function()  loading,required TResult Function( UserPublic user,  String accessToken,  String refreshToken)  success,required TResult Function( String message,  String? field,  String? email,  String? verifiedCode)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.email,_that.verifiedCode,_that.codeResent,_that.retryAfterSeconds);case _Loading():
return loading();case _Success():
return success(_that.user,_that.accessToken,_that.refreshToken);case _RegistrationError():
return error(_that.message,_that.field,_that.email,_that.verifiedCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? email,  String? verifiedCode,  bool codeResent,  int? retryAfterSeconds)?  initial,TResult? Function()?  loading,TResult? Function( UserPublic user,  String accessToken,  String refreshToken)?  success,TResult? Function( String message,  String? field,  String? email,  String? verifiedCode)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.email,_that.verifiedCode,_that.codeResent,_that.retryAfterSeconds);case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.user,_that.accessToken,_that.refreshToken);case _RegistrationError() when error != null:
return error(_that.message,_that.field,_that.email,_that.verifiedCode);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RegistrationState {
  const _Initial({this.email, this.verifiedCode, this.codeResent = false, this.retryAfterSeconds});
  

/// Email пользователя
 final  String? email;
/// Проверенный код (если код уже введён)
 final  String? verifiedCode;
/// Был ли код повторно отправлен
@JsonKey() final  bool codeResent;
/// Время ожидания при rate limit
 final  int? retryAfterSeconds;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.email, email) || other.email == email)&&(identical(other.verifiedCode, verifiedCode) || other.verifiedCode == verifiedCode)&&(identical(other.codeResent, codeResent) || other.codeResent == codeResent)&&(identical(other.retryAfterSeconds, retryAfterSeconds) || other.retryAfterSeconds == retryAfterSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,email,verifiedCode,codeResent,retryAfterSeconds);

@override
String toString() {
  return 'RegistrationState.initial(email: $email, verifiedCode: $verifiedCode, codeResent: $codeResent, retryAfterSeconds: $retryAfterSeconds)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@useResult
$Res call({
 String? email, String? verifiedCode, bool codeResent, int? retryAfterSeconds
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? verifiedCode = freezed,Object? codeResent = null,Object? retryAfterSeconds = freezed,}) {
  return _then(_Initial(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,verifiedCode: freezed == verifiedCode ? _self.verifiedCode : verifiedCode // ignore: cast_nullable_to_non_nullable
as String?,codeResent: null == codeResent ? _self.codeResent : codeResent // ignore: cast_nullable_to_non_nullable
as bool,retryAfterSeconds: freezed == retryAfterSeconds ? _self.retryAfterSeconds : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _Loading implements RegistrationState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationState.loading()';
}


}




/// @nodoc


class _Success implements RegistrationState {
  const _Success({required this.user, required this.accessToken, required this.refreshToken});
  

 final  UserPublic user;
 final  String accessToken;
 final  String refreshToken;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken);

@override
String toString() {
  return 'RegistrationState.success(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 UserPublic user, String accessToken, String refreshToken
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_Success(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserPublic,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RegistrationError implements RegistrationState {
  const _RegistrationError({required this.message, this.field, this.email, this.verifiedCode});
  

 final  String message;
 final  String? field;
/// Предыдущие данные для восстановления состояния
 final  String? email;
 final  String? verifiedCode;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationErrorCopyWith<_RegistrationError> get copyWith => __$RegistrationErrorCopyWithImpl<_RegistrationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationError&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field)&&(identical(other.email, email) || other.email == email)&&(identical(other.verifiedCode, verifiedCode) || other.verifiedCode == verifiedCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,field,email,verifiedCode);

@override
String toString() {
  return 'RegistrationState.error(message: $message, field: $field, email: $email, verifiedCode: $verifiedCode)';
}


}

/// @nodoc
abstract mixin class _$RegistrationErrorCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory _$RegistrationErrorCopyWith(_RegistrationError value, $Res Function(_RegistrationError) _then) = __$RegistrationErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? field, String? email, String? verifiedCode
});




}
/// @nodoc
class __$RegistrationErrorCopyWithImpl<$Res>
    implements _$RegistrationErrorCopyWith<$Res> {
  __$RegistrationErrorCopyWithImpl(this._self, this._then);

  final _RegistrationError _self;
  final $Res Function(_RegistrationError) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? field = freezed,Object? email = freezed,Object? verifiedCode = freezed,}) {
  return _then(_RegistrationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,verifiedCode: freezed == verifiedCode ? _self.verifiedCode : verifiedCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
