import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/about_application_widget.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/profile_section.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/update_about_data.dart';

class AdminMenuView extends StatelessWidget {
  const AdminMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProfileSection(),
                  UpdateAboutData(),
                  AboutApplicationWidget(),
                ],
              ),
            ),
          ),
          Gap(AppConstants.size10h),
          CustomElevatedButton(
              onPressed: () {
                CacheHelper.removeData(key: 'userId').then((value) {
                  CacheHelper.removeData(key: AppConstants.cacheUserModel);
                  CacheHelper.removeData(key: 'userType');
                  AppConstants.userType = '';
                  AppConstants.userId = '';
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.layoutView, (route) => false);
                  showSuccessSnackBar(
                      context: context, message: 'تم تسجيل الخروج بنجاح');
                });
              },
              title: AppStrings.signOut),
        ],
      ),
    );
  }
}
