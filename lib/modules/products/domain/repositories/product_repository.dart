import 'package:shop/modules/products/data/model/product_model.dart';

abstract class ProductRepository{
  List<ProductModel>getAllProducts();
  void addProduct(ProductModel param);
}