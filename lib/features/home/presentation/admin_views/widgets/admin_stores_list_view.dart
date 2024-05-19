import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wafarly/core/utils/app_assets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_empty_widget.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/custom_slidable.dart';
import 'package:wafarly/features/home/presentation/admin_views/widgets/update_store_bottom_sheet.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/home/presentation/views/widgets/stores_list_view_item.dart';

class AdminStoresListView extends StatelessWidget {
  const AdminStoresListView({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    if (stores.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: AppConstants.defaultPadding,
            top: AppConstants.size5h,
          ),
          itemBuilder: (context, index) {
            return CustomSlidable(
              delete: (context) {
                StoresCubit.get(context).deleteStore(storeId: stores[index].id);
              },
              edit: (context) {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return UpdateStoreBottomSheet(storeModel: stores[index]);
                  },
                );
              },
              child: StoresListViewItem(
                storeModel: stores[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(AppConstants.size10w);
          },
          itemCount: stores.length,
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
