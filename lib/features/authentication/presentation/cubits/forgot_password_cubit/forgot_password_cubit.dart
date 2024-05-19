import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/authentication/data/repository/authentication_repository.dart';
import 'package:wafarly/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authenticationRepository) : super(ForgotPasswordInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);


  void resetPassword() async {
    emit(ForgotPasswordLoadingState());
    Either<Failure, String> result =
    await authenticationRepository.resetPassword(
      email: emailController.text,
    );
    result.fold((failure) {
      emit(ForgotPasswordFailureState(failure.error));
    }, (user) {
      emit(ForgotPasswordSuccessState(user));
    });
  }
}
