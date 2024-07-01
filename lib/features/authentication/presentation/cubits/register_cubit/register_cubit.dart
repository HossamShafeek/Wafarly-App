import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/authentication/data/models/authentication_model.dart';
import 'package:wafarly/features/authentication/data/repository/authentication_repository.dart';
import 'package:wafarly/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authenticationRepository) : super(RegisterInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(RegisterChangePasswordVisibilityState());
  }

  late User user;

  Future<void> registerWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    Either<Failure, User> result =
    await authenticationRepository.registerWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(RegisterFailureState(failure.error));
    }, (user) async{
      this.user = user;
     await saveUserDataToFirebase();
      emit(RegisterSuccessState(user));
    });
  }


  Future<void> saveUserDataToFirebase() async {
    emit(SaveUserDataLoadingState());
    Either<Failure, String> result =
    await authenticationRepository.saveUserDataToFirebase(
      authenticationModel: AuthenticationModel(
          uid: user.uid,
          email: user.email!,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          userType: 'user',
          createAt: DateTime.now().toString()),
    );
    result.fold((failure) {
      emit(SaveUserDataFailureState(failure.error));
    }, (message) {
      emit(SaveUserDataSuccessState(message: message));
    });
  }
}
