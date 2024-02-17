import 'package:flutter/material.dart';
import 'package:shop/core/style/app_color.dart';
import 'package:shop/core/util/app_strings.dart';
import 'package:shop/modules/shared_widgets/app_text.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(text: AppStrings.letsAddSomeProducts,textStyle: TextStyle(
        color: AppColors.grayText,fontSize: 12
      ),),
    );
  }
}
