import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_network_image.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';

class StoresListViewItem extends StatelessWidget {
  const StoresListViewItem({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.couponsView,
            arguments: storeModel.storeName);
      },
      child: Container(
        height: AppConstants.size50h,
        padding: EdgeInsets.all(AppConstants.size8h),
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10r),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CustomNetworkImage(
                image: storeModel.imageUrl,
              ),
            ),
            Gap(AppConstants.size8w),
            Text(
              storeModel.storeName,
              style: AppStyles.styleRegular16Black,
            ),
          ],
        ),
      ),
    );
  }
}
