import 'package:shop/core/usecases/app_usecases.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/products/data/repositories/product_repository_impl.dart';

class GetProductsUseCase extends AppUseCase<List<ProductModel>, NoParams> {
  final ProductRepositoryImpl productRepositoryImpl;

  GetProductsUseCase(this.productRepositoryImpl);

  @override
  List<ProductModel>execute(params) {
    try {
      final products = productRepositoryImpl.getAllProducts();
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
