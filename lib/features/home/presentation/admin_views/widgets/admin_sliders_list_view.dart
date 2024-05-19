import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/custom_slidable.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/update_slider_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/views/widgets/offers_list_view_item.dart';

class AdminSlidersListView extends StatelessWidget {

  const AdminSlidersListView({super.key, required this.sliders});

  final List<OfferModel> sliders;

  @override
  Widget build(BuildContext context) {
    if (sliders.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: AppConstants.defaultPadding,
            top: AppConstants.size5h,
          ),
          itemBuilder: (context, index) {
            return CustomSlidable(
              delete: (context) {
                SlidersCubit.get(context).deleteSlider(storeId: sliders[index].id);
              },
              edit: (context) {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return UpdateSliderBottomSheet(sliderModel: sliders[index]);
                  },
                );
              },
              child: OffersListViewItem(
                offerModel: sliders[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(AppConstants.size10h);
          },
          itemCount: sliders.length,
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
