
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

abstract class FavoritesState {}

final class GetFavoritesInitialState extends FavoritesState {}

class GetFavoritesLoadingState extends FavoritesState {}

class GetFavoritesSuccessState extends FavoritesState {
  final List<CouponModel> coupons;

  GetFavoritesSuccessState(this.coupons);
}

class GetFavoritesFailureState extends FavoritesState {
  final String error;
  GetFavoritesFailureState(this.error);
}

class AddToFavoritesLoadingState extends FavoritesState {}

class AddToFavoritesSuccessState extends FavoritesState {
  final String message;

  AddToFavoritesSuccessState(this.message);
}

class AddToFavoritesFailureState extends FavoritesState {
  final String error;

  AddToFavoritesFailureState(this.error);
}

class RemoveFromFavoritesLoadingState extends FavoritesState {}

class RemoveFromFavoritesSuccessState extends FavoritesState {
  final String message;

  RemoveFromFavoritesSuccessState(this.message);
}

class RemoveFromFavoritesFailureState extends FavoritesState {
  final String error;

  RemoveFromFavoritesFailureState(this.error);
}