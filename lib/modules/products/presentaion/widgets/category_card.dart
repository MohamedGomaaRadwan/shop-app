import 'package:flutter/material.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/products/data/enums/category_type.dart';
import 'package:shop/modules/products/data/model/category_model.dart';
import 'package:shop/modules/shared_widgets/index.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.onTap,
      required this.selectedIndex,
      required this.categoryModel});

  final int selectedIndex;
  final CategoryModel categoryModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 110,
        decoration: _buildCategoryDecoration(),
        child: AppPadding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              categoryModel.categoryType.value != CategoryType.allCategories.value
                  ? _buildCategoriesImage()
                  : _buildAllCategoriesCard(),
              16.heightBox,
              _buildCategoryLabel()
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildCategoryDecoration() {
    return BoxDecoration(
        color: AppColors.white,
        border: Border.all(
            color: categoryModel.categoryType.value != selectedIndex
                ? AppColors.white
                : AppColors.primary),
        borderRadius: BorderRadius.circular(AppCorners.med));
  }

  AppText _buildCategoryLabel() {
    return AppText(
      text: categoryModel.categoryName,
      textStyle: TextStyle(color: AppColors.black, fontSize: 12),
    );
  }

  Widget _buildAllCategoriesCard() {
    return Container(
      width: 80,
      height: 56,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppCorners.med)),
      child: const Center(child: AppSVGImage(image: AppIconsPath.menu)),
    );
  }

  Widget _buildCategoriesImage() {
    return AppImage(
      width: 80,
      height: 56,
      path: categoryModel.categoryImage,
    );
  }
}
