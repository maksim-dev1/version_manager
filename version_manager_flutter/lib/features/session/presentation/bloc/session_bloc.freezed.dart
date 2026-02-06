// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent()';
}


}

/// @nodoc
class $SessionEventCopyWith<$Res>  {
$SessionEventCopyWith(SessionEvent _, $Res Function(SessionEvent) __);
}


/// Adds pattern-matching-related methods to [SessionEvent].
extension SessionEventPatterns on SessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadSessions value)?  loadSessions,TResult Function( _TerminateSession value)?  terminateSession,TResult Function( _TerminateAllOther value)?  terminateAllOther,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadSessions() when loadSessions != null:
return loadSessions(_that);case _TerminateSession() when terminateSession != null:
return terminateSession(_that);case _TerminateAllOther() when terminateAllOther != null:
return terminateAllOther(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadSessions value)  loadSessions,required TResult Function( _TerminateSession value)  terminateSession,required TResult Function( _TerminateAllOther value)  terminateAllOther,}){
final _that = this;
switch (_that) {
case _LoadSessions():
return loadSessions(_that);case _TerminateSession():
return terminateSession(_that);case _TerminateAllOther():
return terminateAllOther(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadSessions value)?  loadSessions,TResult? Function( _TerminateSession value)?  terminateSession,TResult? Function( _TerminateAllOther value)?  terminateAllOther,}){
final _that = this;
switch (_that) {
case _LoadSessions() when loadSessions != null:
return loadSessions(_that);case _TerminateSession() when terminateSession != null:
return terminateSession(_that);case _TerminateAllOther() when terminateAllOther != null:
return terminateAllOther(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadSessions,TResult Function( UuidValue sessionId)?  terminateSession,TResult Function()?  terminateAllOther,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadSessions() when loadSessions != null:
return loadSessions();case _TerminateSession() when terminateSession != null:
return terminateSession(_that.sessionId);case _TerminateAllOther() when terminateAllOther != null:
return terminateAllOther();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadSessions,required TResult Function( UuidValue sessionId)  terminateSession,required TResult Function()  terminateAllOther,}) {final _that = this;
switch (_that) {
case _LoadSessions():
return loadSessions();case _TerminateSession():
return terminateSession(_that.sessionId);case _TerminateAllOther():
return terminateAllOther();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadSessions,TResult? Function( UuidValue sessionId)?  terminateSession,TResult? Function()?  terminateAllOther,}) {final _that = this;
switch (_that) {
case _LoadSessions() when loadSessions != null:
return loadSessions();case _TerminateSession() when terminateSession != null:
return terminateSession(_that.sessionId);case _TerminateAllOther() when terminateAllOther != null:
return terminateAllOther();case _:
  return null;

}
}

}

/// @nodoc


class _LoadSessions implements SessionEvent {
  const _LoadSessions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadSessions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.loadSessions()';
}


}




/// @nodoc


class _TerminateSession implements SessionEvent {
  const _TerminateSession({required this.sessionId});
  

 final  UuidValue sessionId;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminateSessionCopyWith<_TerminateSession> get copyWith => __$TerminateSessionCopyWithImpl<_TerminateSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminateSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'SessionEvent.terminateSession(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$TerminateSessionCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$TerminateSessionCopyWith(_TerminateSession value, $Res Function(_TerminateSession) _then) = __$TerminateSessionCopyWithImpl;
@useResult
$Res call({
 UuidValue sessionId
});




}
/// @nodoc
class __$TerminateSessionCopyWithImpl<$Res>
    implements _$TerminateSessionCopyWith<$Res> {
  __$TerminateSessionCopyWithImpl(this._self, this._then);

  final _TerminateSession _self;
  final $Res Function(_TerminateSession) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_TerminateSession(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _TerminateAllOther implements SessionEvent {
  const _TerminateAllOther();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminateAllOther);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.terminateAllOther()';
}


}




