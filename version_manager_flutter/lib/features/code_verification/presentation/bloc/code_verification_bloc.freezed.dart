// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CodeVerificationEvent {

 String get email;
/// Create a copy of CodeVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodeVerificationEventCopyWith<CodeVerificationEvent> get copyWith => _$CodeVerificationEventCopyWithImpl<CodeVerificationEvent>(this as CodeVerificationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeVerificationEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'CodeVerificationEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $CodeVerificationEventCopyWith<$Res>  {
  factory $CodeVerificationEventCopyWith(CodeVerificationEvent value, $Res Function(CodeVerificationEvent) _then) = _$CodeVerificationEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$CodeVerificationEventCopyWithImpl<$Res>
    implements $CodeVerificationEventCopyWith<$Res> {
  _$CodeVerificationEventCopyWithImpl(this._self, this._then);

  final CodeVerificationEvent _self;
  final $Res Function(CodeVerificationEvent) _then;

/// Create a copy of CodeVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CodeVerificationEvent].
extension CodeVerificationEventPatterns on CodeVerificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VerifyCode value)?  verifyCode,TResult Function( _ResendCode value)?  resendCode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyCode() when verifyCode != null:
return verifyCode(_that);case _ResendCode() when resendCode != null:
return resendCode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VerifyCode value)  verifyCode,required TResult Function( _ResendCode value)  resendCode,}){
final _that = this;
switch (_that) {
case _VerifyCode():
return verifyCode(_that);case _ResendCode():
return resendCode(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VerifyCode value)?  verifyCode,TResult? Function( _ResendCode value)?  resendCode,}){
final _that = this;
switch (_that) {
case _VerifyCode() when verifyCode != null:
return verifyCode(_that);case _ResendCode() when resendCode != null:
return resendCode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String code)?  verifyCode,TResult Function( String email)?  resendCode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyCode() when verifyCode != null:
return verifyCode(_that.email,_that.code);case _ResendCode() when resendCode != null:
return resendCode(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String code)  verifyCode,required TResult Function( String email)  resendCode,}) {final _that = this;
switch (_that) {
case _VerifyCode():
return verifyCode(_that.email,_that.code);case _ResendCode():
return resendCode(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String code)?  verifyCode,TResult? Function( String email)?  resendCode,}) {final _that = this;
switch (_that) {
case _VerifyCode() when verifyCode != null:
return verifyCode(_that.email,_that.code);case _ResendCode() when resendCode != null:
return resendCode(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyCode implements CodeVerificationEvent {
  const _VerifyCode({required this.email, required this.code});
  

@override final  String email;
 final  String code;

/// Create a copy of CodeVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'CodeVerificationEvent.verifyCode(email: $email, code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyCodeCopyWith<$Res> implements $CodeVerificationEventCopyWith<$Res> {
  factory _$VerifyCodeCopyWith(_VerifyCode value, $Res Function(_VerifyCode) _then) = __$VerifyCodeCopyWithImpl;
@override @useResult
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

/// Create a copy of CodeVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,}) {
  return _then(_VerifyCode(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResendCode implements CodeVerificationEvent {
  const _ResendCode({required this.email});
  

@override final  String email;

/// Create a copy of CodeVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'CodeVerificationEvent.resendCode(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ResendCodeCopyWith<$Res> implements $CodeVerificationEventCopyWith<$Res> {
  factory _$ResendCodeCopyWith(_ResendCode value, $Res Function(_ResendCode) _then) = __$ResendCodeCopyWithImpl;
@override @useResult
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

/// Create a copy of CodeVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ResendCode(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CodeVerificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeVerificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CodeVerificationState()';
}


}

/// @nodoc
class $CodeVerificationStateCopyWith<$Res>  {
$CodeVerificationStateCopyWith(CodeVerificationState _, $Res Function(CodeVerificationState) __);
}


/// Adds pattern-matching-related methods to [CodeVerificationState].
extension CodeVerificationStatePatterns on CodeVerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CodeVerificationInitial value)?  initial,TResult Function( CodeVerificationLoading value)?  loading,TResult Function( CodeVerificationVerified value)?  verified,TResult Function( CodeVerificationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CodeVerificationInitial() when initial != null:
return initial(_that);case CodeVerificationLoading() when loading != null:
return loading(_that);case CodeVerificationVerified() when verified != null:
return verified(_that);case CodeVerificationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CodeVerificationInitial value)  initial,required TResult Function( CodeVerificationLoading value)  loading,required TResult Function( CodeVerificationVerified value)  verified,required TResult Function( CodeVerificationError value)  error,}){
final _that = this;
switch (_that) {
case CodeVerificationInitial():
return initial(_that);case CodeVerificationLoading():
return loading(_that);case CodeVerificationVerified():
return verified(_that);case CodeVerificationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CodeVerificationInitial value)?  initial,TResult? Function( CodeVerificationLoading value)?  loading,TResult? Function( CodeVerificationVerified value)?  verified,TResult? Function( CodeVerificationError value)?  error,}){
final _that = this;
switch (_that) {
case CodeVerificationInitial() when initial != null:
return initial(_that);case CodeVerificationLoading() when loading != null:
return loading(_that);case CodeVerificationVerified() when verified != null:
return verified(_that);case CodeVerificationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String email)?  verified,TResult Function( String message,  String? field,  bool isAttemptsExhausted)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CodeVerificationInitial() when initial != null:
return initial();case CodeVerificationLoading() when loading != null:
return loading();case CodeVerificationVerified() when verified != null:
return verified(_that.email);case CodeVerificationError() when error != null:
return error(_that.message,_that.field,_that.isAttemptsExhausted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String email)  verified,required TResult Function( String message,  String? field,  bool isAttemptsExhausted)  error,}) {final _that = this;
switch (_that) {
case CodeVerificationInitial():
return initial();case CodeVerificationLoading():
return loading();case CodeVerificationVerified():
return verified(_that.email);case CodeVerificationError():
return error(_that.message,_that.field,_that.isAttemptsExhausted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String email)?  verified,TResult? Function( String message,  String? field,  bool isAttemptsExhausted)?  error,}) {final _that = this;
switch (_that) {
case CodeVerificationInitial() when initial != null:
return initial();case CodeVerificationLoading() when loading != null:
return loading();case CodeVerificationVerified() when verified != null:
return verified(_that.email);case CodeVerificationError() when error != null:
return error(_that.message,_that.field,_that.isAttemptsExhausted);case _:
  return null;

}
}

}

