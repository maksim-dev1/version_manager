// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_check_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailCheckEvent {

 String get email;
/// Create a copy of EmailCheckEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailCheckEventCopyWith<EmailCheckEvent> get copyWith => _$EmailCheckEventCopyWithImpl<EmailCheckEvent>(this as EmailCheckEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailCheckEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'EmailCheckEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailCheckEventCopyWith<$Res>  {
  factory $EmailCheckEventCopyWith(EmailCheckEvent value, $Res Function(EmailCheckEvent) _then) = _$EmailCheckEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$EmailCheckEventCopyWithImpl<$Res>
    implements $EmailCheckEventCopyWith<$Res> {
  _$EmailCheckEventCopyWithImpl(this._self, this._then);

  final EmailCheckEvent _self;
  final $Res Function(EmailCheckEvent) _then;

/// Create a copy of EmailCheckEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailCheckEvent].
extension EmailCheckEventPatterns on EmailCheckEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckEmail value)?  checkEmail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckEmail() when checkEmail != null:
return checkEmail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckEmail value)  checkEmail,}){
final _that = this;
switch (_that) {
case _CheckEmail():
return checkEmail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckEmail value)?  checkEmail,}){
final _that = this;
switch (_that) {
case _CheckEmail() when checkEmail != null:
return checkEmail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  checkEmail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckEmail() when checkEmail != null:
return checkEmail(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  checkEmail,}) {final _that = this;
switch (_that) {
case _CheckEmail():
return checkEmail(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  checkEmail,}) {final _that = this;
switch (_that) {
case _CheckEmail() when checkEmail != null:
return checkEmail(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _CheckEmail implements EmailCheckEvent {
  const _CheckEmail({required this.email});
  

@override final  String email;

/// Create a copy of EmailCheckEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'EmailCheckEvent.checkEmail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailCopyWith<$Res> implements $EmailCheckEventCopyWith<$Res> {
  factory _$CheckEmailCopyWith(_CheckEmail value, $Res Function(_CheckEmail) _then) = __$CheckEmailCopyWithImpl;
@override @useResult
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

/// Create a copy of EmailCheckEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_CheckEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EmailCheckState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailCheckState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailCheckState()';
}


}

/// @nodoc
class $EmailCheckStateCopyWith<$Res>  {
$EmailCheckStateCopyWith(EmailCheckState _, $Res Function(EmailCheckState) __);
}


/// Adds pattern-matching-related methods to [EmailCheckState].
extension EmailCheckStatePatterns on EmailCheckState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( EmailCheckLoading value)?  emailCheckLoading,TResult Function( EmailCheckSuccess value)?  emailCheckSuccess,TResult Function( EmailCheckError value)?  emailCheckError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case EmailCheckLoading() when emailCheckLoading != null:
return emailCheckLoading(_that);case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that);case EmailCheckError() when emailCheckError != null:
return emailCheckError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( EmailCheckLoading value)  emailCheckLoading,required TResult Function( EmailCheckSuccess value)  emailCheckSuccess,required TResult Function( EmailCheckError value)  emailCheckError,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case EmailCheckLoading():
return emailCheckLoading(_that);case EmailCheckSuccess():
return emailCheckSuccess(_that);case EmailCheckError():
return emailCheckError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( EmailCheckLoading value)?  emailCheckLoading,TResult? Function( EmailCheckSuccess value)?  emailCheckSuccess,TResult? Function( EmailCheckError value)?  emailCheckError,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case EmailCheckLoading() when emailCheckLoading != null:
return emailCheckLoading(_that);case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that);case EmailCheckError() when emailCheckError != null:
return emailCheckError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  emailCheckLoading,TResult Function( String email,  bool emailExists,  int? retryAfterSeconds)?  emailCheckSuccess,TResult Function( String message)?  emailCheckError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case EmailCheckLoading() when emailCheckLoading != null:
return emailCheckLoading();case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that.email,_that.emailExists,_that.retryAfterSeconds);case EmailCheckError() when emailCheckError != null:
return emailCheckError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  emailCheckLoading,required TResult Function( String email,  bool emailExists,  int? retryAfterSeconds)  emailCheckSuccess,required TResult Function( String message)  emailCheckError,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case EmailCheckLoading():
return emailCheckLoading();case EmailCheckSuccess():
return emailCheckSuccess(_that.email,_that.emailExists,_that.retryAfterSeconds);case EmailCheckError():
return emailCheckError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  emailCheckLoading,TResult? Function( String email,  bool emailExists,  int? retryAfterSeconds)?  emailCheckSuccess,TResult? Function( String message)?  emailCheckError,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case EmailCheckLoading() when emailCheckLoading != null:
return emailCheckLoading();case EmailCheckSuccess() when emailCheckSuccess != null:
return emailCheckSuccess(_that.email,_that.emailExists,_that.retryAfterSeconds);case EmailCheckError() when emailCheckError != null:
return emailCheckError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements EmailCheckState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailCheckState.initial()';
}


}




