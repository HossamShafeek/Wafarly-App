import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/add_coupon_texts_fields.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/app_bar_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';

class AddCouponBottomSheet extends StatelessWidget {
  const AddCouponBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponsCubit, CouponsState>(
      listener: (context, state) {
        if (state is AddCouponSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          CouponsCubit.get(context).getCoupons();
          Navigator.pop(context);
        } else if (state is AddCouponFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddCouponLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Form(
            key: CouponsCubit.get(context).formKey,
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
                          title: AppStrings.addCoupon,
                        ),
                        Gap(AppConstants.size20h),
                        const AddCouponTextsFields(),

                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child:Column(
                      children: [
                         const Expanded(
                          child: SizedBox.shrink(),),
                        CustomElevatedButton(
                          onPressed: () {
                            if (CouponsCubit.get(context)
                                .formKey
                                .currentState!
                                .validate()) {
                              CouponsCubit.get(context).addCoupon();
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
          ),
        );
      },
    );
  }
}
