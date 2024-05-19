import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/menu/data/models/about_model.dart';
import 'package:wafarly/features/menu/data/repository/menu_repository.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit(this.menuRepository) : super(AboutInitialState());
  final MenuRepository menuRepository;

  static AboutCubit get(context) => BlocProvider.of(context);
  TextEditingController chatLinkController = TextEditingController();
  TextEditingController appLinkController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  late AboutModel aboutModel;

  Future<void> getAboutData() async {
    emit(GetAboutLoadingState());
    Either<Failure, AboutModel> result;
    result = await menuRepository.getAboutData();
    result.fold((failure) {
      emit(GetAboutFailureState(failure.error));
    }, (aboutModel) {
      this.aboutModel = aboutModel;
      emit(GetAboutSuccessState(aboutModel));
    });
  }

  Future<void> updateUserData() async {
    emit(UpdateAboutLoadingState());
    Either<Failure, String> result;
    result = await menuRepository.updateAboutData(
      aboutModel: AboutModel(
        chatLink: chatLinkController.text,
        appLink: appLinkController.text,
      ),
    );
    result.fold((failure) {
      emit(UpdateAboutFailureState(failure.error));
    }, (message) {
      emit(UpdateAboutSuccessState(message));
    });
  }
}
