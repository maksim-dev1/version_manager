// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VersionDetailEvent {

 UuidValue get versionId;
/// Create a copy of VersionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionDetailEventCopyWith<VersionDetailEvent> get copyWith => _$VersionDetailEventCopyWithImpl<VersionDetailEvent>(this as VersionDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetailEvent&&(identical(other.versionId, versionId) || other.versionId == versionId));
}


@override
int get hashCode => Object.hash(runtimeType,versionId);

@override
String toString() {
  return 'VersionDetailEvent(versionId: $versionId)';
}


}

/// @nodoc
abstract mixin class $VersionDetailEventCopyWith<$Res>  {
  factory $VersionDetailEventCopyWith(VersionDetailEvent value, $Res Function(VersionDetailEvent) _then) = _$VersionDetailEventCopyWithImpl;
@useResult
$Res call({
 UuidValue versionId
});




}
/// @nodoc
class _$VersionDetailEventCopyWithImpl<$Res>
    implements $VersionDetailEventCopyWith<$Res> {
  _$VersionDetailEventCopyWithImpl(this._self, this._then);

  final VersionDetailEvent _self;
  final $Res Function(VersionDetailEvent) _then;

/// Create a copy of VersionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? versionId = null,}) {
  return _then(_self.copyWith(
versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}

}


/// Adds pattern-matching-related methods to [VersionDetailEvent].
extension VersionDetailEventPatterns on VersionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDetail value)?  loadDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDetail() when loadDetail != null:
return loadDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDetail value)  loadDetail,}){
final _that = this;
switch (_that) {
case _LoadDetail():
return loadDetail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDetail value)?  loadDetail,}){
final _that = this;
switch (_that) {
case _LoadDetail() when loadDetail != null:
return loadDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue versionId)?  loadDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDetail() when loadDetail != null:
return loadDetail(_that.versionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue versionId)  loadDetail,}) {final _that = this;
switch (_that) {
case _LoadDetail():
return loadDetail(_that.versionId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue versionId)?  loadDetail,}) {final _that = this;
switch (_that) {
case _LoadDetail() when loadDetail != null:
return loadDetail(_that.versionId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadDetail implements VersionDetailEvent {
  const _LoadDetail({required this.versionId});
  

@override final  UuidValue versionId;

/// Create a copy of VersionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDetailCopyWith<_LoadDetail> get copyWith => __$LoadDetailCopyWithImpl<_LoadDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDetail&&(identical(other.versionId, versionId) || other.versionId == versionId));
}


@override
int get hashCode => Object.hash(runtimeType,versionId);

@override
String toString() {
  return 'VersionDetailEvent.loadDetail(versionId: $versionId)';
}


}

/// @nodoc
abstract mixin class _$LoadDetailCopyWith<$Res> implements $VersionDetailEventCopyWith<$Res> {
  factory _$LoadDetailCopyWith(_LoadDetail value, $Res Function(_LoadDetail) _then) = __$LoadDetailCopyWithImpl;
@override @useResult
$Res call({
 UuidValue versionId
});




}
/// @nodoc
class __$LoadDetailCopyWithImpl<$Res>
    implements _$LoadDetailCopyWith<$Res> {
  __$LoadDetailCopyWithImpl(this._self, this._then);

  final _LoadDetail _self;
  final $Res Function(_LoadDetail) _then;

/// Create a copy of VersionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versionId = null,}) {
  return _then(_LoadDetail(
versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc
mixin _$VersionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionDetailState()';
}


}

/// @nodoc
class $VersionDetailStateCopyWith<$Res>  {
$VersionDetailStateCopyWith(VersionDetailState _, $Res Function(VersionDetailState) __);
}


/// Adds pattern-matching-related methods to [VersionDetailState].
extension VersionDetailStatePatterns on VersionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VersionDetailInitial value)?  initial,TResult Function( VersionDetailLoading value)?  loading,TResult Function( VersionDetailLoaded value)?  loaded,TResult Function( VersionDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VersionDetailInitial() when initial != null:
return initial(_that);case VersionDetailLoading() when loading != null:
return loading(_that);case VersionDetailLoaded() when loaded != null:
return loaded(_that);case VersionDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VersionDetailInitial value)  initial,required TResult Function( VersionDetailLoading value)  loading,required TResult Function( VersionDetailLoaded value)  loaded,required TResult Function( VersionDetailError value)  error,}){
final _that = this;
switch (_that) {
case VersionDetailInitial():
return initial(_that);case VersionDetailLoading():
return loading(_that);case VersionDetailLoaded():
return loaded(_that);case VersionDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VersionDetailInitial value)?  initial,TResult? Function( VersionDetailLoading value)?  loading,TResult? Function( VersionDetailLoaded value)?  loaded,TResult? Function( VersionDetailError value)?  error,}){
final _that = this;
switch (_that) {
case VersionDetailInitial() when initial != null:
return initial(_that);case VersionDetailLoading() when loading != null:
return loading(_that);case VersionDetailLoaded() when loaded != null:
return loaded(_that);case VersionDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( VersionDetailResponse detail)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VersionDetailInitial() when initial != null:
return initial();case VersionDetailLoading() when loading != null:
return loading();case VersionDetailLoaded() when loaded != null:
return loaded(_that.detail);case VersionDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( VersionDetailResponse detail)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case VersionDetailInitial():
return initial();case VersionDetailLoading():
return loading();case VersionDetailLoaded():
return loaded(_that.detail);case VersionDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( VersionDetailResponse detail)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case VersionDetailInitial() when initial != null:
return initial();case VersionDetailLoading() when loading != null:
return loading();case VersionDetailLoaded() when loaded != null:
return loaded(_that.detail);case VersionDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VersionDetailInitial implements VersionDetailState {
  const VersionDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionDetailState.initial()';
}


}




/// @nodoc


class VersionDetailLoading implements VersionDetailState {
  const VersionDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VersionDetailState.loading()';
}


}




