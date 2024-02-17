import 'package:get/get.dart';
import 'package:shop/modules/products/data/repositories/product_repository_impl.dart';
import 'package:shop/modules/products/domain/usecases/add_product_usecase.dart';
import 'package:shop/modules/products/domain/usecases/get_all_products_usecase.dart';
import 'package:shop/modules/products/presentaion/view_model/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRepositoryImpl());
    Get.lazyPut(() => AddProductUseCase(Get.find<ProductRepositoryImpl>()));
    Get.lazyPut(() => GetProductsUseCase(Get.find<ProductRepositoryImpl>()));
    Get.put(ProductController(Get.find<GetProductsUseCase>(),Get.find<AddProductUseCase>()), permanent: true);
  }
}