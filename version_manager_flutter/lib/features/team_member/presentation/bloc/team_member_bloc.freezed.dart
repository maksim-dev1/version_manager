// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_member_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamMemberEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMemberEvent()';
}


}

/// @nodoc
class $TeamMemberEventCopyWith<$Res>  {
$TeamMemberEventCopyWith(TeamMemberEvent _, $Res Function(TeamMemberEvent) __);
}


/// Adds pattern-matching-related methods to [TeamMemberEvent].
extension TeamMemberEventPatterns on TeamMemberEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InviteMember value)?  inviteMember,TResult Function( _RemoveMember value)?  removeMember,TResult Function( _UpdateMemberRole value)?  updateMemberRole,TResult Function( _RevokeInvitation value)?  revokeInvitation,TResult Function( _LeaveTeam value)?  leaveTeam,TResult Function( _TransferOwnership value)?  transferOwnership,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InviteMember() when inviteMember != null:
return inviteMember(_that);case _RemoveMember() when removeMember != null:
return removeMember(_that);case _UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that);case _RevokeInvitation() when revokeInvitation != null:
return revokeInvitation(_that);case _LeaveTeam() when leaveTeam != null:
return leaveTeam(_that);case _TransferOwnership() when transferOwnership != null:
return transferOwnership(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InviteMember value)  inviteMember,required TResult Function( _RemoveMember value)  removeMember,required TResult Function( _UpdateMemberRole value)  updateMemberRole,required TResult Function( _RevokeInvitation value)  revokeInvitation,required TResult Function( _LeaveTeam value)  leaveTeam,required TResult Function( _TransferOwnership value)  transferOwnership,}){
final _that = this;
switch (_that) {
case _InviteMember():
return inviteMember(_that);case _RemoveMember():
return removeMember(_that);case _UpdateMemberRole():
return updateMemberRole(_that);case _RevokeInvitation():
return revokeInvitation(_that);case _LeaveTeam():
return leaveTeam(_that);case _TransferOwnership():
return transferOwnership(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InviteMember value)?  inviteMember,TResult? Function( _RemoveMember value)?  removeMember,TResult? Function( _UpdateMemberRole value)?  updateMemberRole,TResult? Function( _RevokeInvitation value)?  revokeInvitation,TResult? Function( _LeaveTeam value)?  leaveTeam,TResult? Function( _TransferOwnership value)?  transferOwnership,}){
final _that = this;
switch (_that) {
case _InviteMember() when inviteMember != null:
return inviteMember(_that);case _RemoveMember() when removeMember != null:
return removeMember(_that);case _UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that);case _RevokeInvitation() when revokeInvitation != null:
return revokeInvitation(_that);case _LeaveTeam() when leaveTeam != null:
return leaveTeam(_that);case _TransferOwnership() when transferOwnership != null:
return transferOwnership(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue teamId,  String email,  TeamRoleType role)?  inviteMember,TResult Function( UuidValue memberId)?  removeMember,TResult Function( UuidValue memberId,  TeamRoleType newRole)?  updateMemberRole,TResult Function( UuidValue memberId)?  revokeInvitation,TResult Function( UuidValue teamId)?  leaveTeam,TResult Function( UuidValue teamId,  UuidValue newOwnerId)?  transferOwnership,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InviteMember() when inviteMember != null:
return inviteMember(_that.teamId,_that.email,_that.role);case _RemoveMember() when removeMember != null:
return removeMember(_that.memberId);case _UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that.memberId,_that.newRole);case _RevokeInvitation() when revokeInvitation != null:
return revokeInvitation(_that.memberId);case _LeaveTeam() when leaveTeam != null:
return leaveTeam(_that.teamId);case _TransferOwnership() when transferOwnership != null:
return transferOwnership(_that.teamId,_that.newOwnerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue teamId,  String email,  TeamRoleType role)  inviteMember,required TResult Function( UuidValue memberId)  removeMember,required TResult Function( UuidValue memberId,  TeamRoleType newRole)  updateMemberRole,required TResult Function( UuidValue memberId)  revokeInvitation,required TResult Function( UuidValue teamId)  leaveTeam,required TResult Function( UuidValue teamId,  UuidValue newOwnerId)  transferOwnership,}) {final _that = this;
switch (_that) {
case _InviteMember():
return inviteMember(_that.teamId,_that.email,_that.role);case _RemoveMember():
return removeMember(_that.memberId);case _UpdateMemberRole():
return updateMemberRole(_that.memberId,_that.newRole);case _RevokeInvitation():
return revokeInvitation(_that.memberId);case _LeaveTeam():
return leaveTeam(_that.teamId);case _TransferOwnership():
return transferOwnership(_that.teamId,_that.newOwnerId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue teamId,  String email,  TeamRoleType role)?  inviteMember,TResult? Function( UuidValue memberId)?  removeMember,TResult? Function( UuidValue memberId,  TeamRoleType newRole)?  updateMemberRole,TResult? Function( UuidValue memberId)?  revokeInvitation,TResult? Function( UuidValue teamId)?  leaveTeam,TResult? Function( UuidValue teamId,  UuidValue newOwnerId)?  transferOwnership,}) {final _that = this;
switch (_that) {
case _InviteMember() when inviteMember != null:
return inviteMember(_that.teamId,_that.email,_that.role);case _RemoveMember() when removeMember != null:
return removeMember(_that.memberId);case _UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that.memberId,_that.newRole);case _RevokeInvitation() when revokeInvitation != null:
return revokeInvitation(_that.memberId);case _LeaveTeam() when leaveTeam != null:
return leaveTeam(_that.teamId);case _TransferOwnership() when transferOwnership != null:
return transferOwnership(_that.teamId,_that.newOwnerId);case _:
  return null;

}
}

}

