import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterTextsFieldsSection extends StatelessWidget {
  const RegisterTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.text,
                controller: RegisterCubit.get(context).firstNameController,
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
                controller: RegisterCubit.get(context).lastNameController,
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
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: RegisterCubit.get(context).emailController,
                prefixIcon: Icon(
                  IconBroken.Message,
                  size: AppConstants.iconSize18,
                  color: AppColors.primary,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterYourEmail;
                  }
                  return null;
                },
                title: AppStrings.email,
                hintText: AppStrings.enterYourEmail,
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                obscureText:
                RegisterCubit.get(context).isShowPassword,
                prefixIcon:  Icon(
                  IconBroken.Lock,
                  size: AppConstants.iconSize18,
                  color: AppColors.primary,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    RegisterCubit.get(context)
                        .changePasswordVisibility();
                  },
                  child: Icon(
                    RegisterCubit.get(context).isShowPassword
                        ? IconBroken.Hide
                        : IconBroken.Show,
                    color: AppColors.primary,
                  ),
                ),
                controller: RegisterCubit.get(context).passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterYourPassword;
                  }
                  return null;
                },
                title: AppStrings.password,
                hintText: AppStrings.enterYourPassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
