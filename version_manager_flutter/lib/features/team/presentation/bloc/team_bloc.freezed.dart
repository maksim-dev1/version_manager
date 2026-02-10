// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamEvent()';
}


}

/// @nodoc
class $TeamEventCopyWith<$Res>  {
$TeamEventCopyWith(TeamEvent _, $Res Function(TeamEvent) __);
}


/// Adds pattern-matching-related methods to [TeamEvent].
extension TeamEventPatterns on TeamEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTeams value)?  loadTeams,TResult Function( _CreateTeam value)?  createTeam,TResult Function( _UpdateTeam value)?  updateTeam,TResult Function( _DeleteTeam value)?  deleteTeam,TResult Function( _LoadInvitations value)?  loadInvitations,TResult Function( _RespondToInvitation value)?  respondToInvitation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTeams() when loadTeams != null:
return loadTeams(_that);case _CreateTeam() when createTeam != null:
return createTeam(_that);case _UpdateTeam() when updateTeam != null:
return updateTeam(_that);case _DeleteTeam() when deleteTeam != null:
return deleteTeam(_that);case _LoadInvitations() when loadInvitations != null:
return loadInvitations(_that);case _RespondToInvitation() when respondToInvitation != null:
return respondToInvitation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTeams value)  loadTeams,required TResult Function( _CreateTeam value)  createTeam,required TResult Function( _UpdateTeam value)  updateTeam,required TResult Function( _DeleteTeam value)  deleteTeam,required TResult Function( _LoadInvitations value)  loadInvitations,required TResult Function( _RespondToInvitation value)  respondToInvitation,}){
final _that = this;
switch (_that) {
case _LoadTeams():
return loadTeams(_that);case _CreateTeam():
return createTeam(_that);case _UpdateTeam():
return updateTeam(_that);case _DeleteTeam():
return deleteTeam(_that);case _LoadInvitations():
return loadInvitations(_that);case _RespondToInvitation():
return respondToInvitation(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTeams value)?  loadTeams,TResult? Function( _CreateTeam value)?  createTeam,TResult? Function( _UpdateTeam value)?  updateTeam,TResult? Function( _DeleteTeam value)?  deleteTeam,TResult? Function( _LoadInvitations value)?  loadInvitations,TResult? Function( _RespondToInvitation value)?  respondToInvitation,}){
final _that = this;
switch (_that) {
case _LoadTeams() when loadTeams != null:
return loadTeams(_that);case _CreateTeam() when createTeam != null:
return createTeam(_that);case _UpdateTeam() when updateTeam != null:
return updateTeam(_that);case _DeleteTeam() when deleteTeam != null:
return deleteTeam(_that);case _LoadInvitations() when loadInvitations != null:
return loadInvitations(_that);case _RespondToInvitation() when respondToInvitation != null:
return respondToInvitation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTeams,TResult Function( String name,  String? description)?  createTeam,TResult Function( UuidValue teamId,  String name,  String? description)?  updateTeam,TResult Function( UuidValue teamId,  bool transferAppsToOwner,  String confirmationName)?  deleteTeam,TResult Function()?  loadInvitations,TResult Function( UuidValue teamId,  bool accept)?  respondToInvitation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTeams() when loadTeams != null:
return loadTeams();case _CreateTeam() when createTeam != null:
return createTeam(_that.name,_that.description);case _UpdateTeam() when updateTeam != null:
return updateTeam(_that.teamId,_that.name,_that.description);case _DeleteTeam() when deleteTeam != null:
return deleteTeam(_that.teamId,_that.transferAppsToOwner,_that.confirmationName);case _LoadInvitations() when loadInvitations != null:
return loadInvitations();case _RespondToInvitation() when respondToInvitation != null:
return respondToInvitation(_that.teamId,_that.accept);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTeams,required TResult Function( String name,  String? description)  createTeam,required TResult Function( UuidValue teamId,  String name,  String? description)  updateTeam,required TResult Function( UuidValue teamId,  bool transferAppsToOwner,  String confirmationName)  deleteTeam,required TResult Function()  loadInvitations,required TResult Function( UuidValue teamId,  bool accept)  respondToInvitation,}) {final _that = this;
switch (_that) {
case _LoadTeams():
return loadTeams();case _CreateTeam():
return createTeam(_that.name,_that.description);case _UpdateTeam():
return updateTeam(_that.teamId,_that.name,_that.description);case _DeleteTeam():
return deleteTeam(_that.teamId,_that.transferAppsToOwner,_that.confirmationName);case _LoadInvitations():
return loadInvitations();case _RespondToInvitation():
return respondToInvitation(_that.teamId,_that.accept);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTeams,TResult? Function( String name,  String? description)?  createTeam,TResult? Function( UuidValue teamId,  String name,  String? description)?  updateTeam,TResult? Function( UuidValue teamId,  bool transferAppsToOwner,  String confirmationName)?  deleteTeam,TResult? Function()?  loadInvitations,TResult? Function( UuidValue teamId,  bool accept)?  respondToInvitation,}) {final _that = this;
switch (_that) {
case _LoadTeams() when loadTeams != null:
return loadTeams();case _CreateTeam() when createTeam != null:
return createTeam(_that.name,_that.description);case _UpdateTeam() when updateTeam != null:
return updateTeam(_that.teamId,_that.name,_that.description);case _DeleteTeam() when deleteTeam != null:
return deleteTeam(_that.teamId,_that.transferAppsToOwner,_that.confirmationName);case _LoadInvitations() when loadInvitations != null:
return loadInvitations();case _RespondToInvitation() when respondToInvitation != null:
return respondToInvitation(_that.teamId,_that.accept);case _:
  return null;

}
}

}

