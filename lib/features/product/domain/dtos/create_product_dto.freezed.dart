// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateProductDto implements DiagnosticableTreeMixin {

 String get name; int get price; String get status; String get description; String get updatedAt;
/// Create a copy of CreateProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProductDtoCopyWith<CreateProductDto> get copyWith => _$CreateProductDtoCopyWithImpl<CreateProductDto>(this as CreateProductDto, _$identity);

  /// Serializes this CreateProductDto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CreateProductDto'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductDto&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price,status,description,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CreateProductDto(name: $name, price: $price, status: $status, description: $description, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CreateProductDtoCopyWith<$Res>  {
  factory $CreateProductDtoCopyWith(CreateProductDto value, $Res Function(CreateProductDto) _then) = _$CreateProductDtoCopyWithImpl;
@useResult
$Res call({
 String name, int price, String status, String description, String updatedAt
});




}
/// @nodoc
class _$CreateProductDtoCopyWithImpl<$Res>
    implements $CreateProductDtoCopyWith<$Res> {
  _$CreateProductDtoCopyWithImpl(this._self, this._then);

  final CreateProductDto _self;
  final $Res Function(CreateProductDto) _then;

/// Create a copy of CreateProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? price = null,Object? status = null,Object? description = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateProductDto].
extension CreateProductDtoPatterns on CreateProductDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateProductDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateProductDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateProductDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateProductDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateProductDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateProductDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int price,  String status,  String description,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateProductDto() when $default != null:
return $default(_that.name,_that.price,_that.status,_that.description,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int price,  String status,  String description,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CreateProductDto():
return $default(_that.name,_that.price,_that.status,_that.description,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int price,  String status,  String description,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CreateProductDto() when $default != null:
return $default(_that.name,_that.price,_that.status,_that.description,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateProductDto with DiagnosticableTreeMixin implements CreateProductDto {
   _CreateProductDto({required this.name, required this.price, required this.status, required this.description, required this.updatedAt});
  factory _CreateProductDto.fromJson(Map<String, dynamic> json) => _$CreateProductDtoFromJson(json);

@override final  String name;
@override final  int price;
@override final  String status;
@override final  String description;
@override final  String updatedAt;

/// Create a copy of CreateProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProductDtoCopyWith<_CreateProductDto> get copyWith => __$CreateProductDtoCopyWithImpl<_CreateProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateProductDtoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CreateProductDto'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProductDto&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,price,status,description,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CreateProductDto(name: $name, price: $price, status: $status, description: $description, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CreateProductDtoCopyWith<$Res> implements $CreateProductDtoCopyWith<$Res> {
  factory _$CreateProductDtoCopyWith(_CreateProductDto value, $Res Function(_CreateProductDto) _then) = __$CreateProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, int price, String status, String description, String updatedAt
});




}
/// @nodoc
class __$CreateProductDtoCopyWithImpl<$Res>
    implements _$CreateProductDtoCopyWith<$Res> {
  __$CreateProductDtoCopyWithImpl(this._self, this._then);

  final _CreateProductDto _self;
  final $Res Function(_CreateProductDto) _then;

/// Create a copy of CreateProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? price = null,Object? status = null,Object? description = null,Object? updatedAt = null,}) {
  return _then(_CreateProductDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
