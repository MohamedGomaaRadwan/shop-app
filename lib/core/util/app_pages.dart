import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop/core/util/app_routes.dart';
import 'package:shop/modules/products/presentaion/view/products_screen.dart';
import 'package:shop/modules/products/presentaion/bindings/product_binding.dart';
import 'package:shop/modules/products/presentaion/view/add_product_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.productsScreen,
      page: () => const ProductsScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.addProductScreen,
      page: () => AddProductScreen(),
      binding: ProductBinding(),
    ),
  ];
}