/// @nodoc


class _LoadTeams implements TeamEvent {
  const _LoadTeams();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTeams);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamEvent.loadTeams()';
}


}




/// @nodoc


class _CreateTeam implements TeamEvent {
  const _CreateTeam({required this.name, this.description});
  

 final  String name;
 final  String? description;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTeamCopyWith<_CreateTeam> get copyWith => __$CreateTeamCopyWithImpl<_CreateTeam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTeam&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'TeamEvent.createTeam(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateTeamCopyWith<$Res> implements $TeamEventCopyWith<$Res> {
  factory _$CreateTeamCopyWith(_CreateTeam value, $Res Function(_CreateTeam) _then) = __$CreateTeamCopyWithImpl;
@useResult
$Res call({
 String name, String? description
});




}
/// @nodoc
class __$CreateTeamCopyWithImpl<$Res>
    implements _$CreateTeamCopyWith<$Res> {
  __$CreateTeamCopyWithImpl(this._self, this._then);

  final _CreateTeam _self;
  final $Res Function(_CreateTeam) _then;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(_CreateTeam(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UpdateTeam implements TeamEvent {
  const _UpdateTeam({required this.teamId, required this.name, this.description});
  

 final  UuidValue teamId;
 final  String name;
 final  String? description;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTeamCopyWith<_UpdateTeam> get copyWith => __$UpdateTeamCopyWithImpl<_UpdateTeam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTeam&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,name,description);

@override
String toString() {
  return 'TeamEvent.updateTeam(teamId: $teamId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$UpdateTeamCopyWith<$Res> implements $TeamEventCopyWith<$Res> {
  factory _$UpdateTeamCopyWith(_UpdateTeam value, $Res Function(_UpdateTeam) _then) = __$UpdateTeamCopyWithImpl;
@useResult
$Res call({
 UuidValue teamId, String name, String? description
});




}
/// @nodoc
class __$UpdateTeamCopyWithImpl<$Res>
    implements _$UpdateTeamCopyWith<$Res> {
  __$UpdateTeamCopyWithImpl(this._self, this._then);

  final _UpdateTeam _self;
  final $Res Function(_UpdateTeam) _then;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_UpdateTeam(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _DeleteTeam implements TeamEvent {
  const _DeleteTeam({required this.teamId, required this.transferAppsToOwner, required this.confirmationName});
  

 final  UuidValue teamId;
 final  bool transferAppsToOwner;
 final  String confirmationName;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTeamCopyWith<_DeleteTeam> get copyWith => __$DeleteTeamCopyWithImpl<_DeleteTeam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTeam&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.transferAppsToOwner, transferAppsToOwner) || other.transferAppsToOwner == transferAppsToOwner)&&(identical(other.confirmationName, confirmationName) || other.confirmationName == confirmationName));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,transferAppsToOwner,confirmationName);

@override
String toString() {
  return 'TeamEvent.deleteTeam(teamId: $teamId, transferAppsToOwner: $transferAppsToOwner, confirmationName: $confirmationName)';
}


}

/// @nodoc
abstract mixin class _$DeleteTeamCopyWith<$Res> implements $TeamEventCopyWith<$Res> {
  factory _$DeleteTeamCopyWith(_DeleteTeam value, $Res Function(_DeleteTeam) _then) = __$DeleteTeamCopyWithImpl;
@useResult
$Res call({
 UuidValue teamId, bool transferAppsToOwner, String confirmationName
});




}
/// @nodoc
class __$DeleteTeamCopyWithImpl<$Res>
    implements _$DeleteTeamCopyWith<$Res> {
  __$DeleteTeamCopyWithImpl(this._self, this._then);

  final _DeleteTeam _self;
  final $Res Function(_DeleteTeam) _then;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? transferAppsToOwner = null,Object? confirmationName = null,}) {
  return _then(_DeleteTeam(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue,transferAppsToOwner: null == transferAppsToOwner ? _self.transferAppsToOwner : transferAppsToOwner // ignore: cast_nullable_to_non_nullable
as bool,confirmationName: null == confirmationName ? _self.confirmationName : confirmationName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadInvitations implements TeamEvent {
  const _LoadInvitations();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInvitations);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamEvent.loadInvitations()';
}


}




/// @nodoc


class _RespondToInvitation implements TeamEvent {
  const _RespondToInvitation({required this.teamId, required this.accept});
  

 final  UuidValue teamId;
 final  bool accept;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespondToInvitationCopyWith<_RespondToInvitation> get copyWith => __$RespondToInvitationCopyWithImpl<_RespondToInvitation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RespondToInvitation&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.accept, accept) || other.accept == accept));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,accept);