/// @nodoc


class _InviteMember implements TeamMemberEvent {
  const _InviteMember({required this.teamId, required this.email, required this.role});
  

 final  UuidValue teamId;
 final  String email;
 final  TeamRoleType role;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteMemberCopyWith<_InviteMember> get copyWith => __$InviteMemberCopyWithImpl<_InviteMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteMember&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,email,role);

@override
String toString() {
  return 'TeamMemberEvent.inviteMember(teamId: $teamId, email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class _$InviteMemberCopyWith<$Res> implements $TeamMemberEventCopyWith<$Res> {
  factory _$InviteMemberCopyWith(_InviteMember value, $Res Function(_InviteMember) _then) = __$InviteMemberCopyWithImpl;
@useResult
$Res call({
 UuidValue teamId, String email, TeamRoleType role
});




}
/// @nodoc
class __$InviteMemberCopyWithImpl<$Res>
    implements _$InviteMemberCopyWith<$Res> {
  __$InviteMemberCopyWithImpl(this._self, this._then);

  final _InviteMember _self;
  final $Res Function(_InviteMember) _then;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? email = null,Object? role = null,}) {
  return _then(_InviteMember(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as TeamRoleType,
  ));
}


}

/// @nodoc


class _RemoveMember implements TeamMemberEvent {
  const _RemoveMember({required this.memberId});
  

 final  UuidValue memberId;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveMemberCopyWith<_RemoveMember> get copyWith => __$RemoveMemberCopyWithImpl<_RemoveMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveMember&&(identical(other.memberId, memberId) || other.memberId == memberId));
}


@override
int get hashCode => Object.hash(runtimeType,memberId);

@override
String toString() {
  return 'TeamMemberEvent.removeMember(memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class _$RemoveMemberCopyWith<$Res> implements $TeamMemberEventCopyWith<$Res> {
  factory _$RemoveMemberCopyWith(_RemoveMember value, $Res Function(_RemoveMember) _then) = __$RemoveMemberCopyWithImpl;
@useResult
$Res call({
 UuidValue memberId
});




}
/// @nodoc
class __$RemoveMemberCopyWithImpl<$Res>
    implements _$RemoveMemberCopyWith<$Res> {
  __$RemoveMemberCopyWithImpl(this._self, this._then);

  final _RemoveMember _self;
  final $Res Function(_RemoveMember) _then;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? memberId = null,}) {
  return _then(_RemoveMember(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _UpdateMemberRole implements TeamMemberEvent {
  const _UpdateMemberRole({required this.memberId, required this.newRole});
  

 final  UuidValue memberId;
 final  TeamRoleType newRole;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMemberRoleCopyWith<_UpdateMemberRole> get copyWith => __$UpdateMemberRoleCopyWithImpl<_UpdateMemberRole>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMemberRole&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.newRole, newRole) || other.newRole == newRole));
}


@override
int get hashCode => Object.hash(runtimeType,memberId,newRole);

@override
String toString() {
  return 'TeamMemberEvent.updateMemberRole(memberId: $memberId, newRole: $newRole)';
}


}

/// @nodoc
abstract mixin class _$UpdateMemberRoleCopyWith<$Res> implements $TeamMemberEventCopyWith<$Res> {
  factory _$UpdateMemberRoleCopyWith(_UpdateMemberRole value, $Res Function(_UpdateMemberRole) _then) = __$UpdateMemberRoleCopyWithImpl;
@useResult
$Res call({
 UuidValue memberId, TeamRoleType newRole
});




}
/// @nodoc
class __$UpdateMemberRoleCopyWithImpl<$Res>
    implements _$UpdateMemberRoleCopyWith<$Res> {
  __$UpdateMemberRoleCopyWithImpl(this._self, this._then);

  final _UpdateMemberRole _self;
  final $Res Function(_UpdateMemberRole) _then;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? memberId = null,Object? newRole = null,}) {
  return _then(_UpdateMemberRole(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as UuidValue,newRole: null == newRole ? _self.newRole : newRole // ignore: cast_nullable_to_non_nullable
as TeamRoleType,
  ));
}


}

