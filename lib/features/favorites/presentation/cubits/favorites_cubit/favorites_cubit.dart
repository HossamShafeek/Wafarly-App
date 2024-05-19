import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/favorites/data/repository/favorites_repository.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_state.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepository)
      : super(GetFavoritesInitialState());

  static FavoritesCubit get(BuildContext context) => BlocProvider.of(context);

  final FavoritesRepository favoritesRepository;

  List<CouponModel> favorites = [];

  Future<void> getFavorites() async {
    emit(GetFavoritesLoadingState());
    Either<Failure, List<CouponModel>> result;
    result = await favoritesRepository.getFavorites(userId: AppConstants.userId);
    result.fold((failure) {
      emit(GetFavoritesFailureState(failure.error));
    }, (favorites) {
      this.favorites = favorites;
      emit(GetFavoritesSuccessState(favorites));
    });
  }

  Future<void> addToFavorites({
    required CouponModel couponModel,
    required String userId,
    required BuildContext context,
  }) async {
    emit(AddToFavoritesLoadingState());
    Either<Failure, String> result;
    result = await favoritesRepository.addToFavorites(
      couponModel: couponModel,
      userId: userId,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(AddToFavoritesFailureState(failure.error));
    }, (message) {
      showSuccessSnackBar(context: context, message: message);
      emit(AddToFavoritesSuccessState(message));
    });
  }

  Future<void> removeFromFavorites({
    required String couponId,
    required String userId,
    required BuildContext context,
  }) async {
    emit(RemoveFromFavoritesLoadingState());
    Either<Failure, String> result =
        await favoritesRepository.removeToFavorites(
          couponId: couponId,
      userId: userId,
    );
    result.fold((failure) {
      showErrorSnackBar(context: context, message: failure.error);
      emit(RemoveFromFavoritesFailureState(failure.error));
    }, (message) {
      showSuccessSnackBar(context: context, message: message);
      emit(RemoveFromFavoritesSuccessState(message));
    });
  }

  void checkExistingProductAndAddOrRemove({
    required CouponModel couponModel,
    required BuildContext context,
  }) {
    if (favorites.contains(couponModel)) {
      removeFromFavorites(
        couponId: couponModel.id,
        userId: AppConstants.userId,
        context: context,
      ).then((value) {
        getFavorites();
      });
    } else {
      addToFavorites(
        couponModel: couponModel,
        userId: AppConstants.userId,
        context: context,
      ).then((value) {
        getFavorites();
      });
    }
  }
}
