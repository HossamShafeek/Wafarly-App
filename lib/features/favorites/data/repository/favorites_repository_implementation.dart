import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/favorites/data/repository/favorites_repository.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

class FavoritesRepositoryImplementation extends FavoritesRepository {
  FavoritesRepositoryImplementation();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<CouponModel>>> getFavorites(
      {required String userId}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> result = await firebaseFirestore
          .collection('Users')
          .doc(userId)
          .collection('Favorites')
          .get();
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
  Future<Either<Failure, String>> addToFavorites({
    required String userId,
    required CouponModel couponModel,
  }) async {
    try {
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
