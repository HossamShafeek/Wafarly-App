import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/splash/presentation/views/widgets/splash_view_body.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToOnBoardingView();
    super.initState();
  }

  void navigateToOnBoardingView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
     if(AppConstants.userId.isEmpty){
       Navigator.pushReplacementNamed(context, Routes.layoutView);
     }else{
       if(AppConstants.userType=='user'){
         Navigator.pushReplacementNamed(context, Routes.layoutView);
       }else{
         Navigator.pushReplacementNamed(context, Routes.adminLayoutView);
       }
     }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppConstants.systemUiOverlayStyleDark,
        child: SplashViewBody(),
      ),
    );
  }
}
