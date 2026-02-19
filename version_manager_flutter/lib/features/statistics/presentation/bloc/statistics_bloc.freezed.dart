// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatisticsEvent {

 DateTime? get dateFrom; DateTime? get dateTo; PlatformType? get platform;
/// Create a copy of StatisticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsEventCopyWith<StatisticsEvent> get copyWith => _$StatisticsEventCopyWithImpl<StatisticsEvent>(this as StatisticsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsEvent&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.platform, platform) || other.platform == platform));
}


@override
int get hashCode => Object.hash(runtimeType,dateFrom,dateTo,platform);

@override
String toString() {
  return 'StatisticsEvent(dateFrom: $dateFrom, dateTo: $dateTo, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $StatisticsEventCopyWith<$Res>  {
  factory $StatisticsEventCopyWith(StatisticsEvent value, $Res Function(StatisticsEvent) _then) = _$StatisticsEventCopyWithImpl;
@useResult
$Res call({
 DateTime? dateFrom, DateTime? dateTo, PlatformType? platform
});




}
/// @nodoc
class _$StatisticsEventCopyWithImpl<$Res>
    implements $StatisticsEventCopyWith<$Res> {
  _$StatisticsEventCopyWithImpl(this._self, this._then);

  final StatisticsEvent _self;
  final $Res Function(StatisticsEvent) _then;

/// Create a copy of StatisticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateFrom = freezed,Object? dateTo = freezed,Object? platform = freezed,}) {
  return _then(_self.copyWith(
dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformType?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatisticsEvent].
extension StatisticsEventPatterns on StatisticsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadAll value)?  loadAll,TResult Function( _UpdateFilter value)?  updateFilter,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadAll() when loadAll != null:
return loadAll(_that);case _UpdateFilter() when updateFilter != null:
return updateFilter(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadAll value)  loadAll,required TResult Function( _UpdateFilter value)  updateFilter,}){
final _that = this;
switch (_that) {
case _LoadAll():
return loadAll(_that);case _UpdateFilter():
return updateFilter(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadAll value)?  loadAll,TResult? Function( _UpdateFilter value)?  updateFilter,}){
final _that = this;
switch (_that) {
case _LoadAll() when loadAll != null:
return loadAll(_that);case _UpdateFilter() when updateFilter != null:
return updateFilter(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UuidValue applicationId,  DateTime? dateFrom,  DateTime? dateTo,  PlatformType? platform)?  loadAll,TResult Function( DateTime? dateFrom,  DateTime? dateTo,  PlatformType? platform)?  updateFilter,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadAll() when loadAll != null:
return loadAll(_that.applicationId,_that.dateFrom,_that.dateTo,_that.platform);case _UpdateFilter() when updateFilter != null:
return updateFilter(_that.dateFrom,_that.dateTo,_that.platform);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UuidValue applicationId,  DateTime? dateFrom,  DateTime? dateTo,  PlatformType? platform)  loadAll,required TResult Function( DateTime? dateFrom,  DateTime? dateTo,  PlatformType? platform)  updateFilter,}) {final _that = this;
switch (_that) {
case _LoadAll():
return loadAll(_that.applicationId,_that.dateFrom,_that.dateTo,_that.platform);case _UpdateFilter():
return updateFilter(_that.dateFrom,_that.dateTo,_that.platform);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UuidValue applicationId,  DateTime? dateFrom,  DateTime? dateTo,  PlatformType? platform)?  loadAll,TResult? Function( DateTime? dateFrom,  DateTime? dateTo,  PlatformType? platform)?  updateFilter,}) {final _that = this;
switch (_that) {
case _LoadAll() when loadAll != null:
return loadAll(_that.applicationId,_that.dateFrom,_that.dateTo,_that.platform);case _UpdateFilter() when updateFilter != null:
return updateFilter(_that.dateFrom,_that.dateTo,_that.platform);case _:
  return null;

}
}

}

/// @nodoc


class _LoadAll implements StatisticsEvent {
  const _LoadAll({required this.applicationId, this.dateFrom, this.dateTo, this.platform});
  

 final  UuidValue applicationId;
@override final  DateTime? dateFrom;
@override final  DateTime? dateTo;
@override final  PlatformType? platform;

/// Create a copy of StatisticsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadAllCopyWith<_LoadAll> get copyWith => __$LoadAllCopyWithImpl<_LoadAll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAll&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.platform, platform) || other.platform == platform));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,dateFrom,dateTo,platform);

@override
String toString() {
  return 'StatisticsEvent.loadAll(applicationId: $applicationId, dateFrom: $dateFrom, dateTo: $dateTo, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$LoadAllCopyWith<$Res> implements $StatisticsEventCopyWith<$Res> {
  factory _$LoadAllCopyWith(_LoadAll value, $Res Function(_LoadAll) _then) = __$LoadAllCopyWithImpl;
@override @useResult
$Res call({
 UuidValue applicationId, DateTime? dateFrom, DateTime? dateTo, PlatformType? platform
});




}
/// @nodoc
class __$LoadAllCopyWithImpl<$Res>
    implements _$LoadAllCopyWith<$Res> {
  __$LoadAllCopyWithImpl(this._self, this._then);

  final _LoadAll _self;
  final $Res Function(_LoadAll) _then;

/// Create a copy of StatisticsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? dateFrom = freezed,Object? dateTo = freezed,Object? platform = freezed,}) {
  return _then(_LoadAll(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as UuidValue,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformType?,
  ));
}


}

