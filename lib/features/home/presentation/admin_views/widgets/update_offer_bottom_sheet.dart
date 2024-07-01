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
import 'package:wafarly/features/home/presentation/admin_views/widgets/update_offer_texts_fields.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_state.dart';


class UpdateOfferBottomSheet extends StatelessWidget {
  const UpdateOfferBottomSheet({super.key, required this.offerModel});

  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OffersCubit, OffersState>(
      listener: (context, state) {
        if (state is UpdateOfferSuccessState) {
          OffersCubit.get(context).getOffers();
          Navigator.pop(context);
          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is UpdateOfferFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateOfferLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const AppBarBottomSheet(
                        title:  AppStrings.updateOffer,
                      ),
                      Gap(AppConstants.size20h),
                      UpdateOfferTextsFields(
                        offerModel: offerModel,
                      ),

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
                          if (OffersCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            OffersCubit.get(context).updateOffer(
                              storeId: offerModel.id,
                            );
                          }
                        },
                        title: AppStrings.update,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
