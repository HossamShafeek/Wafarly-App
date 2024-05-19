import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/data/repository/home_repository.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  StoresCubit(this.homeRepository) : super(StoresInitial());
  final HomeRepository homeRepository;
  final TextEditingController searchController = TextEditingController();
  static StoresCubit get(context) => BlocProvider.of(context);

  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<StoreModel> stores=[];

  Future<void> getStores() async {
    emit(StoresLoadingState());
    Either<Failure, List<StoreModel>> result;
    result = await homeRepository.getStores();
    result.fold((failure) {
      emit(StoresFailureState(failure.error));
    }, (stores) {
      this.stores=stores;
      emit(StoresSuccessState(stores));
    });
  }

  List<StoreModel> searchedStoresList = [];

  void getSearchedStoresList({required String storeName}) {
    searchedStoresList = stores.where((element) {
      return element.storeName.contains(storeName);
    }).toList();
    emit(GetSearchedStoresList());
  }

  Future<void> addStore() async {
    emit(AddStoreLoadingState());
    Either<Failure, String> result =
    await homeRepository.addStore(
      storeModel: StoreModel(
        imageUrl: imageUrlController.text,
        storeName: storeNameController.text,
        id: '',
      ),
    );
    result.fold((failure) {
      emit(AddStoreFailureState(failure.error));
    }, (message) {
      emit(AddStoreSuccessState(message));
    });
  }

  Future<void> updateStore({required String storeId}) async {
    emit(UpdateStoreLoadingState());
    Either<Failure, String> result =
    await homeRepository.updateStore(
      storeId: storeId,
      storeModel: StoreModel(
        imageUrl: imageUrlController.text,
        storeName: storeNameController.text,
        id: storeId,
      ),
    );
    result.fold((failure) {
      emit(UpdateStoreFailureState(failure.error));
    }, (message) {
      emit(UpdateStoreSuccessState(message));
    });
  }



  Future<void> deleteStore({required String storeId}) async {
    emit(DeleteStoreLoadingState());
    Either<Failure, String> result =
    await homeRepository.deleteStore(
      storeId:storeId,
    );
    result.fold((failure) {
      emit(DeleteStoreFailureState(failure.error));
    }, (message) {
      emit(DeleteStoreSuccessState(message));
    });
  }

}
