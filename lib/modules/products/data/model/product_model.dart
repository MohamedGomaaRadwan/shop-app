import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String productName;
  final String storeName;
  final double price;
  final int categoryId;
  final List<String> imagePaths;

  ProductModel({
    required this.productName,
    required this.storeName,
    required this.price,
    required this.categoryId,
    required this.imagePaths,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
