import 'package:get_storage/get_storage.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  final GetStorage _box = GetStorage();
  final String _productsKey="products";

  @override
  Future<void> addProduct(ProductModel param) async {
    final dynamic productsJson = _box.read(_productsKey);
    List<Map<String, dynamic>> products = [];
    if (productsJson is List<dynamic>) {
      products = List<Map<String, dynamic>>.from(productsJson);
    }
    products.add(param.toJson());
    await _box.write(_productsKey, products);
  }

  @override
  List<ProductModel> getAllProducts() {
    final dynamic productsJson = _box.read(_productsKey);
    if (productsJson is List<dynamic>) {
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}