/// @nodoc


class VersionDetailLoaded implements VersionDetailState {
  const VersionDetailLoaded({required this.detail});
  

 final  VersionDetailResponse detail;

/// Create a copy of VersionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionDetailLoadedCopyWith<VersionDetailLoaded> get copyWith => _$VersionDetailLoadedCopyWithImpl<VersionDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetailLoaded&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'VersionDetailState.loaded(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $VersionDetailLoadedCopyWith<$Res> implements $VersionDetailStateCopyWith<$Res> {
  factory $VersionDetailLoadedCopyWith(VersionDetailLoaded value, $Res Function(VersionDetailLoaded) _then) = _$VersionDetailLoadedCopyWithImpl;
@useResult
$Res call({
 VersionDetailResponse detail
});




}
/// @nodoc
class _$VersionDetailLoadedCopyWithImpl<$Res>
    implements $VersionDetailLoadedCopyWith<$Res> {
  _$VersionDetailLoadedCopyWithImpl(this._self, this._then);

  final VersionDetailLoaded _self;
  final $Res Function(VersionDetailLoaded) _then;

/// Create a copy of VersionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(VersionDetailLoaded(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as VersionDetailResponse,
  ));
}


}

/// @nodoc


class VersionDetailError implements VersionDetailState {
  const VersionDetailError({required this.message});
  

 final  String message;

/// Create a copy of VersionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionDetailErrorCopyWith<VersionDetailError> get copyWith => _$VersionDetailErrorCopyWithImpl<VersionDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VersionDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $VersionDetailErrorCopyWith<$Res> implements $VersionDetailStateCopyWith<$Res> {
  factory $VersionDetailErrorCopyWith(VersionDetailError value, $Res Function(VersionDetailError) _then) = _$VersionDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VersionDetailErrorCopyWithImpl<$Res>
    implements $VersionDetailErrorCopyWith<$Res> {
  _$VersionDetailErrorCopyWithImpl(this._self, this._then);

  final VersionDetailError _self;
  final $Res Function(VersionDetailError) _then;

/// Create a copy of VersionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VersionDetailError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
