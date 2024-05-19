import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_container_effect.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class ShimmerAboutMenuWidget extends StatelessWidget {
  const ShimmerAboutMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainerEffect(
          width: 80.w,
        ),
        Gap(AppConstants.size10h),
        ShimmerContainerEffect(
          height: AppConstants.size30h,
        ),
        Gap(AppConstants.size20h),
        ShimmerContainerEffect(
          width: 80.w,
        ),
        Gap(AppConstants.size10h),
        const ShimmerContainerEffect(),
        Gap(AppConstants.size20h),
        ShimmerContainerEffect(
          width: 80.w,
        ),
        Gap(AppConstants.size10h),
        const ShimmerContainerEffect(),
        Gap(AppConstants.size20h),
        ShimmerContainerEffect(
          width: 80.w,
        ),
        Gap(AppConstants.size10h),
        const ShimmerContainerEffect(),
      ],
    );
  }
}