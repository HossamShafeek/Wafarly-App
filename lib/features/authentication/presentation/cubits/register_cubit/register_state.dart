import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final User user;

  RegisterSuccessState(this.user);
}

class RegisterFailureState extends RegisterState {
  final String error;

  RegisterFailureState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterState {}

class SaveUserDataLoadingState extends RegisterState {}

class SaveUserDataSuccessState extends RegisterState {
  final String message;

  SaveUserDataSuccessState({required this.message});
}

class SaveUserDataFailureState extends RegisterState {
  final String error;

  SaveUserDataFailureState(this.error);
}