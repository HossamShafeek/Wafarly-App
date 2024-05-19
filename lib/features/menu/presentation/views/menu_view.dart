import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/about_application_widget.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/no_profile_section.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/profile_section.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.userId.isNotEmpty
                      ? const ProfileSection()
                      : const NoProfileSection(),
                  Gap(AppConstants.size15h),
                  const AboutApplicationWidget(),
                ],
              ),
            ),
          ),
          Gap(AppConstants.size10h),
          AppConstants.userId.isNotEmpty
              ? CustomElevatedButton(
                  onPressed: () {
                    CacheHelper.removeData(key: 'userId').then((value) {
                      AppConstants.userType = '';
                      AppConstants.userId = '';
                      FavoritesCubit.get(context).favorites = [];
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.layoutView, (route) => false);
                      showSuccessSnackBar(
                          context: context, message: 'تم تسجيل الخروج بنجاح');
                    });
                  },
                  title: AppStrings.signOut)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}


