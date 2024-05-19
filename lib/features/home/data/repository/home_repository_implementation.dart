import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/data/repository/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<OfferModel>>> getSliders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Sliders').get();
      List<OfferModel> banners = result.docs.map((banner) {
        return OfferModel.fromJson(banner.data());
      }).toList();
      return Right(banners);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferModel>>> getOffers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Offers').get();
      List<OfferModel> offers = result.docs.map((banner) {
        return OfferModel.fromJson(banner.data());
      }).toList();
      return Right(offers);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StoreModel>>> getStores() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Stores').get();
      List<StoreModel> categories = result.docs.map((category) {
        return StoreModel.fromJson(category.data());
      }).toList();
      return Right(categories);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CouponModel>>> getCoupons() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await firebaseFirestore.collection('Coupons').get();
      List<CouponModel> coupons = result.docs.map((coupon) {
        return CouponModel.fromJson(coupon.data());
      }).toList();
      return Right(coupons);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addCoupon(
      {required CouponModel couponModel}) async {
    try {
      await firebaseFirestore
          .collection('Coupons')
          .add(couponModel.toJson())
          .then((value) async {
        await firebaseFirestore.collection('Coupons').doc(value.id).update({
          'id': value.id,
        });
      });
      return const Right('تم إضافة الكوبون بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addOffer(
      {required OfferModel offerModel}) async {
    try {
      await firebaseFirestore
          .collection('Offers')
          .add(offerModel.toJson())
          .then((value) async {
        await firebaseFirestore.collection('Offers').doc(value.id).update({
          'id': value.id,
        });
      });
      return const Right('تم إضافة العرض بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addSlider(
      {required OfferModel sliderModel}) async {
    try {
      await firebaseFirestore
          .collection('Sliders')
          .add(sliderModel.toJson())
          .then((value) async {
        await firebaseFirestore.collection('Sliders').doc(value.id).update({
          'id': value.id,
        });
      });
      return const Right('تم إضافة العرض بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addStore(
      {required StoreModel storeModel}) async {
    try {
      await firebaseFirestore
          .collection('Stores')
          .add(storeModel.toJson())
          .then((value) async {
        await firebaseFirestore.collection('Stores').doc(value.id).update({
          'id': value.id,
        });
      });
      return const Right('تم إضافة المتجر بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCoupon(
      {required String couponId}) async {
    try {
      await firebaseFirestore.collection('Coupons').doc(couponId).delete();
      return const Right('تم حذف الكوبون بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteOffer({required String offerId}) async {
    try {
      await firebaseFirestore.collection('Offers').doc(offerId).delete();
      return const Right('تم حذف العرض بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSlider(
      {required String sliderId}) async {
    try {
      await firebaseFirestore.collection('Sliders').doc(sliderId).delete();
      return const Right('تم حذف العرض بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteStore({required String storeId}) async {
    try {
      await firebaseFirestore.collection('Stores').doc(storeId).delete();
      return const Right('تم حذف المتجر بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCoupon({required CouponModel couponModel,required String couponId,}) async{
    try {
      await firebaseFirestore
          .collection('Coupons').doc(couponModel.id).update(couponModel.toJson());
      return const Right('تم تعديل الكوبون بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateOffer({required OfferModel offerModel,required String offerId,}) async{
    try {
      await firebaseFirestore
          .collection('Offers').doc(offerModel.id).update(offerModel.toJson());
      return const Right('تم تعديل العرض بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateSlider({required OfferModel sliderModel,required String sliderId,}) async{
    try {
      await firebaseFirestore
          .collection('Sliders').doc(sliderModel.id).update(sliderModel.toJson());
      return const Right('تم تعديل العرض بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateStore({required StoreModel storeModel,required String storeId,}) async{
    try {
      await firebaseFirestore
          .collection('Stores').doc(storeModel.id).update(storeModel.toJson());
      return const Right('تم تعديل المتجر بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
