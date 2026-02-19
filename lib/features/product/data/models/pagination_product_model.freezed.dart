// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationProductModel implements DiagnosticableTreeMixin {

 int get total; List<ProductModel> get products;
/// Create a copy of PaginationProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationProductModelCopyWith<PaginationProductModel> get copyWith => _$PaginationProductModelCopyWithImpl<PaginationProductModel>(this as PaginationProductModel, _$identity);

  /// Serializes this PaginationProductModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationProductModel'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('products', products));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationProductModel&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(products));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationProductModel(total: $total, products: $products)';
}


}

/// @nodoc
abstract mixin class $PaginationProductModelCopyWith<$Res>  {
  factory $PaginationProductModelCopyWith(PaginationProductModel value, $Res Function(PaginationProductModel) _then) = _$PaginationProductModelCopyWithImpl;
@useResult
$Res call({
 int total, List<ProductModel> products
});




}
/// @nodoc
class _$PaginationProductModelCopyWithImpl<$Res>
    implements $PaginationProductModelCopyWith<$Res> {
  _$PaginationProductModelCopyWithImpl(this._self, this._then);

  final PaginationProductModel _self;
  final $Res Function(PaginationProductModel) _then;

/// Create a copy of PaginationProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? products = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationProductModel].
extension PaginationProductModelPatterns on PaginationProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationProductModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  List<ProductModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationProductModel() when $default != null:
return $default(_that.total,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  List<ProductModel> products)  $default,) {final _that = this;
switch (_that) {
case _PaginationProductModel():
return $default(_that.total,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  List<ProductModel> products)?  $default,) {final _that = this;
switch (_that) {
case _PaginationProductModel() when $default != null:
return $default(_that.total,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationProductModel with DiagnosticableTreeMixin implements PaginationProductModel {
   _PaginationProductModel({required this.total, required final  List<ProductModel> products}): _products = products;
  factory _PaginationProductModel.fromJson(Map<String, dynamic> json) => _$PaginationProductModelFromJson(json);

@override final  int total;
 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of PaginationProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationProductModelCopyWith<_PaginationProductModel> get copyWith => __$PaginationProductModelCopyWithImpl<_PaginationProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationProductModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationProductModel'))
    ..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('products', products));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationProductModel&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_products));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationProductModel(total: $total, products: $products)';
}


}

/// @nodoc
abstract mixin class _$PaginationProductModelCopyWith<$Res> implements $PaginationProductModelCopyWith<$Res> {
  factory _$PaginationProductModelCopyWith(_PaginationProductModel value, $Res Function(_PaginationProductModel) _then) = __$PaginationProductModelCopyWithImpl;
@override @useResult
$Res call({
 int total, List<ProductModel> products
});




}
/// @nodoc
class __$PaginationProductModelCopyWithImpl<$Res>
    implements _$PaginationProductModelCopyWith<$Res> {
  __$PaginationProductModelCopyWithImpl(this._self, this._then);

  final _PaginationProductModel _self;
  final $Res Function(_PaginationProductModel) _then;

/// Create a copy of PaginationProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? products = null,}) {
  return _then(_PaginationProductModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

// dart format on
