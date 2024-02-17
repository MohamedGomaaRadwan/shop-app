import 'package:flutter/material.dart';
import 'package:shop/core/extensions/app_size_boxes.dart';
import 'package:shop/core/style/app_color.dart';
import 'package:shop/core/style/app_corners.dart';
import 'package:shop/modules/shared_widgets/app_text.dart';

class AppTextInputField extends StatelessWidget {
  AppTextInputField({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  final String hintText;
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  TextInputType? keyboardType;
  static InputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border, width: 1),
    borderRadius: BorderRadius.circular(AppCorners.med),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.heightBox,
        AppText(
            text: label,
            textStyle: TextStyle(color: AppColors.black, fontSize: 16)),
        10.heightBox,
        TextFormField(
          cursorColor: AppColors.primary,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.hint, fontSize: 14),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            alignLabelWithHint: true,
            errorMaxLines: 2,
            enabledBorder: inputBorder,
            border: inputBorder,
            focusedBorder: inputBorder,
          ),
        ),
        12.heightBox,
      ],
    );
  }
}
