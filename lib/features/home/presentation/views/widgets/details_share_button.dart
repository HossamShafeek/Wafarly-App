import 'package:flutter/material.dart';
import 'package:wafarly/core/functions/share_coupon.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

class DetailsShareButton extends StatelessWidget {
  const DetailsShareButton({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(AppColors.transparent),
      onTap: () {
        shareCoupon(couponModel: couponModel);
      },
      child: CircleAvatar(
        radius: AppConstants.radius20r,
        backgroundColor: AppColors.grey50,
        child: Icon(
          Icons.share_outlined,
          size: AppConstants.iconSize24,
          color: AppColors.blue,
        ),
      ),
    );
  }
}