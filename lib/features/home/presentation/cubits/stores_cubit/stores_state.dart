import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';

abstract class StoresState {}

final class StoresInitial extends StoresState {}

class StoresLoadingState extends StoresState {}

class StoresSuccessState extends StoresState {
  final List<StoreModel> stores;

  StoresSuccessState(this.stores);
}

class StoresFailureState extends StoresState {
  final String error;

  StoresFailureState(this.error);
}

class GetSearchedStoresList extends StoresState{}


class AddStoreLoadingState extends StoresState {}

class AddStoreSuccessState extends StoresState {
  final String message;

  AddStoreSuccessState(this.message);
}

class AddStoreFailureState extends StoresState {
  final String error;

  AddStoreFailureState(this.error);
}

class UpdateStoreLoadingState extends StoresState {}

class UpdateStoreSuccessState extends StoresState {
  final String message;

  UpdateStoreSuccessState(this.message);
}

class UpdateStoreFailureState extends StoresState {
  final String error;

  UpdateStoreFailureState(this.error);
}

class DeleteStoreLoadingState extends StoresState {}

class DeleteStoreSuccessState extends StoresState {
  final String message;

  DeleteStoreSuccessState(this.message);
}

class DeleteStoreFailureState extends StoresState {
  final String error;

  DeleteStoreFailureState(this.error);
}