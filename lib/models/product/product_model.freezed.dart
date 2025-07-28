// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'sizes')
  List<SizeOptionsModel> get sizes => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldPrice')
  String get oldPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
    ProductModel value,
    $Res Function(ProductModel) then,
  ) = _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'category') String category,
    @JsonKey(name: 'imageUrl') String imageUrl,
    @JsonKey(name: 'sizes') List<SizeOptionsModel> sizes,
    @JsonKey(name: 'price') String price,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'oldPrice') String oldPrice,
  });
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? category = null,
    Object? imageUrl = null,
    Object? sizes = null,
    Object? price = null,
    Object? description = null,
    Object? oldPrice = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            sizes:
                null == sizes
                    ? _value.sizes
                    : sizes // ignore: cast_nullable_to_non_nullable
                        as List<SizeOptionsModel>,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            oldPrice:
                null == oldPrice
                    ? _value.oldPrice
                    : oldPrice // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
    _$ProductModelImpl value,
    $Res Function(_$ProductModelImpl) then,
  ) = __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'category') String category,
    @JsonKey(name: 'imageUrl') String imageUrl,
    @JsonKey(name: 'sizes') List<SizeOptionsModel> sizes,
    @JsonKey(name: 'price') String price,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'oldPrice') String oldPrice,
  });
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
    _$ProductModelImpl _value,
    $Res Function(_$ProductModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? category = null,
    Object? imageUrl = null,
    Object? sizes = null,
    Object? price = null,
    Object? description = null,
    Object? oldPrice = null,
  }) {
    return _then(
      _$ProductModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        sizes:
            null == sizes
                ? _value._sizes
                : sizes // ignore: cast_nullable_to_non_nullable
                    as List<SizeOptionsModel>,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        oldPrice:
            null == oldPrice
                ? _value.oldPrice
                : oldPrice // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl({
    @JsonKey(name: '_id') this.id = '',
    @JsonKey(name: 'name') this.name = '',
    @JsonKey(name: 'title') this.title = '',
    @JsonKey(name: 'category') this.category = '',
    @JsonKey(name: 'imageUrl') this.imageUrl = '',
    @JsonKey(name: 'sizes') final List<SizeOptionsModel> sizes = const [],
    @JsonKey(name: 'price') this.price = '',
    @JsonKey(name: 'description') this.description = '',
    @JsonKey(name: 'oldPrice') this.oldPrice = '',
  }) : _sizes = sizes;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'category')
  final String category;
  @override
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  final List<SizeOptionsModel> _sizes;
  @override
  @JsonKey(name: 'sizes')
  List<SizeOptionsModel> get sizes {
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizes);
  }

  @override
  @JsonKey(name: 'price')
  final String price;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'oldPrice')
  final String oldPrice;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, title: $title, category: $category, imageUrl: $imageUrl, sizes: $sizes, price: $price, description: $description, oldPrice: $oldPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    title,
    category,
    imageUrl,
    const DeepCollectionEquality().hash(_sizes),
    price,
    description,
    oldPrice,
  );

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel({
    @JsonKey(name: '_id') final String id,
    @JsonKey(name: 'name') final String name,
    @JsonKey(name: 'title') final String title,
    @JsonKey(name: 'category') final String category,
    @JsonKey(name: 'imageUrl') final String imageUrl,
    @JsonKey(name: 'sizes') final List<SizeOptionsModel> sizes,
    @JsonKey(name: 'price') final String price,
    @JsonKey(name: 'description') final String description,
    @JsonKey(name: 'oldPrice') final String oldPrice,
  }) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'category')
  String get category;
  @override
  @JsonKey(name: 'imageUrl')
  String get imageUrl;
  @override
  @JsonKey(name: 'sizes')
  List<SizeOptionsModel> get sizes;
  @override
  @JsonKey(name: 'price')
  String get price;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'oldPrice')
  String get oldPrice;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SizeOptionsModel _$SizeOptionsModelFromJson(Map<String, dynamic> json) {
  return _SizeOptionsModel.fromJson(json);
}

/// @nodoc
mixin _$SizeOptionsModel {
  @JsonKey(name: 'size')
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSelected')
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this SizeOptionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SizeOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeOptionsModelCopyWith<SizeOptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeOptionsModelCopyWith<$Res> {
  factory $SizeOptionsModelCopyWith(
    SizeOptionsModel value,
    $Res Function(SizeOptionsModel) then,
  ) = _$SizeOptionsModelCopyWithImpl<$Res, SizeOptionsModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'size') String size,
    @JsonKey(name: 'isSelected') bool isSelected,
  });
}

/// @nodoc
class _$SizeOptionsModelCopyWithImpl<$Res, $Val extends SizeOptionsModel>
    implements $SizeOptionsModelCopyWith<$Res> {
  _$SizeOptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SizeOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? size = null, Object? isSelected = null}) {
    return _then(
      _value.copyWith(
            size:
                null == size
                    ? _value.size
                    : size // ignore: cast_nullable_to_non_nullable
                        as String,
            isSelected:
                null == isSelected
                    ? _value.isSelected
                    : isSelected // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SizeOptionsModelImplCopyWith<$Res>
    implements $SizeOptionsModelCopyWith<$Res> {
  factory _$$SizeOptionsModelImplCopyWith(
    _$SizeOptionsModelImpl value,
    $Res Function(_$SizeOptionsModelImpl) then,
  ) = __$$SizeOptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'size') String size,
    @JsonKey(name: 'isSelected') bool isSelected,
  });
}

/// @nodoc
class __$$SizeOptionsModelImplCopyWithImpl<$Res>
    extends _$SizeOptionsModelCopyWithImpl<$Res, _$SizeOptionsModelImpl>
    implements _$$SizeOptionsModelImplCopyWith<$Res> {
  __$$SizeOptionsModelImplCopyWithImpl(
    _$SizeOptionsModelImpl _value,
    $Res Function(_$SizeOptionsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SizeOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? size = null, Object? isSelected = null}) {
    return _then(
      _$SizeOptionsModelImpl(
        size:
            null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                    as String,
        isSelected:
            null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SizeOptionsModelImpl implements _SizeOptionsModel {
  const _$SizeOptionsModelImpl({
    @JsonKey(name: 'size') this.size = '',
    @JsonKey(name: 'isSelected') this.isSelected = false,
  });

  factory _$SizeOptionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SizeOptionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'size')
  final String size;
  @override
  @JsonKey(name: 'isSelected')
  final bool isSelected;

  @override
  String toString() {
    return 'SizeOptionsModel(size: $size, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SizeOptionsModelImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, isSelected);

  /// Create a copy of SizeOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SizeOptionsModelImplCopyWith<_$SizeOptionsModelImpl> get copyWith =>
      __$$SizeOptionsModelImplCopyWithImpl<_$SizeOptionsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SizeOptionsModelImplToJson(this);
  }
}

abstract class _SizeOptionsModel implements SizeOptionsModel {
  const factory _SizeOptionsModel({
    @JsonKey(name: 'size') final String size,
    @JsonKey(name: 'isSelected') final bool isSelected,
  }) = _$SizeOptionsModelImpl;

  factory _SizeOptionsModel.fromJson(Map<String, dynamic> json) =
      _$SizeOptionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'size')
  String get size;
  @override
  @JsonKey(name: 'isSelected')
  bool get isSelected;

  /// Create a copy of SizeOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SizeOptionsModelImplCopyWith<_$SizeOptionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
