import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/errors/failures.dart';
import 'package:wafarly/features/home/data/models/coupon_model/coupon_model.dart';
import 'package:wafarly/features/home/data/repository/home_repository.dart';
import 'package:wafarly/features/home/presentation/cubits/coupons_cubit/coupons_state.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit(this.homeRepository) : super(CouponsInitial());
  final HomeRepository homeRepository;

  static CouponsCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String? storeDropdownValue;


  List<CouponModel> coupons = [];

  Future<void> getCoupons() async {
    emit(CouponsLoadingState());
    Either<Failure, List<CouponModel>> result;
    result = await homeRepository.getCoupons();
    result.fold((failure) {
      emit(CouponsFailureState(failure.error));
    }, (coupons) {
      this.coupons = coupons;
      emit(CouponsSuccessState(coupons));
    });
  }

  List<CouponModel> couponsByStoreName = [];

  void getCouponsByStoreName({required String categoryName}) {
    couponsByStoreName = [];
    if (categoryName == 'الكل') {
      couponsByStoreName = coupons;
    } else {
      coupons.map(
        (coupon) {
          if (coupon.storeName == categoryName) {
            couponsByStoreName.add(coupon);
          }
        },
      ).toList();
    }
  }

  List<CouponModel> searchedCouponsList = [];

  void getSearchedCouponsList({required String couponTitle}) {
    searchedCouponsList = couponsByStoreName.where((element) {
      return element.title.contains(couponTitle);
    }).toList();
    emit(GetSearchedCouponsList());
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(CouponsChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(CouponsChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(CouponsChangeIsSearchingState());
  }

  Future<void> addCoupon() async {
    emit(AddCouponLoadingState());
    Either<Failure, String> result =
    await homeRepository.addCoupon(
      couponModel: CouponModel(
        title: titleController.text,
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        storeName: storeDropdownValue!,
        code: codeController.text,
        id: '',
      ),
    );
    result.fold((failure) {
      emit(AddCouponFailureState(failure.error));
    }, (message) {
      emit(AddCouponSuccessState(message));
    });
  }

  Future<void> updateCoupon({required String couponId }) async {
    emit(UpdateCouponLoadingState());
    Either<Failure, String> result =
    await homeRepository.updateCoupon(
      couponId: couponId,
      couponModel: CouponModel(
        title: titleController.text,
        storeUrl: storeUrlController.text,
        imageUrl: imageUrlController.text,
        storeName: storeDropdownValue!,
        code: codeController.text,
        id: couponId,
      ),
    );
    result.fold((failure) {
      emit(UpdateCouponFailureState(failure.error));
    }, (message) {
      emit(UpdateCouponSuccessState(message));
    });
  }

  Future<void> deleteCoupon({required String couponId }) async {
    emit(DeleteCouponLoadingState());
    Either<Failure, String> result =
    await homeRepository.deleteCoupon(
      couponId: couponId,
    );
    result.fold((failure) {
      emit(DeleteCouponFailureState(failure.error));
    }, (message) {
      emit(DeleteCouponSuccessState(message));
    });
  }

}
