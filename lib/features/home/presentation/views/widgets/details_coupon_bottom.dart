import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/functions/launch_store_url.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/functions/svae_coupon_to_clipboard.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

class DetailsCouponBottom extends StatelessWidget {
  const DetailsCouponBottom({super.key, required this.couponModel});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              couponModel.code,
              style: AppStyles.styleBold30Red.copyWith(
                color: AppColors.white,
              ),
            ),
            Gap(AppConstants.size8h),
            InkWell(
              onTap: () {
                saveCouponCodeToClipboard(
                  context: context,
                  couponCode: couponModel.code,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.copy,
                    style: AppStyles.styleRegular18White,
                  ),
                  Gap(AppConstants.size5w),
                  Icon(
                    Icons.copy,
                    size: AppConstants.iconSize22,
                    color: AppColors.grey50,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () {
                launchStoreUrl(context: context, storeUrl: couponModel.storeUrl)
                    .then((value) {})
                    .catchError((error) {
                  showErrorSnackBar(
                      context: context, message: 'يوجد مشكلة في رابط المتجر');
                });
              },
              title: AppStrings.goToShop,
              backgroundColors: AppColors.white,
              titleColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
