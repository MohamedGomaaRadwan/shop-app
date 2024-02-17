import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/style/app_color.dart';
import 'package:shop/core/style/app_corners.dart';
import 'package:shop/core/util/app_padding.dart';
import 'package:shop/modules/products/presentaion/view_model/product_controller.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();
    return Obx(() {
      final List<String> images = controller.selectedImagesList;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final imagePath in images) _buildImageContainer(imagePath),
              Row(
                children: List.generate(
                    4 - images.length, (index) => _buildEmptyView()),
              ),
            ],
          ),
        );
    });
  }

  Widget _buildImageContainer(String imagePath) {
    return AppPadding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(AppCorners.smRadius),
          border: Border.all(color: AppColors.border),
        ),
        child: Image.file(File(imagePath)),
      ),
    );
  }

  Widget _buildEmptyView() {
    return AppPadding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(AppCorners.smRadius),
          border: Border.all(color: AppColors.border),
        ),
      ),
    );
  }
}
