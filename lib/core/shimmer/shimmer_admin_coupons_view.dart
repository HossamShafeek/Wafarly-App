import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_container_effect.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class ShimmerAdminCouponsView extends StatelessWidget {
  const ShimmerAdminCouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.defaultPadding,
        top: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
      ),
      child: Column(
        children: [
          ShimmerContainerEffect(
            height: 40.h,
          ),
          Gap(AppConstants.size15h),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:  EdgeInsets.all(AppConstants.size10h),
                  width: double.infinity,
                  height: 75.h,
                  decoration: BoxDecoration(
                    color: AppColors.grey50,
                    borderRadius: BorderRadius.circular(AppConstants.radius10r),
                  ),
                  child: Row(
                    children: [
                      const AspectRatio(
                        aspectRatio: 1,
                        child: ShimmerContainerEffect(
                          height: double.infinity,
                        ),
                      ),
                      Gap(AppConstants.size10w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ShimmerContainerEffect(
                              width: double.infinity,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShimmerContainerEffect(
                                  width: 80.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Gap(AppConstants.size10w),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
