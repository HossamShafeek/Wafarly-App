import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/store_dropdown.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';

class UpdateCouponTextsFields extends StatefulWidget {
  const UpdateCouponTextsFields({super.key, required this.couponModel});

  final CouponModel couponModel;

  @override
  State<UpdateCouponTextsFields> createState() => _UpdateCouponTextsFieldsState();
}

class _UpdateCouponTextsFieldsState extends State<UpdateCouponTextsFields> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      CouponsCubit.get(context).titleController.text=widget.couponModel.title;
      CouponsCubit.get(context).codeController.text=widget.couponModel.code;
      CouponsCubit.get(context).imageUrlController.text=widget.couponModel.imageUrl;
      CouponsCubit.get(context).storeUrlController.text=widget.couponModel.storeUrl;
      CouponsCubit.get(context).storeDropdownValue=widget.couponModel.storeName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: CouponsCubit.get(context).titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterTitle;
                }
                return null;
              },
              title: AppStrings.title,
              hintText: AppStrings.enterTitle,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: CouponsCubit.get(context).codeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterCode;
                }
                return null;
              },
              title: AppStrings.code,
              hintText: AppStrings.enterCode,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: CouponsCubit.get(context).imageUrlController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterImageUrl;
                }
                return null;
              },
              title: AppStrings.imageUrl,
              hintText: AppStrings.enterImageUrl,
            ),
            CustomTextField(
              onTapOutsideUnFocus: false,
              textInputType: TextInputType.text,
              controller: CouponsCubit.get(context).storeUrlController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterStoreUrl;
                }
                return null;
              },
              title: AppStrings.storeUrl,
              hintText: AppStrings.enterStoreUrl,
            ),
            const StoreDropdown(),
          ],
        );
      },
    );
  }
}
