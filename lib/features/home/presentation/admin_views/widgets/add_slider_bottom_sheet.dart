import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/add_slider_text_field.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/app_bar_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';


class AddSliderBottomSheet extends StatelessWidget {
  const AddSliderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlidersCubit,SlidersState>(
      listener: (context, state) {
        if(state is AddSliderSuccessState){
          SlidersCubit.get(context).getSliders();
          Navigator.pop(context);
          showSuccessSnackBar(context: context, message: state.message);
        }else if(state is AddSliderFailureState){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddSliderLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child:  CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
               SliverToBoxAdapter(
                 child: Column(
                   children: [
                     const AppBarBottomSheet(
                       title: AppStrings.addOffer,
                     ),
                     Gap(AppConstants.size20h),
                     const AddSliderTextsFields(),
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
                          if (SlidersCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            SlidersCubit.get(context).addSlider();
                          }
                        },
                        title: AppStrings.add,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },);
  }
}
