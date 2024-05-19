import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';


class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton(
      {super.key,
      required this.onTap,
      required this.icon,
      this.padding,
       this.iconColor,
      this.radius,
      this.backgroundColor,
      this.iconSize});

  final void Function() onTap;
  final IconData icon;

  final double? padding;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? radius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(
            padding ?? AppConstants.size3h,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.white,
            borderRadius:
                BorderRadius.circular(radius ?? AppConstants.radius5r),
          ),
          child: Icon(
            icon,
            color: iconColor??AppColors.primary,
            size: iconSize ?? AppConstants.iconSize22,
          )),
    );
  }
}
