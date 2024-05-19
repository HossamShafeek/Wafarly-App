
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';

abstract class SlidersState {}

final class SlidersInitialState extends SlidersState {}

class SlidersLoadingState extends SlidersState {}

class SlidersSuccessState extends SlidersState {
  final List<OfferModel> sliders;

  SlidersSuccessState(this.sliders);
}

class SlidersFailureState extends SlidersState {
  final String error;

  SlidersFailureState(this.error);
}

class ChangeSliderIndexState extends SlidersState{}
class GetSearchedSlidersList extends SlidersState{}


class AddSliderLoadingState extends SlidersState {}

class AddSliderSuccessState extends SlidersState {
  final String message;

  AddSliderSuccessState(this.message);
}

class AddSliderFailureState extends SlidersState {
  final String error;

  AddSliderFailureState(this.error);
}

class UpdateSliderLoadingState extends SlidersState {}

class UpdateSliderSuccessState extends SlidersState {
  final String message;

  UpdateSliderSuccessState(this.message);
}

class UpdateSliderFailureState extends SlidersState {
  final String error;

  UpdateSliderFailureState(this.error);
}

class DeleteSliderLoadingState extends SlidersState {}

class DeleteSliderSuccessState extends SlidersState {
  final String message;

  DeleteSliderSuccessState(this.message);
}

class DeleteSliderFailureState extends SlidersState {
  final String error;

  DeleteSliderFailureState(this.error);
}