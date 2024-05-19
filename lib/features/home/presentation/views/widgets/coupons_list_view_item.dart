import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/add_and_remove_from_favourites_button.dart';
import 'package:wafarly/core/widgets/custom_network_image.dart';
import 'package:wafarly/core/widgets/vertical_separator.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/presentation/views/widgets/ticket_shape_widget.dart';

class CouponsListViewItem extends StatelessWidget {
  const CouponsListViewItem({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.couponDetailsView,
            arguments: couponModel);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(right: AppConstants.size10h),
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppConstants.size10h),
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomNetworkImage(
                  borderRadius: AppConstants.radius8r,
                  image: couponModel.imageUrl,
                ),
              ),
            ),
            Gap(AppConstants.size10w),
            const CustomVerticalSeparator(),
            Gap(AppConstants.size10w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppConstants.size10h,
                  left: AppConstants.size10h,
                  bottom: AppConstants.size10h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        couponModel.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.styleBold18White.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            couponModel.storeName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.styleRegular16Black.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        AppConstants.userType == 'admin'
                            ? const SizedBox.shrink():AddAndRemoveFromFavoritesButton(
                                couponModel: couponModel,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const TicketShapeWidget(),
          ],
        ),
      ),
    );
  }
}
