import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/logo_text_widget.dart';
import 'package:wafarly/core/widgets/no_internet_widget.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BottomNavigationCubit.get(context).checkInternetConnection().then((value) {
        if (BottomNavigationCubit.get(context).isInternet) {
          SlidersCubit.get(context).getSliders();
          StoresCubit.get(context).getStores();
          CouponsCubit.get(context).getCoupons();
          if (AppConstants.userId.isNotEmpty) {
            ProfileCubit.get(context).getUserData();
            FavoritesCubit.get(context).getFavorites();
          }
          AboutCubit.get(context).getAboutData();
          OffersCubit.get(context).getOffers();
        }
      });
    });
    BottomNavigationCubit.get(context).currentIndex = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            title: LogoTextWidget(
              size: 100.h,
            ),
          ),
          body: BottomNavigationCubit.get(context).isInternet
              ? BottomNavigationCubit.get(context)
                  .bodyScreens[BottomNavigationCubit.get(context).currentIndex]
              : NoInternetWidget(
                  onPressed: () {
                    BottomNavigationCubit.get(context).checkInternetConnection().then((value) {
                      if (BottomNavigationCubit.get(context).isInternet) {
                        SlidersCubit.get(context).getSliders();
                        StoresCubit.get(context).getStores();
                        CouponsCubit.get(context).getCoupons();
                        if (AppConstants.userId.isNotEmpty) {
                          ProfileCubit.get(context).getUserData();
                          FavoritesCubit.get(context).getFavorites();
                        }
                        AboutCubit.get(context).getAboutData();
                        OffersCubit.get(context).getOffers();
                      } else {
                        showErrorSnackBar(
                            context: context,
                            message: AppStrings.noInternetTitle);
                      }
                    });
                  },
                ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              BottomNavigationCubit.get(context).changeBottomNavigation(index);
            },
            currentIndex: BottomNavigationCubit.get(context).currentIndex,
            items: BottomNavigationCubit.get(context).bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}
