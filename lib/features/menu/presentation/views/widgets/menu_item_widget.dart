
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.title,
    required this.subtitle, this.paddingForTop,
  });

  final String title;
  final String subtitle;
  final double? paddingForTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(paddingForTop??AppConstants.size15h),
        Text(
          title,
          style: AppStyles.styleBold20Red,
        ),
        Gap(AppConstants.size8h),
        Text(
          subtitle,
          style: AppStyles.styleRegular18White.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}