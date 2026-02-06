// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileEvent()';
}


}

/// @nodoc
class $UserProfileEventCopyWith<$Res>  {
$UserProfileEventCopyWith(UserProfileEvent _, $Res Function(UserProfileEvent) __);
}


/// Adds pattern-matching-related methods to [UserProfileEvent].
extension UserProfileEventPatterns on UserProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadProfile value)?  loadProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadProfile value)  loadProfile,}){
final _that = this;
switch (_that) {
case _LoadProfile():
return loadProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadProfile value)?  loadProfile,}){
final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProfile,}) {final _that = this;
switch (_that) {
case _LoadProfile():
return loadProfile();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProfile,}) {final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile();case _:
  return null;

}
}

}

/// @nodoc


class _LoadProfile implements UserProfileEvent {
  const _LoadProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileEvent.loadProfile()';
}


}




/// @nodoc
mixin _$UserProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState()';
}


}

/// @nodoc
class $UserProfileStateCopyWith<$Res>  {
$UserProfileStateCopyWith(UserProfileState _, $Res Function(UserProfileState) __);
}


/// Adds pattern-matching-related methods to [UserProfileState].
extension UserProfileStatePatterns on UserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( UserProfileLoading value)?  userProfileLoading,TResult Function( UserProfileLoaded value)?  userProfileLoaded,TResult Function( UserProfileError value)?  userProfileError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading(_that);case UserProfileLoaded() when userProfileLoaded != null:
return userProfileLoaded(_that);case UserProfileError() when userProfileError != null:
return userProfileError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( UserProfileLoading value)  userProfileLoading,required TResult Function( UserProfileLoaded value)  userProfileLoaded,required TResult Function( UserProfileError value)  userProfileError,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case UserProfileLoading():
return userProfileLoading(_that);case UserProfileLoaded():
return userProfileLoaded(_that);case UserProfileError():
return userProfileError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( UserProfileLoading value)?  userProfileLoading,TResult? Function( UserProfileLoaded value)?  userProfileLoaded,TResult? Function( UserProfileError value)?  userProfileError,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading(_that);case UserProfileLoaded() when userProfileLoaded != null:
return userProfileLoaded(_that);case UserProfileError() when userProfileError != null:
return userProfileError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  userProfileLoading,TResult Function( UserPublic user)?  userProfileLoaded,TResult Function( String message)?  userProfileError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading();case UserProfileLoaded() when userProfileLoaded != null:
return userProfileLoaded(_that.user);case UserProfileError() when userProfileError != null:
return userProfileError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  userProfileLoading,required TResult Function( UserPublic user)  userProfileLoaded,required TResult Function( String message)  userProfileError,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case UserProfileLoading():
return userProfileLoading();case UserProfileLoaded():
return userProfileLoaded(_that.user);case UserProfileError():
return userProfileError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  userProfileLoading,TResult? Function( UserPublic user)?  userProfileLoaded,TResult? Function( String message)?  userProfileError,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case UserProfileLoading() when userProfileLoading != null:
return userProfileLoading();case UserProfileLoaded() when userProfileLoaded != null:
return userProfileLoaded(_that.user);case UserProfileError() when userProfileError != null:
return userProfileError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements UserProfileState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.initial()';
}


}




/// @nodoc


class UserProfileLoading implements UserProfileState {
  const UserProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileState.userProfileLoading()';
}


}




/// @nodoc


class UserProfileLoaded implements UserProfileState {
  const UserProfileLoaded({required this.user});
  

 final  UserPublic user;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileLoadedCopyWith<UserProfileLoaded> get copyWith => _$UserProfileLoadedCopyWithImpl<UserProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileLoaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserProfileState.userProfileLoaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserProfileLoadedCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory $UserProfileLoadedCopyWith(UserProfileLoaded value, $Res Function(UserProfileLoaded) _then) = _$UserProfileLoadedCopyWithImpl;
@useResult
$Res call({
 UserPublic user
});




}
/// @nodoc
class _$UserProfileLoadedCopyWithImpl<$Res>
    implements $UserProfileLoadedCopyWith<$Res> {
  _$UserProfileLoadedCopyWithImpl(this._self, this._then);

  final UserProfileLoaded _self;
  final $Res Function(UserProfileLoaded) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserProfileLoaded(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserPublic,
  ));
}


}

/// @nodoc


class UserProfileError implements UserProfileState {
  const UserProfileError({required this.message});
  

 final  String message;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileErrorCopyWith<UserProfileError> get copyWith => _$UserProfileErrorCopyWithImpl<UserProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserProfileState.userProfileError(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserProfileErrorCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory $UserProfileErrorCopyWith(UserProfileError value, $Res Function(UserProfileError) _then) = _$UserProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserProfileErrorCopyWithImpl<$Res>
    implements $UserProfileErrorCopyWith<$Res> {
  _$UserProfileErrorCopyWithImpl(this._self, this._then);

  final UserProfileError _self;
  final $Res Function(UserProfileError) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserProfileError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
