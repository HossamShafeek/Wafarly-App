import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_sliders_list_view.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';
import 'package:wafarly/features/home/presentation/views/widgets/custom_indicator_widget.dart';
import 'package:wafarly/features/home/presentation/views/widgets/slider_list_view_item.dart';

class SlidersListView extends StatelessWidget {
  const SlidersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SlidersState>(
      builder: (context, state) {
        if (state is SlidersSuccessState || state is ChangeSliderIndexState) {
          if (SlidersCubit.get(context).sliders.isNotEmpty) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: SlidersCubit.get(context).sliders.length,
                  itemBuilder: (context, index, s) => SlidersListViewItem(
                    slider: SlidersCubit.get(context).sliders[index],
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      SlidersCubit.get(context).changeSliderIndex(index: index);
                    },
                    autoPlay: true,
                    aspectRatio: 2.2,
                    viewportFraction: 0.80,
                    autoPlayInterval: const Duration(seconds: 4),
                    enlargeCenterPage: true,
                  ),
                ),
                Gap(AppConstants.size15h),
                CustomIndicatorWidget(
                  count: SlidersCubit.get(context).sliders.length,
                  currentIndex: SlidersCubit.get(context).currentIndex,
                ),
              ],
            );
          } else {
            return AspectRatio(
              aspectRatio: 2.2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.grey50,
                  borderRadius: BorderRadius.circular(AppConstants.radius8r),
                ),
                child: Text(
                  AppStrings.noOffersTitle,
                  style: AppStyles.styleRegular16Black,
                ),
              ),
            );
          }
        } else if (state is SlidersFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerSlidersListView();
        }
      },
    );
  }
}
