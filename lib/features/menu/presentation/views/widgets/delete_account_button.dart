import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/functions/clear_cash.dart';
import 'package:wafarly/core/functions/show_custom_dialog.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wafarly/features/home/presentation/views/widgets/menu_list_tile.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_state.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is DeleteUserSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return MenuListTile(
          title: AppStrings.deleteAccount,
          subtitle: AppStrings.doYouWantToDeleteTheAccount,
          onTap: () {

            showCustomDialog(
                context: context,
                title: AppStrings.deleteAccount,
                content: AppStrings.doYouWantToDeleteTheAccount,
                actionTitle: AppStrings.delete,
                action: () {
                  clearCash().then((value) {
                    FavoritesCubit.get(context).favorites = [];
                    ProfileCubit.get(context).deleteUser().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.layoutView, (route) => false);
                    });
                  });
                });
          },
        );
      },
    );
  }
}
