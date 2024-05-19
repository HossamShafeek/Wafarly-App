import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_container_effect.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class ShimmerOffersView extends StatelessWidget {
  const ShimmerOffersView({super.key});

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
              padding: EdgeInsets.only(bottom: AppConstants.defaultPadding),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const AspectRatio(
                    aspectRatio: 2.2, child: ShimmerContainerEffect());
              },
              separatorBuilder: (context, index) => Gap(AppConstants.size10h),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
