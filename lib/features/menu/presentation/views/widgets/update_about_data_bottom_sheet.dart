import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/app_bar_bottom_sheet.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_state.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/update_about_data_texts_fields.dart';

class UpdateAboutDataBottomSheet extends StatelessWidget {
  const UpdateAboutDataBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AboutCubit, AboutState>(
      listener: (context, state) {
        if(state is UpdateAboutSuccessState){
          showSuccessSnackBar(context: context, message: state.message);
          AboutCubit.get(context).getAboutData().then((value) {
            Navigator.pop(context);
          });
        }else if(state is UpdateAboutFailureState){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateAboutLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            color: AppColors.white,
            child: Form(
              key: AboutCubit.get(context).formKey,
              child: CustomScrollView(
                physics: const  BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const AppBarBottomSheet(title: AppStrings.updateAppData),
                        Gap(AppConstants.size20h),
                        const UpdateAboutDataTextsFields(),
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
                            if(AboutCubit.get(context).formKey.currentState!.validate()){
                              AboutCubit.get(context).updateUserData();
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
