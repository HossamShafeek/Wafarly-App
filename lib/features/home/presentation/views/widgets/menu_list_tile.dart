import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.onTap});

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: AppConstants.size10h),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppConstants.radius8r),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.styleBold20Red,
                  ),
                  Gap(AppConstants.size8h),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleRegular18White.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              IconBroken.Arrow___Left_2,
              color: AppColors.primary,
              size: AppConstants.iconSize24,
            ),
          ],
        ),
      ),
    );
  }
}