import 'package:get/get.dart';
import 'package:shop/core/usecases/app_usecases.dart';
import 'package:shop/core/usecases/upload_image_usecase.dart';
import 'package:shop/modules/products/data/enums/category_type.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/products/domain/usecases/add_product_usecase.dart';
import 'package:shop/modules/products/domain/usecases/get_all_products_usecase.dart';

class ProductController extends GetxController {
  RxBool isVerticalView = true.obs;
  final AddProductUseCase addProductUseCase;
  final GetProductsUseCase getProductsUseCase;
  final RxList<String> selectedImagesList = <String>[].obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final UploadImageUseCase _uploadImageUseCase = UploadImageUseCase();
  final RxInt selectedCategoryId = CategoryType.allCategories.value.obs;

  ProductController(this.getProductsUseCase, this.addProductUseCase);

  @override
  void onInit() {
    fetchProducts(CategoryType.allCategories.value);
    super.onInit();
  }

  void fetchProducts(int categoryId){
    final List<ProductModel> allProducts =
         getProductsUseCase.execute(const NoParams());
    final filteredProducts = allProducts
        .where((product) => categoryId == CategoryType.allCategories.value
            ? true
            : product.categoryId == categoryId)
        .toList();
    products.assignAll(filteredProducts);
    update();
  }

  void selectCategory(int categoryId) {
    selectedCategoryId.value = categoryId;
    fetchProducts(categoryId);
  }

  Future<void> pickImages() async {
    try {
      final List<String> images =
          await _uploadImageUseCase.execute(const NoParams());
      selectedImagesList.assignAll(images);
    } catch (e) {
      throw Exception(e);
    }
    update();
  }

  void addProduct({required ProductModel product}) {
    addProductUseCase.execute(product);
    fetchProducts(selectedCategoryId.value);
  }

  void toggleListView() {
    isVerticalView.value = !isVerticalView.value;
  }
}
