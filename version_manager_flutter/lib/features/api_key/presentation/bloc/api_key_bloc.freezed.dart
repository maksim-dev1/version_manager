// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_key_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiKeyEvent {

 UuidValue get applicationId;
/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyEventCopyWith<ApiKeyEvent> get copyWith => _$ApiKeyEventCopyWithImpl<ApiKeyEvent>(this as ApiKeyEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyEvent&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'ApiKeyEvent(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class $ApiKeyEventCopyWith<$Res>  {
  factory $ApiKeyEventCopyWith(ApiKeyEvent value, $Res Function(ApiKeyEvent) _then) = _$ApiKeyEventCopyWithImpl;
@useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class _$ApiKeyEventCopyWithImpl<$Res>
    implements $ApiKeyEventCopyWith<$Res> {
  _$ApiKeyEventCopyWithImpl(this._self, this._then);

  final ApiKeyEvent _self;
  final $Res Function(ApiKeyEvent) _then;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiKeyEvent].
extension ApiKeyEventPatterns on ApiKeyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchEmail value)?  fetchEmail,TResult Function( _RequestCode value)?  requestCode,TResult Function( _Regenerate value)?  regenerate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchEmail() when fetchEmail != null:
return fetchEmail(_that);case _RequestCode() when requestCode != null:
return requestCode(_that);case _Regenerate() when regenerate != null:
return regenerate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchEmail value)  fetchEmail,required TResult Function( _RequestCode value)  requestCode,required TResult Function( _Regenerate value)  regenerate,}){
final _that = this;
switch (_that) {
case _FetchEmail():
return fetchEmail(_that);case _RequestCode():
return requestCode(_that);case _Regenerate():
return regenerate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchEmail value)?  fetchEmail,TResult? Function( _RequestCode value)?  requestCode,TResult? Function( _Regenerate value)?  regenerate,}){
final _that = this;
switch (_that) {
case _FetchEmail() when fetchEmail != null:
return fetchEmail(_that);case _RequestCode() when requestCode != null:
return requestCode(_that);case _Regenerate() when regenerate != null:
return regenerate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue applicationId)?  fetchEmail,TResult Function( UuidValue applicationId)?  requestCode,TResult Function( UuidValue applicationId,  String code)?  regenerate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchEmail() when fetchEmail != null:
return fetchEmail(_that.applicationId);case _RequestCode() when requestCode != null:
return requestCode(_that.applicationId);case _Regenerate() when regenerate != null:
return regenerate(_that.applicationId,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue applicationId)  fetchEmail,required TResult Function( UuidValue applicationId)  requestCode,required TResult Function( UuidValue applicationId,  String code)  regenerate,}) {final _that = this;
switch (_that) {
case _FetchEmail():
return fetchEmail(_that.applicationId);case _RequestCode():
return requestCode(_that.applicationId);case _Regenerate():
return regenerate(_that.applicationId,_that.code);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue applicationId)?  fetchEmail,TResult? Function( UuidValue applicationId)?  requestCode,TResult? Function( UuidValue applicationId,  String code)?  regenerate,}) {final _that = this;
switch (_that) {
case _FetchEmail() when fetchEmail != null:
return fetchEmail(_that.applicationId);case _RequestCode() when requestCode != null:
return requestCode(_that.applicationId);case _Regenerate() when regenerate != null:
return regenerate(_that.applicationId,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _FetchEmail implements ApiKeyEvent {
  const _FetchEmail({required this.applicationId});
  

@override final  UuidValue applicationId;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchEmailCopyWith<_FetchEmail> get copyWith => __$FetchEmailCopyWithImpl<_FetchEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchEmail&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'ApiKeyEvent.fetchEmail(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class _$FetchEmailCopyWith<$Res> implements $ApiKeyEventCopyWith<$Res> {
  factory _$FetchEmailCopyWith(_FetchEmail value, $Res Function(_FetchEmail) _then) = __$FetchEmailCopyWithImpl;
@override @useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class __$FetchEmailCopyWithImpl<$Res>
    implements _$FetchEmailCopyWith<$Res> {
  __$FetchEmailCopyWithImpl(this._self, this._then);

  final _FetchEmail _self;
  final $Res Function(_FetchEmail) _then;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,}) {
  return _then(_FetchEmail(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _RequestCode implements ApiKeyEvent {
  const _RequestCode({required this.applicationId});
  

@override final  UuidValue applicationId;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCodeCopyWith<_RequestCode> get copyWith => __$RequestCodeCopyWithImpl<_RequestCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCode&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId);

@override
String toString() {
  return 'ApiKeyEvent.requestCode(applicationId: $applicationId)';
}


}

/// @nodoc
abstract mixin class _$RequestCodeCopyWith<$Res> implements $ApiKeyEventCopyWith<$Res> {
  factory _$RequestCodeCopyWith(_RequestCode value, $Res Function(_RequestCode) _then) = __$RequestCodeCopyWithImpl;
@override @useResult
$Res call({
 UuidValue applicationId
});




}
/// @nodoc
class __$RequestCodeCopyWithImpl<$Res>
    implements _$RequestCodeCopyWith<$Res> {
  __$RequestCodeCopyWithImpl(this._self, this._then);

  final _RequestCode _self;
  final $Res Function(_RequestCode) _then;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,}) {
  return _then(_RequestCode(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _Regenerate implements ApiKeyEvent {
  const _Regenerate({required this.applicationId, required this.code});
  

@override final  UuidValue applicationId;
 final  String code;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegenerateCopyWith<_Regenerate> get copyWith => __$RegenerateCopyWithImpl<_Regenerate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Regenerate&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,code);

@override
String toString() {
  return 'ApiKeyEvent.regenerate(applicationId: $applicationId, code: $code)';
}


}

/// @nodoc
abstract mixin class _$RegenerateCopyWith<$Res> implements $ApiKeyEventCopyWith<$Res> {
  factory _$RegenerateCopyWith(_Regenerate value, $Res Function(_Regenerate) _then) = __$RegenerateCopyWithImpl;
@override @useResult
$Res call({
 UuidValue applicationId, String code
});




}
/// @nodoc
class __$RegenerateCopyWithImpl<$Res>
    implements _$RegenerateCopyWith<$Res> {
  __$RegenerateCopyWithImpl(this._self, this._then);

  final _Regenerate _self;
  final $Res Function(_Regenerate) _then;

/// Create a copy of ApiKeyEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? code = null,}) {
  return _then(_Regenerate(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ApiKeyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiKeyState()';
}


}

/// @nodoc
class $ApiKeyStateCopyWith<$Res>  {
$ApiKeyStateCopyWith(ApiKeyState _, $Res Function(ApiKeyState) __);
}


/// Adds pattern-matching-related methods to [ApiKeyState].
extension ApiKeyStatePatterns on ApiKeyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiKeyInitial value)?  initial,TResult Function( ApiKeyLoading value)?  loading,TResult Function( ApiKeyLoaded value)?  loaded,TResult Function( ApiKeyError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiKeyInitial() when initial != null:
return initial(_that);case ApiKeyLoading() when loading != null:
return loading(_that);case ApiKeyLoaded() when loaded != null:
return loaded(_that);case ApiKeyError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiKeyInitial value)  initial,required TResult Function( ApiKeyLoading value)  loading,required TResult Function( ApiKeyLoaded value)  loaded,required TResult Function( ApiKeyError value)  error,}){
final _that = this;
switch (_that) {
case ApiKeyInitial():
return initial(_that);case ApiKeyLoading():
return loading(_that);case ApiKeyLoaded():
return loaded(_that);case ApiKeyError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiKeyInitial value)?  initial,TResult? Function( ApiKeyLoading value)?  loading,TResult? Function( ApiKeyLoaded value)?  loaded,TResult? Function( ApiKeyError value)?  error,}){
final _that = this;
switch (_that) {
case ApiKeyInitial() when initial != null:
return initial(_that);case ApiKeyLoading() when loading != null:
return loading(_that);case ApiKeyLoaded() when loaded != null:
return loaded(_that);case ApiKeyError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ApiKeyResult result)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiKeyInitial() when initial != null:
return initial();case ApiKeyLoading() when loading != null:
return loading();case ApiKeyLoaded() when loaded != null:
return loaded(_that.result);case ApiKeyError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ApiKeyResult result)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ApiKeyInitial():
return initial();case ApiKeyLoading():
return loading();case ApiKeyLoaded():
return loaded(_that.result);case ApiKeyError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ApiKeyResult result)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ApiKeyInitial() when initial != null:
return initial();case ApiKeyLoading() when loading != null:
return loading();case ApiKeyLoaded() when loaded != null:
return loaded(_that.result);case ApiKeyError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ApiKeyInitial implements ApiKeyState {
  const ApiKeyInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiKeyState.initial()';
}


}




/// @nodoc


class ApiKeyLoading implements ApiKeyState {
  const ApiKeyLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiKeyState.loading()';
}


}




