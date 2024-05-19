import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_dropdown.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/core/widgets/loading_indicator_widget.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_state.dart';

class StoreDropdown extends StatelessWidget {
  const StoreDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        if (state is StoresSuccessState) {
          return CustomDropdown(
            title: AppStrings.storeName,
            hintText: AppStrings.selectStoreName,
            messageForValidate: AppStrings.pleaseSelectStoreName,
            items: state.stores
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.storeName),
                  ),
                )
                .toList(),
            onChange: (value) {
              CouponsCubit.get(context).storeDropdownValue = value.storeName;
            },
          );
        } else if (state is StoresFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
