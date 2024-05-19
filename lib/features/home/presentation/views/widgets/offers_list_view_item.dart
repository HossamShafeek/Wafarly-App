import 'package:flutter/material.dart';
import 'package:wafarly/core/functions/launch_store_url.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_network_image.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';


class OffersListViewItem extends StatelessWidget {
  const OffersListViewItem({super.key, required this.offerModel});

  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchStoreUrl(context: context, storeUrl: offerModel.storeUrl)
            .then((value) {})
            .catchError((error) {
          showErrorSnackBar(
              context: context, message: 'يوجد مشكلة في رابط المتجر');
        });
      },
      child: Stack(alignment: Alignment.bottomCenter, children: [
        AspectRatio(
          aspectRatio: 2.2,
          child: CustomNetworkImage(
            fit: BoxFit.fill,
            image: offerModel.imageUrl,
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppConstants.size5h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.blackWithOpacity,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                AppConstants.radius8r,
              ),
              bottomRight: Radius.circular(
                AppConstants.radius8r,
              ),
            ),
          ),
          child: Text(
            offerModel.storeName,
            style: AppStyles.styleRegular18White,
          ),
        ),
      ]),
    );
  }
}