/// @nodoc


class ApiKeyLoaded implements ApiKeyState {
  const ApiKeyLoaded({required this.result});
  

 final  ApiKeyResult result;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyLoadedCopyWith<ApiKeyLoaded> get copyWith => _$ApiKeyLoadedCopyWithImpl<ApiKeyLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyLoaded&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,result);

@override
String toString() {
  return 'ApiKeyState.loaded(result: $result)';
}


}

/// @nodoc
abstract mixin class $ApiKeyLoadedCopyWith<$Res> implements $ApiKeyStateCopyWith<$Res> {
  factory $ApiKeyLoadedCopyWith(ApiKeyLoaded value, $Res Function(ApiKeyLoaded) _then) = _$ApiKeyLoadedCopyWithImpl;
@useResult
$Res call({
 ApiKeyResult result
});


$ApiKeyResultCopyWith<$Res> get result;

}
/// @nodoc
class _$ApiKeyLoadedCopyWithImpl<$Res>
    implements $ApiKeyLoadedCopyWith<$Res> {
  _$ApiKeyLoadedCopyWithImpl(this._self, this._then);

  final ApiKeyLoaded _self;
  final $Res Function(ApiKeyLoaded) _then;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(ApiKeyLoaded(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ApiKeyResult,
  ));
}

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiKeyResultCopyWith<$Res> get result {
  
  return $ApiKeyResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class ApiKeyError implements ApiKeyState {
  const ApiKeyError({required this.message});
  

 final  String message;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyErrorCopyWith<ApiKeyError> get copyWith => _$ApiKeyErrorCopyWithImpl<ApiKeyError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiKeyState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiKeyErrorCopyWith<$Res> implements $ApiKeyStateCopyWith<$Res> {
  factory $ApiKeyErrorCopyWith(ApiKeyError value, $Res Function(ApiKeyError) _then) = _$ApiKeyErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ApiKeyErrorCopyWithImpl<$Res>
    implements $ApiKeyErrorCopyWith<$Res> {
  _$ApiKeyErrorCopyWithImpl(this._self, this._then);

  final ApiKeyError _self;
  final $Res Function(ApiKeyError) _then;

/// Create a copy of ApiKeyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ApiKeyError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ApiKeyResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiKeyResult()';
}


}

/// @nodoc
class $ApiKeyResultCopyWith<$Res>  {
$ApiKeyResultCopyWith(ApiKeyResult _, $Res Function(ApiKeyResult) __);
}


/// Adds pattern-matching-related methods to [ApiKeyResult].
extension ApiKeyResultPatterns on ApiKeyResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiKeyEmailLoaded value)?  emailLoaded,TResult Function( ApiKeyCodeSent value)?  codeSent,TResult Function( ApiKeyRegenerated value)?  regenerated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiKeyEmailLoaded() when emailLoaded != null:
return emailLoaded(_that);case ApiKeyCodeSent() when codeSent != null:
return codeSent(_that);case ApiKeyRegenerated() when regenerated != null:
return regenerated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiKeyEmailLoaded value)  emailLoaded,required TResult Function( ApiKeyCodeSent value)  codeSent,required TResult Function( ApiKeyRegenerated value)  regenerated,}){
final _that = this;
switch (_that) {
case ApiKeyEmailLoaded():
return emailLoaded(_that);case ApiKeyCodeSent():
return codeSent(_that);case ApiKeyRegenerated():
return regenerated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiKeyEmailLoaded value)?  emailLoaded,TResult? Function( ApiKeyCodeSent value)?  codeSent,TResult? Function( ApiKeyRegenerated value)?  regenerated,}){
final _that = this;
switch (_that) {
case ApiKeyEmailLoaded() when emailLoaded != null:
return emailLoaded(_that);case ApiKeyCodeSent() when codeSent != null:
return codeSent(_that);case ApiKeyRegenerated() when regenerated != null:
return regenerated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String maskedEmail)?  emailLoaded,TResult Function( String? maskedEmail,  int? retryAfterSeconds)?  codeSent,TResult Function( String apiKey,  DateTime regeneratedAt)?  regenerated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiKeyEmailLoaded() when emailLoaded != null:
return emailLoaded(_that.maskedEmail);case ApiKeyCodeSent() when codeSent != null:
return codeSent(_that.maskedEmail,_that.retryAfterSeconds);case ApiKeyRegenerated() when regenerated != null:
return regenerated(_that.apiKey,_that.regeneratedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String maskedEmail)  emailLoaded,required TResult Function( String? maskedEmail,  int? retryAfterSeconds)  codeSent,required TResult Function( String apiKey,  DateTime regeneratedAt)  regenerated,}) {final _that = this;
switch (_that) {
case ApiKeyEmailLoaded():
return emailLoaded(_that.maskedEmail);case ApiKeyCodeSent():
return codeSent(_that.maskedEmail,_that.retryAfterSeconds);case ApiKeyRegenerated():
return regenerated(_that.apiKey,_that.regeneratedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String maskedEmail)?  emailLoaded,TResult? Function( String? maskedEmail,  int? retryAfterSeconds)?  codeSent,TResult? Function( String apiKey,  DateTime regeneratedAt)?  regenerated,}) {final _that = this;
switch (_that) {
case ApiKeyEmailLoaded() when emailLoaded != null:
return emailLoaded(_that.maskedEmail);case ApiKeyCodeSent() when codeSent != null:
return codeSent(_that.maskedEmail,_that.retryAfterSeconds);case ApiKeyRegenerated() when regenerated != null:
return regenerated(_that.apiKey,_that.regeneratedAt);case _:
  return null;

}
}

}

