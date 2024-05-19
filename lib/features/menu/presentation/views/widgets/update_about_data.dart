import 'package:flutter/material.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_container_button.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/update_about_data_bottom_sheet.dart';

class UpdateAboutData extends StatelessWidget {
  const UpdateAboutData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.size15h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.doYouWantToModifyAppData,
            style:
            AppStyles.styleRegular18White.copyWith(color: AppColors.black),
          ),
          CustomContainerButton(
            padding: AppConstants.size5h,
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return const UpdateAboutDataBottomSheet();
                },
              );
            },
            icon: IconBroken.Edit,
            backgroundColor: AppColors.grey50,
          ),
        ],
      ),
    );
  }
}

