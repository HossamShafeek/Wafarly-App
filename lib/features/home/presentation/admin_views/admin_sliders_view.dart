import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/shimmer/shimmer_offers_view.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/core/widgets/custom_search_field.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/admin_sliders_list_view.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';

class AdminSlidersView extends StatelessWidget {
  const AdminSlidersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlidersCubit, SlidersState>(
      listener: (context, state) {
        if(state is DeleteSliderSuccessState){
          SlidersCubit.get(context).getSliders();
          showSuccessSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is SlidersSuccessState || state is GetSearchedSlidersList) {
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
                  controller: SlidersCubit.get(context).searchController,
                  onChanged: (value) {
                    SlidersCubit.get(context)
                        .getSearchedSlidersList(storeName: value);
                  },
                ),
                if (SlidersCubit.get(context).sliders.isNotEmpty) ...{
                  Gap(AppConstants.size10h),
                  AdminSlidersListView(
                    sliders: SlidersCubit.get(context).searchController.text.isEmpty
                        ? SlidersCubit.get(context).sliders
                        : SlidersCubit.get(context).searchedSlidersList,
                  ),
                } else ...{
                  Expanded(
                    child: Center(
                      child: CustomEmptyWidget(
                        imagePath: AppAssets.emptyList,
                        title: AppStrings.noOffersTitle,
                        subtitle: AppStrings.noOffersSubtitle,
                      ),
                    ),
                  ),
                }
              ],
            ),
          );
        } else if (state is SlidersFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerOffersView();
        }
      },
    );
  }
}



