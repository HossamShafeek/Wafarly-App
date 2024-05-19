import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/presentation/views/widgets/offers_list_view_item.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({super.key, required this.offers});

  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    if (offers.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: AppConstants.defaultPadding,
            top: AppConstants.size5h,
          ),
          itemBuilder: (context, index) {
            return OffersListViewItem(
              offerModel: offers[index],
            );
          },
          separatorBuilder: (context, index) {
            return Gap(AppConstants.size10h);
          },
          itemCount: offers.length,
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
  }
}
