import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/shimmer/shimmer_coupons_list_view.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/core/widgets/title_list_and_view_all.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';
import 'package:wafarly/features/home/presentation/views/widgets/coupons_list_view_item.dart';

class CouponsListViewForHome extends StatelessWidget {
  const CouponsListViewForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        if (state is CouponsSuccessState ||
            state is GetSearchedCouponsList ||
            state is CouponsChangeIsSearchingState) {
          return Column(
            children: [
              TitleListAndViewAll(
                title: AppStrings.coupons,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.couponsView,
                      arguments: 'الكل');
                },
              ),
              if (CouponsCubit.get(context).coupons.isNotEmpty) ...{
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CouponsListViewItem(
                    couponModel: CouponsCubit.get(context).coupons[index],
                  ),
                  separatorBuilder: (context, index) =>
                      Gap(AppConstants.size10h),
                  itemCount: CouponsCubit.get(context).coupons.length >= 5
                      ? 5
                      : CouponsCubit.get(context).coupons.length,
                ),
              } else ...{
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius8r),
                    ),
                    child: Text(
                      AppStrings.noCoupons,
                      style: AppStyles.styleRegular16Black,
                    ),
                  ),
                ),
              }
            ],
          );
        } else if (state is CouponsFailureState) {
          return Padding(
            padding: EdgeInsets.only(top: AppConstants.size30h),
            child: CustomErrorWidget(error: state.error),
          );
        } else {
          return const ShimmerCouponsListView();
        }
      },
    );
  }
}
