import 'package:dartz/dartz.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/authentication/data/models/authentication_model.dart';
import 'package:wafarly/features/menu/data/models/about_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, AuthenticationModel>> getUserData({
    required String userId,
  });
  Future<Either<Failure, String>> updateUserData({
    required String userId,
    required String firstName,
    required String lastName,
  });
  Future<Either<Failure, AboutModel>> getAboutData();
  Future<Either<Failure, String>> updateAboutData({required AboutModel aboutModel});
}
