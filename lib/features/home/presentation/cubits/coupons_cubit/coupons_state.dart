import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

abstract class CouponsState {}

final class CouponsInitial extends CouponsState {}

class CouponsLoadingState extends CouponsState {}

class CouponsSuccessState extends CouponsState {
  final List<CouponModel> coupons;

  CouponsSuccessState(this.coupons);
}

class CouponsFailureState extends CouponsState {
  final String error;

  CouponsFailureState(this.error);
}

class GetSearchedCouponsList extends CouponsState {}

class CouponsChangeIsSearchingState extends CouponsState {}

class AddCouponLoadingState extends CouponsState {}

class AddCouponSuccessState extends CouponsState {
  final String message;

  AddCouponSuccessState(this.message);
}

class AddCouponFailureState extends CouponsState {
  final String error;

  AddCouponFailureState(this.error);
}

class UpdateCouponLoadingState extends CouponsState {}

class UpdateCouponSuccessState extends CouponsState {
  final String message;

  UpdateCouponSuccessState(this.message);
}

class UpdateCouponFailureState extends CouponsState {
  final String error;

  UpdateCouponFailureState(this.error);
}

class DeleteCouponLoadingState extends CouponsState {}

class DeleteCouponSuccessState extends CouponsState {
  final String message;

  DeleteCouponSuccessState(this.message);
}

class DeleteCouponFailureState extends CouponsState {
  final String error;

  DeleteCouponFailureState(this.error);
}