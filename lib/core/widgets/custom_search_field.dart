import 'package:flutter/material.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      onChanged: onChanged,
      style: AppStyles.styleRegular16Black,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Container(
          margin: EdgeInsets.all(AppConstants.size5h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radius5r),
            color: AppColors.white,
          ),
          child: Icon(
            IconBroken.Search,
            size: AppConstants.iconSize18,
            color: AppColors.primary,
          ),
        ),
        filled: true,
        isDense: true,
        hintStyle: AppStyles.styleRegular14Grey,
        fillColor: AppColors.grey50,
        border: AppConstants.enabledBorder,
        focusedBorder: AppConstants.enabledBorder,
      ),
    );
  }
}