@override
String toString() {
  return 'TeamEvent.respondToInvitation(teamId: $teamId, accept: $accept)';
}


}

/// @nodoc
abstract mixin class _$RespondToInvitationCopyWith<$Res> implements $TeamEventCopyWith<$Res> {
  factory _$RespondToInvitationCopyWith(_RespondToInvitation value, $Res Function(_RespondToInvitation) _then) = __$RespondToInvitationCopyWithImpl;
@useResult
$Res call({
 UuidValue teamId, bool accept
});




}
/// @nodoc
class __$RespondToInvitationCopyWithImpl<$Res>
    implements _$RespondToInvitationCopyWith<$Res> {
  __$RespondToInvitationCopyWithImpl(this._self, this._then);

  final _RespondToInvitation _self;
  final $Res Function(_RespondToInvitation) _then;

/// Create a copy of TeamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? accept = null,}) {
  return _then(_RespondToInvitation(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue,accept: null == accept ? _self.accept : accept // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TeamState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamState()';
}


}

/// @nodoc
class $TeamStateCopyWith<$Res>  {
$TeamStateCopyWith(TeamState _, $Res Function(TeamState) __);
}


/// Adds pattern-matching-related methods to [TeamState].
extension TeamStatePatterns on TeamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( TeamLoading value)?  teamLoading,TResult Function( TeamLoaded value)?  teamLoaded,TResult Function( TeamError value)?  teamError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case TeamLoading() when teamLoading != null:
return teamLoading(_that);case TeamLoaded() when teamLoaded != null:
return teamLoaded(_that);case TeamError() when teamError != null:
return teamError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( TeamLoading value)  teamLoading,required TResult Function( TeamLoaded value)  teamLoaded,required TResult Function( TeamError value)  teamError,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case TeamLoading():
return teamLoading(_that);case TeamLoaded():
return teamLoaded(_that);case TeamError():
return teamError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( TeamLoading value)?  teamLoading,TResult? Function( TeamLoaded value)?  teamLoaded,TResult? Function( TeamError value)?  teamError,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case TeamLoading() when teamLoading != null:
return teamLoading(_that);case TeamLoaded() when teamLoaded != null:
return teamLoaded(_that);case TeamError() when teamError != null:
return teamError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  teamLoading,TResult Function( UuidValue? currentUserId,  List<Team> teams,  List<TeamMember> invitations)?  teamLoaded,TResult Function( String message)?  teamError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case TeamLoading() when teamLoading != null:
return teamLoading();case TeamLoaded() when teamLoaded != null:
return teamLoaded(_that.currentUserId,_that.teams,_that.invitations);case TeamError() when teamError != null:
return teamError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  teamLoading,required TResult Function( UuidValue? currentUserId,  List<Team> teams,  List<TeamMember> invitations)  teamLoaded,required TResult Function( String message)  teamError,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case TeamLoading():
return teamLoading();case TeamLoaded():
return teamLoaded(_that.currentUserId,_that.teams,_that.invitations);case TeamError():
return teamError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  teamLoading,TResult? Function( UuidValue? currentUserId,  List<Team> teams,  List<TeamMember> invitations)?  teamLoaded,TResult? Function( String message)?  teamError,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case TeamLoading() when teamLoading != null:
return teamLoading();case TeamLoaded() when teamLoaded != null:
return teamLoaded(_that.currentUserId,_that.teams,_that.invitations);case TeamError() when teamError != null:
return teamError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements TeamState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamState.initial()';
}


}




