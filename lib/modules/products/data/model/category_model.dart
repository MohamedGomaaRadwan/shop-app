import 'package:shop/core/util/app_images_path.dart';
import 'package:shop/core/util/app_strings.dart';
import 'package:shop/modules/products/data/enums/category_type.dart';

class CategoryModel{
  final CategoryType categoryType;
  final String categoryName;
  final String categoryImage;
  CategoryModel({required this.categoryImage, required this.categoryType, required this.categoryName});

  static List<CategoryModel>categories=[
    CategoryModel(categoryName:AppStrings.category1,categoryType: CategoryType.category1,categoryImage: AppImagesPath.category1),
    CategoryModel(categoryName:AppStrings.category2,categoryType: CategoryType.category2,categoryImage: AppImagesPath.category2),
    CategoryModel(categoryName:AppStrings.category3,categoryType: CategoryType.category3,categoryImage: AppImagesPath.category3),
  ];
}