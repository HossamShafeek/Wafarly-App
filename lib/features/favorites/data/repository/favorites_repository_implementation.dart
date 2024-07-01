import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/favorites/data/repository/favorites_repository.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

class FavoritesRepositoryImplementation extends FavoritesRepository {
  FavoritesRepositoryImplementation();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<CouponModel>>> getFavorites(
      {required String userId}) async {
    try {
      List<CouponModel> coupons;
      if (CacheHelper.getString(key: AppConstants.cacheFavoritesModel) ==
          null) {
        QuerySnapshot<Map<String, dynamic>> result = await firebaseFirestore
            .collection('Users')
            .doc(userId)
            .collection('Favorites')
            .get();
        List<Map<String, dynamic>> convertResult = result.docs.map((e) {
          return e.data();
        }).toList();
        CacheHelper.setString(
            key: AppConstants.cacheFavoritesModel,
            value: jsonEncode(convertResult));
        coupons = result.docs.map((coupon) {
          return CouponModel.fromJson(coupon.data());
        }).toList();
        return Right(coupons);
      } else {
        List<dynamic> result = await jsonDecode(
            CacheHelper.getString(key: AppConstants.cacheFavoritesModel)!);
        coupons = result.map((coupon) {
          return CouponModel.fromJson(coupon);
        }).toList();
        return Right(coupons);
      }
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addToFavorites({
    required String userId,
    required CouponModel couponModel,
  }) async {
    try {
      CacheHelper.removeData(key: AppConstants.cacheFavoritesModel);
      await firebaseFirestore
          .collection('Users')
          .doc(userId)
          .collection('Favorites')
          .doc(couponModel.id)
          .set(couponModel.toJson());
      return const Right('تم إضافة الكوبون الي المفضلة');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeToFavorites({
    required String couponId,
    required String userId,
  }) async {
    try {
      CacheHelper.removeData(key: AppConstants.cacheFavoritesModel);
      await firebaseFirestore
          .collection('Users')
          .doc(userId)
          .collection('Favorites')
          .doc(couponId)
          .delete();
      return const Right('تم حذف الكوبون من المفضلة');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
