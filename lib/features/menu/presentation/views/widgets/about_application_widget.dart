import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/functions/launch_store_url.dart';
import 'package:wafarly/core/functions/share_coupon.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/shimmer/shimmer_about_menu_widget.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/features/home/presentation/views/widgets/menu_list_tile.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_state.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/menu_item_widget.dart';

class AboutApplicationWidget extends StatelessWidget {
  const AboutApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit,AboutState>(builder: (context, state) {
      if(state is GetAboutSuccessState){
        return Column(
          children: [
             const MenuItemWidget(
              paddingForTop:0,
              title: AppStrings.whoAreWe,
              subtitle: AppStrings.whoAreWeDescription,
            ),
            MenuListTile(
              title: AppStrings.rateUs,
              subtitle: AppStrings.rateUsDescription,
              onTap: () {
                launchStoreUrl(context: context, storeUrl: state.aboutModel.appLink).then((value){}).catchError((error){
                  showErrorSnackBar(context: context, message: 'يوجد مشكلة في الرابط');
                });
              },
            ),
            MenuListTile(
              title: AppStrings.contactUs,
              subtitle: AppStrings.contactUsDescription,
              onTap: () {
                launchStoreUrl(context: context, storeUrl: state.aboutModel.chatLink).then((value){}).catchError((error){
                  showErrorSnackBar(context: context, message: 'يوجد مشكلة في الرابط');
                });
              },
            ),
            MenuListTile(
              title: AppStrings.shareApplication,
              subtitle: AppStrings.shareApplicationDescription,
              onTap: () {
                shareApp(link: state.aboutModel.appLink);
              },
            ),
          ],
        );
      }else if(state is GetAboutFailureState){
        return CustomErrorWidget(error: state.error);
      }else{
        return const ShimmerAboutMenuWidget();
      }
    },);
  }
}