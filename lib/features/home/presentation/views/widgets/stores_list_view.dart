import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/shimmer/shimmer_stores_list_view.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/core/widgets/title_list_and_view_all.dart';
import 'package:wafarly/features/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_state.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/home/presentation/views/widgets/stores_list_view_item.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        if (state is StoresSuccessState || state is GetSearchedStoresList) {
          return Column(
            children: [
              TitleListAndViewAll(
                title: AppStrings.stores,
                onPressed: () {
                  BottomNavigationCubit.get(context).changeBottomNavigation(4);
                },
              ),
              if (StoresCubit.get(context).stores.isNotEmpty) ...{
                SizedBox(
                  height: 56.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return StoresListViewItem(
                        storeModel: StoresCubit.get(context).stores[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Gap(AppConstants.size10w);
                    },
                    itemCount: StoresCubit.get(context).stores.length,
                  ),
                ),
              } else ...{
                Container(
                  height: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.grey50,
                    borderRadius: BorderRadius.circular(AppConstants.radius8r),
                  ),
                  child: Text(
                    AppStrings.noStoresTitle,
                    style: AppStyles.styleRegular16Black,
                  ),
                ),
              }
            ],
          );
        } else if (state is StoresFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerStoresListView();
        }
      },
    );
  }
}
