import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/app_bar_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/update_store_texts_fields.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_state.dart';

class UpdateStoreBottomSheet extends StatelessWidget {
  const UpdateStoreBottomSheet({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoresCubit, StoresState>(
      listener: (context, state) {
        if (state is UpdateStoreSuccessState) {
          StoresCubit.get(context).getStores();
          Navigator.pop(context);
          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is UpdateStoreFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateStoreLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const AppBarBottomSheet(
                        title:  AppStrings.updateStore,
                      ),
                      Gap(AppConstants.size20h),
                      UpdateStoreTextsFields(
                        storeModel: storeModel,
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox.shrink(),),
                      CustomElevatedButton(
                        onPressed: () {
                          if (StoresCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            StoresCubit.get(context).updateStore(
                              storeId: storeModel.id,
                            );
                          }
                        },
                        title: AppStrings.update,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