/// @nodoc


class TeamLoading implements TeamState {
  const TeamLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamState.teamLoading()';
}


}




/// @nodoc


class TeamLoaded implements TeamState {
  const TeamLoaded({required this.currentUserId, required final  List<Team> teams, required final  List<TeamMember> invitations}): _teams = teams,_invitations = invitations;
  

 final  UuidValue? currentUserId;
 final  List<Team> _teams;
 List<Team> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

 final  List<TeamMember> _invitations;
 List<TeamMember> get invitations {
  if (_invitations is EqualUnmodifiableListView) return _invitations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invitations);
}


/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamLoadedCopyWith<TeamLoaded> get copyWith => _$TeamLoadedCopyWithImpl<TeamLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamLoaded&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&const DeepCollectionEquality().equals(other._teams, _teams)&&const DeepCollectionEquality().equals(other._invitations, _invitations));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId,const DeepCollectionEquality().hash(_teams),const DeepCollectionEquality().hash(_invitations));

@override
String toString() {
  return 'TeamState.teamLoaded(currentUserId: $currentUserId, teams: $teams, invitations: $invitations)';
}


}

/// @nodoc
abstract mixin class $TeamLoadedCopyWith<$Res> implements $TeamStateCopyWith<$Res> {
  factory $TeamLoadedCopyWith(TeamLoaded value, $Res Function(TeamLoaded) _then) = _$TeamLoadedCopyWithImpl;
@useResult
$Res call({
 UuidValue? currentUserId, List<Team> teams, List<TeamMember> invitations
});




}
/// @nodoc
class _$TeamLoadedCopyWithImpl<$Res>
    implements $TeamLoadedCopyWith<$Res> {
  _$TeamLoadedCopyWithImpl(this._self, this._then);

  final TeamLoaded _self;
  final $Res Function(TeamLoaded) _then;

/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentUserId = freezed,Object? teams = null,Object? invitations = null,}) {
  return _then(TeamLoaded(
currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as UuidValue?,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<Team>,invitations: null == invitations ? _self._invitations : invitations // ignore: cast_nullable_to_non_nullable
as List<TeamMember>,
  ));
}


}

/// @nodoc


class TeamError implements TeamState {
  const TeamError({required this.message});
  

 final  String message;

/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamErrorCopyWith<TeamError> get copyWith => _$TeamErrorCopyWithImpl<TeamError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TeamState.teamError(message: $message)';
}


}

/// @nodoc
abstract mixin class $TeamErrorCopyWith<$Res> implements $TeamStateCopyWith<$Res> {
  factory $TeamErrorCopyWith(TeamError value, $Res Function(TeamError) _then) = _$TeamErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TeamErrorCopyWithImpl<$Res>
    implements $TeamErrorCopyWith<$Res> {
  _$TeamErrorCopyWithImpl(this._self, this._then);

  final TeamError _self;
  final $Res Function(TeamError) _then;

/// Create a copy of TeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TeamError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
