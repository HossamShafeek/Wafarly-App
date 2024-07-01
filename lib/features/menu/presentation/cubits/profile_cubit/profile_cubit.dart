import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/authentication/data/models/authentication_model.dart';
import 'package:wafarly/features/menu/data/repository/menu_repository.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.menuRepository) : super(ProfileInitialState());
  final MenuRepository menuRepository;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static ProfileCubit get(context) => BlocProvider.of(context);

  late AuthenticationModel authenticationModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    Either<Failure, AuthenticationModel> result;
    result = await menuRepository.getUserData(
      userId: AppConstants.userId,
    );
    result.fold((failure) {
      emit(GetUserDataFailureState(failure.error));
    }, (authenticationModel) {
      this.authenticationModel = authenticationModel;
      emit(GetUserDataSuccessState(authenticationModel));
    });
  }

  Future<void> updateUserData() async {
    emit(UpdateUserDataLoadingState());
    Either<Failure, String> result;
    result = await menuRepository.updateUserData(
      userId: AppConstants.userId,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
    result.fold((failure) {
      emit(UpdateUserDataFailureState(failure.error));
    }, (message) {
      emit(UpdateUserDataSuccessState(message));
    });
  }

  Future<void> deleteUser() async {
    emit(DeleteUserLoadingState());
    Either<Failure, String> result;
    result = await menuRepository.deleteUser(
      userId: AppConstants.userId,
    );
    result.fold((failure) {
      emit(DeleteUserFailureState(failure.error));
    }, (message) {
      emit(DeleteUserSuccessState(message));
    });
  }
}
