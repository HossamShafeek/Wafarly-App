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
import 'package:wafarly/features/home/presentation/admin_views/widgets/admin_offers_list_view.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_state.dart';

class AdminOffersView extends StatelessWidget {
  const AdminOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OffersCubit, OffersState>(
      listener: (context, state) {
        if(state is DeleteOfferSuccessState){
          OffersCubit.get(context).getOffers();
          showSuccessSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is OffersSuccessState || state is GetSearchedOffersList) {
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
                  controller: OffersCubit.get(context).searchController,
                  onChanged: (value) {
                    OffersCubit.get(context)
                        .getSearchedOffersList(storeName: value);
                  },
                ),
                if (OffersCubit.get(context).offers.isNotEmpty) ...{
                  Gap(AppConstants.size10h),
                  AdminOffersListView(
                    offers: OffersCubit.get(context).searchController.text.isEmpty
                        ? OffersCubit.get(context).offers
                        : OffersCubit.get(context).searchedOffersList,
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
        } else if (state is OffersFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerOffersView();
        }
      },
    );
  }
}