/// @nodoc


class ApiKeyEmailLoaded implements ApiKeyResult {
  const ApiKeyEmailLoaded({required this.maskedEmail});
  

 final  String maskedEmail;

/// Create a copy of ApiKeyResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyEmailLoadedCopyWith<ApiKeyEmailLoaded> get copyWith => _$ApiKeyEmailLoadedCopyWithImpl<ApiKeyEmailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyEmailLoaded&&(identical(other.maskedEmail, maskedEmail) || other.maskedEmail == maskedEmail));
}


@override
int get hashCode => Object.hash(runtimeType,maskedEmail);

@override
String toString() {
  return 'ApiKeyResult.emailLoaded(maskedEmail: $maskedEmail)';
}


}

/// @nodoc
abstract mixin class $ApiKeyEmailLoadedCopyWith<$Res> implements $ApiKeyResultCopyWith<$Res> {
  factory $ApiKeyEmailLoadedCopyWith(ApiKeyEmailLoaded value, $Res Function(ApiKeyEmailLoaded) _then) = _$ApiKeyEmailLoadedCopyWithImpl;
@useResult
$Res call({
 String maskedEmail
});




}
/// @nodoc
class _$ApiKeyEmailLoadedCopyWithImpl<$Res>
    implements $ApiKeyEmailLoadedCopyWith<$Res> {
  _$ApiKeyEmailLoadedCopyWithImpl(this._self, this._then);

  final ApiKeyEmailLoaded _self;
  final $Res Function(ApiKeyEmailLoaded) _then;

/// Create a copy of ApiKeyResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maskedEmail = null,}) {
  return _then(ApiKeyEmailLoaded(
maskedEmail: null == maskedEmail ? _self.maskedEmail : maskedEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ApiKeyCodeSent implements ApiKeyResult {
  const ApiKeyCodeSent({this.maskedEmail, this.retryAfterSeconds});
  

 final  String? maskedEmail;
 final  int? retryAfterSeconds;

/// Create a copy of ApiKeyResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyCodeSentCopyWith<ApiKeyCodeSent> get copyWith => _$ApiKeyCodeSentCopyWithImpl<ApiKeyCodeSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyCodeSent&&(identical(other.maskedEmail, maskedEmail) || other.maskedEmail == maskedEmail)&&(identical(other.retryAfterSeconds, retryAfterSeconds) || other.retryAfterSeconds == retryAfterSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,maskedEmail,retryAfterSeconds);

@override
String toString() {
  return 'ApiKeyResult.codeSent(maskedEmail: $maskedEmail, retryAfterSeconds: $retryAfterSeconds)';
}


}

/// @nodoc
abstract mixin class $ApiKeyCodeSentCopyWith<$Res> implements $ApiKeyResultCopyWith<$Res> {
  factory $ApiKeyCodeSentCopyWith(ApiKeyCodeSent value, $Res Function(ApiKeyCodeSent) _then) = _$ApiKeyCodeSentCopyWithImpl;
@useResult
$Res call({
 String? maskedEmail, int? retryAfterSeconds
});




}
/// @nodoc
class _$ApiKeyCodeSentCopyWithImpl<$Res>
    implements $ApiKeyCodeSentCopyWith<$Res> {
  _$ApiKeyCodeSentCopyWithImpl(this._self, this._then);

  final ApiKeyCodeSent _self;
  final $Res Function(ApiKeyCodeSent) _then;

/// Create a copy of ApiKeyResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maskedEmail = freezed,Object? retryAfterSeconds = freezed,}) {
  return _then(ApiKeyCodeSent(
maskedEmail: freezed == maskedEmail ? _self.maskedEmail : maskedEmail // ignore: cast_nullable_to_non_nullable
as String?,retryAfterSeconds: freezed == retryAfterSeconds ? _self.retryAfterSeconds : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ApiKeyRegenerated implements ApiKeyResult {
  const ApiKeyRegenerated({required this.apiKey, required this.regeneratedAt});
  

 final  String apiKey;
 final  DateTime regeneratedAt;

/// Create a copy of ApiKeyResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyRegeneratedCopyWith<ApiKeyRegenerated> get copyWith => _$ApiKeyRegeneratedCopyWithImpl<ApiKeyRegenerated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKeyRegenerated&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.regeneratedAt, regeneratedAt) || other.regeneratedAt == regeneratedAt));
}


@override
int get hashCode => Object.hash(runtimeType,apiKey,regeneratedAt);

@override
String toString() {
  return 'ApiKeyResult.regenerated(apiKey: $apiKey, regeneratedAt: $regeneratedAt)';
}


}

/// @nodoc
abstract mixin class $ApiKeyRegeneratedCopyWith<$Res> implements $ApiKeyResultCopyWith<$Res> {
  factory $ApiKeyRegeneratedCopyWith(ApiKeyRegenerated value, $Res Function(ApiKeyRegenerated) _then) = _$ApiKeyRegeneratedCopyWithImpl;
@useResult
$Res call({
 String apiKey, DateTime regeneratedAt
});




}
/// @nodoc
class _$ApiKeyRegeneratedCopyWithImpl<$Res>
    implements $ApiKeyRegeneratedCopyWith<$Res> {
  _$ApiKeyRegeneratedCopyWithImpl(this._self, this._then);

  final ApiKeyRegenerated _self;
  final $Res Function(ApiKeyRegenerated) _then;

/// Create a copy of ApiKeyResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiKey = null,Object? regeneratedAt = null,}) {
  return _then(ApiKeyRegenerated(
apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,regeneratedAt: null == regeneratedAt ? _self.regeneratedAt : regeneratedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
