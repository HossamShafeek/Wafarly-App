import 'package:wafarly/features/authentication/data/models/authentication_model.dart';

abstract class ProfileState {}

final class ProfileInitialState extends ProfileState {}

class GetUserDataLoadingState extends ProfileState {}

class GetUserDataSuccessState extends ProfileState {
  final AuthenticationModel authenticationModel;

  GetUserDataSuccessState(this.authenticationModel);
}

class GetUserDataFailureState extends ProfileState {
  final String error;

  GetUserDataFailureState(this.error);
}

class UpdateUserDataLoadingState extends ProfileState {}

class UpdateUserDataSuccessState extends ProfileState {
  final String message;

  UpdateUserDataSuccessState(this.message);
}

class UpdateUserDataFailureState extends ProfileState {
  final String error;

  UpdateUserDataFailureState(this.error);
}

