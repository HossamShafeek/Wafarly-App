import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.validator,
    required this.title,
    required this.hintText,
    this.paddingForTop,
    this.paddingForBottom,
    required this.messageForValidate,
    required this.items,
    required this.onChange,
  });

  final String? Function(String?)? validator;
  final String title;
  final String hintText;
  final String messageForValidate;
  final double? paddingForTop;
  final double? paddingForBottom;
  final List<DropdownMenuItem> items;
  final Function(dynamic value) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleSemiBold16Black,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: paddingForTop ?? AppConstants.defaultPadding,
            bottom: paddingForBottom ?? AppConstants.size15h,
          ),
          child: DropdownButtonFormField(
            validator: (value) => value == null ? messageForValidate : null,
            //style: AppStyles.styleRegular16Black,
            decoration: InputDecoration(
              fillColor: AppColors.grey50,
              filled: true,
              isDense: true,
              hintStyle: AppStyles.styleRegular14Grey,
              border: AppConstants.enabledBorder,
              focusedBorder: AppConstants.enabledBorder,
            ),
            isExpanded: true,
            borderRadius: BorderRadius.circular(AppConstants.radius8r),
            hint: Text(
              hintText,
              style: AppStyles.styleRegular14Grey,
            ),
            items: items,
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
