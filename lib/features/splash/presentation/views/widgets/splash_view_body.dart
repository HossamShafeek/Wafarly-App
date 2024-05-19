import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/widgets/loading_indicator_widget.dart';
import 'package:wafarly/core/widgets/logo_text_widget.dart';


class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, bottom: 70.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LogoTextWidget(),
            LoadingIndicatorWidget(strokeWidth: 3.5.h),
          ],
        ),
      ),
    );
  }
}