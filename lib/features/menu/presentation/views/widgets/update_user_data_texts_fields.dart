import 'package:flutter/material.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/menu/presentation/cubits/profile_cubit/profile_cubit.dart';

class UpdateUserDataTextsFields extends StatefulWidget {
  const UpdateUserDataTextsFields({super.key});

  @override
  State<UpdateUserDataTextsFields> createState() =>
      _UpdateUserDataTextsFieldsState();
}

class _UpdateUserDataTextsFieldsState extends State<UpdateUserDataTextsFields> {
  @override
  void initState() {
    ProfileCubit.get(context).firstNameController.text =
        ProfileCubit.get(context).authenticationModel.firstName;
    ProfileCubit.get(context).lastNameController.text =
        ProfileCubit.get(context).authenticationModel.lastName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textInputType: TextInputType.text,
          controller: ProfileCubit.get(context).firstNameController,
          prefixIcon: Icon(
            IconBroken.Profile,
            size: AppConstants.iconSize18,
            color: AppColors.primary,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.pleaseEnterYourFirstName;
            }
            return null;
          },
          title: AppStrings.firstName,
          hintText: AppStrings.enterYourFirstName,
        ),
        CustomTextField(
          textInputType: TextInputType.text,
          controller: ProfileCubit.get(context).lastNameController,
          prefixIcon: Icon(
            IconBroken.Profile,
            size: AppConstants.iconSize18,
            color: AppColors.primary,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.pleaseEnterYourLastName;
            }
            return null;
          },
          title: AppStrings.lastName,
          hintText: AppStrings.enterYourLastName,
        ),
      ],
    );
  }
}
