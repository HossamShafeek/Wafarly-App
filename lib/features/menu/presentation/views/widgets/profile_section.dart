import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/shimmer/shimmer_profile_section.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_error_widget.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/profile_bottom_sheet.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/profile_item_widget.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.account,
                style: AppStyles.styleBold20Red,
              ),
              ProfileItemWidget(
                title: AppStrings.firstName,
                content: state.authenticationModel.firstName,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) {
                      return const ProfileBottomSheet();
                    },
                  );
                },
              ),
              ProfileItemWidget(
                title: AppStrings.lastName,
                content: state.authenticationModel.lastName,
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return const ProfileBottomSheet();
                    },
                  );
                },
              ),
            ],
          );
        } else if (state is GetUserDataFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerProfileSection();
        }
      },
    );
  }
}