/// @nodoc


class _RevokeInvitation implements TeamMemberEvent {
  const _RevokeInvitation({required this.memberId});
  

 final  UuidValue memberId;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevokeInvitationCopyWith<_RevokeInvitation> get copyWith => __$RevokeInvitationCopyWithImpl<_RevokeInvitation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevokeInvitation&&(identical(other.memberId, memberId) || other.memberId == memberId));
}


@override
int get hashCode => Object.hash(runtimeType,memberId);

@override
String toString() {
  return 'TeamMemberEvent.revokeInvitation(memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class _$RevokeInvitationCopyWith<$Res> implements $TeamMemberEventCopyWith<$Res> {
  factory _$RevokeInvitationCopyWith(_RevokeInvitation value, $Res Function(_RevokeInvitation) _then) = __$RevokeInvitationCopyWithImpl;
@useResult
$Res call({
 UuidValue memberId
});




}
/// @nodoc
class __$RevokeInvitationCopyWithImpl<$Res>
    implements _$RevokeInvitationCopyWith<$Res> {
  __$RevokeInvitationCopyWithImpl(this._self, this._then);

  final _RevokeInvitation _self;
  final $Res Function(_RevokeInvitation) _then;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? memberId = null,}) {
  return _then(_RevokeInvitation(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _LeaveTeam implements TeamMemberEvent {
  const _LeaveTeam({required this.teamId});
  

 final  UuidValue teamId;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveTeamCopyWith<_LeaveTeam> get copyWith => __$LeaveTeamCopyWithImpl<_LeaveTeam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveTeam&&(identical(other.teamId, teamId) || other.teamId == teamId));
}


@override
int get hashCode => Object.hash(runtimeType,teamId);

@override
String toString() {
  return 'TeamMemberEvent.leaveTeam(teamId: $teamId)';
}


}

/// @nodoc
abstract mixin class _$LeaveTeamCopyWith<$Res> implements $TeamMemberEventCopyWith<$Res> {
  factory _$LeaveTeamCopyWith(_LeaveTeam value, $Res Function(_LeaveTeam) _then) = __$LeaveTeamCopyWithImpl;
@useResult
$Res call({
 UuidValue teamId
});




}
/// @nodoc
class __$LeaveTeamCopyWithImpl<$Res>
    implements _$LeaveTeamCopyWith<$Res> {
  __$LeaveTeamCopyWithImpl(this._self, this._then);

  final _LeaveTeam _self;
  final $Res Function(_LeaveTeam) _then;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,}) {
  return _then(_LeaveTeam(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class _TransferOwnership implements TeamMemberEvent {
  const _TransferOwnership({required this.teamId, required this.newOwnerId});
  

 final  UuidValue teamId;
 final  UuidValue newOwnerId;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferOwnershipCopyWith<_TransferOwnership> get copyWith => __$TransferOwnershipCopyWithImpl<_TransferOwnership>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferOwnership&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.newOwnerId, newOwnerId) || other.newOwnerId == newOwnerId));
}


@override
int get hashCode => Object.hash(runtimeType,teamId,newOwnerId);

@override
String toString() {
  return 'TeamMemberEvent.transferOwnership(teamId: $teamId, newOwnerId: $newOwnerId)';
}


}

