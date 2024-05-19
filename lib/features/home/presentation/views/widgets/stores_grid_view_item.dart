import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_network_image.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';

class StoresGridViewItem extends StatelessWidget {
  const StoresGridViewItem({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.couponsView,
            arguments: storeModel.storeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey50,
                  border: Border.all(
                    color: AppColors.grey50,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(AppConstants.radius10r),
                ),
                child: CustomNetworkImage(
                  image: storeModel.imageUrl,
                ),
              ),
            ),
          ),
          Gap(AppConstants.size5h),
          Text(
            storeModel.storeName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleRegular16Black,
          ),
        ],
      ),
    );
  }
}