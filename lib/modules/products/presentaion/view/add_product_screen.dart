import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/products/data/enums/category_type.dart';
import 'package:shop/modules/products/data/model/category_model.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/products/presentaion/view_model/product_controller.dart';
import 'package:shop/modules/products/presentaion/widgets/category_dropdown_menu.dart';
import 'package:shop/modules/products/presentaion/widgets/images_list_view.dart';
import 'package:shop/modules/products/presentaion/widgets/side_title.dart';
import 'package:shop/modules/shared_widgets/index.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);
  final ProductController controller = Get.find<ProductController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SingleChildScrollView(
        child: AppPadding(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.heightBox,
                _buildAppBar(context),
                20.heightBox,
                SideTitle(label: AppStrings.productPictures),
                10.heightBox,
                const ImagesListView(),
                10.heightBox,
                _buildPressToAddPictureButton(),
                12.heightBox,
                _buildProductName(),
                _buildProductPrice(),
                _buildStoreName(),
                10.heightBox,
                SideTitle(label: AppStrings.category),
                10.heightBox,
                _buildCategoryDropDownMenu(),
                16.heightBox,
                AppButton(onTap: addProduct, label: AppStrings.addProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppButton _buildPressToAddPictureButton() {
    return AppButton(
      onTap: () => controller.pickImages(),
      label: AppStrings.pressToAddPicture,
      leading: _buildAddIcon(),
    );
  }

  CategoryDropDownMenu _buildCategoryDropDownMenu() {
    return CategoryDropDownMenu(
      onCategoryChange: (category) {
        categoryModel = category;
      },
    );
  }

  AppTextInputField _buildStoreName() {
    return AppTextInputField(
      controller: storeNameController,
      label: AppStrings.storeName,
      hintText: AppStrings.storeName,
      validator: (value) =>
          AppFormValidator.requiredField(value, AppStrings.pleaseFillThisField),
    );
  }

  AppTextInputField _buildProductPrice() {
    return AppTextInputField(
      controller: priceController,
      label: AppStrings.price,
      hintText: AppStrings.price,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) =>
          AppFormValidator.requiredField(value, AppStrings.pleaseFillThisField),
    );
  }

  AppTextInputField _buildProductName() {
    return AppTextInputField(
      controller: productNameController,
      label: AppStrings.productName,
      hintText: AppStrings.productName,
      validator: (value) =>
          AppFormValidator.requiredField(value, AppStrings.pleaseFillThisField),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppStrings.addProduct,
      trailing: AppBarWidget(
        icon: AppIconsPath.backArrow,
        onTap: () => Get.back(),
      ),
    );
  }

  void addProduct() {
    final productName = productNameController.text.trim();
    final price = double.tryParse(priceController.text.trim()) ?? 0.0;
    final storeName = storeNameController.text.trim();
    if (categoryModel == null || controller.selectedImagesList.isEmpty) {
      Get.snackbar(
        AppStrings.warning,
        AppStrings.youMustSelectCategoryAndProductImage,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (formKey.currentState!.validate()) {
      controller.addProduct(
          product: ProductModel(
              productName: productName,
              price: price,
              storeName: storeName,
              imagePaths: controller.selectedImagesList,
              categoryId: categoryModel!.categoryType
                  .value) // You need to implement image uploading logic here
          );
      Get.back();
    }
  }

  Widget _buildAddIcon() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppCorners.sm),
          color: AppColors.white),
      child: AppPadding(
        padding: const EdgeInsets.all(6),
        child: AppSVGImage(
            boxFit: BoxFit.fitWidth,
            image: AppIconsPath.add,
            color: AppColors.primary),
      ),
    );
  }
}
