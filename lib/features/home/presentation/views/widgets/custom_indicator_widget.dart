import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget(
      {super.key, required this.count, required this.currentIndex});

  final int count, currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedSmoothIndicator(
        count: count,
        activeIndex: currentIndex,
        effect: ExpandingDotsEffect(
          dotColor: AppColors.grey50,
          dotHeight: 10,
          dotWidth: 10,
          expansionFactor: 4,
          spacing: AppConstants.size5w,
          activeDotColor: AppColors.primary,
        ),
      ),
    );
  }
}
