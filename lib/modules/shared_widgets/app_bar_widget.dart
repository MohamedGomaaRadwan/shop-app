import 'package:flutter/material.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/shared_widgets/index.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.icon,required this.onTap});
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppCorners.lg),
            color: AppColors.white),
        child: AppPadding(
          padding: const EdgeInsets.all(16),
          child: AppSVGImage(image: icon),
        ),
      ),
    );
  }
}
