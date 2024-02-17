import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/products/data/model/product_model.dart';
import 'package:shop/modules/shared_widgets/app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          _buildProductImage(),
          12.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductName(),
              20.heightBox,
              _buildPrice(),
              20.heightBox,
              _buildStoreName()
            ],
          )
        ],
      ),
    );
  }

  AppText _buildProductName() {
    return AppText(
        text: product.productName,
        textStyle: TextStyle(color: AppColors.black, fontSize: 18));
  }

  Container _buildStoreName() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.hint,
          borderRadius: BorderRadius.all(AppCorners.smRadius)),
      child: AppPadding(
        padding: const EdgeInsets.all(8.0),
        child: AppText(
            text: product.storeName,
            textStyle: TextStyle(
              color: AppColors.grayText,
              fontSize: 10,
            )),
      ),
    );
  }

  Row _buildPrice() {
    return Row(
      children: [
        AppText(
          text: product.price.toString(),
          textStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
          ),
        ),
        8.widthBox,
        AppText(
          text: AppStrings.sar,
          textStyle: TextStyle(
            color: AppColors.text,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return SizedBox(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppCorners.med),
        child: Image.file(File(product.imagePaths[0]),
      )),
    );
  }
}
