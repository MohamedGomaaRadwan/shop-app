import 'package:flutter/material.dart';
import 'package:shop/core/extensions/app_size_boxes.dart';
import 'package:shop/core/style/app_color.dart';
import 'package:shop/core/style/app_corners.dart';
import 'package:shop/modules/shared_widgets/app_text.dart';

class AppButton extends StatelessWidget {
  AppButton({super.key, required this.onTap, required this.label,this.leading});

  final VoidCallback onTap;
  final String label;
  Widget? leading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppCorners.med)),
        child: leading == null
            ? _buildLabel()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leading!,
                  16.widthBox,
                  _buildLabel(),
                ],
              ),
      ),
    );
  }

  Widget _buildLabel() {
    return Center(
      child: AppText(
          text: label,
          textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 18,
          )),
    );
  }
}
