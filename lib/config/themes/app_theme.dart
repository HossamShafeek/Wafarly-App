import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final int alpha = color.alpha;

  final Map<int, Color> shades = {
    50: Color.fromARGB(alpha, red, green, blue),
    100: Color.fromARGB(alpha, red, green, blue),
    200: Color.fromARGB(alpha, red, green, blue),
    300: Color.fromARGB(alpha, red, green, blue),
    400: Color.fromARGB(alpha, red, green, blue),
    500: Color.fromARGB(alpha, red, green, blue),
    600: Color.fromARGB(alpha, red, green, blue),
    700: Color.fromARGB(alpha, red, green, blue),
    800: Color.fromARGB(alpha, red, green, blue),
    900: Color.fromARGB(alpha, red, green, blue),
  };

  return MaterialColor(color.value, shades);
}


ThemeData appTheme() {
  return ThemeData(
      primarySwatch: getMaterialColor(AppColors.primary),
      useMaterial3: false,
      unselectedWidgetColor: AppColors.grey,
      textTheme: GoogleFonts.tajawalTextTheme(),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: AppColors.transparent,
        elevation: 0,
        systemOverlayStyle: AppConstants.systemUiOverlayStyleDark,
        titleTextStyle: AppStyles.styleRegular25Black,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedIconTheme: IconThemeData(size: AppConstants.iconSize22),
        unselectedIconTheme: IconThemeData(size: AppConstants.iconSize22),
        selectedLabelStyle: AppStyles.styleRegular15Grey,
        unselectedLabelStyle: AppStyles.styleRegular13Grey,
      ));
}
