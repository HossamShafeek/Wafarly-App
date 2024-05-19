import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_network_image.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

class DetailsCouponHead extends StatelessWidget {
  const DetailsCouponHead({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.size20h,
        ),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomNetworkImage(
                  image: couponModel.imageUrl,
                ),
              ),
            ),
            Gap(AppConstants.size10h),
            Text(
              couponModel.storeName,
              style: AppStyles.styleBold18White,
            ),
            Gap(AppConstants.defaultPadding),
            Text(
              couponModel.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppStyles.styleBold20Red.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}