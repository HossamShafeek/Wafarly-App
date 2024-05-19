import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/presentation/views/widgets/stores_grid_view_item.dart';

class StoresGridView extends StatelessWidget {
  const StoresGridView({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    if (stores.isNotEmpty) {
      return Expanded(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          itemCount: stores.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: AppConstants.size15h,
            crossAxisSpacing: AppConstants.size15h,
          ),
          itemBuilder: (context, index) => StoresGridViewItem(
            storeModel: stores[index],
          ),
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: CustomEmptyWidget(
            imagePath: AppAssets.search,
            title: AppStrings.noResultTitle,
            subtitle: AppStrings.noResultSubtitle,
          ),
        ),
      );
    }
  }
}