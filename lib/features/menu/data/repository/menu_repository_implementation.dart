import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/authentication/data/models/authentication_model.dart';
import 'package:wafarly/features/menu/data/models/about_model.dart';
import 'package:wafarly/features/menu/data/repository/menu_repository.dart';

class MenuRepositoryImplementation extends MenuRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, AuthenticationModel>> getUserData({
    required String userId,
  }) async {
    try {
      AuthenticationModel userModel ;
      if(CacheHelper.getString(key: AppConstants.cacheUserModel)==null){
        DocumentSnapshot<Map<String, dynamic>> result =
        await firebaseFirestore.collection('Users').doc(userId).get();
        userModel = AuthenticationModel.fromJson(result.data()!);
        CacheHelper.setString(
            key: AppConstants.cacheUserModel, value: jsonEncode(userModel.toJson()));
        return Right(userModel);
      }else{
        Map<String, dynamic> resultFromCache = await jsonDecode(
            CacheHelper.getString(key: AppConstants.cacheUserModel)!);
        userModel = AuthenticationModel.fromJson(resultFromCache);
        return Right(userModel);
      }
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateUserData(
      {required String userId,
      required String firstName,
      required String lastName}) async {
    try {
      await firebaseFirestore.collection('Users').doc(userId).update({
        'first_name': firstName,
        'last_name': lastName,
      });
      return const Right('تم تحديث البيانات بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, AboutModel>> getAboutData() async {
    try {
      AboutModel aboutModel;
      if(CacheHelper.getString(key: AppConstants.cacheAboutModel)==null){
        DocumentSnapshot<Map<String, dynamic>> result = await firebaseFirestore
            .collection('About')
            .doc('N3Itn1OgRFktt0zznK8f')
            .get();
        aboutModel = AboutModel.fromJson(result.data()!);
        CacheHelper.setString(
            key: AppConstants.cacheAboutModel, value: jsonEncode(aboutModel.toJson()));
        return Right(aboutModel);
      }else{
        Map<String, dynamic> resultFromCache = await jsonDecode(
            CacheHelper.getString(key: AppConstants.cacheAboutModel)!);
        aboutModel = AboutModel.fromJson(resultFromCache);
        return Right(aboutModel);
      }
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateAboutData(
      {required AboutModel aboutModel}) async {
    try {
      await firebaseFirestore
          .collection('About')
          .doc('N3Itn1OgRFktt0zznK8f')
          .update(aboutModel.toJson());
      return const Right('تم تحديث بيانات التطبيق بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser({required String userId}) async{
    try {
      await firebaseFirestore.collection('Users').doc(userId).delete();
      await firebaseAuth.currentUser!.delete();

      return const Right('تم حذف حسابك بنجاح');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
