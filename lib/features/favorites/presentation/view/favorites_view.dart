import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_state.dart';
import 'package:wafarly/features/home/presentation/views/widgets/coupons_list_view_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        FavoritesCubit cubits = FavoritesCubit.get(context);
        if (FavoritesCubit.get(context).favorites.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CouponsListViewItem(couponModel: cubits.favorites[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.size10h,
              );
            },
            itemCount: cubits.favorites.length,
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.favorite,
            title: AppStrings.favoriteIsEmptyTitle,
            subtitle: AppStrings.favoriteIsEmptySubtitle,
          );
        }
      },
    );
  }
}
