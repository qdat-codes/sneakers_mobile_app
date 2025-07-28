// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      sizes:
          (json['sizes'] as List<dynamic>?)
              ?.map((e) => SizeOptionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      price: json['price'] as String? ?? '',
      description: json['description'] as String? ?? '',
      oldPrice: json['oldPrice'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'sizes': instance.sizes,
      'price': instance.price,
      'description': instance.description,
      'oldPrice': instance.oldPrice,
    };

_$SizeOptionsModelImpl _$$SizeOptionsModelImplFromJson(
  Map<String, dynamic> json,
) => _$SizeOptionsModelImpl(
  size: json['size'] as String? ?? '',
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$$SizeOptionsModelImplToJson(
  _$SizeOptionsModelImpl instance,
) => <String, dynamic>{
  'size': instance.size,
  'isSelected': instance.isSelected,
};
