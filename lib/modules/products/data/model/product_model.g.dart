// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productName: json['productName'] as String,
      storeName: json['storeName'] as String,
      price: (json['price'] as num).toDouble(),
      categoryId: json['categoryId'] as int,
      imagePaths: (json['imagePaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'storeName': instance.storeName,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'imagePaths': instance.imagePaths,
    };
