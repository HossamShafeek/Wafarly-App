import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/features/home/presentation/views/widgets/coupons_list_view_for_home.dart';
import 'package:wafarly/features/home/presentation/views/widgets/sliders_list_view.dart';
import 'package:wafarly/features/home/presentation/views/widgets/stores_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: AppConstants.defaultPadding),
      child: Column(
        children: [
          const SlidersListView(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            child: const Column(
              children: [
                StoresListView(),
                CouponsListViewForHome(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
