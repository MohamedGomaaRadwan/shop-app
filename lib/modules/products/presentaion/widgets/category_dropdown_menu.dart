import 'package:flutter/material.dart';
import 'package:shop/core/style/app_color.dart';
import 'package:shop/core/util/app_icons_path.dart';
import 'package:shop/core/util/app_padding.dart';
import 'package:shop/core/util/app_strings.dart';
import 'package:shop/modules/products/data/model/category_model.dart';
import 'package:shop/modules/shared_widgets/index.dart';

class CategoryDropDownMenu extends StatefulWidget {
  const CategoryDropDownMenu({super.key, required this.onCategoryChange});

  final Function(CategoryModel) onCategoryChange;

  @override
  State<CategoryDropDownMenu> createState() => _CategoryDropDownMenuState();
}

class _CategoryDropDownMenuState extends State<CategoryDropDownMenu> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButton<CategoryModel>(
        icon: _buildIcon(),
        underline: Container(),
        hint: _buildHintText(),
        value: selectedCategory,
        isExpanded: true,
        onChanged: (CategoryModel? value) {
          setState(() {
            selectedCategory = value;
            widget.onCategoryChange(selectedCategory!);
          });
        },
        items: CategoryModel.categories.map((CategoryModel category) {
          return DropdownMenuItem<CategoryModel>(
            value: category,
            child: _buildCategoryName(category.categoryName),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryName(String categoryName) {
    return AppPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppText(
        text: categoryName,
        textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  AppPadding _buildHintText() {
    return AppPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppText(
          text: AppStrings.selectCategory,
          textStyle: TextStyle(
            color: AppColors.blue,
            fontSize: 12,
          ),
        ),
      );
  }

  Widget _buildIcon() {
    return AppPadding(
      child: Container(
        padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.blue)
          ),
          child: const AppSVGImage(image: AppIconsPath.downArrow)),
    );
  }
}