/// @nodoc


class _UpdateFilter implements StatisticsEvent {
  const _UpdateFilter({this.dateFrom, this.dateTo, this.platform});
  

@override final  DateTime? dateFrom;
@override final  DateTime? dateTo;
@override final  PlatformType? platform;

/// Create a copy of StatisticsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFilterCopyWith<_UpdateFilter> get copyWith => __$UpdateFilterCopyWithImpl<_UpdateFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFilter&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.platform, platform) || other.platform == platform));
}


@override
int get hashCode => Object.hash(runtimeType,dateFrom,dateTo,platform);

@override
String toString() {
  return 'StatisticsEvent.updateFilter(dateFrom: $dateFrom, dateTo: $dateTo, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$UpdateFilterCopyWith<$Res> implements $StatisticsEventCopyWith<$Res> {
  factory _$UpdateFilterCopyWith(_UpdateFilter value, $Res Function(_UpdateFilter) _then) = __$UpdateFilterCopyWithImpl;
@override @useResult
$Res call({
 DateTime? dateFrom, DateTime? dateTo, PlatformType? platform
});




}
/// @nodoc
class __$UpdateFilterCopyWithImpl<$Res>
    implements _$UpdateFilterCopyWith<$Res> {
  __$UpdateFilterCopyWithImpl(this._self, this._then);

  final _UpdateFilter _self;
  final $Res Function(_UpdateFilter) _then;

/// Create a copy of StatisticsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateFrom = freezed,Object? dateTo = freezed,Object? platform = freezed,}) {
  return _then(_UpdateFilter(
dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformType?,
  ));
}


}

/// @nodoc
mixin _$StatisticsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatisticsState()';
}


}

/// @nodoc
class $StatisticsStateCopyWith<$Res>  {
$StatisticsStateCopyWith(StatisticsState _, $Res Function(StatisticsState) __);
}


/// Adds pattern-matching-related methods to [StatisticsState].
extension StatisticsStatePatterns on StatisticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StatisticsInitial value)?  initial,TResult Function( StatisticsLoading value)?  loading,TResult Function( StatisticsLoaded value)?  loaded,TResult Function( StatisticsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StatisticsInitial() when initial != null:
return initial(_that);case StatisticsLoading() when loading != null:
return loading(_that);case StatisticsLoaded() when loaded != null:
return loaded(_that);case StatisticsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StatisticsInitial value)  initial,required TResult Function( StatisticsLoading value)  loading,required TResult Function( StatisticsLoaded value)  loaded,required TResult Function( StatisticsError value)  error,}){
final _that = this;
switch (_that) {
case StatisticsInitial():
return initial(_that);case StatisticsLoading():
return loading(_that);case StatisticsLoaded():
return loaded(_that);case StatisticsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StatisticsInitial value)?  initial,TResult? Function( StatisticsLoading value)?  loading,TResult? Function( StatisticsLoaded value)?  loaded,TResult? Function( StatisticsError value)?  error,}){
final _that = this;
switch (_that) {
case StatisticsInitial() when initial != null:
return initial(_that);case StatisticsLoading() when loading != null:
return loading(_that);case StatisticsLoaded() when loaded != null:
return loaded(_that);case StatisticsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( StatisticsOverviewResponse overview,  DailyActiveUsersResponse dailyUsers,  VersionStatisticsResponse versions,  PlatformStatisticsResponse platforms,  GeoStatisticsResponse geo,  TimeAnalyticsResponse timeAnalytics,  StatisticsFilter filter)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StatisticsInitial() when initial != null:
return initial();case StatisticsLoading() when loading != null:
return loading();case StatisticsLoaded() when loaded != null:
return loaded(_that.overview,_that.dailyUsers,_that.versions,_that.platforms,_that.geo,_that.timeAnalytics,_that.filter);case StatisticsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( StatisticsOverviewResponse overview,  DailyActiveUsersResponse dailyUsers,  VersionStatisticsResponse versions,  PlatformStatisticsResponse platforms,  GeoStatisticsResponse geo,  TimeAnalyticsResponse timeAnalytics,  StatisticsFilter filter)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case StatisticsInitial():
return initial();case StatisticsLoading():
return loading();case StatisticsLoaded():
return loaded(_that.overview,_that.dailyUsers,_that.versions,_that.platforms,_that.geo,_that.timeAnalytics,_that.filter);case StatisticsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( StatisticsOverviewResponse overview,  DailyActiveUsersResponse dailyUsers,  VersionStatisticsResponse versions,  PlatformStatisticsResponse platforms,  GeoStatisticsResponse geo,  TimeAnalyticsResponse timeAnalytics,  StatisticsFilter filter)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case StatisticsInitial() when initial != null:
return initial();case StatisticsLoading() when loading != null:
return loading();case StatisticsLoaded() when loaded != null:
return loaded(_that.overview,_that.dailyUsers,_that.versions,_that.platforms,_that.geo,_that.timeAnalytics,_that.filter);case StatisticsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class StatisticsInitial implements StatisticsState {
  const StatisticsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatisticsState.initial()';
}


}




/// @nodoc


class StatisticsLoading implements StatisticsState {
  const StatisticsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatisticsState.loading()';
}


}




