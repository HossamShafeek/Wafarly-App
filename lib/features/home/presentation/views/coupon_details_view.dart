import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_back_button.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/presentation/views/widgets/coupons_details_view_body.dart';
import 'package:wafarly/features/home/presentation/views/widgets/details_favorite_button.dart';
import 'package:wafarly/features/home/presentation/views/widgets/details_share_button.dart';

class CouponDetailsView extends StatelessWidget {
  const CouponDetailsView({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.details),
        actions: [
          AppConstants.userType == 'admin'
              ? const SizedBox.shrink():DetailsFavoriteButton(couponModel: couponModel),
          Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultPadding,
              right: AppConstants.size8w,
            ),
            child: DetailsShareButton(couponModel: couponModel),
          ),
        ],
      ),
      body: CouponDetailsViewBody(couponModel: couponModel),
    );
  }
}