/// @nodoc


class CodeVerificationInitial implements CodeVerificationState {
  const CodeVerificationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeVerificationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CodeVerificationState.initial()';
}


}




/// @nodoc


class CodeVerificationLoading implements CodeVerificationState {
  const CodeVerificationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeVerificationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CodeVerificationState.loading()';
}


}




/// @nodoc


class CodeVerificationVerified implements CodeVerificationState {
  const CodeVerificationVerified({required this.email});
  

 final  String email;

/// Create a copy of CodeVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodeVerificationVerifiedCopyWith<CodeVerificationVerified> get copyWith => _$CodeVerificationVerifiedCopyWithImpl<CodeVerificationVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeVerificationVerified&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'CodeVerificationState.verified(email: $email)';
}


}

/// @nodoc
abstract mixin class $CodeVerificationVerifiedCopyWith<$Res> implements $CodeVerificationStateCopyWith<$Res> {
  factory $CodeVerificationVerifiedCopyWith(CodeVerificationVerified value, $Res Function(CodeVerificationVerified) _then) = _$CodeVerificationVerifiedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$CodeVerificationVerifiedCopyWithImpl<$Res>
    implements $CodeVerificationVerifiedCopyWith<$Res> {
  _$CodeVerificationVerifiedCopyWithImpl(this._self, this._then);

  final CodeVerificationVerified _self;
  final $Res Function(CodeVerificationVerified) _then;

/// Create a copy of CodeVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(CodeVerificationVerified(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CodeVerificationError implements CodeVerificationState {
  const CodeVerificationError({required this.message, this.field, this.isAttemptsExhausted = false});
  

 final  String message;
 final  String? field;
@JsonKey() final  bool isAttemptsExhausted;

/// Create a copy of CodeVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodeVerificationErrorCopyWith<CodeVerificationError> get copyWith => _$CodeVerificationErrorCopyWithImpl<CodeVerificationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeVerificationError&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field)&&(identical(other.isAttemptsExhausted, isAttemptsExhausted) || other.isAttemptsExhausted == isAttemptsExhausted));
}


@override
int get hashCode => Object.hash(runtimeType,message,field,isAttemptsExhausted);

@override
String toString() {
  return 'CodeVerificationState.error(message: $message, field: $field, isAttemptsExhausted: $isAttemptsExhausted)';
}


}

/// @nodoc
abstract mixin class $CodeVerificationErrorCopyWith<$Res> implements $CodeVerificationStateCopyWith<$Res> {
  factory $CodeVerificationErrorCopyWith(CodeVerificationError value, $Res Function(CodeVerificationError) _then) = _$CodeVerificationErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? field, bool isAttemptsExhausted
});




}
/// @nodoc
class _$CodeVerificationErrorCopyWithImpl<$Res>
    implements $CodeVerificationErrorCopyWith<$Res> {
  _$CodeVerificationErrorCopyWithImpl(this._self, this._then);

  final CodeVerificationError _self;
  final $Res Function(CodeVerificationError) _then;

/// Create a copy of CodeVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? field = freezed,Object? isAttemptsExhausted = null,}) {
  return _then(CodeVerificationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,isAttemptsExhausted: null == isAttemptsExhausted ? _self.isAttemptsExhausted : isAttemptsExhausted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
