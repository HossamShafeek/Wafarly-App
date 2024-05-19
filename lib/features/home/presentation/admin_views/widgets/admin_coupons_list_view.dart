import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/custom_slidable.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/update_coupon_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';
import 'package:wafarly/features/home/presentation/views/widgets/coupons_list_view_item.dart';

class AdminCouponsListView extends StatelessWidget {
  const AdminCouponsListView({super.key, required this.coupons});

  final List<CouponModel> coupons;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        if (coupons.isNotEmpty) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: AppConstants.defaultPadding,
                top: AppConstants.size5h,
              ),
              itemCount: coupons.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CustomSlidable(

                delete: (context) {
                  CouponsCubit.get(context).deleteCoupon(couponId: coupons[index].id);
                },
                edit: (context) {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return UpdateCouponBottomSheet(couponModel: coupons[index]);
                    },
                  );
                },

                child: CouponsListViewItem(
                  couponModel: coupons[index],
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstants.size10h),
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: CustomEmptyWidget(
                imagePath: AppAssets.search,
                title: AppStrings.noResultTitle,
                subtitle: AppStrings.noResultSubtitle,
              ),
            ),
          );
        }
      },
    );
  }
}
