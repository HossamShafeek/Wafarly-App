import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_container_effect.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class ShimmerAdminStoresListView extends StatelessWidget {
  const ShimmerAdminStoresListView({super.key});

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
              padding: EdgeInsets.only(bottom: AppConstants.defaultPadding),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.grey50,
                    borderRadius: BorderRadius.circular(AppConstants.radius10r),
                  ),
                  padding:  EdgeInsets.all(AppConstants.size8h),
                  child: Row(
                    children: [
                      const AspectRatio(
                        aspectRatio: 1,
                        child: ShimmerContainerEffect(
                        ),
                      ),
                      Gap(AppConstants.size8w),
                       ShimmerContainerEffect(width:100.w,),
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
