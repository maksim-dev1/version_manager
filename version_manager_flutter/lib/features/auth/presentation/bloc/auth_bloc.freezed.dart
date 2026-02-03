// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckAuth value)?  checkAuth,TResult Function( _CheckEmail value)?  checkEmail,TResult Function( _RefreshTokens value)?  refreshTokens,TResult Function( _Logout value)?  logout,TResult Function( _LogoutAll value)?  logoutAll,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckAuth() when checkAuth != null:
return checkAuth(_that);case _CheckEmail() when checkEmail != null:
return checkEmail(_that);case _RefreshTokens() when refreshTokens != null:
return refreshTokens(_that);case _Logout() when logout != null:
return logout(_that);case _LogoutAll() when logoutAll != null:
return logoutAll(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckAuth value)  checkAuth,required TResult Function( _CheckEmail value)  checkEmail,required TResult Function( _RefreshTokens value)  refreshTokens,required TResult Function( _Logout value)  logout,required TResult Function( _LogoutAll value)  logoutAll,}){
final _that = this;
switch (_that) {
case _CheckAuth():
return checkAuth(_that);case _CheckEmail():
return checkEmail(_that);case _RefreshTokens():
return refreshTokens(_that);case _Logout():
return logout(_that);case _LogoutAll():
return logoutAll(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckAuth value)?  checkAuth,TResult? Function( _CheckEmail value)?  checkEmail,TResult? Function( _RefreshTokens value)?  refreshTokens,TResult? Function( _Logout value)?  logout,TResult? Function( _LogoutAll value)?  logoutAll,}){
final _that = this;
switch (_that) {
case _CheckAuth() when checkAuth != null:
return checkAuth(_that);case _CheckEmail() when checkEmail != null:
return checkEmail(_that);case _RefreshTokens() when refreshTokens != null:
return refreshTokens(_that);case _Logout() when logout != null:
return logout(_that);case _LogoutAll() when logoutAll != null:
return logoutAll(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuth,TResult Function( String email)?  checkEmail,TResult Function( String refreshToken)?  refreshTokens,TResult Function( String accessToken)?  logout,TResult Function( String accessToken)?  logoutAll,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckAuth() when checkAuth != null:
return checkAuth();case _CheckEmail() when checkEmail != null:
return checkEmail(_that.email);case _RefreshTokens() when refreshTokens != null:
return refreshTokens(_that.refreshToken);case _Logout() when logout != null:
return logout(_that.accessToken);case _LogoutAll() when logoutAll != null:
return logoutAll(_that.accessToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuth,required TResult Function( String email)  checkEmail,required TResult Function( String refreshToken)  refreshTokens,required TResult Function( String accessToken)  logout,required TResult Function( String accessToken)  logoutAll,}) {final _that = this;
switch (_that) {
case _CheckAuth():
return checkAuth();case _CheckEmail():
return checkEmail(_that.email);case _RefreshTokens():
return refreshTokens(_that.refreshToken);case _Logout():
return logout(_that.accessToken);case _LogoutAll():
return logoutAll(_that.accessToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuth,TResult? Function( String email)?  checkEmail,TResult? Function( String refreshToken)?  refreshTokens,TResult? Function( String accessToken)?  logout,TResult? Function( String accessToken)?  logoutAll,}) {final _that = this;
switch (_that) {
case _CheckAuth() when checkAuth != null:
return checkAuth();case _CheckEmail() when checkEmail != null:
return checkEmail(_that.email);case _RefreshTokens() when refreshTokens != null:
return refreshTokens(_that.refreshToken);case _Logout() when logout != null:
return logout(_that.accessToken);case _LogoutAll() when logoutAll != null:
return logoutAll(_that.accessToken);case _:
  return null;

}
}

}

/// @nodoc


class _CheckAuth implements AuthEvent {
  const _CheckAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuth()';
}


}




/// @nodoc


class _CheckEmail implements AuthEvent {
  const _CheckEmail({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckEmailCopyWith<_CheckEmail> get copyWith => __$CheckEmailCopyWithImpl<_CheckEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmail&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.checkEmail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$CheckEmailCopyWith(_CheckEmail value, $Res Function(_CheckEmail) _then) = __$CheckEmailCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$CheckEmailCopyWithImpl<$Res>
    implements _$CheckEmailCopyWith<$Res> {
  __$CheckEmailCopyWithImpl(this._self, this._then);

  final _CheckEmail _self;
  final $Res Function(_CheckEmail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_CheckEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RefreshTokens implements AuthEvent {
  const _RefreshTokens({required this.refreshToken});
  

 final  String refreshToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokensCopyWith<_RefreshTokens> get copyWith => __$RefreshTokensCopyWithImpl<_RefreshTokens>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokens&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'AuthEvent.refreshTokens(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokensCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RefreshTokensCopyWith(_RefreshTokens value, $Res Function(_RefreshTokens) _then) = __$RefreshTokensCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class __$RefreshTokensCopyWithImpl<$Res>
    implements _$RefreshTokensCopyWith<$Res> {
  __$RefreshTokensCopyWithImpl(this._self, this._then);

  final _RefreshTokens _self;
  final $Res Function(_RefreshTokens) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_RefreshTokens(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Logout implements AuthEvent {
  const _Logout({required this.accessToken});
  

 final  String accessToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutCopyWith<_Logout> get copyWith => __$LogoutCopyWithImpl<_Logout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken);

@override
String toString() {
  return 'AuthEvent.logout(accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$LogoutCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LogoutCopyWith(_Logout value, $Res Function(_Logout) _then) = __$LogoutCopyWithImpl;
@useResult
$Res call({
 String accessToken
});




}
/// @nodoc
class __$LogoutCopyWithImpl<$Res>
    implements _$LogoutCopyWith<$Res> {
  __$LogoutCopyWithImpl(this._self, this._then);

  final _Logout _self;
  final $Res Function(_Logout) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accessToken = null,}) {
  return _then(_Logout(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LogoutAll implements AuthEvent {
  const _LogoutAll({required this.accessToken});
  

 final  String accessToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutAllCopyWith<_LogoutAll> get copyWith => __$LogoutAllCopyWithImpl<_LogoutAll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutAll&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken);

@override
String toString() {
  return 'AuthEvent.logoutAll(accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$LogoutAllCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LogoutAllCopyWith(_LogoutAll value, $Res Function(_LogoutAll) _then) = __$LogoutAllCopyWithImpl;
@useResult
$Res call({
 String accessToken
});




}
/// @nodoc
class __$LogoutAllCopyWithImpl<$Res>
    implements _$LogoutAllCopyWith<$Res> {
  __$LogoutAllCopyWithImpl(this._self, this._then);

  final _LogoutAll _self;
  final $Res Function(_LogoutAll) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accessToken = null,}) {
  return _then(_LogoutAll(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Authenticated value)?  authenticated,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _EmailChecked value)?  emailChecked,TResult Function( _AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _EmailChecked() when emailChecked != null:
return emailChecked(_that);case _AuthError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _EmailChecked value)  emailChecked,required TResult Function( _AuthError value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Authenticated():
return authenticated(_that);case _Unauthenticated():
return unauthenticated(_that);case _EmailChecked():
return emailChecked(_that);case _AuthError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _EmailChecked value)?  emailChecked,TResult? Function( _AuthError value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _EmailChecked() when emailChecked != null:
return emailChecked(_that);case _AuthError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( UserPublic user,  String accessToken,  String refreshToken)?  authenticated,TResult Function()?  unauthenticated,TResult Function( String email,  bool emailExists,  bool codeSent,  int? retryAfterSeconds)?  emailChecked,TResult Function( String message,  String? field)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user,_that.accessToken,_that.refreshToken);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _EmailChecked() when emailChecked != null:
return emailChecked(_that.email,_that.emailExists,_that.codeSent,_that.retryAfterSeconds);case _AuthError() when error != null:
return error(_that.message,_that.field);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( UserPublic user,  String accessToken,  String refreshToken)  authenticated,required TResult Function()  unauthenticated,required TResult Function( String email,  bool emailExists,  bool codeSent,  int? retryAfterSeconds)  emailChecked,required TResult Function( String message,  String? field)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Authenticated():
return authenticated(_that.user,_that.accessToken,_that.refreshToken);case _Unauthenticated():
return unauthenticated();case _EmailChecked():
return emailChecked(_that.email,_that.emailExists,_that.codeSent,_that.retryAfterSeconds);case _AuthError():
return error(_that.message,_that.field);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( UserPublic user,  String accessToken,  String refreshToken)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( String email,  bool emailExists,  bool codeSent,  int? retryAfterSeconds)?  emailChecked,TResult? Function( String message,  String? field)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user,_that.accessToken,_that.refreshToken);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _EmailChecked() when emailChecked != null:
return emailChecked(_that.email,_that.emailExists,_that.codeSent,_that.retryAfterSeconds);case _AuthError() when error != null:
return error(_that.message,_that.field);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _Authenticated implements AuthState {
  const _Authenticated({required this.user, required this.accessToken, required this.refreshToken});
  

 final  UserPublic user;
 final  String accessToken;
 final  String refreshToken;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedCopyWith<_Authenticated> get copyWith => __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken);

@override
String toString() {
  return 'AuthState.authenticated(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(_Authenticated value, $Res Function(_Authenticated) _then) = __$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 UserPublic user, String accessToken, String refreshToken
});




}
/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_Authenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserPublic,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unauthenticated implements AuthState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class _EmailChecked implements AuthState {
  const _EmailChecked({required this.email, required this.emailExists, this.codeSent = false, this.retryAfterSeconds});
  

 final  String email;
 final  bool emailExists;
/// Был ли отправлен код верификации (при регистрации, когда emailExists = false)
@JsonKey() final  bool codeSent;
/// Время ожидания при rate limit
 final  int? retryAfterSeconds;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailCheckedCopyWith<_EmailChecked> get copyWith => __$EmailCheckedCopyWithImpl<_EmailChecked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailChecked&&(identical(other.email, email) || other.email == email)&&(identical(other.emailExists, emailExists) || other.emailExists == emailExists)&&(identical(other.codeSent, codeSent) || other.codeSent == codeSent)&&(identical(other.retryAfterSeconds, retryAfterSeconds) || other.retryAfterSeconds == retryAfterSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailExists,codeSent,retryAfterSeconds);

@override
String toString() {
  return 'AuthState.emailChecked(email: $email, emailExists: $emailExists, codeSent: $codeSent, retryAfterSeconds: $retryAfterSeconds)';
}


}

/// @nodoc
abstract mixin class _$EmailCheckedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$EmailCheckedCopyWith(_EmailChecked value, $Res Function(_EmailChecked) _then) = __$EmailCheckedCopyWithImpl;
@useResult
$Res call({
 String email, bool emailExists, bool codeSent, int? retryAfterSeconds
});




}
/// @nodoc
class __$EmailCheckedCopyWithImpl<$Res>
    implements _$EmailCheckedCopyWith<$Res> {
  __$EmailCheckedCopyWithImpl(this._self, this._then);

  final _EmailChecked _self;
  final $Res Function(_EmailChecked) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? emailExists = null,Object? codeSent = null,Object? retryAfterSeconds = freezed,}) {
  return _then(_EmailChecked(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailExists: null == emailExists ? _self.emailExists : emailExists // ignore: cast_nullable_to_non_nullable
as bool,codeSent: null == codeSent ? _self.codeSent : codeSent // ignore: cast_nullable_to_non_nullable
as bool,retryAfterSeconds: freezed == retryAfterSeconds ? _self.retryAfterSeconds : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _AuthError implements AuthState {
  const _AuthError({required this.message, this.field});
  

 final  String message;
 final  String? field;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthErrorCopyWith<_AuthError> get copyWith => __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthError&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode => Object.hash(runtimeType,message,field);

@override
String toString() {
  return 'AuthState.error(message: $message, field: $field)';
}


}

/// @nodoc
abstract mixin class _$AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthErrorCopyWith(_AuthError value, $Res Function(_AuthError) _then) = __$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? field
});




}
/// @nodoc
class __$AuthErrorCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(this._self, this._then);

  final _AuthError _self;
  final $Res Function(_AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? field = freezed,}) {
  return _then(_AuthError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
