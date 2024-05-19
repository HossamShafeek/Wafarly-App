import 'package:get_it/get_it.dart';
import 'package:wafarly/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:wafarly/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:wafarly/features/favorites/data/repository/favorites_repository_implementation.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wafarly/features/home/data/repository/home_repository_implementation.dart';
import 'package:wafarly/features/home/presentation/cubits/admin_bottom_navigation_cubit/admin_bottom_navigation_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/menu/data/repository/menu_repository_implementation.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Auth Repo ( Login Cubit - Register Cubit)
  getIt.registerSingleton<AuthenticationRepositoryImplementation>(
      AuthenticationRepositoryImplementation());
  getIt.registerFactory(() =>
      LoginCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  getIt.registerFactory(() =>
      RegisterCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  getIt.registerFactory(() =>
      ForgotPasswordCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  //Bottom Nav Bar Cubit
  getIt.registerFactory(() => BottomNavigationCubit());
  //Admin Bottom Nav Bar Cubit
  getIt.registerFactory(() => AdminBottomNavigationCubit());
  //Home Repo ( Sliders Cubit - Categories Cubit - Coupons Cubit )
  getIt.registerSingleton<HomeRepositoryImplementation>(
      HomeRepositoryImplementation());
  getIt.registerFactory(
      () => SlidersCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => OffersCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => StoresCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
      () => CouponsCubit(getIt.get<HomeRepositoryImplementation>()));
  ///Menu Repo ( Profile Cubit - About Cubit )
  getIt.registerSingleton<MenuRepositoryImplementation>(
    MenuRepositoryImplementation()
  );
  getIt.registerFactory(
      () => ProfileCubit(getIt.get<MenuRepositoryImplementation>()));
  getIt.registerFactory(
          () => AboutCubit(getIt.get<MenuRepositoryImplementation>()));
  // //Favourites Repo ( Favourites Cubit )
  getIt.registerSingleton(FavoritesRepositoryImplementation());
  getIt.registerFactory(
          () => FavoritesCubit(getIt.get<FavoritesRepositoryImplementation>()));
}