import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/products/presentaion/bindings/product_binding.dart';
import 'package:shop/modules/products/presentaion/view/products_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.productsScreen,
      initialBinding: ProductBinding(),
      home: const ProductsScreen(),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}