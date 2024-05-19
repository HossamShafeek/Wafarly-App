import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginTextsFieldsSection extends StatelessWidget {
  const LoginTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: LoginCubit.get(context).emailController,
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
                paddingForBottom: 0,
                obscureText:
                    LoginCubit.get(context).isShowPassword,
                prefixIcon:  Icon(
                  IconBroken.Lock,
                  size: AppConstants.iconSize18,
                  color: AppColors.primary,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    LoginCubit.get(context)
                        .changePasswordVisibility();
                  },
                  child: Icon(
                    LoginCubit.get(context).isShowPassword
                        ? IconBroken.Hide
                        : IconBroken.Show,
                    color: AppColors.primary,
                  ),
                ),
                controller: LoginCubit.get(context).passwordController,
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