/// @nodoc
mixin _$SessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState()';
}


}

/// @nodoc
class $SessionStateCopyWith<$Res>  {
$SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( SessionLoading value)?  sessionLoading,TResult Function( SessionLoaded value)?  sessionLoaded,TResult Function( SessionError value)?  sessionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case SessionLoading() when sessionLoading != null:
return sessionLoading(_that);case SessionLoaded() when sessionLoaded != null:
return sessionLoaded(_that);case SessionError() when sessionError != null:
return sessionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( SessionLoading value)  sessionLoading,required TResult Function( SessionLoaded value)  sessionLoaded,required TResult Function( SessionError value)  sessionError,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case SessionLoading():
return sessionLoading(_that);case SessionLoaded():
return sessionLoaded(_that);case SessionError():
return sessionError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( SessionLoading value)?  sessionLoading,TResult? Function( SessionLoaded value)?  sessionLoaded,TResult? Function( SessionError value)?  sessionError,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case SessionLoading() when sessionLoading != null:
return sessionLoading(_that);case SessionLoaded() when sessionLoaded != null:
return sessionLoaded(_that);case SessionError() when sessionError != null:
return sessionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sessionLoading,TResult Function( List<SessionInfo> sessions)?  sessionLoaded,TResult Function( String message)?  sessionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case SessionLoading() when sessionLoading != null:
return sessionLoading();case SessionLoaded() when sessionLoaded != null:
return sessionLoaded(_that.sessions);case SessionError() when sessionError != null:
return sessionError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sessionLoading,required TResult Function( List<SessionInfo> sessions)  sessionLoaded,required TResult Function( String message)  sessionError,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case SessionLoading():
return sessionLoading();case SessionLoaded():
return sessionLoaded(_that.sessions);case SessionError():
return sessionError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sessionLoading,TResult? Function( List<SessionInfo> sessions)?  sessionLoaded,TResult? Function( String message)?  sessionError,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case SessionLoading() when sessionLoading != null:
return sessionLoading();case SessionLoaded() when sessionLoaded != null:
return sessionLoaded(_that.sessions);case SessionError() when sessionError != null:
return sessionError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements SessionState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.initial()';
}


}




/// @nodoc


class SessionLoading implements SessionState {
  const SessionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.sessionLoading()';
}


}




/// @nodoc


class SessionLoaded implements SessionState {
  const SessionLoaded({required final  List<SessionInfo> sessions}): _sessions = sessions;
  

 final  List<SessionInfo> _sessions;
 List<SessionInfo> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionLoadedCopyWith<SessionLoaded> get copyWith => _$SessionLoadedCopyWithImpl<SessionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionLoaded&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SessionState.sessionLoaded(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionLoadedCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionLoadedCopyWith(SessionLoaded value, $Res Function(SessionLoaded) _then) = _$SessionLoadedCopyWithImpl;
@useResult
$Res call({
 List<SessionInfo> sessions
});




}
/// @nodoc
class _$SessionLoadedCopyWithImpl<$Res>
    implements $SessionLoadedCopyWith<$Res> {
  _$SessionLoadedCopyWithImpl(this._self, this._then);

  final SessionLoaded _self;
  final $Res Function(SessionLoaded) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(SessionLoaded(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionInfo>,
  ));
}


}

/// @nodoc


class SessionError implements SessionState {
  const SessionError({required this.message});
  

 final  String message;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionErrorCopyWith<SessionError> get copyWith => _$SessionErrorCopyWithImpl<SessionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SessionState.sessionError(message: $message)';
}


}

/// @nodoc
abstract mixin class $SessionErrorCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionErrorCopyWith(SessionError value, $Res Function(SessionError) _then) = _$SessionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SessionErrorCopyWithImpl<$Res>
    implements $SessionErrorCopyWith<$Res> {
  _$SessionErrorCopyWithImpl(this._self, this._then);

  final SessionError _self;
  final $Res Function(SessionError) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SessionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
