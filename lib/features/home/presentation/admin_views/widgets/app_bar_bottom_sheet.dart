import 'package:flutter/material.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class AppBarBottomSheet extends StatelessWidget {
  const AppBarBottomSheet({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            IconBroken.Arrow___Right_2,
            size: AppConstants.iconSize28,
            color:AppColors.primary,
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular25Black,
          ),
        ),
      ],
    );
  }
}