/// @nodoc


class EmailCheckLoading implements EmailCheckState {
  const EmailCheckLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailCheckLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailCheckState.emailCheckLoading()';
}


}




/// @nodoc


class EmailCheckSuccess implements EmailCheckState {
  const EmailCheckSuccess({required this.email, required this.emailExists, this.retryAfterSeconds});
  

 final  String email;
 final  bool emailExists;
/// Время ожидания при rate limit
 final  int? retryAfterSeconds;

/// Create a copy of EmailCheckState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailCheckSuccessCopyWith<EmailCheckSuccess> get copyWith => _$EmailCheckSuccessCopyWithImpl<EmailCheckSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailCheckSuccess&&(identical(other.email, email) || other.email == email)&&(identical(other.emailExists, emailExists) || other.emailExists == emailExists)&&(identical(other.retryAfterSeconds, retryAfterSeconds) || other.retryAfterSeconds == retryAfterSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailExists,retryAfterSeconds);

@override
String toString() {
  return 'EmailCheckState.emailCheckSuccess(email: $email, emailExists: $emailExists, retryAfterSeconds: $retryAfterSeconds)';
}


}

/// @nodoc
abstract mixin class $EmailCheckSuccessCopyWith<$Res> implements $EmailCheckStateCopyWith<$Res> {
  factory $EmailCheckSuccessCopyWith(EmailCheckSuccess value, $Res Function(EmailCheckSuccess) _then) = _$EmailCheckSuccessCopyWithImpl;
@useResult
$Res call({
 String email, bool emailExists, int? retryAfterSeconds
});




}
/// @nodoc
class _$EmailCheckSuccessCopyWithImpl<$Res>
    implements $EmailCheckSuccessCopyWith<$Res> {
  _$EmailCheckSuccessCopyWithImpl(this._self, this._then);

  final EmailCheckSuccess _self;
  final $Res Function(EmailCheckSuccess) _then;

/// Create a copy of EmailCheckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? emailExists = null,Object? retryAfterSeconds = freezed,}) {
  return _then(EmailCheckSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailExists: null == emailExists ? _self.emailExists : emailExists // ignore: cast_nullable_to_non_nullable
as bool,retryAfterSeconds: freezed == retryAfterSeconds ? _self.retryAfterSeconds : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class EmailCheckError implements EmailCheckState {
  const EmailCheckError({required this.message});
  

 final  String message;

/// Create a copy of EmailCheckState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailCheckErrorCopyWith<EmailCheckError> get copyWith => _$EmailCheckErrorCopyWithImpl<EmailCheckError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailCheckError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EmailCheckState.emailCheckError(message: $message)';
}


}

/// @nodoc
abstract mixin class $EmailCheckErrorCopyWith<$Res> implements $EmailCheckStateCopyWith<$Res> {
  factory $EmailCheckErrorCopyWith(EmailCheckError value, $Res Function(EmailCheckError) _then) = _$EmailCheckErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EmailCheckErrorCopyWithImpl<$Res>
    implements $EmailCheckErrorCopyWith<$Res> {
  _$EmailCheckErrorCopyWithImpl(this._self, this._then);

  final EmailCheckError _self;
  final $Res Function(EmailCheckError) _then;

/// Create a copy of EmailCheckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EmailCheckError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
