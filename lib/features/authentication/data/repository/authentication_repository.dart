import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/authentication/data/models/authentication_model.dart';


abstract class AuthenticationRepository {
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> registerWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> saveUserDataToFirebase({
    required AuthenticationModel authenticationModel,
  });
  Future<Either<Failure, String>> resetPassword({
    required String email,
  });
}
