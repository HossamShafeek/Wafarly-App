import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/config/themes/app_theme.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/service_locator.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';

import 'features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'features/menu/presentation/cubits/about_cubit/about_cubit.dart';
import 'features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

class Wafarly extends StatelessWidget {
  const Wafarly({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers:[
            BlocProvider(create: (context) => getIt.get<FavoritesCubit>(),),
            BlocProvider(create: (context) => getIt.get<OffersCubit>(),),
            BlocProvider(create: (context) => getIt.get<StoresCubit>(),),
            BlocProvider(create: (context) => getIt.get<SlidersCubit>(),),
            BlocProvider(create: (context) => getIt.get<CouponsCubit>(),),
            BlocProvider(create: (context) => getIt.get<ProfileCubit>(),),
            BlocProvider(create: (context) => getIt.get<AboutCubit>(),),
          ],
          child: MaterialApp(
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            title: AppStrings.wafarly,
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
