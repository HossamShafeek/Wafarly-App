import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_container_effect.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class ShimmerStoresGridView extends StatelessWidget {
  const ShimmerStoresGridView({super.key});

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
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: AppConstants.size15h,
                crossAxisSpacing: AppConstants.size15h,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  const Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ShimmerContainerEffect(),
                    ),
                  ),
                  Gap(AppConstants.size5h),
                  const ShimmerContainerEffect(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}