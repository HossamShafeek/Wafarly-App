import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/widgets/horizontal_separator.dart';

class DetailsCouponSeparator extends StatelessWidget {
  const DetailsCouponSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: AppConstants.size20h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.radius25r),
              bottomLeft: Radius.circular(AppConstants.radius25r),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.all(20.w),
            child: const CustomHorizontalSeparator(
              color: AppColors.white,
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: AppConstants.size20h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppConstants.radius25r),
              bottomRight: Radius.circular(AppConstants.radius25r),
            ),
          ),
        ),
      ],
    );
  }
}