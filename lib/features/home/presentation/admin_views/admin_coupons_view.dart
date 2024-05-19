import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/shimmer/shimmer_admin_coupons_view.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/core/widgets/custom_search_field.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/admin_coupons_list_view.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';

class AdminCouponsView extends StatelessWidget {
  const AdminCouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponsCubit, CouponsState>(
      listener: (context, state) {
        if(state is DeleteCouponSuccessState){
          CouponsCubit.get(context).getCoupons();
          showSuccessSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is CouponsSuccessState || state is GetSearchedCouponsList) {
          return Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
              top: AppConstants.defaultPadding,
            ),
            child: Column(
              children: [
                CustomSearchField(
                  hintText: AppStrings.searchHintTextForCouponView,
                  controller: CouponsCubit.get(context).searchController,
                  onChanged: (value) {
                      CouponsCubit.get(context).getSearchedCouponsList(
                        couponTitle: value,);
                  },
                ),
                if (CouponsCubit.get(context).coupons.isNotEmpty) ...{
                  Gap(AppConstants.size10h),
                  AdminCouponsListView(
                    coupons:  CouponsCubit.get(context).searchController.text.isEmpty
                        ? CouponsCubit.get(context).coupons
                        : CouponsCubit.get(context).searchedCouponsList,
                  ),
                } else ...{
                  Expanded(
                    child: Center(
                      child: CustomEmptyWidget(
                        imagePath: AppAssets.emptyList,
                        title: AppStrings.noAllStoresTitle,
                        subtitle: AppStrings.noAllCouponsSubtitle,
                      ),
                    ),
                  ),
                }
              ],
            ),
          );
        } else if (state is CouponsFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerAdminCouponsView();
        }
      },
    );
  }
}
