import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';
import 'package:wafarly/features/home/presentation/views/widgets/coupons_list_view_item.dart';

class CouponsViewBody extends StatelessWidget {
  const CouponsViewBody({super.key, required this.coupons});

  final List<CouponModel> coupons;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        if (coupons.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemCount: coupons.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CouponsListViewItem(
              couponModel: coupons[index],
            ),
            separatorBuilder: (context, index) =>
                SizedBox(height: AppConstants.size10h),
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.search,
            title: AppStrings.noResultTitle,
            subtitle: AppStrings.noResultSubtitle,
          );
        }
      },
    );
  }
}
