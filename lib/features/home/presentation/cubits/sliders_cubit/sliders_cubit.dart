import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/data/repository/home_repository.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit(this.homeRepository) : super(SlidersInitialState());
  final HomeRepository homeRepository;

  static SlidersCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<OfferModel> sliders=[];

  Future<void> getSliders() async {
    emit(SlidersLoadingState());
    Either<Failure, List<OfferModel>> result;
    result = await homeRepository.getSliders();
    result.fold((failure) {
      emit(SlidersFailureState(failure.error));
    }, (sliders) {
      this.sliders =sliders;
      emit(SlidersSuccessState(sliders));
    });
  }

  int currentIndex = 0;

  void changeSliderIndex({required int index}){
    currentIndex = index;
    emit(ChangeSliderIndexState());
  }

  List<OfferModel> searchedSlidersList = [];

  void getSearchedSlidersList({required String storeName}) {
    searchedSlidersList = sliders.where((element) {
      return element.storeName.contains(storeName);
    }).toList();
    emit(GetSearchedSlidersList());
  }

  Future<void> addSlider() async {
    emit(AddSliderLoadingState());
    Either<Failure, String> result =
    await homeRepository.addSlider(
      sliderModel: OfferModel(
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        storeName: storeNameController.text,
        id: '',
      ),
    );
    result.fold((failure) {
      emit(AddSliderFailureState(failure.error));
    }, (message) {
      emit(AddSliderSuccessState(message));
    });
  }

  Future<void> updateSlider({required String storeId}) async {
    emit(UpdateSliderLoadingState());
    Either<Failure, String> result =
    await homeRepository.updateSlider(
      sliderId: storeId,
      sliderModel: OfferModel(
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        storeName: storeNameController.text,
        id: storeId,
      ),
    );
    result.fold((failure) {
      emit(UpdateSliderFailureState(failure.error));
    }, (message) {
      emit(UpdateSliderSuccessState(message));
    });
  }

  Future<void> deleteSlider({required String storeId}) async {
    emit(DeleteSliderLoadingState());
    Either<Failure, String> result =
    await homeRepository.deleteSlider(
      sliderId:storeId,
    );
    result.fold((failure) {
      emit(DeleteSliderFailureState(failure.error));
    }, (message) {
      emit(DeleteSliderSuccessState(message));
    });
  }

}