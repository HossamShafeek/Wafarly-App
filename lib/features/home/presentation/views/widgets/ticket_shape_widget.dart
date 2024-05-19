import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';

class TicketShapeWidget extends StatelessWidget {
  const TicketShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 20.w,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Container(
        height: 18.w,
        width: AppConstants.size10w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppConstants.radius25r),
            bottomRight: Radius.circular(AppConstants.radius25r),
          ),
        ),
      ),
    );
  }
}