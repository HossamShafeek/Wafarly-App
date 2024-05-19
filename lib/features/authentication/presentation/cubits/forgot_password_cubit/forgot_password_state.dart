
abstract class ForgotPasswordState {}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String message;

  ForgotPasswordSuccessState(this.message);
}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String error;

  ForgotPasswordFailureState(this.error);
}
