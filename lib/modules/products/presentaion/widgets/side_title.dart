import 'package:flutter/cupertino.dart';
import 'package:shop/core/util/index.dart';
import 'package:shop/modules/shared_widgets/app_text.dart';

class SideTitle extends StatelessWidget {
  const SideTitle({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return AppText(
      text: label,
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
    );
  }
}
