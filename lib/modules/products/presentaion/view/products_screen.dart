import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/products/data/enums/category_type.dart';
import 'package:shop/modules/products/data/model/category_model.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/products/presentaion/view_model/product_controller.dart';
import 'package:shop/modules/products/presentaion/widgets/category_card.dart';
import 'package:shop/modules/products/presentaion/widgets/empty_view.dart';
import 'package:shop/modules/products/presentaion/widgets/product_card.dart';
import 'package:shop/modules/products/presentaion/widgets/side_title.dart';
import 'package:shop/modules/shared_widgets/index.dart';

class ProductsScreen extends GetView<ProductController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Obx(
        () => AppPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.heightBox,
                _buildAppBar(),
                10.heightBox,
                SideTitle(label: AppStrings.categories),
                10.heightBox,
                _buildCategories(),
                10.heightBox,
                _buildChangeListView(),
                10.heightBox,
                _buildListOfProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      title: AppStrings.products,
      leading: AppBarWidget(
        icon: AppIconsPath.add,
        onTap: () {
          controller.selectedImagesList.clear();
          Get.toNamed(AppRoutes.addProductScreen);
        },
      ),
    );
  }

  Widget _buildChangeListView() {
    return InkWell(
      onTap: () => controller.toggleListView(),
      child: Row(
        children: [
          const AppSVGImage(
            image: AppIconsPath.elementsMenu,
            width: 20,
            height: 20,
          ),
          8.widthBox,
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(AppCorners.medRadius),
            ),
            child: AppPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: AppText(
                text: controller.isVerticalView.value
                    ? AppStrings.changeDisplayToHorizontal
                    : AppStrings.changeDisplayToVertical,
                textStyle: TextStyle(
                  color: AppColors.red,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListOfProducts() {
    if (controller.products.isEmpty) return const EmptyView();
    return SizedBox(
      height: controller.isVerticalView.value ? null : 130,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: controller.isVerticalView.value
            ? _buildVerticalView()
            : _buildHorizontalView(),
      ),
    );
  }

  SingleChildScrollView _buildHorizontalView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for (final product in controller.products)
                _buildProductCard(product),
            ],
          ),
        ],
      ),
    );
  }

  ListView _buildVerticalView() {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: controller.products[index]);
      },
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ProductCard(product: product),
    );
  }

  Widget _buildCategories() {
    return Row(
      children: [
        _buildShowAllCategories(),
        Expanded(
          child: SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CategoryModel.categories.length,
              itemBuilder: (context, index) {
                final category = CategoryModel.categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CategoryCard(
                    categoryModel: category,
                    selectedIndex: controller.selectedCategoryId.value,
                    onTap: () =>
                        controller.selectCategory(category.categoryType.value),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildShowAllCategories() {
    return SizedBox(
      height: 110,
      child: AppPadding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CategoryCard(
          categoryModel: CategoryModel(
            categoryName: AppStrings.showAll,
            categoryType: CategoryType.allCategories,
            categoryImage: AppImagesPath.category1,
          ),
          selectedIndex: controller.selectedCategoryId.value,
          onTap: () =>
              controller.selectCategory(CategoryType.allCategories.value),
        ),
      ),
    );
  }
}
