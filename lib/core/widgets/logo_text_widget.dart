import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/utils/app_assets.dart';


class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
     return Image.asset(
    AppAssets.wafarlyLogo,
    width: size??150.h,
  );
  }
}
