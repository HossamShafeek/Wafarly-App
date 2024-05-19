import 'package:wafarly/features/menu/data/models/about_model.dart';

abstract class AboutState {}

final class AboutInitialState extends AboutState {}

class GetAboutLoadingState extends AboutState {}

class GetAboutSuccessState extends AboutState {
  final AboutModel aboutModel;

  GetAboutSuccessState(this.aboutModel);
}

class GetAboutFailureState extends AboutState {
  final String error;

  GetAboutFailureState(this.error);
}

class UpdateAboutLoadingState extends AboutState {}

class UpdateAboutSuccessState extends AboutState {
  final String message;

  UpdateAboutSuccessState(this.message);
}

class UpdateAboutFailureState extends AboutState {
  final String error;

  UpdateAboutFailureState(this.error);
}
