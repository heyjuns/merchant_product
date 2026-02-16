// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ErrorException {

 String get message;
/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorExceptionCopyWith<ErrorException> get copyWith => _$ErrorExceptionCopyWithImpl<ErrorException>(this as ErrorException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ErrorException(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorExceptionCopyWith<$Res>  {
  factory $ErrorExceptionCopyWith(ErrorException value, $Res Function(ErrorException) _then) = _$ErrorExceptionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorExceptionCopyWithImpl<$Res>
    implements $ErrorExceptionCopyWith<$Res> {
  _$ErrorExceptionCopyWithImpl(this._self, this._then);

  final ErrorException _self;
  final $Res Function(ErrorException) _then;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorException].
extension ErrorExceptionPatterns on ErrorException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerException value)?  server,TResult Function( TimeoutException value)?  timeout,TResult Function( NetworkException value)?  network,TResult Function( CacheException value)?  cache,TResult Function( ConflictException value)?  conflict,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that);case TimeoutException() when timeout != null:
return timeout(_that);case NetworkException() when network != null:
return network(_that);case CacheException() when cache != null:
return cache(_that);case ConflictException() when conflict != null:
return conflict(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerException value)  server,required TResult Function( TimeoutException value)  timeout,required TResult Function( NetworkException value)  network,required TResult Function( CacheException value)  cache,required TResult Function( ConflictException value)  conflict,}){
final _that = this;
switch (_that) {
case ServerException():
return server(_that);case TimeoutException():
return timeout(_that);case NetworkException():
return network(_that);case CacheException():
return cache(_that);case ConflictException():
return conflict(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerException value)?  server,TResult? Function( TimeoutException value)?  timeout,TResult? Function( NetworkException value)?  network,TResult? Function( CacheException value)?  cache,TResult? Function( ConflictException value)?  conflict,}){
final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that);case TimeoutException() when timeout != null:
return timeout(_that);case NetworkException() when network != null:
return network(_that);case CacheException() when cache != null:
return cache(_that);case ConflictException() when conflict != null:
return conflict(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  int? code)?  server,TResult Function( String message)?  timeout,TResult Function( String message)?  network,TResult Function( String message)?  cache,TResult Function( String message)?  conflict,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that.message,_that.code);case TimeoutException() when timeout != null:
return timeout(_that.message);case NetworkException() when network != null:
return network(_that.message);case CacheException() when cache != null:
return cache(_that.message);case ConflictException() when conflict != null:
return conflict(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  int? code)  server,required TResult Function( String message)  timeout,required TResult Function( String message)  network,required TResult Function( String message)  cache,required TResult Function( String message)  conflict,}) {final _that = this;
switch (_that) {
case ServerException():
return server(_that.message,_that.code);case TimeoutException():
return timeout(_that.message);case NetworkException():
return network(_that.message);case CacheException():
return cache(_that.message);case ConflictException():
return conflict(_that.message);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  int? code)?  server,TResult? Function( String message)?  timeout,TResult? Function( String message)?  network,TResult? Function( String message)?  cache,TResult? Function( String message)?  conflict,}) {final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that.message,_that.code);case TimeoutException() when timeout != null:
return timeout(_that.message);case NetworkException() when network != null:
return network(_that.message);case CacheException() when cache != null:
return cache(_that.message);case ConflictException() when conflict != null:
return conflict(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServerException implements ErrorException {
  const ServerException({required this.message, this.code});
  

@override final  String message;
 final  int? code;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,message,code);

@override
String toString() {
  return 'ErrorException.server(message: $message, code: $code)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res> implements $ErrorExceptionCopyWith<$Res> {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, int? code
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,}) {
  return _then(ServerException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class TimeoutException implements ErrorException {
  const TimeoutException({required this.message});
  

@override final  String message;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutExceptionCopyWith<TimeoutException> get copyWith => _$TimeoutExceptionCopyWithImpl<TimeoutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ErrorException.timeout(message: $message)';
}


}

/// @nodoc
abstract mixin class $TimeoutExceptionCopyWith<$Res> implements $ErrorExceptionCopyWith<$Res> {
  factory $TimeoutExceptionCopyWith(TimeoutException value, $Res Function(TimeoutException) _then) = _$TimeoutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TimeoutExceptionCopyWithImpl<$Res>
    implements $TimeoutExceptionCopyWith<$Res> {
  _$TimeoutExceptionCopyWithImpl(this._self, this._then);

  final TimeoutException _self;
  final $Res Function(TimeoutException) _then;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TimeoutException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkException implements ErrorException {
  const NetworkException({required this.message});
  

@override final  String message;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ErrorException.network(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res> implements $ErrorExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CacheException implements ErrorException {
  const CacheException({required this.message});
  

@override final  String message;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheExceptionCopyWith<CacheException> get copyWith => _$CacheExceptionCopyWithImpl<CacheException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ErrorException.cache(message: $message)';
}


}

/// @nodoc
abstract mixin class $CacheExceptionCopyWith<$Res> implements $ErrorExceptionCopyWith<$Res> {
  factory $CacheExceptionCopyWith(CacheException value, $Res Function(CacheException) _then) = _$CacheExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CacheExceptionCopyWithImpl<$Res>
    implements $CacheExceptionCopyWith<$Res> {
  _$CacheExceptionCopyWithImpl(this._self, this._then);

  final CacheException _self;
  final $Res Function(CacheException) _then;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CacheException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConflictException implements ErrorException {
  const ConflictException({required this.message});
  

@override final  String message;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictExceptionCopyWith<ConflictException> get copyWith => _$ConflictExceptionCopyWithImpl<ConflictException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ErrorException.conflict(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConflictExceptionCopyWith<$Res> implements $ErrorExceptionCopyWith<$Res> {
  factory $ConflictExceptionCopyWith(ConflictException value, $Res Function(ConflictException) _then) = _$ConflictExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConflictExceptionCopyWithImpl<$Res>
    implements $ConflictExceptionCopyWith<$Res> {
  _$ConflictExceptionCopyWithImpl(this._self, this._then);

  final ConflictException _self;
  final $Res Function(ConflictException) _then;

/// Create a copy of ErrorException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConflictException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
