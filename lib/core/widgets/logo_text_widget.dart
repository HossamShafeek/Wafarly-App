import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.wafarly,
      style: AppStyles.styleBold30Red,
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Image.asset(
//     AppAssets.logoText,
//     width: size??AppConstants.size200w,
//   );
// }
