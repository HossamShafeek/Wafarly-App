import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/authentication/data/models/authentication_model.dart';
import 'package:wafarly/features/authentication/data/repository/authentication_repository.dart';
import 'package:wafarly/features/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authenticationRepository) : super(LoginInitialState());

  final AuthenticationRepository authenticationRepository;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibilityState());
  }
  late User user;
   AuthenticationModel? userModel;

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoadingState());
    Either<Failure, User> result =
    await authenticationRepository.loginWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(LoginFailureState(failure.error));
    }, (user) async{
      this.user = user;
      DocumentSnapshot<Map<String, dynamic>> users =
      await firebaseFirestore.collection('Users').doc(user.uid).get();
      userModel = AuthenticationModel.fromJson(users.data()!);
      emit(LoginSuccessState(user));
    });
  }

}
