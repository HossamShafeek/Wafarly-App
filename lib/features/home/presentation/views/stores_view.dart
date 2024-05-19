import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_stores_list_view.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/core/widgets/custom_search_field.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_state.dart';
import 'package:wafarly/features/home/presentation/views/widgets/stores_grid_view.dart';

class StoresView extends StatelessWidget {
  const StoresView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        if (state is StoresSuccessState || state is GetSearchedStoresList) {
          return Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
              top: AppConstants.defaultPadding,
            ),
            child: Column(
              children: [
                CustomSearchField(
                  hintText: AppStrings.searchHintText,
                  controller: StoresCubit.get(context).searchController,
                  onChanged: (value) {
                    StoresCubit.get(context)
                        .getSearchedStoresList(storeName: value);
                  },
                ),
                if (StoresCubit.get(context).stores.isNotEmpty) ...{
                  Gap(AppConstants.size10h),
                  StoresGridView(
                    stores:
                        StoresCubit.get(context).searchController.text.isEmpty
                            ? StoresCubit.get(context).stores
                            : StoresCubit.get(context).searchedStoresList,
                  ),
                } else ...{
                  Expanded(
                    child: Center(
                      child: CustomEmptyWidget(
                        imagePath: AppAssets.emptyList,
                        title: AppStrings.noStoresTitle,
                        subtitle: AppStrings.noStoresSubtitle,
                      ),
                    ),
                  ),
                }
              ],
            ),
          );
        } else if (state is StoresFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerStoresListView();
        }
      },
    );
  }
}