/// @nodoc
abstract mixin class _$TransferOwnershipCopyWith<$Res> implements $TeamMemberEventCopyWith<$Res> {
  factory _$TransferOwnershipCopyWith(_TransferOwnership value, $Res Function(_TransferOwnership) _then) = __$TransferOwnershipCopyWithImpl;
@useResult
$Res call({
 UuidValue teamId, UuidValue newOwnerId
});




}
/// @nodoc
class __$TransferOwnershipCopyWithImpl<$Res>
    implements _$TransferOwnershipCopyWith<$Res> {
  __$TransferOwnershipCopyWithImpl(this._self, this._then);

  final _TransferOwnership _self;
  final $Res Function(_TransferOwnership) _then;

/// Create a copy of TeamMemberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,Object? newOwnerId = null,}) {
  return _then(_TransferOwnership(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as UuidValue,newOwnerId: null == newOwnerId ? _self.newOwnerId : newOwnerId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc
mixin _$TeamMemberState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMemberState()';
}


}

/// @nodoc
class $TeamMemberStateCopyWith<$Res>  {
$TeamMemberStateCopyWith(TeamMemberState _, $Res Function(TeamMemberState) __);
}


/// Adds pattern-matching-related methods to [TeamMemberState].
extension TeamMemberStatePatterns on TeamMemberState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( TeamMemberActionInProgress value)?  actionInProgress,TResult Function( TeamMemberActionSuccess value)?  actionSuccess,TResult Function( TeamMemberActionError value)?  actionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case TeamMemberActionInProgress() when actionInProgress != null:
return actionInProgress(_that);case TeamMemberActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case TeamMemberActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( TeamMemberActionInProgress value)  actionInProgress,required TResult Function( TeamMemberActionSuccess value)  actionSuccess,required TResult Function( TeamMemberActionError value)  actionError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case TeamMemberActionInProgress():
return actionInProgress(_that);case TeamMemberActionSuccess():
return actionSuccess(_that);case TeamMemberActionError():
return actionError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( TeamMemberActionInProgress value)?  actionInProgress,TResult? Function( TeamMemberActionSuccess value)?  actionSuccess,TResult? Function( TeamMemberActionError value)?  actionError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case TeamMemberActionInProgress() when actionInProgress != null:
return actionInProgress(_that);case TeamMemberActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case TeamMemberActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  actionInProgress,TResult Function( String message)?  actionSuccess,TResult Function( String message)?  actionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case TeamMemberActionInProgress() when actionInProgress != null:
return actionInProgress();case TeamMemberActionSuccess() when actionSuccess != null:
return actionSuccess(_that.message);case TeamMemberActionError() when actionError != null:
return actionError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  actionInProgress,required TResult Function( String message)  actionSuccess,required TResult Function( String message)  actionError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case TeamMemberActionInProgress():
return actionInProgress();case TeamMemberActionSuccess():
return actionSuccess(_that.message);case TeamMemberActionError():
return actionError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  actionInProgress,TResult? Function( String message)?  actionSuccess,TResult? Function( String message)?  actionError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case TeamMemberActionInProgress() when actionInProgress != null:
return actionInProgress();case TeamMemberActionSuccess() when actionSuccess != null:
return actionSuccess(_that.message);case TeamMemberActionError() when actionError != null:
return actionError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TeamMemberState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMemberState.initial()';
}


}




/// @nodoc


class TeamMemberActionInProgress implements TeamMemberState {
  const TeamMemberActionInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberActionInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMemberState.actionInProgress()';
}


}




/// @nodoc


class TeamMemberActionSuccess implements TeamMemberState {
  const TeamMemberActionSuccess({required this.message});
  

 final  String message;

/// Create a copy of TeamMemberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberActionSuccessCopyWith<TeamMemberActionSuccess> get copyWith => _$TeamMemberActionSuccessCopyWithImpl<TeamMemberActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberActionSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TeamMemberState.actionSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $TeamMemberActionSuccessCopyWith<$Res> implements $TeamMemberStateCopyWith<$Res> {
  factory $TeamMemberActionSuccessCopyWith(TeamMemberActionSuccess value, $Res Function(TeamMemberActionSuccess) _then) = _$TeamMemberActionSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TeamMemberActionSuccessCopyWithImpl<$Res>
    implements $TeamMemberActionSuccessCopyWith<$Res> {
  _$TeamMemberActionSuccessCopyWithImpl(this._self, this._then);

  final TeamMemberActionSuccess _self;
  final $Res Function(TeamMemberActionSuccess) _then;

/// Create a copy of TeamMemberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TeamMemberActionSuccess(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TeamMemberActionError implements TeamMemberState {
  const TeamMemberActionError({required this.message});
  

 final  String message;

/// Create a copy of TeamMemberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberActionErrorCopyWith<TeamMemberActionError> get copyWith => _$TeamMemberActionErrorCopyWithImpl<TeamMemberActionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberActionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TeamMemberState.actionError(message: $message)';
}


}

/// @nodoc
abstract mixin class $TeamMemberActionErrorCopyWith<$Res> implements $TeamMemberStateCopyWith<$Res> {
  factory $TeamMemberActionErrorCopyWith(TeamMemberActionError value, $Res Function(TeamMemberActionError) _then) = _$TeamMemberActionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TeamMemberActionErrorCopyWithImpl<$Res>
    implements $TeamMemberActionErrorCopyWith<$Res> {
  _$TeamMemberActionErrorCopyWithImpl(this._self, this._then);

  final TeamMemberActionError _self;
  final $Res Function(TeamMemberActionError) _then;

/// Create a copy of TeamMemberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TeamMemberActionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
