import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';



class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle(
      {super.key, required this.subtitle, required this.title});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleBold30Red,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: AppConstants.size5h, bottom: AppConstants.defaultPadding),
          child: Text(
            subtitle,
            style: AppStyles.styleRegular16Black.copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
