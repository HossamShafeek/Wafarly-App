import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_container_effect.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class ShimmerProfileSection extends StatelessWidget {
  const ShimmerProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainerEffect(width: 80.w),
        Gap(AppConstants.size10h),
        ShimmerContainerEffect(width: 50.w),
        Gap(AppConstants.size8h),
        ShimmerContainerEffect(
          width:double.infinity,
          height: 40.h,
        ),
        Gap(AppConstants.size10h),
        ShimmerContainerEffect(width: 50.w),
        Gap(AppConstants.size8h),
        ShimmerContainerEffect(
          width:double.infinity,
          height: 40.h,
        ),
      ],
    );
  }
}