/// @nodoc


class StatisticsLoaded implements StatisticsState {
  const StatisticsLoaded({required this.overview, required this.dailyUsers, required this.versions, required this.platforms, required this.geo, required this.timeAnalytics, required this.filter});
  

 final  StatisticsOverviewResponse overview;
 final  DailyActiveUsersResponse dailyUsers;
 final  VersionStatisticsResponse versions;
 final  PlatformStatisticsResponse platforms;
 final  GeoStatisticsResponse geo;
 final  TimeAnalyticsResponse timeAnalytics;
 final  StatisticsFilter filter;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsLoadedCopyWith<StatisticsLoaded> get copyWith => _$StatisticsLoadedCopyWithImpl<StatisticsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsLoaded&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.dailyUsers, dailyUsers) || other.dailyUsers == dailyUsers)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.platforms, platforms) || other.platforms == platforms)&&(identical(other.geo, geo) || other.geo == geo)&&(identical(other.timeAnalytics, timeAnalytics) || other.timeAnalytics == timeAnalytics)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,overview,dailyUsers,versions,platforms,geo,timeAnalytics,filter);

@override
String toString() {
  return 'StatisticsState.loaded(overview: $overview, dailyUsers: $dailyUsers, versions: $versions, platforms: $platforms, geo: $geo, timeAnalytics: $timeAnalytics, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $StatisticsLoadedCopyWith<$Res> implements $StatisticsStateCopyWith<$Res> {
  factory $StatisticsLoadedCopyWith(StatisticsLoaded value, $Res Function(StatisticsLoaded) _then) = _$StatisticsLoadedCopyWithImpl;
@useResult
$Res call({
 StatisticsOverviewResponse overview, DailyActiveUsersResponse dailyUsers, VersionStatisticsResponse versions, PlatformStatisticsResponse platforms, GeoStatisticsResponse geo, TimeAnalyticsResponse timeAnalytics, StatisticsFilter filter
});




}
/// @nodoc
class _$StatisticsLoadedCopyWithImpl<$Res>
    implements $StatisticsLoadedCopyWith<$Res> {
  _$StatisticsLoadedCopyWithImpl(this._self, this._then);

  final StatisticsLoaded _self;
  final $Res Function(StatisticsLoaded) _then;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? overview = null,Object? dailyUsers = null,Object? versions = null,Object? platforms = null,Object? geo = null,Object? timeAnalytics = null,Object? filter = null,}) {
  return _then(StatisticsLoaded(
overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as StatisticsOverviewResponse,dailyUsers: null == dailyUsers ? _self.dailyUsers : dailyUsers // ignore: cast_nullable_to_non_nullable
as DailyActiveUsersResponse,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as VersionStatisticsResponse,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as PlatformStatisticsResponse,geo: null == geo ? _self.geo : geo // ignore: cast_nullable_to_non_nullable
as GeoStatisticsResponse,timeAnalytics: null == timeAnalytics ? _self.timeAnalytics : timeAnalytics // ignore: cast_nullable_to_non_nullable
as TimeAnalyticsResponse,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as StatisticsFilter,
  ));
}


}

/// @nodoc


class StatisticsError implements StatisticsState {
  const StatisticsError({required this.message});
  

 final  String message;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsErrorCopyWith<StatisticsError> get copyWith => _$StatisticsErrorCopyWithImpl<StatisticsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StatisticsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $StatisticsErrorCopyWith<$Res> implements $StatisticsStateCopyWith<$Res> {
  factory $StatisticsErrorCopyWith(StatisticsError value, $Res Function(StatisticsError) _then) = _$StatisticsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StatisticsErrorCopyWithImpl<$Res>
    implements $StatisticsErrorCopyWith<$Res> {
  _$StatisticsErrorCopyWithImpl(this._self, this._then);

  final StatisticsError _self;
  final $Res Function(StatisticsError) _then;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StatisticsError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
