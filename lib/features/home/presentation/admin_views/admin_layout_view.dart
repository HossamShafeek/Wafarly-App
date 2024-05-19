import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/logo_text_widget.dart';
import 'package:wafarly/core/widgets/no_internet_widget.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/add_coupon_bootom_sheet.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/add_offer_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/add_slider_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/add_store_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/cubits/admin_bottom_navigation_cubit/admin_bottom_navigation_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/admin_bottom_navigation_cubit/admin_bottom_navigation_state.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

class AdminLayoutView extends StatefulWidget {
  const AdminLayoutView({super.key});

  @override
  State<AdminLayoutView> createState() => _AdminLayoutViewState();
}

class _AdminLayoutViewState extends State<AdminLayoutView> {
  @override
  void initState() {
    AdminBottomNavigationCubit.get(context).checkInternetConnection().then((value) {
      if(AdminBottomNavigationCubit.get(context).isInternet){
        SlidersCubit.get(context).getSliders();
        StoresCubit.get(context).getStores();
        CouponsCubit.get(context).getCoupons();
        ProfileCubit.get(context).getUserData();
        OffersCubit.get(context).getOffers();
        AboutCubit.get(context).getAboutData();
      }
    });
    AdminBottomNavigationCubit.get(context).currentIndex = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBottomNavigationCubit, AdminBottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            title: LogoTextWidget(
              size: 100.h,
            ),
          ),
          body: AdminBottomNavigationCubit.get(context).isInternet?AdminBottomNavigationCubit.get(context).bodyScreens[
              AdminBottomNavigationCubit.get(context).currentIndex]:NoInternetWidget(onPressed:(){
            AdminBottomNavigationCubit.get(context).checkInternetConnection().then((value) {
              if(AdminBottomNavigationCubit.get(context).isInternet){
                SlidersCubit.get(context).getSliders();
                StoresCubit.get(context).getStores();
                CouponsCubit.get(context).getCoupons();
                ProfileCubit.get(context).getUserData();
                OffersCubit.get(context).getOffers();
                AboutCubit.get(context).getAboutData();
              }else{
                showErrorSnackBar(
                    context: context,
                    message: AppStrings.noInternetTitle);
              }
            });
          }),
          floatingActionButton:AdminBottomNavigationCubit.get(context).isInternet?
              AdminBottomNavigationCubit.get(context).currentIndex == 0
                  ? const SizedBox.shrink()
                  : FloatingActionButton(
                      onPressed: () {
                        if (AdminBottomNavigationCubit.get(context)
                                .currentIndex ==
                            4) {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return const AddStoreBottomSheet();
                            },
                          );
                        } else if (AdminBottomNavigationCubit.get(context)
                                .currentIndex ==
                            3) {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return const AddOfferBottomSheet();
                            },
                          );
                        } else if (AdminBottomNavigationCubit.get(context)
                                .currentIndex ==
                            2) {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return const AddCouponBottomSheet();
                            },
                          );
                        } else {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return const AddSliderBottomSheet();
                            },
                          );
                        }
                      },
                      child: Icon(
                        Icons.add,
                        size: AppConstants.iconSize22,
                      ),
                    ):const SizedBox.shrink(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              AdminBottomNavigationCubit.get(context)
                  .changeAdminBottomNavigation(index);
            },
            currentIndex: AdminBottomNavigationCubit.get(context).currentIndex,
            items: AdminBottomNavigationCubit.get(context)
                .bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}
