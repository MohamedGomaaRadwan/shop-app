import 'package:flutter/material.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/shared_widgets/index.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title, this.leading, this.trailing});

  final String title;
  Widget? leading;
  Widget? trailing;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading ?? 50.widthBox,
        _buildTitle(context),
        trailing ?? 50.widthBox,
      ],
    );
  }

  AppText _buildTitle(BuildContext context) {
    return AppText(
      text: title,
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: 20,
      ),
    );
  }
}
