import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/service_locator.dart';
import 'package:wafarly/firebase_options.dart';
import 'package:wafarly/wafarly.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  await CacheHelper.init();
  AppConstants.userId = CacheHelper.getString(key: 'userId') ?? '';
  AppConstants.userType = CacheHelper.getString(key: 'userType') ?? '';
  runApp(const Wafarly());
}
