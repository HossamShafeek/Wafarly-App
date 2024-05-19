import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/features/home/presentation/admin_views/admin_coupons_view.dart';
import 'package:wafarly/features/menu/presentation/views/admin_menu_view.dart';
import 'package:wafarly/features/home/presentation/admin_views/admin_offers_view.dart';
import 'package:wafarly/features/home/presentation/admin_views/admin_sliders_view.dart';
import 'package:wafarly/features/home/presentation/admin_views/admin_stores_view.dart';
import 'package:wafarly/features/home/presentation/cubits/admin_bottom_navigation_cubit/admin_bottom_navigation_state.dart';



class AdminBottomNavigationCubit extends Cubit<AdminBottomNavigationState> {
  AdminBottomNavigationCubit() : super(AdminBottomNavigationInitialState());

  static AdminBottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  void changeAdminBottomNavigation(int index) {
    currentIndex = index;
    emit(ChangeAdminBottomNavigationState());
  }

  bool isInternet = false;

  Future<void>checkInternetConnection()async{
    isInternet  = await InternetConnectionChecker().hasConnection;
    emit(CheckInternetConnection());
  }


  List<Widget> bodyScreens = const [
    AdminMenuView(),
    AdminSlidersView(),
    AdminCouponsView(),
    AdminOffersView(),
    AdminStoresView(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Filter,
      ),
      label: AppStrings.menu,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.More_Square,
      ),
      label: AppStrings.slider,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Ticket,
      ),
      label: AppStrings.coupons,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Discount,
      ),
      label: AppStrings.offers,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Bag,
      ),
      label: AppStrings.stores,
    ),
  ];
}
