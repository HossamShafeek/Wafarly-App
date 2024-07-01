import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/app_bar_bottom_sheet.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/update_user_data_texts_fields.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is UpdateUserDataSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
        CacheHelper.removeData(key: AppConstants.cacheUserModel).then((value) {
          Navigator.pop(context);
          ProfileCubit.get(context).getUserData();
        });
        }else if(state is UpdateUserDataFailureState){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateUserDataLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            color: AppColors.white,
            child: Form(
              key: ProfileCubit.get(context).formKey,
              child: CustomScrollView(
                physics: const  BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                   child: Column(
                     children: [
                       const AppBarBottomSheet(title: AppStrings.updatePersonalData),
                       Gap(AppConstants.size20h),
                       const UpdateUserDataTextsFields(),
                     ],
                   ),
                 ),
                 SliverFillRemaining(
                   hasScrollBody: false,
                   child: Column(
                     children: [
                       const Expanded(
                         child: SizedBox.shrink(),),
                       CustomElevatedButton(
                         onPressed: () {
                           if(ProfileCubit.get(context).formKey.currentState!.validate()){
                             ProfileCubit.get(context).updateUserData();
                           }
                         },
                         title: AppStrings.update,
                       ),
                     ],
                   ),
                 )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}