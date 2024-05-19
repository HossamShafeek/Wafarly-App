import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/data/repository/home_repository.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.homeRepository) : super(OffersInitialState());
  final HomeRepository homeRepository;

  static OffersCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<OfferModel> offers = [];

  Future<void> getOffers() async {
    emit(OffersLoadingState());
    Either<Failure, List<OfferModel>> result;
    result = await homeRepository.getOffers();
    result.fold((failure) {
      emit(OffersFailureState(failure.error));
    }, (offers) {
      this.offers = offers;
      emit(OffersSuccessState(offers));
    });
  }

  List<OfferModel> searchedOffersList = [];

  void getSearchedOffersList({required String storeName}) {
    searchedOffersList = offers.where((element) {
      return element.storeName.contains(storeName);
    }).toList();
    emit(GetSearchedOffersList());
  }

  Future<void> addOffer() async {
    emit(AddOfferLoadingState());
    Either<Failure, String> result =
    await homeRepository.addOffer(
      offerModel: OfferModel(
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        storeName: storeNameController.text,
        id: '',
      ),
    );
    result.fold((failure) {
      emit(AddOfferFailureState(failure.error));
    }, (message) {
      emit(AddOfferSuccessState(message));
    });
  }

  Future<void> updateOffer({required String storeId}) async {
    emit(UpdateOfferLoadingState());
    Either<Failure, String> result =
    await homeRepository.updateOffer(
      offerId: storeId,
      offerModel: OfferModel(
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        storeName: storeNameController.text,
        id: storeId,
      ),
    );
    result.fold((failure) {
      emit(UpdateOfferFailureState(failure.error));
    }, (message) {
      emit(UpdateOfferSuccessState(message));
    });
  }



  Future<void> deleteOffer({required String storeId}) async {
    emit(DeleteOfferLoadingState());
    Either<Failure, String> result =
    await homeRepository.deleteOffer(
      offerId:storeId,
    );
    result.fold((failure) {
      emit(DeleteOfferFailureState(failure.error));
    }, (message) {
      emit(DeleteOfferSuccessState(message));
    });
  }

}
