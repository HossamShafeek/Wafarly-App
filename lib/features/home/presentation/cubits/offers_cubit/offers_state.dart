
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';

abstract class OffersState {}

final class OffersInitialState extends OffersState {}

class OffersLoadingState extends OffersState {}

class OffersSuccessState extends OffersState {
  final List<OfferModel> offers;

  OffersSuccessState(this.offers);
}

class OffersFailureState extends OffersState {
  final String error;

  OffersFailureState(this.error);
}

class GetSearchedOffersList extends OffersState {}

class AddOfferLoadingState extends OffersState {}

class AddOfferSuccessState extends OffersState {
  final String message;

  AddOfferSuccessState(this.message);
}

class AddOfferFailureState extends OffersState {
  final String error;

  AddOfferFailureState(this.error);
}

class UpdateOfferLoadingState extends OffersState {}

class UpdateOfferSuccessState extends OffersState {
  final String message;

  UpdateOfferSuccessState(this.message);
}

class UpdateOfferFailureState extends OffersState {
  final String error;

  UpdateOfferFailureState(this.error);
}

class DeleteOfferLoadingState extends OffersState {}

class DeleteOfferSuccessState extends OffersState {
  final String message;

  DeleteOfferSuccessState(this.message);
}

class DeleteOfferFailureState extends OffersState {
  final String error;

  DeleteOfferFailureState(this.error);
}