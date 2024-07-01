import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/app_bar_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/update_slider_texts_filds.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';


class UpdateSliderBottomSheet extends StatelessWidget {
  const UpdateSliderBottomSheet({super.key, required this.sliderModel});

 final OfferModel sliderModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlidersCubit,SlidersState>(
      listener: (context, state) {
        if(state is UpdateSliderSuccessState){
          SlidersCubit.get(context).getSliders();
          Navigator.pop(context);
          showSuccessSnackBar(context: context, message: state.message);
        }else if(state is UpdateSliderFailureState){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateSliderLoadingState,
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
                        title: AppStrings.updateOffer,
                      ),
                      Gap(AppConstants.size20h),
                      UpdateSliderTextsFields(sliderModel: sliderModel),

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
                            SlidersCubit.get(context).updateSlider(storeId: sliderModel.id);
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
