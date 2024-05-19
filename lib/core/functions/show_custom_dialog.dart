import 'package:flutter/material.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_text_button.dart';

void showCustomDialog({required BuildContext context}){
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: Text(
          AppStrings.youAreNotLoggedInYet,
          style: AppStyles.styleBold18White.copyWith(
            color: AppColors.primary,
          ),
        ),
        content: Text(
          AppStrings.youMustBeLoggedIn,
          style: AppStyles.styleRegular16Black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(AppConstants.radius10r),
        ),
        actions: [
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.loginView);
            },
            title: AppStrings.signIn,
            textStyle: AppStyles.styleRegular16Black.copyWith(
              color: AppColors.blue,
            ),
          ),
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            title: AppStrings.cancel,
            textStyle: AppStyles.styleRegular16Black.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      );
    },
  );
}