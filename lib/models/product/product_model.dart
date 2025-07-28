import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: '_id') @Default('') String id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'category') @Default('') String category,
    @JsonKey(name: 'imageUrl') @Default('') String imageUrl,
    @JsonKey(name: 'sizes')
    @Default([])
    List<SizeOptionsModel> sizes,
    @JsonKey(name: 'price') @Default('') String price,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'oldPrice') @Default('') String oldPrice,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class SizeOptionsModel with _$SizeOptionsModel {
  const factory SizeOptionsModel({
    @JsonKey(name: 'size') @Default('') String size,
    @JsonKey(name: 'isSelected') @Default(false) bool isSelected,
  }) = _SizeOptionsModel;

  factory SizeOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$SizeOptionsModelFromJson(json);
}
