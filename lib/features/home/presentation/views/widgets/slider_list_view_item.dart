import 'package:flutter/material.dart';
import 'package:wafarly/core/functions/launch_store_url.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/widgets/custom_network_image.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';

class SlidersListViewItem extends StatelessWidget {
  const SlidersListViewItem({super.key, required this.slider});

  final OfferModel slider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launchStoreUrl(context: context, storeUrl: slider.storeUrl)
            .then((value) {})
            .catchError((error) {
          showErrorSnackBar(
              context: context, message: 'يوجد مشكلة في رابط المتجر');
        });
      },
      child: CustomNetworkImage(
        image: slider.imageUrl,
        backgroundColor: AppColors.grey50,
        borderRadius: AppConstants.radius10r,
      ),
    );
  }
}