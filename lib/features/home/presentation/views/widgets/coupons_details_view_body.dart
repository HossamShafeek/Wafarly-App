import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/presentation/views/widgets/details_coupon_bottom.dart';
import 'package:wafarly/features/home/presentation/views/widgets/details_coupon_head.dart';
import 'package:wafarly/features/home/presentation/views/widgets/details_coupon_separator.dart';

class CouponDetailsViewBody extends StatelessWidget {
  const CouponDetailsViewBody({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radius20r),
          color: AppColors.primary,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: AppConstants.size10h),
              height: AppConstants.size8h,
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppConstants.radius5r),
              ),
            ),
            DetailsCouponHead(
              couponModel: couponModel,
            ),
            const DetailsCouponSeparator(),
            DetailsCouponBottom(couponModel: couponModel),
          ],
        ),
      ),
    );
  }
}