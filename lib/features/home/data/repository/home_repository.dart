import 'package:dartz/dartz.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<OfferModel>>> getSliders();

  Future<Either<Failure, String>> addSlider({required OfferModel sliderModel});

  Future<Either<Failure, String>> updateSlider({
    required OfferModel sliderModel,
    required String sliderId,
  });

  Future<Either<Failure, String>> deleteSlider({required String sliderId});

  Future<Either<Failure, List<OfferModel>>> getOffers();

  Future<Either<Failure, String>> addOffer({required OfferModel offerModel});

  Future<Either<Failure, String>> updateOffer({
    required OfferModel offerModel,
    required String offerId,
  });

  Future<Either<Failure, String>> deleteOffer({required String offerId});

  Future<Either<Failure, List<StoreModel>>> getStores();

  Future<Either<Failure, String>> addStore({required StoreModel storeModel});

  Future<Either<Failure, String>> updateStore({
    required StoreModel storeModel,
    required String storeId,
  });

  Future<Either<Failure, String>> deleteStore({required String storeId});

  Future<Either<Failure, List<CouponModel>>> getCoupons();

  Future<Either<Failure, String>> addCoupon({required CouponModel couponModel});

  Future<Either<Failure, String>> updateCoupon({
    required CouponModel couponModel,
    required String couponId,
  });

  Future<Either<Failure, String>> deleteCoupon({required String couponId});
}
