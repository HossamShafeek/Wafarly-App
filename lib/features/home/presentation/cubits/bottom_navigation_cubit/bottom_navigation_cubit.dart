import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/features/favorites/presentation/view/favorites_view.dart';
import 'package:wafarly/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:wafarly/features/home/presentation/views/stores_view.dart';
import 'package:wafarly/features/home/presentation/views/home_view.dart';
import 'package:wafarly/features/menu/presentation/views/menu_view.dart';
import 'package:wafarly/features/home/presentation/views/offers_view.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }

  bool isInternet = false;

  Future<void>checkInternetConnection()async{
    isInternet  = await InternetConnectionChecker().hasConnection;
    emit(CheckInternetConnection());
  }

  List<Widget> bodyScreens = const [
    MenuView(),
    FavoritesView(),
    HomeView(),
    OffersView(),
    StoresView(),
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
        IconBroken.Heart,
      ),
      label: AppStrings.favorites,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: AppStrings.home,
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
